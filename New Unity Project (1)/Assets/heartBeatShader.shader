Shader "ClaseCG/heartBeatShader"
{
    Properties
    {
        _Ambient ("Color ambiente", Color) = (1,1,1,1)
        _Difuso ("Color difuso", Color) = (1,0,0,1)
        _Specular ("Color especular", Color) = (1,1,1,1)
        _Brillito ("Coeficiente de brillo", FLoat) = 10
        _Speed("Velocidad", Range(-200,200)) = 10
    }
    SubShader
    {
        Pass 
        {
            
            CGPROGRAM
            
            //definir 2 shaders

            //vertex shader
            //fragment shader
            #pragma vertex vert
            #pragma fragment frag

            uniform float4 _Ambient;
            uniform float4 _Speed;
            struct vInput {
                float4 pos : POSITION;
                float3 normal : NORMAL;

            };

            //float4 - vector tamaño 4 de floats
            float4  vert(vInput input) : SV_POSITION {
                //float4 modPos = float4(pos.x+2, pos.y, pos.z, pos.w);

                float3 ver = input.pos.xyz + input.normal.xyz * (_SinTime.z / 60);

                float3 result1 = UnityObjectToClipPos(ver);
                float4 position = UnityObjectToClipPos(input.pos);
                
                float4 result = float4(result1, position.w);
                
                return result;
            }   
            float4 frag() : COLOR {
                return _Ambient;
            }


            ENDCG
        }
        
    }
    FallBack "Diffuse"
}
