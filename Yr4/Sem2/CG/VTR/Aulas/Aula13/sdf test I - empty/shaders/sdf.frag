

uniform float FOV;
uniform float Ratio;
uniform vec2 WindowSize;
uniform vec4 RayOrigin;
uniform vec4 CamView, CamUp, CamRight;
uniform vec3 LightPos;
uniform float Timer;

uniform vec3 background = vec3(0.5, 0.8, 0.9);

out vec4 color;

const int MAX_STEPS = 128;
const float MAX_DIST = 512;
const float EPSILON = 0.001;

struct object {
    float dist;
    int id;
};


object fOpUnionID(object a, object b) {
    return a.dist < b.dist ? a : b;
}

object fOpIntersectionID(object a, object b) {
    return a.dist > b.dist ? a : b;
}

object fOpDiffID(object a, object b) {
    return a.dist > -b.dist ? a : object(-b.dist, b.id);
}

vec3 opRepLim(vec3 p, float s, vec3 lima, vec3 limb) {
    return p - s * clamp(round(p/s), lima, limb);
}

vec3 opSymX(vec3 p) {
    return vec3(abs(p.x), p.y, p.z);
}

object map(vec3 p) {

    float d = dot(p, vec3(0,1,0));
    object plane = object(d, 1);

    // Columns
    vec3 p2 = p;

    p2 = opRepLim(p2, 6.0, vec3(0,0,-3), vec3(0,0,3));
    p2 = opSymX(p2);

    p2.x -= 10;
    p2.y -= 1.6;

    float r = 1.0 - 0.025 * p2.y;
    r = r - 0.1 * pow(0.5 + 0.5*sin(16 * atan(p2.x, p2.z)), 2);
    r = r + 0.1 * pow(0.5 + 0.5 * sin(3.14159 * p2.y - 157 ), 0.03);
    d = length(p2.xz) - r;
    d = max(d, p2.y - 12);
    d = d - abs(turbulence(p2*2) * 0.01);
    object cylinder = object(d, 3);

    // Pedras do topo e chão das colunas
    //p2 = p - vec3(0, 1.6, 0);
    vec3 p3 = p2 - vec3(0,0.35,0);

    p3 = opRepLim(p3, 11.8, vec3(0,0,0), vec3(0,1,0));
    object box = object(fBox(p3, vec3(1.25, 0.3, 1.25)) - 0.06 - abs(turbulence(p3*2))*0.03, 3);

    vec3 p4 = p;
    p4.y = p4.y - 1.2;
    p4 = opRepLim(p4, 6, vec3(-2,0,-3),vec3(2,0,3));
    object floor = object(fBox(p4, vec3(2.975, 0.4, 2.975)) - 0.02, 3);


    object res = fOpUnionID(plane, cylinder);
    res = fOpUnionID(res, box);
    res = fOpUnionID(res, floor);

    return res;
}

float getAmbientOcclusion(vec3 p, vec3 n) {

    float occ = 0;
    float weight = 1.0;

    for(int i = 0; i < 8; ++i) {
        float len = 0.01 + 0.02 * float(i * i);
        float dist = map(p + n * len).dist;
        occ += (len - dist) * weight;
        weight *= 0.85;
    }

    return 1.0 - clamp(0.6 * occ, 0.0, 1.0);
}

float getShadows(vec3 p, vec3 lightDir) {

    float res = MAX_DIST;
    float dist = 0.01;
    float lightSize = 0.2;

    float dist_to_light = length(p - LightPos);
    
    for(int i = 0; i < MAX_STEPS; ++i) {
        float hit = map(p + lightDir * dist).dist;
        dist += hit;
        res = min(res, hit/(dist * lightSize));

        if (hit < EPSILON * 0.00005 || dist > MAX_DIST || dist > dist_to_light) break;
    }

    return clamp(res, 0.0, 1.0);
}


vec3 getNormal(vec3 p) {

    vec2 e = vec2(EPSILON, 0);

    vec3 n = normalize(vec3(map(p).dist) - vec3(map(p - e.xyy).dist, map(p - e.yxy).dist, map(p - e.yyx).dist));

    return n;
}

vec3 getLight(vec3 p, vec3 color) {

    vec3 n = getNormal(p);
    vec3 ld = normalize(LightPos - p);
    
    vec3 diffuse = color * max(dot(n, ld), 0.0);
    vec3 ambient = color * 0.1;

    float occ = getAmbientOcclusion(p, n);

    return ambient * occ + diffuse * getShadows(p + n*0.0001, ld);
}


vec3 getMaterial(vec3 p, int id) {

    vec3 m;
    switch(id) {
        case 1: m = vec3(0.5, 0.5, 0.5); break;
        case 2: m = vec3(1.0, 1.0, 0); break;
        case 3: m = vec3(0.8, 0.62, 0.41); break;
    }

    return m;
}



vec3 getColor(object obj, vec3 rayDirection) {

    vec3 c;

    if (obj.dist < MAX_DIST) {
        
        vec3 p = vec3(RayOrigin) + obj.dist * rayDirection;
        c = getMaterial(p, obj.id);
        c = getLight(p, c);
        c = mix(c, background, 1.0 - exp(-0.000005 * obj.dist * obj.dist));
    }
    else {
        c = background - clamp(max(0.9 * rayDirection.y, 0.0), 0.0, 0.4);
    }

    c = pow(c, vec3(0.454));
    return c;
}


object rayMarch(vec3 origin, vec3 dir) {

    object hit;
    float dist = 0.0;
    int objID = 0;

    for(int i = 0; i < MAX_STEPS; ++i) {
        vec3 p = origin + dist * dir;
        hit = map(p);
        dist += hit.dist;
        objID = hit.id;

        if(abs(hit.dist) < EPSILON  || dist > MAX_DIST) break;
    }

    return object(dist, objID);
}


vec3 getRayDirection(vec2 fc, vec2 offset) {

    vec3 rayDirection;

    float FocalLength = 1.0 / tan(radians(FOV * 0.5));
    rayDirection.xy = (fc + offset) / WindowSize * 2.0 - 1.0;
    rayDirection.x *= Ratio;
    
    rayDirection.z = - FocalLength;
    rayDirection = normalize(rayDirection);

    rayDirection = mat3(vec3(CamRight), vec3(CamUp), vec3(-CamView)) * rayDirection;

    return rayDirection;
}

void main() {

    vec3 c = background;
    vec3 rayDirection;
    object obj;

    rayDirection = getRayDirection(gl_FragCoord.xy, vec2(0));

    obj = rayMarch(RayOrigin.xyz, rayDirection);

    c = getColor(obj, rayDirection);

    color = vec4(c, 1.0);
}
