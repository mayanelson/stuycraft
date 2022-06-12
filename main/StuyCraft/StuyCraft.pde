   float xMove, yMove;
   Player player;
   Movement control;
   int tick;
   ArrayList<Mob> mobs;
   int zcount;
   int ccount;
   int crcount;
   boolean held;
   Item heldItem;
   boolean isMining;
   float newMouseX;
   float newMouseY;
   PImage heldImg; 
  
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
    TNT0 = loadImage("TNT0.png");
    TNT1 = loadImage("TNT1.png");
    xMove = -(worldWidth/2 - width/2);
    //System.out.println("Top corner: " + (-1 * xMove) + ", " + 0);
    //System.out.println("Player coordinates: " + player.xcor + ", " + player.ycor);
    
    xMove = -(worldWidth/2 - width/2);
    control = new Movement();
  }
  
  void draw(){
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
     for (int i = 0; i < 100; i++){
      int y = (int) random(world.length-2)+2;
      int x = (int) random(world[0].length-1)+1;  
      if ( x < world[0].length && y < world.length && world[y][x] != null){
        spawnMob(x,y);     
      }
    }
    }
    if (tick%4 == 0){
      for (int i = 0; i < mobs.size(); i++){
        if(mobs.get(i).type.equals("Zombie") || mobs.get(i).type.equals("Creeper")){
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
    if(isMining){
      player.mining(newMouseX, newMouseY);
    }
    pushMatrix();
    translate(xMove, yMove);
    for (Block[] row : world){
     for  (Block spot: row){
       if (spot != null){ spot.display(); }
     }
    }
    for (int i = 0; i < mobs.size(); i++){
      Mob mob = mobs.get(i);
      if (mob != null){    
            mob.gravity();
            mob.display();  
            if(player.hotbar[player.hbSlot]!= null && player.hotbar[player.hbSlot].num ==1){
              if ((mob.xcor <= newMouseX && mob.xcor + mob.mwidth >= newMouseX && mob.ycor <= newMouseY && mob.ycor + mob.mheight >= newMouseY) && dist(newMouseX, newMouseY, player.xcor + player.pwidth/2, player.ycor + player.pheight/2) <= player.range){
                  noStroke();
                  fill(225, 150);
                  rect(mob.xcor, mob.ycor, mob.mwidth, mob.mheight);
              }
            }
      }
    }
    if (dist(newMouseX, newMouseY, player.xcor + player.pwidth/2, player.ycor + player.pheight/2) <= player.range){
       if(player.hotbar[player.hbSlot]!= null && player.hotbar[player.hbSlot].num !=1){ 
        noStroke();
        fill(225, 150);
        rect((int)newMouseX/scale * scale, (int)newMouseY/scale * scale, scale, scale);
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
      heldImg = loadImage(heldItem.type);
      heldImg.resize(50,50);
      image(heldImg,mouseX-25,mouseY-25);
      fill(0);
      textSize(20);
      text(heldItem.stack,mouseX+10,mouseY-10);
    }

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
          // Disposal Slot
          if (held &&  mouseX > width - 440 && mouseX < width - 390 && mouseY > height-635 && mouseY < height-585){
            heldItem = null;
            //heldItem.stack = 0;
            held = false;
          }
          //craftingplace
          if (player.crafting() && !held && mouseX > width - 600 && mouseX < width - 550 && mouseY > height-726 && mouseY < height-676){
            heldItem = player.craft;
            heldItem.stack = player.craft.stack;
            held = true;
              for (int i= 0; i < player.crafting.length; i++){
                if (player.crafting[i] != null){
                  if (heldItem.stack >= 64){
                  if (player.craft.type.equals("plank0.png") || player.craft.type.equals("stick.png")){
                    player.crafting[i].stack -= 16;
                    }
                    else {
                      player.crafting[i].stack -= heldItem.stack;
                    }
                  }
                  else if (heldItem.stack < 65){
                    if (player.craft.type.equals("plank0.png") || player.craft.type.equals("stick.png")){
                    player.crafting[i].stack -= heldItem.stack/4;
                    }
                    else {
                      player.crafting[i].stack -= heldItem.stack;
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
            //730/2 should be the offset from the center horizontally;
            // Slots are 50 by 50

           if (mouseX > i*80*0.945 + (width-730)/2 && mouseX < i*80*0.945 + (width-730)/2 + 50 && mouseY > height-262 && mouseY < height-212){       
              if (!held && player.hotbar[i] != null){
              heldItem = player.hotbar[i];
              heldItem.stack = player.hotbar[i].stack;
              player.hotbar[i] = null;
              held = true;
              }
              else if (held && player.hotbar[i] == null) {
                player.hotbar[i] = heldItem;
                held = false;
                heldItem = null;
              }
              else if (held && player.hotbar[i] != null && player.hotbar[i].type.equals(heldItem.type)){
                if (player.hotbar[i].stack + heldItem.stack > 65){
                  heldItem.stack -= 64 - player.hotbar[i].stack;
                  player.hotbar[i].stack = 64;
                  held = true;
                }
                else {
                  player.hotbar[i].stack += heldItem.stack;
                  held = false;
                }
              }
            }
          }
          //INVENTORY
          int col = (int)((mouseX - ((width-730)/2)) / (80*0.945));
          int row = -1;
          if (mouseY > height - 548 && mouseY < height-498){
            row = 0;
          }
          if (mouseY > height - 456 && mouseY < height-406){
           row = 1; 
          }
          if (mouseY > height - 364 && mouseY < height-314){
            row = 2;
          }
          //System.out.println(col);
          if (col >= 0 && col < 10 && row >= 0){
            int index = row * 10 + col;
                 if (!held && player.inventory[index] != null){
                   heldItem = player.inventory[index];
                   player.inventory[index] = null;
                   held = true;
                 }
                 else if (held && player.inventory[index] == null){
                    player.inventory[index] = heldItem;
                    held = false;
                    heldItem = null;
                 }
                 else if (held && player.inventory[index] != null && player.inventory[index].type.equals(heldItem.type)){
                  if (player.inventory[index].stack + heldItem.stack > 65){
                    heldItem.stack -= 64 - player.inventory[index].stack;
                    player.inventory[index].stack = 64;
                    held = true;
                  }
                  else {
                    player.inventory[index].stack += heldItem.stack;
                    held = false;
                    heldItem = null;
                  }
                }            
          }
          
          //LOOPS FOR CRAFTING
          
          int cCol = (int)((mouseX - (width-493)/2)/(80*0.95));
          int cRow = -1;
          if (mouseY > height -794 && mouseY < height - 754){
           cRow = 0; 
          }
          if (mouseY >height - 722 && mouseY < height - 672){
           cRow = 1; 
          }
          if (mouseY > height - 644 && mouseY < height - 594){
           cRow = 2; 
          }
          if (cCol >= 0 && cCol < 3 && cRow >=0){
           int index = cCol + cRow * 3;
            if (!held && player.crafting[index] != null){
                   heldItem = player.crafting[index];
                   player.crafting[index] = null;
                   held = true;
                 }
                 else if (held && player.crafting[index] == null){
                    player.crafting[index] = heldItem;
                    held = false;
                 }
                 else if (held && player.crafting[index] != null && player.crafting[index].type.equals(heldItem.type)){
                   if (player.crafting[index].stack + heldItem.stack > 65){
                    heldItem.stack -= 64 - player.crafting[index].stack;
                    player.crafting[index].stack = 64;
                    held = true;
                    }
                    else {
                      player.crafting[index].stack += heldItem.stack;
                      held = false;
                    }  
                }
          }
        }
        else if (player.hotbar[player.hbSlot] != null && player.hotbar[player.hbSlot].num == 1){
          player.attack(newMouseX, newMouseY);
          
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
           player.place((int)newMouseX/scale,(int)newMouseY/scale,newMouseX,newMouseY);
           //figure it out later
        }
      }
      else if (player.open && held){
        Item placing = new Item(heldItem, 1);
        int col = (int)((mouseX - (width-493)/2)/(80*0.95));
        int row = -1;
        if (mouseY > height -794 && mouseY < height - 754){
         row = 0; 
        }
        if (mouseY >height - 722 && mouseY < height - 672){
         row = 1; 
        }
        if (mouseY > height - 644 && mouseY < height - 594){
         row = 2; 
        }
        if (col >= 0 && col < 3 && row >=0){
         int index = col + row * 3;
         if (player.crafting[index] == null && heldItem.stack > 1){
                    heldItem.stack--;
                    player.crafting[index] = placing;
                    held = true;
                 }
                 else if (player.crafting[index] == null && heldItem.stack <= 1){
                    player.crafting[index] = placing;
                    held = false;
                 }
                 else if (player.crafting[index] != null && player.crafting[index].type.equals(heldItem.type) && heldItem.stack > 1){
                    player.crafting[index].stack ++;
                    heldItem.stack--;
                    held = true;
                  }
                  else if (player.crafting[index] != null && player.crafting[index].type.equals(heldItem.type) && heldItem.stack <= 1){
                    player.crafting[index].stack ++;
                    heldItem.stack--;
                    held = false;
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
    if (world[y - 1][x] == null && world[y-2][x] == null){
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
    if (crcount < 30){
      Creeper c = new Creeper(b.xcor,(b.ycor-(int)(scale*2)));
      mobs.add(c);
      crcount++;
    }
    }
  } 
  
  void mouseReleased(){
    if (!player.open){
      isMining = false;
      if ((int)newMouseY/ scale < 250 && (int)newMouseY/ scale >= 0 && (int)newMouseX/scale < 500 && (int)newMouseX/scale >=0){
      Block block = world[(int)newMouseY/ scale][(int)newMouseX/scale];
        if (block != null){
          block.currentDurability =block.maxDurability;
        }  
      }
    }
  }
  
  void mouseClicked(){
    if (!player.open && player.hotbar[player.hbSlot]!= null && player.hotbar[player.hbSlot].num ==1){
      player.attack(newMouseX, newMouseY);
    }
  }
  
