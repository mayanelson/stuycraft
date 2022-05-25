   int xMove, yMove;
   Player player;
  
  void setup(){
    background(255);
    size(1500, 1000);
    worldGenerate();
    player = new Player();
    xMove = 0;
    yMove = 0;
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
    }
  }
  
  void mousePressed(){
    for (int i = 0; i < world.length; i++){
     for  (int j = 0; j < world[0].length; j++){
       Block spot = world[i][j];
       if (spot != null && mouseX > spot.xcor && mouseX < spot.xcor + spot.sideLength && mouseY > spot.ycor && mouseY < spot.ycor + spot.sideLength ){
         //NEED TO TEST IF THIS AFFECTS EDGES
         //if p equipped = spot.tool or smth
         player.breakBlock(spot);
         world[i][j] = null;
         
        }
     }
    }
  }
