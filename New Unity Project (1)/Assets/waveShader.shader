Shader "ClaseCG/shaderWaves"{
    Properties{
        _Strength("Fuerza", Range(0,2)) = 1.0
        _Color("Color", Color) = (0,0,0,1)
        _Speed("Velocidad", Range(-200,200)) = 100
    }

    SubShader{
        Tags{"RenderType" = "transparent" }
            Pass
            {
            Cull Off

            CGPROGRAM

            #pragma fragment fragmentFunction
            #pragma vertex vertexFunction
            

            float _Speed;
            float4 _Color;
            float _Strength;
            


            struct vertexIn{
                float4 vertex : POSITION;

            };

            struct vertexOut{
                float4 position : SV_POSITION;
            };

            vertexOut vertexFunction(vertexIn IN){
                vertexOut obj;

                float4 positionWorld = mul(unity_ObjectToWorld, IN.vertex);
                float4 distance = (cos(positionWorld.y) + cos(positionWorld.x + (_Speed * _Time)));
                positionWorld.y = positionWorld.y + (distance * _Strength);
                obj.position = mul(UNITY_MATRIX_VP, positionWorld);

                return obj;

            }

            float4 fragmentFunction(vertexOut IN) : COLOR{
                return _Color;
            }

            
            ENDCG
            
            }
            

            
            
        
    }



}
