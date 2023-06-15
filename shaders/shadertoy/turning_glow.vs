//https://iquilezles.org/articles/palettes/
vec3 palette ( in float t )
{
    vec3 a = vec3(0.5, 0.5, 0.5);
    vec3 b = vec3(0.5, 0.5, 0.5);
    vec3 c = vec3(1.0, 1.0, 1.0);
    vec3 d = vec3(0.263, 0.416, 0.557);

    return a + b*cos( 6.28318*(c*t+d) );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (centered and from -1 to 1)
    vec2 uv = (fragCoord * 2.0 - iResolution.xy) / iResolution.y;
    vec2 uv0 = uv;
    vec3 finalColor = vec3(0.0);

    float rot = radians(45.0*sin(iTime*0.3));
    mat2 rotation_matrix = mat2(cos(rot), -sin(rot), sin(rot), cos(rot));
   	uv = rotation_matrix * uv;

    for (float i=0.0; i<4.0; i++)
    {
        uv = fract(uv) - 0.5;

        float d = length(uv) * exp(-length(uv0));
        vec3 col = palette(length(uv0) + iTime*0.2);

        d = abs(sin(d*10.0 + i*0.4 + iTime*0.3) / 8.0);

        d = pow(0.01 / d, 1.5);

        finalColor += col * d;
    }

    fragColor = vec4(finalColor, 1.0);
}