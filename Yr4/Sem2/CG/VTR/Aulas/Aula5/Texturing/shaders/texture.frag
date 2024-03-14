#version 330

uniform float shininess = 128;
uniform sampler2D texEarth, texSpec, texNight, texClouds;
uniform float timer;

in	vec4 eye;
in	vec3 n;
in	vec3 ld;
in vec2 texCoord;

out vec4 colorOut;

float snoise(vec4 p);
float perlin(vec4 p){
	float c = 0, amp =1.0 ;
	vec4 freq = p;

	for(int i = 0 ; i<5; ++i){
		c = c + snoise(freq) * amp;
		amp  /= 2;
		freq *= 2;
	}
	c = c * 0.5 + 0.5;
	return c;
}
const float PI = 3.14159;
void main() {

	vec4 eColor = texture(texEarth, texCoord);
	float eSpec = texture(texSpec,texCoord).r;
	vec4 eNight = texture(texNight, texCoord);
	float eClouds = texture(texClouds, texCoord).r;

	vec2 t = vec2(texCoord.s * 2 * PI + timer*0.00008, -PI* 0.5 + texCoord.t * PI);
	vec3 s =  vec3(cos(t.t)*sin(t.s), sin(t.t), cos(t.t)*cos(t.s));
	eClouds = perlin(vec4(s  ,timer*0.00004)*3);


	//eClouds = perlin(vec4(texCoord + timer*0.000015 ,timer*0.00001,0)*12);
	eClouds = smoothstep(0.33,1.0, eClouds);
	// set the specular term to black
	vec4 spec = vec4(0.0);

	// normalize both input vectors
	vec3 nd = normalize(n);
	vec3 e = normalize(vec3(eye));

	float intensity = max(dot(nd,ld), 0.0);

	// if the vertex is lit compute the specular color
	if (intensity > 0.0) {
		// compute the half vector
		vec3 h = normalize(ld + e);	
		// compute the specular intensity
		float intSpec = max(dot(h,nd), 0.0);
		// compute the specular term into spec
		spec = vec4(1) * pow(intSpec,shininess);
	}
	vec4 cDay = intensity * eColor * (1-eClouds) + eClouds 		+ spec*eSpec * (1-eClouds);
	vec4 cNight = eNight * (1-eClouds);
	if (intensity>0){
		colorOut = cDay;
	}
	else
		colorOut = cNight;
	float f = smoothstep(0,0.3,intensity);
	colorOut = mix(cNight,cDay,f);
}