  void setup(){
    background(255);
    size(3000, 2000);
    worldGenerate();
  }
  
  void draw(){
    for (Block[] row : world){
     for  (Block spot: row){
       if (spot != null){ spot.display(); }
     }
    }
  }
  
  void keyPressed(){
  }
  
  void mouseClicked(){
  }
