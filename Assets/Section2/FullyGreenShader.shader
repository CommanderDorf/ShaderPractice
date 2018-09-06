Shader "Custom/FullyGreenShader" {
	Properties 
	{
		_mainTexture ("Main Texture", 2D) = "white" {}
	}
	SubShader {
		CGPROGRAM
		#pragma surface surf Lambert

		struct Input 
		{
			float2 uv_mainTexture;
		};

		sampler2D _mainTexture;

		void surf (Input IN, inout SurfaceOutput o) 
		{
			o.Albedo = tex2D(_mainTexture, IN.uv_mainTexture).rgb;
			o.Albedo.g = 1;
		}
		ENDCG
	}
	FallBack "Diffuse"
}