Shader "Custom/DiffuseEmissiveShader" {
	Properties 
	{
		_diffuseTex ("Diffuse Texture", 2D) = "white" {}
		_emissiveTex ("Emissive Texture", 2D) = "black"{}
	}
	SubShader 
	{
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _diffuseTex;
		sampler2D _emissiveTex;

		struct Input 
		{
			float2 uv_diffuseTex;
		};

		void surf (Input IN, inout SurfaceOutput o) 
		{
			o.Albedo = tex2D(_diffuseTex, IN.uv_diffuseTex).rgb;
			o.Emission = tex2D(_emissiveTex, IN.uv_diffuseTex).rgb;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
