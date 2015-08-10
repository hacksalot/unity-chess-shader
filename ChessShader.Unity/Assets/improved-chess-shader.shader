/**
An improved version of the Unity chessboard shader, based on GPU Gems, Chapter
25 (http://http.developer.nvidia.com/GPUGems/gpugems_ch25.html).
*/

Shader "Chess/Derivative" {
  Properties
  {
    _Magnitude ("Magnitude", Float) = 8 // chessboard size
  }
  SubShader {
    Pass {



      CGPROGRAM
      #pragma vertex vert_img
      #pragma fragment frag
      #include "UnityCG.cginc"
      float _Magnitude; // chessboard size

      // An explicit definition of (and equivalent to) fwidth().
      float filter_width(float2 v) {
        float2 fw = max( abs(ddx(v)), abs(ddy(v)) );
        return max( fw.x, fw.y );
      }

      // Functionized version of the BUMP_INT macro
      float2 bump_int( float2 i ) {
        return floor((i)/2) + 2.f * max(((i)/2) - floor((i)/2) - .5f, 0.f);
      }

      // Given the interpolated UV coordinate for the current fragment/pixel,
      // return a color between black (0,0,0,1) and white (1,1,1,1) based on
      // a derivate-based filter width estimation. See:
      // http://http.developer.nvidia.com/GPUGems/gpugems_ch25.html
      float4 checker( float2 uv ) {
        float width = filter_width( uv ); // or fwidth( uv );
        float2 p0 = uv - .5 * width, p1 = uv + .5 * width;
        float2 i = ( bump_int(p1) - bump_int(p0) ) / width;
        return (i.x * i.y + (1 - i.x) * (1 - i.y)) * float4(1.0,1.0,1.0,1.0);
      }

      // The actual fragment shader
      fixed4 frag( v2f_img v2f ) : SV_Target {
        return checker( v2f.uv * _Magnitude );
      }



ENDCG } } }
