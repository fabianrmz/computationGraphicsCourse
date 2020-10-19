Shader "ClaseCG/phongShader"
{
    Properties
    {
        _Ambient ("Color ambiente", Color) = (1,1,1,1)
        _Difuso ("Color difuso", Color) = (1,0,0,1)
        _Specular ("Color especular", Color) = (1,1,1,1)
        _Brillito ("Coeficiente de brillo", FLoat) = 10

        _Textura("Textura", 2D) = "white"
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
            uniform sampler2D _Textura;
            uniform float4 _Specular;

            struct vInput {
                float4 pos : POSITION;
                float3 normal : NORMAL;
                float4 textcoord : TEXCOORD0;
            };
            struct vOutput{
                float4 pos : SV_POSITION;
                float3 normal : NORMAL ;
                float4 tex : TEXCOORD0;
            };

            

            //float4 - vector tamaño 4 de floats
            vOutput vert(vInput input){
                float4 result = UnityObjectToClipPos(input.pos);
                vOutput resultado;
                resultado.pos = result;
                resultado.normal = input.normal;
                
                
                resultado.tex = input.textcoord;
                //acceder a elementos de vectores, result.x, result.y, result.xy, result.xyz, result.d, result.r
                return resultado;
            }   
            float4 frag(vInput input) : COLOR {
                //Ambiental: ka * ia
                float4 ambiental = float4(0,0,0,0);
                ambiental = _Ambient * _LightColor0 * 0.2;
                //Difuso: kd (L . N) id
                // L  vector que va en direccion de la luz
                float3 l =  normalize(_WorldSpaceLightPos0.xyz);
                // N vector normal
                // para cambiar el espacio de las coordenadas
                float3 n = normalize(mul(float4(input.normal, 0), unity_WorldToObject));

                //cosas por hacer
                //dot() es el metodo para producto punto
                //resultado puedes ser negativo
                float producto = max(0.0, dot(l,n));




                float4 difuso = float4(0,0,0,0);
                difuso = _Difuso * _LightColor0 * producto;
                //Especular: ks (R . V)**a is
                float4 especular = float4(0,0,0,0);
                float3 r = reflect(-l,n);
                float3 v = normalize(_WorldSpaceCameraPos.xyz - input.pos.xyz);
                especular = _Specular * _LightColor0 * pow(dot(r,v),1);

                //return float4(ambiental+difuso+especular);
            
                return float4(ambiental+difuso+especular) ;
            }


            ENDCG
        }
        
    }
    FallBack "Diffuse"
}