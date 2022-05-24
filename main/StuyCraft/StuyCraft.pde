   int xMove, yMove;
  
  void setup(){
    background(255);
    size(3000, 2000);
    worldGenerate();
    xMove = 0;
    yMove = 0;
    stone0 = loadImage("Stone0.png");
    stone0.resize(scale, scale);
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
        yMove += 1.5 * scale;
        break;
      case ('s'):
        yMove -=1.5 * scale;
        break;
      case ('a'):
        xMove += 1.5 * scale;
        break;
      case ('d'):
        xMove -= 1.5 * scale;
        break;
    }
  }
  
  void mouseClicked(){
  }
