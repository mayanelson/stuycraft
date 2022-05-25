   int xMove, yMove;
   Player player;
  
  void setup(){
    background(255);
    size(3000, 2000);
    worldGenerate();
    player = new Player();
    xMove = 0;
    yMove = 0;
    stone0 = loadImage("Stone0.png");
    stone0.resize(scale, scale);
    sand0 = loadImage("Sand0.png");
    sand0.resize(scale, scale);
    leaf0 = loadImage("Leaf0.png");
    leaf0.resize(scale, scale);
    wood0 = loadImage("Wood0.png");
    wood0.resize(scale, scale);
    grass0 = loadImage("Grass0.png");
    grass0.resize(scale, scale);
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
    player.display();
    //translate(-1  * player.xVel, -1 * player.yVel);
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
