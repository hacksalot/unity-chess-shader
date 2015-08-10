/**
Sample chessboard shader #2 from the Unity manual.
http://docs.unity3d.com/Manual/SL-VertexFragmentShaderExamples.html
*/

Shader "Chess/Simple2" {
    Properties
    {
      _Magnitude ("Magnitude", Float) = 8 // chessboard size
    }
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            float _Magnitude; // chessboard size

            #include "UnityCG.cginc"

            fixed4 frag(v2f_img i) : SV_Target {
                bool p = fmod(i.uv.x*_Magnitude,2.0) < 1.0;
                bool q = fmod(i.uv.y*_Magnitude,2.0) > 1.0;
                bool c = (p && q) || !(p || q);

                return fixed4( c, c, c, 1.0 );
            }
            ENDCG
        }
    }
}
