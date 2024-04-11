#version 420
 
layout(triangles) in;
layout (line_strip, max_vertices=6) out;

uniform mat4 m_pvm;

uniform float linelength = 1;

in Data {
	vec3 normal;
	vec4 tangent;
	vec4 bitangent;
} DataIn[3];

out vec4 color;

void main() {

	gl_Position = m_pvm * gl_in[0].gl_Position;
	color = vec4(0, 1, 0, 1);
	EmitVertex();
	gl_Position = m_pvm * (gl_in[0].gl_Position + vec4(DataIn[0].normal, 0.0) * linelength);
	color = vec4(0, 1, 0, 1);
	EmitVertex();
	EndPrimitive();

	gl_Position = m_pvm * gl_in[1].gl_Position;
	color = vec4(1, 0, 0, 1);
	EmitVertex();
	gl_Position = m_pvm * (gl_in[1].gl_Position + DataIn[1].tangent * linelength);
	color = vec4(1, 0, 0, 1);
	EmitVertex();
	EndPrimitive();

	gl_Position = m_pvm * gl_in[2].gl_Position;
	color = vec4(0, 0, 1, 1);
	EmitVertex();
	gl_Position = m_pvm * (gl_in[2].gl_Position + DataIn[2].bitangent * linelength);
	color = vec4(0, 0, 1, 1);
	EmitVertex();
	EndPrimitive();
	
}

