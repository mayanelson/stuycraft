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
    if (tick%1800 == 0){
      player.hungerDrain();
    }
    if (tick%100 == 0){
      if (player.hunger > 9 && player.health < 10){
        player.health++;
      }
    }
    if (tick%10 == 0){
      for (int i = 0; i < 100; i++){
      int y = (int) random(world.length-2)+2;
      int x = (int) random(world[0].length-1)+1;  
      if ( x < world[0].length && y < world.length && world[y][x] != null){
        spawnMob(x,y);    
      }
    }
    }
    if (tick%3 == 0){
      for (int i = 0; i < mobs.size(); i++){
        if(mobs.get(i).type.equals("Zombie")){
          mobs.get(i).move(1);
        }
        int rand = (int)random(10);
        int rand2 = (int)random(40);
        if (mobs.get(i) != null){    
          if (mobs.get(i).motion == 1){
            mobs.get(i).move(1);
            if (rand == 1){
              mobs.get(i).motion = 0;
            }
          }
          else if (mobs.get(i).motion == 2){
            mobs.get(i).move(-1);
            if (rand == 1){
              mobs.get(i).motion = 0;
            }
          }
          else{       
          if (rand2 == 1){
            mobs.get(i).motion = 1;
          }
          if (rand2 == 2){
            mobs.get(i).motion = 2;
          }
        }
        }
      }
    }
    background(255);
    if (player.ycor/scale < 105){
    fill(194,235,240);  
    }
    else {
      fill(190);
    }
    rect(0,0,width,height);
    player.display();
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
            mobs.get(i).gravity();
            mobs.get(i).display();
          }   
      }
    
    popMatrix();
    player.gravity();
    if (control.inputs[0]){
      player.move(-1); 
    }
    if (control.inputs[2]){
      player.move(1); 
    }   
    player.display();
    if (!player.dead){
      if (player.hotbar[player.hbSlot] != null){
        pushMatrix();
        translate(xMove, yMove);
        PImage img = player.hotbar[player.hbSlot].image;
        if (player.direct){
        scale(-1,1);
        //DOESNT WORK WITH SCALE
        image(img,-player.xcor-scale*0.9,player.ycor+scale*0.9);
        }
        else {
          image(img, player.xcor - scale/5,player.ycor+scale*0.9);
        }
        popMatrix();
      }
    }
   // System.out.println(player.xcor +", " + player.ycor + " & " + xMove + ", " + yMove);
   // System.out.println((player.xcor + xMove) + ", " + (player.ycor + yMove));
  }
  
  void keyPressed(){
    switch (key){
      case ('w'):
        if(! control.inputs[1]){
          control.activate(key);
          player.jump(10);
        }
        break;
      case ('a'):
        control.activate(key);
        break;
      case ('d'):
        control.activate(key);
        break;
      case ('e'):
        player.open = !player.open;
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
            int dmg = (int) random(4)+1;
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
      if (player.hotbar[player.hbSlot] != null && player.hbSlot > 3){
      if (player.hotbar[player.hbSlot].type.equals("Steak0.png") || player.hotbar[player.hbSlot].type.equals("Apple0.png")){
        if (player.hunger < 10){
        player.eat(player.hotbar[player.hbSlot]);
        player.hotbar[player.hbSlot].stack--;
        if (player.hotbar[player.hbSlot].stack == 0){
          player.hotbar[player.hbSlot] = null;
        }
        }
      }
       else if (world[(int)newMouseY/scale][(int)newMouseX/scale] == null){
         player.place((int)newMouseX/scale,(int)newMouseY/scale);
         //figure it out later
      }
    }
    }
  }
  
  void keyReleased(){
    control.deactivate(key);
  }
  
  void spawnMob(int x, int y){
    if (world[y - 1][x] == null && world[y-2][x] == null /*&& world[x][y+1] == null && world[x][y-1] == null*/){
      Block b = world[y][x];
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
