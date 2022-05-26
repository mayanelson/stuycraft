public class Biome{
  float mobSpawn;
  float treeSpawn;
  int leftX, rightX, upperY, lowerY;
  
  Biome(float mobSpawn, float treeSpawn, int x1, int x2, int y1, int y2){
   this.mobSpawn = mobSpawn;
   this.treeSpawn = treeSpawn;
   leftX = x1;
   rightX = x2;
   upperY = y1;
   lowerY = y2;
  }
  
  void spawnMob(){}
}
