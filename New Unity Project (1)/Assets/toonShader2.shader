Shader "Custom/Toon"
{
	Properties
	{
		_Color("Color", Color) = (0.5, 0.65, 1, 1)
		_MainTex("Main Texture", 2D) = "white" {}
		_AmbientColor("Ambient Color", Color) = (0.4, 0.4, 0.4, 1)

		_OutlineTex("Outline Texture", 2D) = "white" {}
		_OutlineColor("Outline Color", Color) = (0,0,0,1)
		_OutlineWidth("Outline Width", Range(1.0,1.15)) = 1.1
	}
	SubShader
	{
		Pass
		{
			Name "OUTLINE"

			ZWrite Off

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv : TEXCOORD0;
			};

			float _OutlineWidth;
			float4 _OutlineColor;
			sampler2D _OutlineTex;

			v2f vert(appdata IN)
			{
				IN.vertex.xyz *= _OutlineWidth;
				v2f OUT;

				OUT.pos = UnityObjectToClipPos(IN.vertex);
				OUT.uv = IN.uv;

				return OUT;
			}

			fixed4 frag(v2f IN) : SV_Target
			{
				float4 texColor = tex2D(_OutlineTex, IN.uv);
				return texColor * _OutlineColor;
			}

			ENDCG
		}
		Pass
		{
			Name "OBJECT"
			Tags
			{
				"LightMode" = "ForwardBase"
				"PassFlags" = "OnlyDirectional"
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"
			#include "Lighting.cginc"

			struct appdata
			{
				float4 vertex : POSITION;				
				float4 uv : TEXCOORD0;
				float3 normal : NORMAL;
			};

			struct v2f
			{
				float4 pos : SV_POSITION;
				float2 uv : TEXCOORD0;
				float3 worldNormal : NORMAL;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.worldNormal = UnityObjectToWorldNormal(v.normal);
				return o;
			}
			
			float4 _Color;
			float4 _AmbientColor;

			float4 frag(v2f i) : SV_Target
			{
				float3 normal = normalize(i.worldNormal);
				float NdotL = dot(_WorldSpaceLightPos0, normal);
				float lightIntensity;
				if (NdotL >= 0) {
					lightIntensity = 1;
				}
				else if (NdotL > -0.5 && NdotL < 0) {
					lightIntensity = 0.5;
				}
				else if (NdotL <= -0.5) {
					lightIntensity = 0;
				}
				float4 light = lightIntensity * _LightColor0;
				float4 sample = tex2D(_MainTex, i.uv);

				return _Color * sample * (_AmbientColor + light);
			}
			ENDCG
		}
	}
}