using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Noise 
{
   public static float [,] GenerateNoiseMap( int mapWidth, int mapHeight, float scale, int seed, int octaves, float persistance, float lacunarity, Vector2 offset){

        if (scale <= 0 ){
            scale = 0.0001f;
        }

        System.Random prng = new System.Random(seed);
        Vector2[] octaveOffsets = new Vector2[octaves];
        for (int i = 0; i < octaves; i++)
        {
            float offsetX = prng.Next(-100000, 100000) + offset.x;
            float offsetY = prng.Next(-100000, 100000) + offset.y;
            octaveOffsets[i] = new Vector2(offsetX, offsetY);
        }



        float [,] noiseMap = new float [mapWidth, mapHeight];

        float maxNoiseHeight = float.MinValue;
        float minNoiseHeight = float.MaxValue;

        float halfWidth = mapWidth/2;
        float halfHeight = mapHeight / 2;


        for (int y = 0; y< mapHeight; y++){

            for (int x = 0; x< mapWidth; x++){
                float ampliture = 1;
                float frequency = 1;
                float noiseHeight = 0;
            
                for (int i = 0; i < octaves; i++){
            
                    float sampleX = ( x - halfWidth )/ scale * frequency + octaveOffsets[i].x;
                    float sampleY = ( y - halfHeight )/ scale * frequency + octaveOffsets[i].y;

                    float perlinValue = Mathf.PerlinNoise(sampleX, sampleY) * 2 - 1;
                    noiseHeight += perlinValue * ampliture;
                    ampliture *= persistance;
                    frequency*= lacunarity;
                }


                if (noiseHeight > maxNoiseHeight)
                {
                    maxNoiseHeight = noiseHeight;
                }
                if (noiseHeight < minNoiseHeight)
                {
                    minNoiseHeight = noiseHeight;
                }

                noiseMap[x, y] = noiseHeight;
            }
        }

        for (int y = 0; y < mapHeight; y++)
        {
            for (int x = 0; x < mapWidth; x++)
            {
                noiseMap[x, y] = Mathf.InverseLerp(minNoiseHeight, maxNoiseHeight, noiseMap[x, y]);
            }
        }



        return noiseMap;

   }
}

