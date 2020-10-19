Shader "ClaseCG/NewSurfaceShader"
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
            uniform float _Brillito;

            struct vInput {
                float4 pos : POSITION;
                float3 normal : NORMAL;
                float4 texcoord : TEXCOORD0;
            };
            struct vOutput{
                float4 pos : SV_POSITION;
                float3 normal : NORMAL ;
                float4 tex : TEXCOORD0;
                float3 v: TEXCOORD1;
            };

            

            //float4 - vector tamaño 4 de floats
            vOutput vert(vInput input){

                //float4  v : TEXCOORD1;
                float4 result = UnityObjectToClipPos(input.pos);
                vOutput resultado;
                resultado.pos = result;
                resultado.normal = input.normal;
                
                
                resultado.tex = input.texcoord;
                //acceder a elementos de vectores, result.x, result.y, result.xy, result.xyz, result.d, result.r
                
                //calcular vector v
                // restar la posicion de vista - posicion de vertice

                float3 vertexGlobal = mul(input.pos, unity_ObjectToWorld).xyz;
                float3 haciaVista = _WorldSpaceCameraPos - vertexGlobal;
                resultado.v = normalize(haciaVista);
                
                
                return resultado;
            }   
            float4 frag(vOutput input) : COLOR {
                //Ambiental: ka * ia
                float4 ambiental = float4(0,0,0,0);
                ambiental = _Ambient * _LightColor0 * 0.2;
                //Difuso: kd (L . N) id
                // L  vector que va en direccion de la luz
                float3 l =  normalize(_WorldSpaceLightPos0.xyz * -1);
                // N vector normal
                // para cambiar el espacio de las coordenadas
                float3 n = normalize(mul(float4(input.normal, 0), unity_WorldToObject));
                float3 n2 = normalize(UnityObjectToViewPos(input.normal));
                //cosas por hacer   
                //dot() es el metodo para producto punto
                //resultado puedes ser negativo

               float producto = max(0.0, dot(l,n2));
                float4 difuso = float4(0,0,0,0);
                difuso = _Difuso * _LightColor0 * producto;

                
                float4 especular = float4(0,0,0,0);

                float3 v = input.v;
                float3 r = reflect(-l,n);
                
                //Especular: ks (R . V)**a is
                float product = max(0.0,dot(v,r));
                especular = _Specular *_LightColor0 * (pow(product, _Brillito));
                //return float4(ambiental+difuso+especular);
            
                return float4(ambiental+difuso+especular) + tex2D(_Textura, input.tex.xy);
            }


            ENDCG
        }
        
    }
    FallBack "Diffuse"
}
