#version 460

// uniforms
uniform mat4 m_pvm;
uniform mat3 m_normal;
uniform mat4 m_viewModel;
uniform mat4 m_model;


// input streams - local space
in vec4 position;
in vec3 normal;

//output
out vec3 n, e;
out vec4 p_gbl; // normal in camera space

void main() {

    e = -vec3(m_viewModel * position);
    p_gbl = m_model * position;

    n = normalize(m_normal * normal);    
    gl_Position = m_pvm * position;
}