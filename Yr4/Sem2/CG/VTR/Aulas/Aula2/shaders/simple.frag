#version 460

uniform vec4 diffuse;
uniform float shininess = 128.0;

//in vec4 cor;
in vec3 n, ld, eye_cam;

out vec4 color;

void main() {

    vec3 nn = normalize(n);

    float intensity = max(0.0,dot(nn,ld));

    float specInt = 0;
    if (intensity > 0) {
        vec3 h = normalize(ld + normalize(eye_cam));
        specInt = pow(max(dot(h, nn), 0.0), shininess);
        }

/*
    // Toon lighting
    float i;
    if(intensity > 0.9) i = 1.0;
    else if(intensity > 0.66) i = 0.75;
    else if(intensity > 0.33) i = 0.5;
    else i = 0.25;
*/  

    vec4 cor = diffuse * max(0.30,intensity) + specInt * vec4(1);

    color = cor;
}