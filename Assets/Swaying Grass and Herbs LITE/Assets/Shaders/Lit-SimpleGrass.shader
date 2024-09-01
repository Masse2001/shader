// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33250,y:32254,varname:node_4013,prsc:2|diff-5653-RGB,normal-1332-OUT,amdfl-5988-OUT,clip-7796-OUT,voffset-2112-OUT;n:type:ShaderForge.SFN_Multiply,id:2112,x:32780,y:32861,varname:node_2112,prsc:2|A-4381-R,B-5668-OUT;n:type:ShaderForge.SFN_VertexColor,id:4381,x:32577,y:32792,varname:node_4381,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:5653,x:32505,y:32233,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5653,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e4504dd2c3c34464bb8ce9453dce0e87,ntxv:0,isnm:False|UVIN-5911-UVOUT;n:type:ShaderForge.SFN_Append,id:5668,x:32636,y:33042,varname:node_5668,prsc:2|A-9224-OUT,B-4770-OUT,C-9224-OUT;n:type:ShaderForge.SFN_Multiply,id:9224,x:32446,y:32923,varname:node_9224,prsc:2|A-188-OUT,B-7801-OUT;n:type:ShaderForge.SFN_Sin,id:188,x:32267,y:32829,varname:node_188,prsc:2|IN-6003-X;n:type:ShaderForge.SFN_FragmentPosition,id:6003,x:32025,y:32829,varname:node_6003,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7801,x:32250,y:33022,varname:node_7801,prsc:2|A-3390-OUT,B-2434-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4770,x:32463,y:33209,ptovrint:False,ptlb:,ptin:_,varname:node_4770,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:3390,x:32008,y:33022,ptovrint:False,ptlb:Intensity,ptin:_Intensity,varname:node_3390,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Multiply,id:2434,x:32112,y:33162,varname:node_2434,prsc:2|A-1510-OUT,B-9033-OUT;n:type:ShaderForge.SFN_Cos,id:9033,x:31922,y:33252,varname:node_9033,prsc:2|IN-9985-T;n:type:ShaderForge.SFN_TexCoord,id:9269,x:31685,y:33106,varname:node_9269,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Time,id:9985,x:31708,y:33276,varname:node_9985,prsc:2;n:type:ShaderForge.SFN_OneMinus,id:1510,x:31892,y:33106,varname:node_1510,prsc:2|IN-9269-V;n:type:ShaderForge.SFN_Multiply,id:7796,x:32667,y:32369,varname:node_7796,prsc:2|A-5653-A,B-4764-OUT;n:type:ShaderForge.SFN_Slider,id:4764,x:32333,y:32420,ptovrint:False,ptlb:Alpha Strength,ptin:_AlphaStrength,varname:node_4764,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_TexCoord,id:5911,x:32086,y:32300,varname:node_5911,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:7143,x:32213,y:32536,ptovrint:False,ptlb:Normal Map,ptin:_NormalMap,varname:node_7143,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True|UVIN-5911-UVOUT;n:type:ShaderForge.SFN_ComponentMask,id:7503,x:32382,y:32543,varname:node_7503,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-7143-RGB;n:type:ShaderForge.SFN_Multiply,id:3621,x:32605,y:32543,varname:node_3621,prsc:2|A-7503-OUT,B-2128-OUT;n:type:ShaderForge.SFN_Slider,id:2128,x:32225,y:32710,ptovrint:False,ptlb:Normal Strength,ptin:_NormalStrength,varname:node_2128,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Append,id:1332,x:32766,y:32529,varname:node_1332,prsc:2|A-3621-OUT,B-7663-OUT;n:type:ShaderForge.SFN_Vector1,id:7663,x:32634,y:32678,varname:node_7663,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:5988,x:33054,y:32305,varname:node_5988,prsc:2|A-5653-RGB,B-6149-OUT;n:type:ShaderForge.SFN_Slider,id:6149,x:32897,y:32454,ptovrint:False,ptlb:Ambient Light,ptin:_AmbientLight,varname:node_6149,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:5653-4770-3390-4764-7143-2128-6149;pass:END;sub:END;*/

Shader "Shader Forge/Lit-SimpleGrass" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _ ("", Float ) = 0
        _Intensity ("Intensity", Float ) = 10
        _AlphaStrength ("Alpha Strength", Range(0, 1)) = 1
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalStrength ("Normal Strength", Range(0, 1)) = 0
        _AmbientLight ("Ambient Light", Range(0, 1)) = 0
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _;
            uniform float _Intensity;
            uniform float _AlphaStrength;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _NormalStrength;
            uniform float _AmbientLight;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_9985 = _Time;
                float node_9224 = (sin(mul(unity_ObjectToWorld, v.vertex).r)*(_Intensity*((1.0 - o.uv0.g)*cos(node_9985.g))));
                v.vertex.xyz += (o.vertexColor.r*float3(node_9224,_,node_9224));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = float3((_NormalMap_var.rgb.rg*_NormalStrength),1.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip((_MainTex_var.a*_AlphaStrength) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += (_MainTex_var.rgb*_AmbientLight); // Diffuse Ambient Light
                float3 diffuseColor = _MainTex_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _;
            uniform float _Intensity;
            uniform float _AlphaStrength;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _NormalStrength;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_9985 = _Time;
                float node_9224 = (sin(mul(unity_ObjectToWorld, v.vertex).r)*(_Intensity*((1.0 - o.uv0.g)*cos(node_9985.g))));
                v.vertex.xyz += (o.vertexColor.r*float3(node_9224,_,node_9224));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = float3((_NormalMap_var.rgb.rg*_NormalStrength),1.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip((_MainTex_var.a*_AlphaStrength) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = _MainTex_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
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
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _;
            uniform float _Intensity;
            uniform float _AlphaStrength;
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
                float4 node_9985 = _Time;
                float node_9224 = (sin(mul(unity_ObjectToWorld, v.vertex).r)*(_Intensity*((1.0 - o.uv0.g)*cos(node_9985.g))));
                v.vertex.xyz += (o.vertexColor.r*float3(node_9224,_,node_9224));
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip((_MainTex_var.a*_AlphaStrength) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
