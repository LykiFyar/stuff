#version 410


layout(triangles, fractional_even_spacing, ccw) in;

uniform	mat4 projViewModelMatrix;

in vec4 posTC[];

void main() {

	float u = gl_TessCoord.x;
	float v = gl_TessCoord.y;
    float w = 1 - u - v;
	
	vec4 p = posTC[0] * w + posTC[1] * u + posTC[2] * v;
	
    
	gl_Position = projViewModelMatrix * p;
}