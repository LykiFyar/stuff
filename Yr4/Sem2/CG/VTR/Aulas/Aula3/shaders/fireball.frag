#version 460

//uniform
uniform vec4 diffuse;
uniform vec4 l_pos; // world space
uniform mat4 m_view;
uniform float shininess = 64;
uniform vec4 specular;

// input
in vec3 n, e;
in vec4 p_gbl;

// output
out vec4 color;

void main() {

    vec4 l_dir = l_pos - p_gbl;

    vec3 nn = normalize(n); // camera space
    vec3 ld = normalize(vec3(m_view * l_dir)); // camera space

    float intensity = max(0.0, dot(nn,ld));
    float specInt = 0;
    if(intensity > 0) {
        vec3 h = normalize(ld + normalize(e));

        specInt = pow(max(dot(h,nn), 0.0), shininess);
    }

    color = intensity * diffuse + specular * specInt;
}