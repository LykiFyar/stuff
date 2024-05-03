#version 440

in vec2 texCoord;

uniform vec2 vp_dims;

uniform float scale = 1.0;
uniform int max_it = 200;
uniform vec2 center = vec2(0,0);
uniform int power = 2;

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

    vec2 point = (texCoord * 2 - 1) * ratio + center;

    int it = 0;
    vec2 z = vec2(0,0);
    while ((it < max_it) && (length(z) < 2)) {
        z = complexPower(z,power) + point;
        it++;
    }

    if (it < max_it) {
        vec3 rgb = vec3(sqrt(it*1.0/max_it));
        res = vec4(rgb, 0);
    }
        
    else
        res = vec4(0,0,0,0);
} 
