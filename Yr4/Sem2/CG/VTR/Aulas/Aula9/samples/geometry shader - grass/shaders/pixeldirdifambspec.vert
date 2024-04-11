#version 330

in vec4 position;

void main () {

	vec4 pos;
	pos.x = gl_InstanceID / 1000;
	pos.z = gl_InstanceID % 1000;
	pos.y = 0; pos.w = 1;	
	pos.xyz = pos.xyz * 0.15;
	gl_Position = pos;	
}