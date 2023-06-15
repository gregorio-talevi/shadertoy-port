#version 330 core
in vec2 frag_coord;
uniform float iTime;
uniform vec2 iResolution;
uniform vec2 iMouse;
out vec4 frag_color;


// Hoop Loop by Gregorio Talevi
// License Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// Contact the author for other licensing options

vec3 palette ( in float t )
{
    vec3 a = vec3(0.4, 0.4, 0.4);
    vec3 b = vec3(0.4, 0.1, 0.4);
    vec3 c = vec3(0.2, 0.8, 0.4);
    vec3 d = vec3(0.2, 0.2, 0.4);

    return a + b*cos( 6.00450*(c*t+d) );
}

void main( )
{
    vec2 uv = frag_coord;
    vec2 uv0 = uv;
    vec3 finalColor = vec3(0.0);

    float angle = iTime * 0.008;

    for (float i=0.0; i<2.0; i++)
    {
        uv = uv * 1.5 - 0.5;

        vec3 col = palette(length(uv0) + i*0.4);
        float d = length(uv) * exp(-length(uv0) + iTime*0.008);
        d = cos(d*8.0 + iTime)/6.0;
        d = abs(d);
        d = pow(0.01 / d, 1.4) + 0.1;

        finalColor += col * d;
    }

    frag_color = vec4(finalColor, 1.0);
}