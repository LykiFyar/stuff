#version 460

in vec2 texCoord;

out vec4 res;

layout(std430, binding = 1) buffer result {
	uvec4 color[];
};

void main() {

    uint index = int(gl_FragCoord.x) * 1024 + int(gl_FragCoord.y );
    uvec4 c = color[index];
    vec4 f1 = (vec4(c) );
    vec3 f = f1.xyz;
   // f = pow(f, vec3(1.0,0.83,0.7) );
    //f = min(f/(1+f),1.0);
    res = vec4(f.x/25, f.y/25, f.z/25 ,  0);
    //res = vec4(f,  0);

 //   if (texCoord.x > 0.45 && texCoord.x < 0.55 && texCoord.y > 0.45 && texCoord.y < 0.55)
  //      res = vec4(1,0,0,0);
  //  if (gl_FragCoord.x > 510 && gl_FragCoord.x < 514 && gl_FragCoord.y > 510 && gl_FragCoord.y < 514)
   //     res = vec4(0,0,1,0);

 //   if ((gl_FragCoord.x * 1024.0 + gl_FragCoord.y) > 524780.0 && (gl_FragCoord.x * 1024.0 + gl_FragCoord.y) < 524810.0)
 //       res = vec4(0,1,0,0);

    

} 
