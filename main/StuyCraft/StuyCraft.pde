   int xMove, yMove;
   Player player;
  
  void setup(){
    background(255);
    size(1500, 1000);
    worldGenerate();
    player = new Player();
    xMove = 0;
    yMove = 0;
    stone0 = loadImage("Stone0.png");
    stone0.resize(scale, scale);
    stone1 = loadImage("Stone1.png");
    stone1.resize(scale, scale);
    sand0 = loadImage("Sand0.png");
    sand0.resize(scale, scale);
    leaf0 = loadImage("Leaf0.png");
    leaf0.resize(scale, scale);
    wood0 = loadImage("Wood0.png");
    wood0.resize(scale, scale);
    grass0 = loadImage("Grass0.png");
    grass0.resize(scale, scale);
    grass1 = loadImage("Grass1.png");
    grass1.resize(scale, scale);
    grass2 = loadImage("Grass2.png");
    grass2.resize(scale, scale);
  }
  
  void draw(){
    background(255);
    //translate(-1  * xMove, -1 * yMove);
    pushMatrix();
    translate(xMove, yMove);
    for (Block[] row : world){
     for  (Block spot: row){
       if (spot != null){ spot.display(); }
     }
    }
    popMatrix();
    player.display();
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
      case('0'):
        player.hbSlot = 9;
        break;
      case('1'):
        player.hbSlot = 0;
        break;
      case('2'):
        player.hbSlot = 1;
        break;
      case('3'):
        player.hbSlot = 2;
        break;
      case('4'):
        player.hbSlot = 3;
        break;
      case('5'):
        player.hbSlot = 4;
        break;
      case('6'):
        player.hbSlot = 5;
        break;
      case('7'):
        player.hbSlot = 6;
        break;
      case('8'):
        player.hbSlot = 7;
        break;
      case('9'):
        player.hbSlot = 8;
        break;      
    }
  }
  
  void mousePressed(){
    if (mouseButton == LEFT){
    for (int i = 0; i < world.length; i++){
     for  (int j = 0; j < world[0].length; j++){
       Block spot = world[i][j];
       if (spot != null && mouseX > spot.xcor && mouseX < spot.xcor + spot.sideLength && mouseY > spot.ycor && mouseY < spot.ycor + spot.sideLength ){
         //NEED TO TEST IF THIS AFFECTS EDGES
         if (spot.uses == player.hbSlot){
           //spot.animate();
           //spot.display();
           //RANGE
           delay(500);
           player.breakBlock(spot);
           world[i][j] = null;
         }
         
        }
     }
    }
    }
    else if (mouseButton == RIGHT){
       if (world[mouseY/scale][mouseX/scale] == null){
         player.place(mouseX/scale,mouseY/scale);
         //figure it out later
      }
    }
  }
