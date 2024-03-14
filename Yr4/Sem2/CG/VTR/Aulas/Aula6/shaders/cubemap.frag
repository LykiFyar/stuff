#version 460

in vec3 incident, n;

uniform samplerCube tex_cm;
uniform float alpha = 0.5;
uniform float eta = 1.1;
uniform float gap = 0.02;

out vec4 color;

void main() {
    /*
    //  ------------------------------------------------
    // Reflexão - o vetor incidente é refletido em relação à normal
    // a reflexão assume que o vetor parte da origem do cubo
    vec3 refl = reflect(normalize(incident), normalize(n));
    color = texture(tex_cm, refl);
    //
    */

    /*
    //  ------------------------------------------------
    // Reflexão com teapot transparente
    vec3 i = normalize(incident);
    vec3 nn = normalize(n);
    vec3 refl = reflect(i, nn);

    float opacity = 1 - dot(-i,nn);

    color = vec4(texture(tex_cm, refl).rgb, opacity);
    //
    */

    /*
    //  ------------------------------------------------
    // Reflexão + refração
    vec3 i = normalize(incident);
    vec3 nn = normalize(n);
    vec3 refl = reflect(i, nn);
    vec4 crefl = texture(tex_cm, refl);

    vec3 refr = refract(i, nn, eta);
    vec4 crefr = texture(tex_cm, refr);

    float dot_in = dot(-i,nn);
    float k = 1 - eta*eta*(1 - dot_in*dot_in);

    color = mix(crefl, crefr, k);
    //
    */
    //  ------------------------------------------------
    // Distorção cromática
    vec3 i = normalize(incident);
    vec3 nn = normalize(n);
    vec3 refl = reflect(i, nn);
    //vec4 crefl = texture(tex_cm, refl);
    vec3 crefl = texture(tex_cm, refl).rgb;

    vec3 trefrRED = refract(i, nn, eta - gap);
    vec3 trefrGREEN = refract(i, nn, eta);
    vec3 trefrBLUE = refract(i, nn, eta + gap);

    vec3 refr;
    refr.r = texture(tex_cm, trefrRED).r;
    refr.g = texture(tex_cm, trefrGREEN).g;
    refr.b = texture(tex_cm, trefrBLUE).b;

    float dot_in = dot(-i,nn);
    float k = 1 - eta*eta*(1 - dot_in*dot_in);

    color = vec4(mix(crefl, refr, k),1);
    //  ------------------------------------------------
}