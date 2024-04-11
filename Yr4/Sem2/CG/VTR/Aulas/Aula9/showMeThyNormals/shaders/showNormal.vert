#version 420

in vec4 position;
in vec4 tangent;
in vec4 bitangent;
in vec3 normal;

out Data {
	vec3 normal;
	vec4 tangent;
	vec4 bitangent;
} DataOut;

void main()
{
	DataOut.normal = normal;
	DataOut.tangent = tangent;
	DataOut.bitangent = bitangent;
	gl_Position = position;
} 
