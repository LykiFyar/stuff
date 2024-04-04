#version 330

uniform	mat4 m_pvm;
uniform	mat4 m_viewModel;
uniform	mat4 m_view;
uniform	mat3 m_normal;

uniform	vec4 l_dir;	// camera space

in vec4 position;	// local space
in vec3 normal;		// local space
in vec4 tangent;	// local space
in vec2 texCoord0;

// the data to be sent to the fragment shader
out Data {
	vec2 texCoord;
	vec3 l_dir; // tangent space
} DataOut;

void main () {
	// pass through texture coordinates
	DataOut.texCoord = texCoord0;
	
	// all vectors to camera space
	vec3 n = normalize(m_normal * normal);
	vec3 t = vec3(m_viewModel * tangent);
	vec3 b = normalize(cross(n,t));
		
	// build inverse tbn	
    // tbn: tangent space -> camera space
    // inverse tbn: camera space -> tangent space
	mat3 tbn_trans = transpose(mat3(t, b, n)); // transpose = inverse
	
    // transform light to tangent space
	DataOut.l_dir = tbn_trans *  vec3(m_view * -l_dir);

	gl_Position = m_pvm * position;	
}