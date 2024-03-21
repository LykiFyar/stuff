#version 460

uniform vec4 lightDir;
uniform mat4 m_view;


in vec4 position;
in vec2 texCoord0;

out vec2 tc;
out vec3 ld;


void main() {

    tc = texCoord0;
    gl_Position = position;
    ld = -vec3(m_view * lightDir);
}