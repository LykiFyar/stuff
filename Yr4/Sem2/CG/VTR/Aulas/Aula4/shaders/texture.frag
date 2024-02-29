#version 460

// uniforms
uniform sampler2D tex;

uniform int div = 5;
uniform float width = 0.5;
uniform float gap = 0.025;
uniform float factor = 0.5;

uniform vec4 diffuse = vec4(0.3, 0.3, 0.6, 0);
uniform vec4 secondary_diffuse = vec4(0.6,0.6,0.6,0);

// interpolated inputs
in vec2 tc;

// output
out vec4 color;

void main() {

    vec2 fr = fract(tc * div);

    //if(fr.s > width && fr.t > width) discard;
    
    // Lines with aliasing
    //if(fr.s > width) color = diffuse;
    //else color = secondary_diffuse;

    //color =  diffuse; //texture(tex, tc); //vec4(tc,0,1); //vec4(0,1,0,1);


    /*
    vec2 res = textureQueryLod(tex, tc.st);

         if(res.x == 0) color = vec4(1,0,0,0);
    else if(res.x <  1) color = vec4(0,1,0,0);
    else if(res.x <  2) color = vec4(0,0,1,0);
    else if(res.x <  3) color = vec4(0,1,1,0);
    else if(res.x <  4) color = vec4(1,0,1,0);
    else if(res.x <  5) color = vec4(1,1,0,0);
    else                color = vec4(0.5,0.5,0.5,0);

    */

    // Lines without aliasing (anti-aliasing process) - linear interpolation
    float f;
    if(fr.s < width-gap) color = diffuse;
    else if (fr.s < width) {
        f = fr.s - (width-gap);
        f = f/gap;
        color = mix(diffuse, secondary_diffuse, f);
    }
    else if(fr.s < 1-gap) color = secondary_diffuse;
    else {
        f = fr.s - (1-gap);
        f = f/gap;
        color = mix(secondary_diffuse, diffuse, f);
    }

    // Smooth stepping

    f = smoothstep(width-gap, width, fr.s) - smoothstep(1-gap,1,fr.s);

    //f = texture(tex, tc*div).r;
    color = mix(diffuse, secondary_diffuse, f);

    // using a texture to obtain a similar effect (coloredLine.jpg)
    //color = texture(tex, fr);

    //vec2 deriv = vec2(dFdx(fr.s), dFdy(fr.s));
    vec2 deriv = vec2(dFdx(tc.s * div), dFdy(tc.s * div));
    float len = length(deriv);

    float actualGap = len * factor;
    f = smoothstep(width-actualGap, width, fr.s) - smoothstep(1-actualGap, 1,fr.s);
    color = mix(diffuse, secondary_diffuse, f);

}