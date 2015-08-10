/**
Sample chessboard shader #1 from the Unity manual.
http://docs.unity3d.com/Manual/SL-VertexFragmentShaderExamples.html
*/

Shader "Custom/TextureCoordinates/Chess" {
    SubShader {
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct vertexInput {
                float4 vertex : POSITION;
                float4 texcoord0 : TEXCOORD0;
            };

            struct fragmentInput{
                float4 position : SV_POSITION;
                float4 texcoord0 : TEXCOORD0;
            };

            fragmentInput vert(vertexInput i){
                fragmentInput o;
                o.position = mul (UNITY_MATRIX_MVP, i.vertex);
                o.texcoord0 = i.texcoord0;
                return o;
            }

            fixed4 frag(fragmentInput i) : SV_Target {
                fixed4 color;
                if ( fmod(i.texcoord0.x*8.0,2.0) < 1.0 ){
                    if ( fmod(i.texcoord0.y*8.0,2.0) < 1.0 )
                    {
                        color = fixed4(1.0,1.0,1.0,1.0);
                    } else {
                        color = fixed4(0.0,0.0,0.0,1.0);
                    }
                } else {
                    if ( fmod(i.texcoord0.y*8.0,2.0) > 1.0 )
                    {
                        color = fixed4(1.0,1.0,1.0,1.0);
                    } else {
                        color = fixed4(0.0,0.0,0.0,1.0);}
                    }
                return color;
            }
            ENDCG
        }
    }
}
