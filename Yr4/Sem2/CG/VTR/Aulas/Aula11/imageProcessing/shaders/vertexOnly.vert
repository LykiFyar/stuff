#version 440

uniform writeonly image2D imageUnit;
uniform sampler2D texUnit;

in vec4 position;



void main() {

	ivec2 texCoord = ivec2(gl_InstanceID / 512, gl_InstanceID % 512);
	vec4 tl = texelFetchOffset(texUnit, texCoord, 0, ivec2(-1, -1));
	vec4 tc = texelFetchOffset(texUnit, texCoord, 0, ivec2( 0,	-1));
	vec4 tr = texelFetchOffset(texUnit, texCoord, 0, ivec2( 1, -1));
	vec4 cl = texelFetchOffset(texUnit, texCoord, 0, ivec2(-1,	 0));
	vec4 cc = texelFetchOffset(texUnit, texCoord, 0, ivec2( 0,  0));
	vec4 cr = texelFetchOffset(texUnit, texCoord, 0, ivec2( 1,	 0));
	vec4 bl = texelFetchOffset(texUnit, texCoord, 0, ivec2(-1,	 1));
	vec4 bc = texelFetchOffset(texUnit, texCoord, 0, ivec2( 0,	 1));
	vec4 br = texelFetchOffset(texUnit, texCoord, 0, ivec2( 1,  1));

	vec4 res = (8 * cc - tl - tc - tr - cl - cr - bl - bc - br);
	imageStore(imageUnit, texCoord, res);
} 
