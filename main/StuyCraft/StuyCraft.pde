   float xMove, yMove;
   Player player;
   Movement control;
   int tick;
   ArrayList<Mob> mobs;
   int zcount;
   int ccount;
   boolean held;
   String heldtype;
   int heldStack;
   PImage heldImg;
   boolean isMining;
   float newMouseX;
   float newMouseY;
  
  void setup(){
    held = false;
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
    stone2 = loadImage("Stone2.png");
    stone2.resize(scale, scale);
    sand0 = loadImage("Sand0.png");
    sand0.resize(scale, scale);
    sand1 = loadImage("Sand1.png");
    sand1.resize(scale, scale);
    sand2 = loadImage("Sand2.png");
    sand2.resize(scale, scale);
    leaf0 = loadImage("Leaf0.png");
    leaf0.resize(scale, scale);
    leaf1 = loadImage("Leaf1.png");
    leaf1.resize(scale, scale);
    leaf2 = loadImage("Leaf2.png");
    leaf2.resize(scale, scale);
    wood0 = loadImage("Wood0.png");
    wood0.resize(scale, scale);
    wood1 = loadImage("Wood1.png");
    wood1.resize(scale, scale);
    wood2 = loadImage("Wood2.png");
    wood2.resize(scale, scale);
    grass0 = loadImage("Grass0.png");
    grass0.resize(scale, scale);
<<<<<<< HEAD
=======
    plank0 = loadImage("plank.png");
    plank0.resize(scale,scale);
>>>>>>> c54c2116f622395dc2330e6d9d57d5e4bfe83ec0
    grass1 = loadImage("Grass1.png");
    grass1.resize(scale, scale);
    grass2 = loadImage("Grass2.png");
    grass2.resize(scale, scale);
    plank0 = loadImage("plank0.png");
    plank0.resize(scale,scale);
    plank1 = loadImage("plank1.png");
    plank1.resize(scale,scale);
    plank2 = loadImage("plank2.png");
    plank2.resize(scale,scale);
    ironore0 = loadImage("ironore0.png");
    ironore0.resize(scale,scale);
    ironore1 = loadImage("ironore1.png");
    ironore1.resize(scale,scale);
    ironore2 = loadImage("ironore2.png");
    ironore2.resize(scale,scale);
    diaore0 = loadImage("diamondore0.png");
    diaore0.resize(scale,scale);
    diaore1 = loadImage("diamondore1.png");
    diaore1.resize(scale,scale);
    diaore2 = loadImage("diamondore2.png");
    diaore2.resize(scale,scale);
    xMove = -(worldWidth/2 - width/2);
    //System.out.println("Top corner: " + (-1 * xMove) + ", " + 0);
    //System.out.println("Player coordinates: " + player.xcor + ", " + player.ycor);
    
    xMove = -(worldWidth/2 - width/2);
    control = new Movement();
  }
  
  void draw(){
   //System.out.println("Player coordinates: " + player.xcor + ", " + player.ycor);
    newMouseX = (mouseX - width/2) + player.xcor;
    newMouseY = (mouseY - height/2) + player.ycor;
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
    if(isMining){
      player.mining(newMouseX, newMouseY);
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
    if (!player.dead && !player.open){
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
    if (player.open && held){
      heldImg = loadImage(heldtype);
      heldImg.resize(50,50);
      image(heldImg,mouseX-25,mouseY-25);
      fill(0);
      textSize(20);
      text(heldStack,mouseX+10,mouseY-10);
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
    if (newMouseX > 0 && newMouseX < worldWidth && newMouseY > 0 && newMouseY < worldHeight){
      if (mouseButton == LEFT){
        if (player.open){
          if (held &&  mouseX > width - 440 && mouseX < width - 390 && mouseY > height-635 && mouseY < height-585){
            heldtype = null;
            heldStack = 0;
            held = false;
          }
          //craftingplace
          if (player.crafting() && !held && mouseX > width - 600 && mouseX < width - 550 && mouseY > height-726 && mouseY < height-676){
            heldtype = player.craft.type;
            heldStack = player.craft.stack;
            held = true;
              for (int i= 0; i < player.crafting.length; i++){
                if (player.crafting[i] != null){
                  if (heldStack >= 64){
                  if (player.craft.type.equals("plank0.png") || player.craft.type.equals("stick.png")){
                    player.crafting[i].stack -= 16;
                    }
                    else {
                      player.crafting[i].stack -= heldStack;
                    }
                  }
                  else if (heldStack < 65){
                    if (player.craft.type.equals("plank0.png") || player.craft.type.equals("stick.png")){
                    player.crafting[i].stack -= heldStack/4;
                    }
                    else {
                      player.crafting[i].stack -= heldStack;
                    }
                    if (player.crafting[i].stack <= 0){
                      player.crafting[i] = null;
                    }
                  }
                }
              }
               player.craft = null;
            
          }
          //LOOPS FOR HOTBAR
          for (int i = 0; i < player.hotbar.length; i++){
            if (mouseX > i*80*0.945 + (width-730)/2 && mouseX < i*80*0.945 + (width-730)/2 + 50 && mouseY > height-262 && mouseY < height-212){       
              if (!held && player.hotbar[i] != null){
              heldtype = player.hotbar[i].type;
              heldStack = player.hotbar[i].stack;
              player.hotbar[i] = null;
              held = true;
              }
              else if (held && player.hotbar[i] == null) {
                Item b = new Item(heldtype);
                b.stack = heldStack;
                player.hotbar[i] = b;
                held = false;
              }
              else if (held && player.hotbar[i] != null && player.hotbar[i].type.equals(heldtype)){
                if (player.hotbar[i].stack + heldStack > 65){
                  heldStack -= 64 - player.hotbar[i].stack;
                  player.hotbar[i].stack = 64;
                  held = true;
                }
                else {
                  player.hotbar[i].stack += heldStack;
                  held = false;
                }
              }
            }
          }
          //LOOPS FOR INVENTORY
          for (int i = 0; i < player.inventory.length; i++){
             if (i < 10){
               if (mouseX > i*80*0.945 + (width-730)/2 && mouseX < i*80*0.945 + (width-730)/2 + 50 && mouseY > height-548 && mouseY < height-498){ 
                 if (!held && player.inventory[i] != null){
                   heldtype = player.inventory[i].type;
                   heldStack = player.inventory[i].stack;
                   player.inventory[i] = null;
                   held = true;
                 }
                 else if (held && player.inventory[i] == null){
                    Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.inventory[i] = b;
                    held = false;
                 }
                 else if (held && player.inventory[i] != null && player.inventory[i].type.equals(heldtype)){
                  if (player.inventory[i].stack + heldStack > 65){
                    heldStack -= 64 - player.inventory[i].stack;
                    player.inventory[i].stack = 64;
                    held = true;
                  }
                  else {
                    player.inventory[i].stack += heldStack;
                    held = false;
                }
              }
               }
            }
            else if (i < 20){
              if (mouseX > (i-10)*80*0.945 + (width-730)/2 && mouseX < (i-10)*80*0.945 + (width-730)/2 + 50 && mouseY > height-456 && mouseY < height-406){ 
                if (!held && player.inventory[i] != null){
                   heldtype = player.inventory[i].type;
                   heldStack = player.inventory[i].stack;
                   player.inventory[i] = null;
                   held = true;
                 }
                 else if (held && player.inventory[i] == null){
                   Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.inventory[i] = b;
                    held = false;
                 }  
                 else if (held && player.inventory[i] != null && player.inventory[i].type.equals(heldtype)){
                    if (player.inventory[i].stack + heldStack > 65){
                    heldStack -= 64 - player.inventory[i].stack;
                    player.inventory[i].stack = 64;
                    held = true;
                  }
                  else {
                    player.inventory[i].stack += heldStack;
                    held = false;
                }
              }
              }
            }
            else if (mouseX > (i-20)*80*0.945 + (width-730)/2 && mouseX < (i-20)*80*0.945 + (width-730)/2 + 50 && mouseY > height-368 && mouseY < height-318){ 
                if (!held && player.inventory[i] != null){
                   heldtype = player.inventory[i].type;
                   heldStack = player.inventory[i].stack;
                   player.inventory[i] = null;
                   held = true;
                 }
                 else if (held && player.inventory[i] == null){
                   Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.inventory[i] = b;
                    held = false;
                 }
                 else if (held && player.inventory[i] != null && player.inventory[i].type.equals(heldtype)){
                    if (player.inventory[i].stack + heldStack > 65){
                    heldStack -= 64 - player.inventory[i].stack;
                    player.inventory[i].stack = 64;
                    held = true;
                  }
                  else {
                    player.inventory[i].stack += heldStack;
                    held = false;
                }
              }
            }
          }
          //LOOPS FOR CRAFTING
          for (int i = 0; i < player.crafting.length; i++){
            //fill(0);
            //rect(i*80*0.94 + (width-493)/2, height-796,50,50);
              if (i < 3){
               if (mouseX > i*80*0.95 + (width-493)/2 && mouseX < i*80*0.95 + (width-493)/2 + 50 && mouseY > height-794 && mouseY < height-744){ 
                 if (!held && player.crafting[i] != null){
                   heldtype = player.crafting[i].type;
                   heldStack = player.crafting[i].stack;
                   player.crafting[i] = null;
                   held = true;
                 }
                 else if (held && player.crafting[i] == null){
                    Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.crafting[i] = b;
                    held = false;
                 }
                 else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype)){
                   if (player.crafting[i].stack + heldStack > 65){
                    heldStack -= 64 - player.crafting[i].stack;
                    player.crafting[i].stack = 64;
                    held = true;
                  }
                  else {
                    player.crafting[i].stack += heldStack;
                    held = false;
                }
              }
               }
            }
            else if (i < 6){
              if (mouseX > (i-3)*80*0.95 + (width-493)/2 && mouseX < (i-3)*80*0.95 + (width-493)/2 + 50 && mouseY > height-722 && mouseY < height-672){ 
                if (!held && player.crafting[i] != null){
                   heldtype = player.crafting[i].type;
                   heldStack = player.crafting[i].stack;
                   player.crafting[i] = null;
                   held = true;
                 }
                 else if (held && player.crafting[i] == null){
                   Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.crafting[i] = b;
                    held = false;
                 }  
                 else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype)){
                  if (player.crafting[i].stack + heldStack > 65){
                    heldStack -= 64 - player.crafting[i].stack;
                    player.crafting[i].stack = 64;
                    held = true;
                  }
                  else {
                    player.crafting[i].stack += heldStack;
                    held = false;
                }
              }
              }
            }
            else if (mouseX > (i-6)*80*0.95 + (width-493)/2 && mouseX < (i-6)*80*0.95 + (width-493)/2 + 50 && mouseY > height-644 && mouseY < height-594){ 
                if (!held && player.crafting[i] != null){
                   heldtype = player.crafting[i].type;
                   heldStack = player.crafting[i].stack;
                   player.crafting[i] = null;
                   held = true;
                 }
                 else if (held && player.crafting[i] == null){
                   Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.crafting[i] = b;
                    held = false;
                 }
                 else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype)){
                   if (player.crafting[i].stack + heldStack > 65){
                    heldStack -= 64 - player.crafting[i].stack;
                    player.crafting[i].stack = 64;
                    held = true;
                  }
                  else {
                    player.crafting[i].stack += heldStack;
                    held = false;
                }
              }
          }
        }
        }
        else if (player.hotbar[player.hbSlot] != null && player.hotbar[player.hbSlot].num == 0){
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
          isMining = true;
        }
      }
      else if (mouseButton == RIGHT){
        if (player.hotbar[player.hbSlot] != null && player.hotbar[player.hbSlot].num == -1 && !player.open){
        if (player.hotbar[player.hbSlot].type.equals("Steak0.png") || player.hotbar[player.hbSlot].type.equals("Apple0.png")){
          if (player.hunger < 10){
          player.eat(player.hotbar[player.hbSlot]);
          player.hotbar[player.hbSlot].stack--;
          if (player.hotbar[player.hbSlot].stack == 0){
            player.hotbar[player.hbSlot] = null;
          }
          }
        }
        else if (player.hotbar[player.hbSlot].type.equals("diamond.png") || player.hotbar[player.hbSlot].type.equals("iron.png")|| player.hotbar[player.hbSlot].type.equals("stick.png")){
        }
         else if (world[(int)newMouseY/scale][(int)newMouseX/scale] == null){
           player.place((int)newMouseX/scale,(int)newMouseY/scale);
           //figure it out later
        }
      }
      else if (player.open){
        for (int i = 0; i < player.crafting.length; i++){
          if (i < 3){
               if (mouseX > i*80*0.95 + (width-493)/2 && mouseX < i*80*0.95 + (width-493)/2 + 50 && mouseY > height-794 && mouseY < height-744){ 
                 if (held && player.crafting[i] == null && heldStack > 1){
                    Item b = new Item(heldtype);
                    b.stack++;
                    heldStack--;
                    player.crafting[i] = b;
                    held = true;
                 }
                 else if (held && player.crafting[i] == null && heldStack <= 1){
                   Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.crafting[i] = b;
                    held = false;
                 }
                 else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype) && heldStack > 1){
                    player.crafting[i].stack ++;
                    heldStack--;
                    held = true;
                  }
                  else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype) && heldStack <= 1){
                    player.crafting[i].stack ++;
                    heldStack--;
                    held = false;
                  }
               }
          }
            else if (i < 6){
              if (mouseX > (i-3)*80*0.95 + (width-493)/2 && mouseX < (i-3)*80*0.95 + (width-493)/2 + 50 && mouseY > height-722 && mouseY < height-672){ 
                if (held && player.crafting[i] == null && heldStack > 1){
                    Item b = new Item(heldtype);
                    b.stack++;
                    heldStack--;
                    player.crafting[i] = b;
                    held = true;
                 }
                 else if (held && player.crafting[i] == null && heldStack <= 1){
                   Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.crafting[i] = b;
                    held = false;
                 }
                 else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype) && heldStack > 1){
                    player.crafting[i].stack ++;
                    heldStack--;
                    held = true;
                  }
                  else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype) && heldStack <= 1){
                    player.crafting[i].stack ++;
                    heldStack--;
                    held = false;
                  }
              }
            }
            else if (mouseX > (i-6)*80*0.95 + (width-493)/2 && mouseX < (i-6)*80*0.95 + (width-493)/2 + 50 && mouseY > height-644 && mouseY < height-594){ 
                if (held && player.crafting[i] == null && heldStack > 1){
                    Item b = new Item(heldtype);
                    b.stack++;
                    heldStack--;
                    player.crafting[i] = b;
                    held = true;
                 }
                 else if (held && player.crafting[i] == null && heldStack <= 1){
                   Item b = new Item(heldtype);
                    b.stack = heldStack;
                    player.crafting[i] = b;
                    held = false;
                 }
                 else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype) && heldStack > 1){
                    player.crafting[i].stack ++;
                    heldStack--;
                    held = true;
                  }
                  else if (held && player.crafting[i] != null && player.crafting[i].type.equals(heldtype) && heldStack <= 1){
                    player.crafting[i].stack ++;
                    heldStack--;
                    held = false;
                  }
          }
        }
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
    if (b.type.equals("Stone") && zcount < 80){
      Zombie z = new Zombie(b.xcor,(b.ycor-(int)(scale*2)));
      mobs.add(z);
      zcount++;
    }
    }
  } 
  
  void mouseReleased(){
    if (!player.open){
      isMining = false;
      Block block = world[(int)newMouseY/ scale][(int)newMouseX/scale];
      if (block != null){
        block.currentDurability =block.maxDurability;
      }
    }
  }
