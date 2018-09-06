Shader "Custom/BumpDiffuse" {
	Properties {
		_diffuseTex ("Albedo (RGB)", 2D) = "white" {}
		_bumpTex ("Bump (RGB)", 2D) = "bump" {}
		_bumpSlider ("Bump Amount", Range(0,10)) = 1
		_bumpBrightness ("Bump Brightness", Range(0, 10)) = 1
	}
	SubShader {
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _diffuseTex;
		sampler2D _bumpTex;
		half _bumpSlider;
		half _bumpBrightness;

		struct Input {
			float2 uv_diffuseTex;
			float2 uv_bumpTex;
		};


		void surf (Input IN, inout SurfaceOutput o) 
		{
			o.Albedo = tex2D (_diffuseTex, IN.uv_diffuseTex).rgb;
			o.Normal = UnpackNormal(tex2D(_bumpTex, IN.uv_bumpTex));
			o.Normal *= float3(_bumpSlider, _bumpSlider, _bumpBrightness);
		}
		ENDCG
	}
	FallBack "Diffuse"
}
