   float xMove, yMove;
   Player player;
   Movement control;
   int tick;
   ArrayList<Mob> mobs;
   int zcount;
   int ccount;
  
  void setup(){
    tick = 0;
    mobs = new ArrayList<Mob>();
    background(255);
    size(1500, 1000);
    worldGenerate();
    player = new Player();
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
    xMove = -(worldWidth/2 - width/2);
    //System.out.println("Top corner: " + (-1 * xMove) + ", " + 0);
    //System.out.println("Player coordinates: " + player.xcor + ", " + player.ycor);
    grass1 = loadImage("Grass1.png");
    grass1.resize(scale, scale);
    grass2 = loadImage("Grass2.png");
    grass2.resize(scale, scale);
    control = new Movement();
  }
  
  void draw(){
   //System.out.println("Player coordinates: " + player.xcor + ", " + player.ycor);
    tick++;
    if (tick%6000 == 0){
      player.hungerDrain();
    }
    if (tick%10 == 0){
      for (int i = 0; i < 100; i++){
      int x = (int) random(world.length-2)+2;
      int y = (int) random(world[0].length-1)+1;  
      if (world[x][y] != null && x < 248 && y < 499){
        spawnMob(x,y);    
      }
    }
    }
    background(255);
    //translate(-1  * xMove, -1 * yMove);
    pushMatrix();
    translate(xMove, yMove);
    for (Block[] row : world){
     for  (Block spot: row){
       if (spot != null){ spot.display(); }
     }
    }
    for (int i = 0; i < mobs.size(); i++){
      if (mobs.get(i) != null){
      mobs.get(i).display();
      }
    }
    popMatrix();
    player.gravity();
    if (control.inputs[0]){
      xMove -= player.move(-1); 
    }
    if (control.inputs[2]){
      xMove -= player.move(1); 
    }   
    player.display();
  }
  
  void keyPressed(){
    switch (key){
      case ('w'):
        if(! control.inputs[1]){
          control.activate(key);
          player.jump(8);
        }
        break;
      case ('a'):
        control.activate(key);
        break;
      case ('d'):
        control.activate(key);
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
    float newMouseX = (mouseX - width/2) + player.xcor;
    float newMouseY = (mouseY - height/2) + player.ycor;
    if (mouseButton == LEFT){
      if (player.hbSlot == 0){
        for (int i = 0; i < mobs.size(); i++){
          Mob m = mobs.get(i);
          if (newMouseX > m.xcor && newMouseX < m.xcor + m.mwidth && newMouseY > m.ycor && newMouseY < m.ycor + m.mheight){
            //print("hit");
            int dmg = (int) random(5);
            fill(247,5,5);
            text(dmg + " HP",m.xcor,m.ycor-m.mheight - scale);
            m.takeDamage(dmg);
            if (m.health <= 0){
              m.die();
              mobs.remove(i);
            }
          }
        }
      }
      else {
    for (int i = 0; i < world.length; i++){
     for  (int j = 0; j < world[0].length; j++){
       Block spot = world[i][j];

       if (spot != null && newMouseX > spot.xcor && newMouseX < spot.xcor + spot.sideLength && newMouseY > spot.ycor && newMouseY < spot.ycor + spot.sideLength ){
         //NEED TO TEST IF THIS AFFECTS EDGES
         if (spot.uses == player.hbSlot){
           //spot.animate();
           //spot.display();
           //RANGE
           //delay(500);
           player.breakBlock(spot);
           world[i][j] = null;
         }
         
        }
     }
    }
    }
    }
    else if (mouseButton == RIGHT){
       if (world[(int)newMouseY/scale][(int)newMouseX/scale] == null){
         player.place((int)newMouseX/scale,(int)newMouseY/scale);
         //figure it out later
      }
    }
  }
  
  void keyReleased(){
    control.deactivate(key);
  }
  
  void spawnMob(int x, int y){
    if (world[x-1][y] == null && world[x-2][y] == null /*&& world[x][y+1] == null && world[x][y-1] == null*/){
      Block b = world[x][y];
      if (b.type.equals("Grass") && ccount < 20){
     // print("cow!");
      Cow c = new Cow(b.xcor,(b.ycor-(int)(scale*1.5)));
      mobs.add(c);
      ccount += 1;
    }
    if (b.type.equals("Stone") && zcount < 100){
      Zombie z = new Zombie(b.xcor,(b.ycor-(int)(scale*2)));
      mobs.add(z);
      zcount++;
    }
    }
  }
