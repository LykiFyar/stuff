#version 460

uniform mat4 m_pvm;
uniform mat4 m_view;
uniform mat3 m_normal;
uniform vec4 ldir;
uniform mat4 m_viewModel;

in vec4 position;
in vec3 normal;

out vec3 n,ld, eye_cam;

void main() {

    n = normalize(m_normal * normal); // camera space
    ld = normalize(vec3(m_view * ldir)); // camera space

    // vetor do ponto ao olho no espaço da camera
    eye_cam = -vec3(m_viewModel * position);

    gl_Position = m_pvm * position;
}