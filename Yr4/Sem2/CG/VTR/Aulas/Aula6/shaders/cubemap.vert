#version 460

in vec4 position; // espaço local
in vec4 normal; // espaço local

uniform mat4 m_m, m_pvm; 
uniform vec3 cam_pos; // espaço mundo

out vec3 incident, n; // espaço mundo

void main() {

    mat4 m = inverse(transpose(m_m));
    
    n = normalize(vec3(m * normal));

    vec3 pos = vec3(m_m * position);
    incident = pos - cam_pos;

    gl_Position = m_pvm * position;
}