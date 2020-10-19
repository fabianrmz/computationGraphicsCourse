Shader "ClaseCG/shaderLight"
{
    Properties
    {
        _Ambient ("Color ambiente", Color) = (1,1,1,1)
        _Difuso ("Color difuso", Color) = (1,0,0,1)
        _Specular ("Color especular", Color) = (1,1,1,1)
        _Brillito ("Coeficiente de brillo", FLoat) = 10
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
            #include "UnityCG.cginc"

            uniform float4 _LightColor0;
            uniform float4 _Ambient;
            uniform float4 _Difuso;

            struct vInput {
                float4 pos : POSITION;
                float3 normal : NORMAL;

            };
            struct vOutput{
                float4 pos : SV_POSITION;
                float3 normal : NORMAL ;
            };

            

            //float4 - vector tamaño 4 de floats
            vOutput vert(vInput input){
                float4 result = UnityObjectToClipPos(input.pos);
                vOutput resultado;
                resultado.pos = result;
                resultado.normal = input.normal;
                
                
                //acceder a elementos de vectores, result.x, result.y, result.xy, result.xyz, result.d, result.r
                return resultado;
            }   
            float4 frag(vInput input) : COLOR {
                //Ambiental: ka * ia
                float4 ambiental = float4(0,0,0,0);
                ambiental = _Ambient * _LightColor0 * 0.5;
                //Difuso: kd (L . N) id
                // L  vector que va en direccion de la luz
                float l =  normalize(_WorldSpaceLightPos0.xyz);
                // N vector normal
                // para cambiar el espacio de las coordenadas
                float3 n = normalize(mul(float4(input.normal, 0), unity_WorldToObject));

                //cosas por hacer
                //dot() es el metodo para producto punto
                //resultado puedes ser negativo



                float4 difuso = float4(0,0,0,0);
                difuso = _Difuso * _LightColor0 * max(0.0, dot(n, l));
                //Especular: ks (R . V)**a is
                float4 especular = float4(0,0,0,0);
                return float4(ambiental+difuso+especular);
            }


            ENDCG
        }
        
    }
    FallBack "Diffuse"
}
