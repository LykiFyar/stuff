#version 450

uniform vec4 diffuse;

out vec4 outputF;

void main() {

    outputF = diffuse;
}