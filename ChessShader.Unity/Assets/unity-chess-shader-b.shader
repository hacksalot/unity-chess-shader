/**
Sample chessboard shader #2 from the Unity manual.
http://docs.unity3d.com/Manual/SL-VertexFragmentShaderExamples.html
*/

Shader "Custom/TextureCoordinates/ChessOpt" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            fixed4 frag(v2f_img i) : SV_Target {
                bool p = fmod(i.uv.x*8.0,2.0) < 1.0;
                bool q = fmod(i.uv.y*8.0,2.0) > 1.0;
                bool c = (p && q) || !(p || q);

                return fixed4( c, c, c, 1.0 );
            }
            ENDCG
        }
    }
}
