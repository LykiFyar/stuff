#version 330

uniform sampler2D tex;

in Data {
	vec2 texCoord;
	vec3 normal;
	vec3 l_dir;
} DataIn;

out vec4 colorOut;

void main() {

	// normalize vectors
	
	vec3 normal = normalize(DataIn.normal);

	float intensity = max(dot(normal,DataIn.l_dir), 0.0);

	vec4 diffuse = texture(tex, DataIn.texCoord);
	colorOut = (intensity + 0.15) * diffuse;

}

