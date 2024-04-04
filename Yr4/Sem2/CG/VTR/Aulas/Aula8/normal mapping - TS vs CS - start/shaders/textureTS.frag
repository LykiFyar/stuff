#version 330

uniform sampler2D normalMap;

in Data {
	vec2 texCoord;
	vec3 l_dir; // tangent space
} DataIn;

out vec4 colorOut;

void main() {

	// get normal from texture and decode it
	vec3 texNormal = normalize(vec3(texture(normalMap, DataIn.texCoord) * 2.0 - 1.0));
	
	// normalize light vector
	vec3 l = normalize(DataIn.l_dir);
	
	float intensity = max(dot(texNormal, l), 0.0);

	vec4 diffuse = vec4(1.0, 1.0, 0.9, 1);
	colorOut = (intensity + 0.15) * diffuse;
}