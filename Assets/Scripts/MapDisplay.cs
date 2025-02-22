using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MapDisplay : MonoBehaviour
{
    [SerializeField] private Renderer textureRenderer; 
    public MeshFilter meshFilter;
    public MeshRenderer meshRenderer;
    public void DrawTexture(Texture2D texture)
    {
        if (textureRenderer == null) {
            Debug.LogError("Texture Renderer is not assigned.");
            return;
        }

        textureRenderer.sharedMaterial.mainTexture = texture;
        textureRenderer.transform.localScale = new Vector3(texture.width, 1, texture.height);
    }

    public void DrawMesh(MeshData meshData, Texture2D texture){

        meshFilter.sharedMesh = meshData.CreatMesh();
        meshRenderer.sharedMaterial.mainTexture = texture;
    }
}
