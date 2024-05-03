#version 440

in vec2 texCoord;

uniform vec2 vp_dims;
uniform float timer;

uniform float scale = 2.0;
uniform int max_it = 200;
uniform float zoom_level = 1;
uniform vec2 center = vec2(0,0);
uniform vec2 z0 = vec2(-0.8, 0.156);
uniform ivec2 click_pos = ivec2(0,0);
uniform int power = 2;
uniform float radius = 0.15f;


layout(std430, binding = 1) buffer debugBuffer {
	vec2 debug;
};

out vec4 res;

const float PI = 3.14159265359;

// http://lolengine.net/blog/2013/07/27/rgb-to-hsv-in-glsl
// All components are in the range [0…1], including hue.
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

vec2 complexPower(vec2 c, float exp) {

    float r = pow(sqrt(c.x*c.x + c.y*c.y), exp);
    float angle;

    if (c.x == 0)
        angle = PI * 0.5;
    else {
        angle = atan(c.y/c.x);
        if (c.x < 0)
            angle += PI;
    }
    angle = angle * exp;
    return vec2(r * cos(angle), r * sin(angle));
}

void main() {

    vec2 ratio;
    if (vp_dims.x > vp_dims.y)
        ratio = vec2(vp_dims.x/vp_dims.y, 1.0) / scale;
    else
        ratio = vec2(1.0, vp_dims.y/vp_dims.x) / scale;

    // if not set choose center of screen
    vec2 click;
    if (click_pos == vec2(0))
        click = vec2(0);
    else {
        click = ((click_pos  - vp_dims * 0.5)/ vp_dims) * ratio * vec2(1,-1) ;
        if (debug != click) {
            debug -= click;
            click -= debug;
        }
    }
    

    vec2 point = (texCoord * 2 - 1) * ratio / zoom_level + center;

    int it = 0;
    vec2 z = point;
    vec2 c = click + radius * vec2(cos(timer/1000), sin(timer/1000));
    
    while ((it < max_it) && (length(z) < 2)) {
        z = complexPower(z,power) + c;
        it++;
    }

    if (it < max_it) {
        vec3 rgb = vec3(sqrt(it* 1.0/max_it));//hsv2rgb(vec3(sqrt(it/max_it*32) , 1, 1));
        res = vec4(rgb, 0);
    }
        
    else
        res = vec4(0,0,0,0);
} 
