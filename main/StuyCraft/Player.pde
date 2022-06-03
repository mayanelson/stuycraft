class Player{
  int health;
  int hunger;
  Item[] hotbar;
  PImage hotBarDisplay;
  PImage image;
  PImage healthBar;
  PImage hungerBar;
  PImage inventoryDisplay;
  Item[] inventory;
  int xcor;
  int ycor;
  float pwidth;
  float pheight;
  Item equipped;
  int xVel;
  int hbSlot;
  int yVel;
  float grav;
  boolean direct;
  boolean dead;
  boolean open;
  Item[] crafting;
  Item craft;
  
  public Player(){
    direct = true;
    dead = false;
    health = 10;
    hunger = 10;
    hotbar = new Item[10];
    crafting = new Item[9];
    image = loadImage("Steve0.png");
    image.resize(scale,scale*2);
    hotBarDisplay = loadImage("hotbar.png");
    hotBarDisplay.resize(800,91);
    healthBar = loadImage("heart.png");
    healthBar.resize(50,50);
    hungerBar = loadImage("hunger.png");
    hungerBar.resize(100,100);
    xcor = (int)(worldWidth/2);
    ycor = height/2;
    pwidth = scale * 0.75;
    pheight = scale* 2;
    xVel = scale / 5;
    yVel = 0;
    grav = 1.0;

    hungerBar.resize(50,50);
    //CREATE TOOLS AND ADD TO HOTBAR
    hbSlot = 0;
    Sword sw = new Sword();
    sw.stack++;
    hotbar[0] = sw;
    Pickaxe p = new Pickaxe();
    p.stack++;
    hotbar[1] = p;
    Axe a = new Axe();
    a.stack++;
    hotbar[2] = a;
    Shovel s = new Shovel();
    s.stack++;
    hotbar[3] = s;
    
<<<<<<< HEAD
   inventoryDisplay = loadImage("inventory.png");
   inventory = new Item[30];
   inventoryDisplay.resize((int)(550*1.5),(int)(450*1.5));
=======

    inventoryDisplay = loadImage("inventory.png");
    inventory = new Item[30];
    inventoryDisplay.resize((int)(550*1.5),(int)(450*1.5));

>>>>>>> c54c2116f622395dc2330e6d9d57d5e4bfe83ec0
  }
  
  void addToHotbar(Item item){
    Item b;
    if (item.type == "Beef"){
      b = new Item("Steak0.png");
    }
    else {
      b = new Item("Apple0.png");
    }
    boolean placed = false;
    for (int i = 0; i < inventory.length; i++){
      if (inventory[i]!= null){
      }
      if (inventory[i] != null && inventory[i].type.equals(b.type) && inventory[i].stack < 64){
        inventory[i].stack++;
        placed = true;
        i = 900000;
      }
    }
    if (!placed){
    for (int i = 0; i < hotbar.length; i++){
      if (hotbar[i] == null){
        b.stack++;
        hotbar[i] = b;  
        placed = true;
        i = 11;
      }    
      else if (hotbar[i].type.equals(b.type) && hotbar[i].stack < 64) {
        hotbar[i].stack ++;
        placed = true;
        i = 11;
      }
      else if (hotbar[i].stack > 64 && i < 9){
        b.stack++;
        hotbar[i+1] = b;
        placed = true;
        i = 11;
    }
    }
    }
    if (!placed){
      print("Inventory full!");
    }
  }
  
  void removeHotbar(Item item){
  }
  
  void breakBlock(Block toBreak){
    if(!open){
<<<<<<< HEAD
      
      toBreak.currentDurability -= 10.0;
=======
      toBreak.currentDurability -= 3;
>>>>>>> c54c2116f622395dc2330e6d9d57d5e4bfe83ec0
      
      if(toBreak.currentDurability <= 0){
        world[toBreak.ycor/scale][toBreak.xcor/scale] = null;
        Item b;
        
        switch (toBreak.type){
         case "ironore":
            b = new Item("iron.png");
            break;
         case "diamondore":
            b = new Item("diamond.png");
            break;
         case "Leaf":
            double rand = random(10);
            if (rand < 2){
            b = new Item("Apple0.png");
            }
            else {
              b = null;
            }         
           break;
         default:
            b = new Item(toBreak.type+"0.png");
            break;
        }
<<<<<<< HEAD

=======
>>>>>>> c54c2116f622395dc2330e6d9d57d5e4bfe83ec0
        if (b != null){
        //BlockItem b = toBreak.drop;
        boolean placed = false;
        for (int i = 0; i < inventory.length; i++){
          if (inventory[i]!= null){
          }
          if (inventory[i] != null && inventory[i].type.equals(b.type) && inventory[i].stack < 64){
            inventory[i].stack++;
            placed = true;
            i = 900000;
          }
        }
        if (!placed){
        for (int i = 0; i < hotbar.length; i++){
            if (hotbar[i] == null){
              b.stack++;
              hotbar[i] = b;  
              placed = true;
              i = 11;
            }    
            else if (hotbar[i].type.equals(b.type) && hotbar[i].stack < 64) {
              hotbar[i].stack ++;
              placed = true;
              i = 11;
            }
            else if (hotbar[i].stack > 64 && i < 9){
              b.stack++;
              hotbar[i+1] = b;
              placed = true;
              i = 11;
            }
          }
        }
        if (!placed){
          boolean iplace = false;
          for (int i = 0; i < inventory.length; i++){
            if (inventory[i] == null){
              b.stack++;
              inventory[i] = b;
              iplace = true;
              i = 10000;
            }
            else if (inventory[i].type.equals(b.type) && inventory[i].stack < 64){
              inventory[i].stack++;
              iplace = true;
              i = 10000;
            }
            else if (inventory[i].stack > 64 && i < 29){
              b.stack++;
              inventory[i+1]= b;
              iplace = true;
              i = 10000;
            }
            
          }
          if (!iplace){
            System.out.println("Inventory full! No more items can be added");
          }
        }
        }
        }
    }
  }
  
  void place(int x, int y){
    if (!open){
    if (hotbar[hbSlot] != null){
      if (hotbar[hbSlot].type.equals("Grass0.png")){
      world[y][x] = new Grass(x*scale,y*scale,scale);; 
      }
      if (hotbar[hbSlot].type.equals("Sand0.png")){
      world[y][x] = new Sand(x*scale,y*scale,scale);; 
      }
      if (hotbar[hbSlot].type.equals("Stone0.png")){
      world[y][x] = new Stone(x*scale,y*scale,scale);; 
      }
      if (hotbar[hbSlot].type.equals("Wood0.png")){
      world[y][x] = new Wood(x*scale,y*scale,scale);; 
      }
      if (hotbar[hbSlot].type.equals("plank0.png")){
      world[y][x] = new Plank(x*scale,y*scale,scale);; 
      }
      hotbar[hbSlot].stack--;
      if (hotbar[hbSlot].stack == 0){
        hotbar[hbSlot] = null;
      }
    }
    }
    
  }
  
  
  void takeDamage(int amt){
  }
  
  
  void gravity(){
    int feet = (int)(ycor+ pheight);
    //System.out.println("Feet: " + feet);
    if (feet/scale > 1 && feet/scale < world.length - 1){
      Block mayFloor = world[feet/scale][xcor/scale];
      Block mayFloor2 = world[feet/scale][(int)(xcor + pwidth)/scale];
   
      if (mayFloor == null && mayFloor2 == null){
        ycor += yVel;
        yMove = -(ycor - height/2);
        yVel += grav;
        if (yVel > scale){yVel = scale;}
      }
      else{
        yVel = 0;
        ycor = ((int)(ycor)/scale) * scale;
         yMove = -(ycor - height/2);
      }
    }
    else{
        yVel = 0;
        ycor = ((int)(ycor)/scale) * scale;
        yMove = -(ycor - height/2);
    }
  }
  
  void move(int direction){
    //System.out.println((xcor + pwidth)/scale);
    if (!open){
        xcor += xVel * direction;
        if (direction < 0){
          direct = false;
         Block leftBottom = world[(int)(ycor/scale) + 1][xcor/scale];
         Block leftTop = world[(int)(ycor/scale)][xcor/scale];
         if (leftBottom != null || leftTop != null || xcor/scale == 0){
          xcor = (xcor / scale) * scale + scale + 1;
          xMove =-( xcor -width/2); 
         }
        }
        if (direction > 0){
          direct = true;
         Block rightBottom = world[(int)(ycor/scale) + 1][(xcor + int(pwidth))/scale];
         Block rightTop = world[(int)(ycor/scale)][(xcor + (int)(pwidth))/scale];
         if (rightBottom != null || rightTop != null || ((xcor + (int)(pwidth))/scale == world[0].length - 1)){
          xcor = (xcor)/ scale * scale + scale - (int)(pwidth) - 1;
          xMove = -(xcor -width/2); 
          //System.out.println("Before: " + (xcor + ", " + (xcor + pwidth)));
         // System.out.println("Reached");
         }
        }
        xMove =-( xcor -width/2); 
    }
  }
  
  
  void jump(int velocity){
    if(!open){
    if( yVel == 0){
      yVel -= velocity;
      ycor += yVel;
      if (world[(int)(ycor)/scale][xcor/scale] != null || world[(int)(ycor)/scale][(int)(xcor + pwidth)/scale] != null){
        yVel = 0; 
        ycor = (int)(ycor)/scale * scale + scale + 1;
      }
      yMove = -(ycor - height/2);
    }
    }
  }
  
  void eat(Item food){
    if (!open){
    int  i = 0;
    int hp;
    if (food.type == "Steak0.png"){
      hp = 4;
    }
    else {
      hp = 2;
    }
    while (i < hp && hunger <10){
      hunger++;
      i++;
    }
    }
  }
  
  void die(){
    dead = true;
  }
  
  void collision(){
    
  }
  
  void hungerDrain(){
    hunger--;
    if (hunger == 0){
      die();
    }
  }
  
  void openInventory(){
    open = true;
    //re
  }
  
  // STORES CRAFTING RECIPES
  boolean crafting(){
    int nullcount = 0;
    int woodcount = 0;
    int plankcount = 0;
    ArrayList<Integer> ppos = new ArrayList<Integer>(0);
    ArrayList<Integer> pstack = new ArrayList<Integer>(0);
    int stack = 0;
    for (int i = 0; i < crafting.length; i++){
      if (crafting[i] == null){
        nullcount++;
      }
      if (crafting[i] != null && crafting[i].type.equals("Wood0.png")){
        stack = crafting[i].stack;
        woodcount++;
      }
      if (crafting[i] != null && crafting[i].type.equals("plank0.png")){
        ppos.add(i); 
        pstack.add(crafting[i].stack);
        plankcount++;
      }
    }
    //PLANKS
    if (nullcount == 8 && woodcount == 1){
      craft = new Item("plank0.png");
      if (stack*4 > 65){
        craft.stack = 64;
      }
      else {
        craft.stack = stack*4;
      }
      return true;
    }
    //STICKS
    else if (nullcount == 7 && plankcount == 2 && ppos.get(1) - ppos.get(0) == 3){
       craft = new Item("stick.png");
       if (pstack.get(0) > pstack.get(1)){
         stack = pstack.get(1);
       }
       else {
         stack = pstack.get(0);
       }
      if (stack*4 > 65){
        craft.stack = 64;
      }
      else {
        craft.stack = stack*4;
      }
      return true;
    }
    //PICK/AXE
    else if (nullcount == 4){
      if (crafting[0] != null && crafting[1]!= null && crafting[2] != null && crafting[4]!=null && 
      crafting[7] != null &&crafting[0].type.equals("iron.png") && crafting[1].type.equals("iron.png") && 
      crafting[2].type.equals("iron.png") && crafting[4].type.equals("stick.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("ironpick.png");
         craft.stack = 1;
      return true;
      }
      if (crafting[0] != null && crafting[1]!= null && crafting[2] != null && crafting[4]!=null && 
      crafting[7] != null &&crafting[0].type.equals("diamond.png") && crafting[1].type.equals("idiamond.png") && 
      crafting[2].type.equals("diamond.png") && crafting[4].type.equals("stick.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("diapick.png");
         craft.stack = 1;
      return true;
      }
       if (crafting[0] != null && crafting[1]!= null && crafting[3] != null && crafting[4]!=null && 
      crafting[7] != null &&crafting[0].type.equals("iron.png") && crafting[1].type.equals("iron.png") && 
      crafting[3].type.equals("iron.png") && crafting[4].type.equals("stick.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("ironaxe.png");
         craft.stack = 1;
      return true;
      }
       if (crafting[0] != null && crafting[1]!= null && crafting[3] != null && crafting[4]!=null && 
      crafting[7] != null &&crafting[0].type.equals("diamond.png") && crafting[1].type.equals("idiamond.png") && 
      crafting[4].type.equals("diamond.png") && crafting[4].type.equals("stick.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("diaaxe.png");
         craft.stack = 1;
      return true;
      }
    }
    //SHOV/SWORD
    else if (nullcount == 6){
      if (crafting[1]!= null && crafting[4]!=null && crafting[7] != null && crafting[1].type.equals("iron.png") && 
      crafting[4].type.equals("stick.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("ironshov.png");
         craft.stack = 1;
      return true;
      }
      if (crafting[1]!= null && crafting[4]!=null && crafting[7] != null && crafting[1].type.equals("diamond.png") && 
      crafting[4].type.equals("stick.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("diashov.png");
         craft.stack = 1;
      return true;
      }
       if (crafting[1]!= null && crafting[4]!=null && crafting[7] != null && crafting[1].type.equals("iron.png") && 
      crafting[4].type.equals("iron.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("ironsword.png");
         craft.stack = 1;
      return true;
      }
      if (crafting[1]!= null && crafting[4]!=null && crafting[7] != null && crafting[1].type.equals("diamond.png") && 
      crafting[4].type.equals("diamond.png") && crafting[7].type.equals("stick.png")){
         craft = new Item("diasword.png");
         craft.stack = 1;
      return true;
      }
      
    }
    return false;
  }
  
  void display(){
    if (dead){
      fill(255,0,0);
      rect(0,0,width,height);
      fill(0);
      text("lol u died",width/2,height/2);
    }else{
    if (direct){
    image(image,width/2,height/2);
    }
    else {
      pushMatrix();
      scale(-1,1);
      image(image,-width/2 - pwidth,height/2);
      popMatrix();
    }
    
    if (!open){
    fill(238,245,148);
    stroke(255);
    rect(hbSlot*80*0.98 + (width-780)/2, height-200,80,80);
    noFill();
    image(hotBarDisplay,(width-800)/2,height-200);
    for (int i = 0; i < hotbar.length; i++){
      if (hotbar[i] != null){
        hotbar[i].image.resize(50,50);
        image(hotbar[i].image,i*80*0.99 + (width-760)/2, height-180);
        textSize(20);
        fill(0);
        text("" + hotbar[i].stack,i*80*0.99 + (width-700)/2, height-160);
      }
    }
    }
    for (int i = 1; i < health; i++){
      image(healthBar, 40*i, 60);
    }
    for (int i = 1; i < hunger; i++){
      image(hungerBar, 40* i, 120);
    }
  }
    if (open){
      
      image(inventoryDisplay,(width-550*1.5)/2,(height-450*1.5)/2);
      if (crafting()){
        craft.image.resize(50,50);
        image(craft.image,width-600,height-726);
        textSize(20);
        text("" + craft.stack, width-575, height-714);
      }
      textSize(15);
      fill(0);
      text("Left click picks up and places blocks in inventory. Right click to drop single item in crafting window.", width-550*2, height-450*1.79);
      for (int i = 0; i < hotbar.length; i++){
      if (hotbar[i] != null){
        hotbar[i].image.resize(50,50);
        image(hotbar[i].image,i*80*0.945 + (width-730)/2, height-262);
        textSize(20);
        fill(0);
        text("" + hotbar[i].stack,i*80*0.945 + (width-670)/2, height-250);
      }   
    }
    for (int i = 0; i < inventory.length; i++){
        if (inventory[i] != null){
          inventory[i].image.resize(50,50);
          if (i < 10){
            //FIX VALUES LATER
            image(inventory[i].image, i*80*0.945 + (width-730)/2, height - 548);
            textSize(20);
            fill(0);
            text("" + inventory[i].stack,i*80*0.945 + (width-670)/2, height-536);
          }
          else if (i < 20){
            image(inventory[i].image, (i-10)*80*0.945 + (width-730)/2, height - 456);
            textSize(20);
            fill(0);
            text("" + inventory[i].stack,(i-10)*80*0.945 + (width-670)/2, height-444);
          }
          else {
            image(inventory[i].image, (i-20)*80*0.945 + (width-730)/2, height - 368);
            textSize(20);
            fill(0);
            text("" + inventory[i].stack,(i-20)*80*0.945 + (width-670)/2, height-356);
          }
        }
    }
        for (int i = 0; i < crafting.length; i++){
        if (crafting[i] != null){
          crafting[i].image.resize(50,50);
          if (i < 3){
            image(crafting[i].image, i*80*0.95 + (width-493)/2, height - 794);
            textSize(20);
            fill(0);
            text("" + crafting[i].stack,i*80*0.95 + (width-433)/2, height-782);
          }
          else if (i < 6){
            image(crafting[i].image, (i-3)*80*0.95 + (width-493)/2, height - 722);
            textSize(20);
            fill(0);
            text("" + crafting[i].stack,(i-3)*80*0.95 + (width-433)/2, height-710);
          }
          else {
            image(crafting[i].image, (i-6)*80*0.95 + (width-493)/2, height - 644);
            textSize(20);
            fill(0);
            text("" + crafting[i].stack,(i-6)*80*0.95 + (width-433)/2, height-632);
          }
        }
    }
      
    }
  }
  
  void mining(float xVal, float yVal){
    if (dist(xcor + pwidth/2, ycor + pheight/2, xVal, yVal) <= 3 * scale){
    int worldX = (int)xVal/scale;
    int worldY = (int)yVal/scale;
    Block spot = world[worldY][worldX];
    if (spot != null && hotbar[hbSlot] != null && spot.uses == hotbar[hbSlot].num){
             breakBlock(spot);
     }
    }
  }
}
