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

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (centered and from -1 to 1)
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
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
    
    fragColor = vec4(finalColor, 1.0);
}