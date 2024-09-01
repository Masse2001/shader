// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5100563,fgcg:0.5887052,fgcb:0.6544118,fgca:1,fgde:0.005,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33041,y:32737,varname:node_3138,prsc:2|emission-8452-RGB,clip-8452-A,voffset-2839-OUT;n:type:ShaderForge.SFN_Tex2d,id:8452,x:32503,y:32696,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_8452,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e4504dd2c3c34464bb8ce9453dce0e87,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:5420,x:32549,y:32887,varname:node_5420,prsc:2;n:type:ShaderForge.SFN_Multiply,id:2839,x:32838,y:33060,varname:node_2839,prsc:2|A-5420-R,B-3051-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2006,x:31975,y:33336,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_2006,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Cos,id:2678,x:32030,y:33666,varname:node_2678,prsc:2|IN-8681-OUT;n:type:ShaderForge.SFN_Time,id:1565,x:31776,y:33666,varname:node_1565,prsc:2;n:type:ShaderForge.SFN_TexCoord,id:4471,x:31776,y:33474,varname:node_4471,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_OneMinus,id:2948,x:31986,y:33484,varname:node_2948,prsc:2|IN-4471-V;n:type:ShaderForge.SFN_Multiply,id:5462,x:32208,y:33530,varname:node_5462,prsc:2|A-2948-OUT,B-2678-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:7363,x:32076,y:33055,varname:node_7363,prsc:2;n:type:ShaderForge.SFN_Sin,id:4980,x:32241,y:33055,varname:node_4980,prsc:2|IN-7363-X;n:type:ShaderForge.SFN_Multiply,id:3393,x:32464,y:33174,varname:node_3393,prsc:2|A-4980-OUT,B-4164-OUT;n:type:ShaderForge.SFN_Multiply,id:4164,x:32291,y:33269,varname:node_4164,prsc:2|A-2006-OUT,B-5462-OUT;n:type:ShaderForge.SFN_Append,id:3051,x:32732,y:33322,varname:node_3051,prsc:2|A-3393-OUT,B-6644-OUT,C-3393-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6644,x:32518,y:33476,ptovrint:False,ptlb:Height,ptin:_Height,varname:node_6644,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:746,x:31776,y:33878,ptovrint:False,ptlb:Frequency,ptin:_Frequency,varname:node_746,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2;n:type:ShaderForge.SFN_Multiply,id:8681,x:31939,y:33818,varname:node_8681,prsc:2|A-1565-T,B-746-OUT;proporder:8452-2006-6644-746;pass:END;sub:END;*/

Shader "Shader Forge/Unlit-SimpleGrass" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _Intensity ("Intensity", Float ) = 10
        _Height ("Height", Float ) = 0
        _Frequency ("Frequency", Float ) = 2
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Intensity;
            uniform float _Height;
            uniform float _Frequency;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 node_1565 = _Time;
                float node_3393 = (sin(mul(unity_ObjectToWorld, v.vertex).r)*(_Intensity*((1.0 - o.uv0.g)*cos((node_1565.g*_Frequency)))));
                v.vertex.xyz += (o.vertexColor.r*float3(node_3393,_Height,node_3393));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = _MainTex_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Intensity;
            uniform float _Height;
            uniform float _Frequency;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 posWorld : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 node_1565 = _Time;
                float node_3393 = (sin(mul(unity_ObjectToWorld, v.vertex).r)*(_Intensity*((1.0 - o.uv0.g)*cos((node_1565.g*_Frequency)))));
                v.vertex.xyz += (o.vertexColor.r*float3(node_3393,_Height,node_3393));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(_MainTex_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
