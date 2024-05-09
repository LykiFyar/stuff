#version 330

uniform vec4 lightDirection;
uniform mat4 lightSpaceMat;

uniform mat4 PVM, V, M;
uniform mat3 NormalMatrix;

in vec4 position;
in vec3 normal;
in vec2 texCoord0;

out vec4 projShadowCoord;
out vec3 normalV;
out vec2 texCoordV;
out vec3 lightDir;

void main() {
    
    normalV = normalize(NormalMatrix * normal);
    texCoordV = texCoord0;
    lightDir = normalize(vec3(V * (-lightDirection)));

    projShadowCoord = lightSpaceMat * M * position;

    gl_Position = PVM * position;
}