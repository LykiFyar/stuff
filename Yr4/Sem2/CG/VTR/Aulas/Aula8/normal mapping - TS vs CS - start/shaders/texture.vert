#version 330

uniform	mat4 m_pvm;
uniform	mat4 m_viewModel;
uniform	mat4 m_view;
uniform	mat3 m_normal;

uniform	vec4 l_dir;	// global space

in vec4 position;	// local space
in vec3 normal;		// local space
in vec2 texCoord0;

// the data to be sent to the fragment shader
out Data {
	vec2 texCoord;
	vec3 normal;    // camera space
	vec3 l_dir;     // camera space
} DataOut;


void main () {

	DataOut.texCoord = texCoord0;

    // transform vectors to camera space and normalize
	DataOut.normal = normalize(m_normal * normal);
	DataOut.l_dir = normalize(vec3(m_viewModel * -l_dir)); 

	gl_Position = m_pvm * position;	
}
