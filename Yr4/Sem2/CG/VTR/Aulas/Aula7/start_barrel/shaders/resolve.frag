#version 460

uniform sampler2DMS texUnit;
uniform sampler2D texNormal;
uniform int samples = 32;
uniform vec2 vp_dim;


in vec2 texCoord;

out vec4 outputF;

void main() {

    float flag = texture(texNormal, texCoord).w;
    if(flag == 0.0) {
        discard;
        return;
    }

    ivec2 tc = ivec2(texCoord * vp_dim);

    outputF = vec4(0);
    for(int i = 0; i < samples; ++i) {
        outputF += texelFetch(texUnit, tc, i);
    }
    outputF = outputF / samples;

}