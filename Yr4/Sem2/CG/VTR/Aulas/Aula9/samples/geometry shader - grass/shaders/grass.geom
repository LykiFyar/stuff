#version 330

layout(points) in;
layout (triangle_strip, max_vertices=9) out;

uniform sampler2D noise;
uniform mat4 m_pvm;
uniform float timer;

uniform float windScale = 0.5;


out Data {
	float height;
    float green;
} DataOut;

void main() {

    vec4 p[5];
    float h[5];

    vec4 pos = gl_in[0].gl_Position;

    // shift the blades so that they not end up alligned in XZ
    pos += texture(noise, pos.xz * vec2(3.14159, 1.17)).x * 0.0375;

    // compute the 5 vertices that will make up the blade    
    float base_width = 0.1 + texture(noise, pos.xz * vec2(3.14159, 1.17)).x * 0.1;
    float middle_width =  texture(noise, pos.zx * vec2(2.37,3.14159)).x * 0.15;
    p[0] = -vec4(base_width*0.5, 0,0,0); h[0] = 0.0;
    p[1] = vec4(base_width*0.5, 0,0,0); h[1] = 0.0;
    float middle_height = 2 * texture(noise, pos.zx * 3.14159).x;
    p[2] = vec4(-middle_width*0.5, middle_height,0,0); h[2] = middle_height;
    p[3] = vec4(+middle_width*0.5, middle_height,0,0); h[3] = middle_height;

    float bend = texture(noise, pos.zx * vec2(1.79,3.14159)).x * 0.15;
    p[4] = vec4(0 , middle_height * 1.75, bend,0); h[4] = middle_height * 1.75;



    // build matrix to rotate the blades randomly around the y axis
    float c = texture(noise, pos.xz + vec2(7.79, 14.14159)).x * 2 - 1;
    float s =  sqrt(1.0 - c*c);
    // 3D rotation matrix around the Y axis
    mat3 randomRot = mat3(c, 0, -s,    0, 1, 0,     s, 0, c);

    // rotate according to the wind
    // vec winDir2 is a direction vector in the XZ plane
    vec2 winDir2 = vec2(texture(noise, pos.xz * 0.0025 + timer * 0.00001).x * 2 -1, texture(noise, pos.zx * 0.0047 + timer*0.00001).x * 2 -1);
    // vec winDir is a normalized 3D direction, where windScale controls the weight of the Y component
    vec3 winDir = normalize(vec3(winDir2.x, 1.0/windScale, winDir2.y));

    // build a rotation matrix
    vec3 xDir = vec3(1,0,0);
    vec3 zDir = cross(xDir, winDir);
    xDir = cross(winDir, zDir);
    mat3 rotWind = mat3(xDir, winDir, zDir);

    // rotate bottom points 
    for (int i = 0; i < 2; ++i) {
        p[i].xyz =  randomRot * p[i].xyz;
    }

    // rotate the middle points, note the wind takes effect in here
    // apply matrix to middle points
    for (int i = 2; i < 4; ++i) {
        p[i].xyz =  rotWind * randomRot * p[i].xyz;
    }

    // rotate the tip a little bit more to bend the blade
    // this is achieved by giving less importance to the Y direction, i.e. the winDir vector
    // will have a greater angle with the vertical direction
    winDir = normalize(vec3(winDir2.x, 1.5/windScale, winDir2.y));
    xDir = vec3(1,0,0);
    zDir = cross(xDir, winDir);
    xDir = cross(winDir, zDir);

    mat3 rotWind2 = mat3(xDir, winDir, zDir);

    p[4].xyz =  rotWind2 * rotWind * randomRot * p[4].xyz;

    for (int i = 0; i < 5; ++i) {
	    gl_Position = m_pvm * (pos + p[i]);
        DataOut.height = h[i];
        DataOut.green = (abs(c)*0.8 + 0.4) * h[i]*0.5;
	    EmitVertex();
    }   

 
	EndPrimitive();
}
