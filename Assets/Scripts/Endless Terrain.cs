using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EndlessTerrain : MonoBehaviour
{
    
    public const float maxViewDst = 500f; 
    public Transform viewer; 

    public Material mapMaterial;

    public static Vector3 viewerPosition; 
    static MapGenerator mapGenerator;
    int chunkSize;
    int chunksVisibleInViewDst;

    Dictionary<Vector2, TerrainChunk> terrainChunkDictionary = new Dictionary<Vector2, TerrainChunk>();
    List<TerrainChunk> terrainChunksVisibleLastUpdate = new List<TerrainChunk>();


    private void Start(){
        mapGenerator = FindObjectOfType<MapGenerator>();
        chunkSize = MapGenerator.mapChunkSize - 1;
        chunksVisibleInViewDst = Mathf.RoundToInt(maxViewDst / chunkSize);
    }

    private void Update(){
        viewerPosition = new Vector3(viewer.position.x, 0, viewer.position.z);
        UpdateVisibleChunks(); 
    }


    void UpdateVisibleChunks(){ 

         for (int i = 0; i < terrainChunksVisibleLastUpdate.Count; i++){
            terrainChunksVisibleLastUpdate[i].SetVisible(false);
        }
        terrainChunksVisibleLastUpdate.Clear();

        int currentChunkCoordX = Mathf.RoundToInt(viewerPosition.x / chunkSize); 
        int currentChunkCoordY = Mathf.RoundToInt(viewerPosition.z / chunkSize); 

        for(int yOffset = -chunksVisibleInViewDst; yOffset <= chunksVisibleInViewDst; yOffset++){ 
            for(int xOffset = -chunksVisibleInViewDst; xOffset <= chunksVisibleInViewDst; xOffset++){
                Vector2 viewerChunkCoord = new Vector2(currentChunkCoordX + xOffset, currentChunkCoordY + yOffset); 

                if(terrainChunkDictionary.ContainsKey(viewerChunkCoord)){
                    terrainChunkDictionary[viewerChunkCoord].UpdateTerrainChunk(); 
                    if (terrainChunkDictionary[viewerChunkCoord].IsVisible()){ 
                        terrainChunksVisibleLastUpdate.Add(terrainChunkDictionary[viewerChunkCoord]);
                    }
                } else {
                    terrainChunkDictionary.Add(viewerChunkCoord, new TerrainChunk(viewerChunkCoord, chunkSize, transform, mapMaterial )); 
                }
            }
        }
    }


    public class TerrainChunk
    {
        GameObject meshObject;
        Vector2 position;
        Bounds bounds; 

        MapData mapData;
        MeshRenderer meshRenderer;
        MeshFilter meshFilter;



        public TerrainChunk(Vector2 coord, int size, Transform parent, Material material){
            position = coord * size;
            bounds = new Bounds(position, Vector2.one * size); 
            Vector3 positionV3 = new Vector3(position.x, 0, position.y);

            meshObject = new GameObject("Terrain chunk");
            meshFilter = meshObject.AddComponent<MeshFilter>();
            meshRenderer = meshObject.AddComponent<MeshRenderer>();
            meshRenderer.material = material;
            meshObject.transform.position = positionV3;
            meshObject.transform.parent = parent;
            SetVisible(false);
            
            mapGenerator.RequestMapData(OnMapDataReceived);
        }

        public void OnMapDataReceived(MapData mapData){
            mapGenerator.RequestMeshData(mapData, OnMeshDataReceived);
        }


        void OnMeshDataReceived(MeshData meshData){
            meshFilter.mesh = meshData.CreatMesh();
        }


        public void UpdateTerrainChunk(){ 
            float viewerDstFromNearestEdge = Mathf.Sqrt(bounds.SqrDistance(viewerPosition)); 
            bool visible = viewerDstFromNearestEdge <= maxViewDst; 
            SetVisible(visible);
        }

        public void SetVisible(bool visible){
            meshObject.SetActive(visible);
        }

        public bool IsVisible(){
            return meshObject.activeSelf;
        }
    }

}
