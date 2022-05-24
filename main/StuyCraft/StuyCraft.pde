   int xMove, yMove;
  
  void setup(){
    background(255);
    size(3000, 2000);
    worldGenerate();
    xMove = 0;
    yMove = 0;
  }
  
  void draw(){
    background(255);
    pushMatrix();
    translate(xMove, yMove);
    for (Block[] row : world){
     for  (Block spot: row){
       if (spot != null){ spot.display(); }
     }
    }
    popMatrix();
  }
  
  void keyPressed(){
    switch (key){
      case ('w'):
        yMove += scale;
        break;
      case ('s'):
        yMove -= scale;
        break;
      case ('a'):
        xMove += scale;
        break;
      case ('d'):
        xMove -= scale;
        break;
    }
  }
  
  void mouseClicked(){
  }
