shader_type spatial;

uniform float density = 100.0;
uniform float height = 0.0;
uniform float thickness = 2.0;

// The MIT License
// Copyright © 2017 Inigo Quilez
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
float hash1(uint n) {
    // integer hash copied from Hugo Elias
	n = (n << 13U) ^ n;
    n = n * (n * n * 15731U + 789221U) + 1376312589U;
    return float( n & uint(0x7fffffffU))/float(0x7fffffff);
}

void fragment() {
	uvec2 scaledUV = uvec2(density * UV);
	float localCenterDist = length((fract(density * UV) * 2.0) - 1.0);
	
	uint seed = scaledUV.x + 100U * scaledUV.y + 100U * 10U;
	float rand = mix(0.3, 1.0, hash1(seed));
	
	if (localCenterDist < (thickness * (rand - height))) {
		ALBEDO = vec3(0.0, 1.0 * height, 0.0);
	} else {
		discard;
	}
}
