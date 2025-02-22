using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using System.Threading; 

public class MapGenerator : MonoBehaviour
{
    
    
    public const int mapChunkSize = 241;

    [Range(0,6)]
    public int levelOfDetails;

    [SerializeField] float noiseScale;
    public enum DrawMode {NoiseMap, ColorMap, Mesh};
    public DrawMode drawMode;

    public int octaves;
    [Range(0,1)]
    public float persistance;
    public float lacunarity;
    public int seed;
    public Vector2 offset;

    public float meshHeightMultiplier ;
    public AnimationCurve meshHeightCurve;


    public bool autoGenerate;

    public TerrainType [] regions;


    Queue<MapThreadInfo<MapData>> mapThreadInfoQueue = new Queue<MapThreadInfo<MapData>>();
    Queue<MapThreadInfo<MeshData>> meshThreadInfoQueue = new Queue<MapThreadInfo<MeshData>>();

    public void DrawMapInEditor(){

        MapData mapData = GenerateMapData();
        MapDisplay display = FindObjectOfType<MapDisplay>();
        if(drawMode == DrawMode.NoiseMap){
            display.DrawTexture(TextureGenerator.TextureFormHeightMap(mapData.heightMap));
        }else if(drawMode == DrawMode.ColorMap){
            display.DrawTexture(TextureGenerator.TextFromColorMap(mapData.colorMap, mapChunkSize, mapChunkSize));
        }else if (drawMode == DrawMode.Mesh) {
            display.DrawMesh(MeshGenerator.GenerateTerrainMesh(mapData.heightMap, meshHeightMultiplier, meshHeightCurve, levelOfDetails), TextureGenerator.TextFromColorMap(mapData.colorMap, mapChunkSize, mapChunkSize));
        }
        
    }

    public void RequestMapData(Action<MapData> callback){
        ThreadStart threadStart  = delegate{
            MapDataThread(callback);
        };
        new Thread(threadStart).Start();
    }

    void MapDataThread(Action<MapData> callback){
        MapData mapData = GenerateMapData();
        lock (mapThreadInfoQueue){
            mapThreadInfoQueue.Enqueue(new MapThreadInfo<MapData>(callback, mapData));
        }
    }

    public void RequestMeshData(MapData mapData, Action<MeshData> callback){
        ThreadStart threadStart  = delegate{
            MeshDataThread(mapData, callback);
        };
        new Thread(threadStart).Start();
    }

    void MeshDataThread(MapData mapData, Action<MeshData> callback){
        MeshData meshData = MeshGenerator.GenerateTerrainMesh(mapData.heightMap, meshHeightMultiplier, meshHeightCurve, levelOfDetails );
        lock (meshThreadInfoQueue){
            meshThreadInfoQueue.Enqueue(new MapThreadInfo<MeshData>(callback, meshData));
        }
    }


    private void Update(){
        if(mapThreadInfoQueue.Count > 0){
            for(int i = 0; i< mapThreadInfoQueue.Count; i++ ){
                MapThreadInfo<MapData> threadInfo = mapThreadInfoQueue.Dequeue();
                threadInfo.callback(threadInfo.parameter);
            }
        }
        if(meshThreadInfoQueue.Count > 0){
            for(int i = 0; i< meshThreadInfoQueue.Count; i++ ){
                MapThreadInfo<MeshData> threadInfo = meshThreadInfoQueue.Dequeue();
                threadInfo.callback(threadInfo.parameter);
            }
        }
    }


    public MapData GenerateMapData(){

        float [,] noiseMap = Noise.GenerateNoiseMap(mapChunkSize, mapChunkSize, noiseScale, seed, octaves, persistance, lacunarity, offset);


        Color[] colorMap = new Color[mapChunkSize * mapChunkSize];
        for (int y = 0; y < mapChunkSize; y++){
            for (int x = 0; x < mapChunkSize; x++){
                float currentHeight = noiseMap[x, y];
                for (int i = 0; i < regions.Length; i++){
                    if(currentHeight <= regions[i].height){
                        colorMap[y * mapChunkSize + x] = regions[i].color;
                        break;
                    }
                }
            }
        }

        return new MapData(noiseMap, colorMap);


    }

    private void OnValidate(){

        if(lacunarity < 1){
            lacunarity = 1;
        }

        if(octaves < 0){
            octaves = 0;
        }

    }

    struct MapThreadInfo<T>{
        public readonly Action<T> callback;
        public readonly T parameter;
         
        public MapThreadInfo(Action<T> callback, T parameter){
            this.callback = callback;
            this.parameter = parameter;
        }

    }

}

[System.Serializable]
public struct TerrainType{

    public string name;
    public float height;
    public Color color;
}


public struct MapData{
    public readonly float[,] heightMap;
    public readonly Color[] colorMap;

    public MapData(float[,] heightMap, Color[] colorMap)
    {
        this.heightMap = heightMap;
        this.colorMap = colorMap;
    }

}

