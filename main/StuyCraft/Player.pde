class Player{
  int health;
  int hunger;
  Item[] hotbar;
  PImage hotBarDisplay;
  PImage image;
  PImage healthBar;
  PImage hungerBar;
  int xcor;
  int ycor;
  float pwidth;
  float pheight;
  Item equipped;
  int xVel;
  int hbSlot;
  int yVel;
  float grav;

  public Player(){
    health = 10;
    hunger = 10;
    hotbar = new Item[10];
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
    pheight = scale*2;
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
    
  }
  void addToHotbar(Item item){
  }
  
  void removeHotbar(Item item){
  }
  
  void breakBlock(Block toBreak){
    Item b;
    if (toBreak.type.equals("Grass")){
        b = new Item("Grass0.png");
    }
    else if (toBreak.type.equals("Sand")) {
        b = new Item("Sand0.png");
    }
    else if (toBreak.type.equals("Stone")) {
        b = new Item("Stone0.png");
    }
    else if (toBreak.type.equals("Wood")) {
        b = new Item("Sand0.png");
    }
    else {
        b = new Item("Apple.png");
    }
    //BlockItem b = toBreak.drop;
    boolean placed = false;
    for (int i = 4; i < hotbar.length; i++){
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
    if (!placed){
      print("Inventory full!");
    }

  }
  
  void place(int x, int y){
    if (hbSlot > 3 && hotbar[hbSlot] != null){
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
      hotbar[hbSlot].stack--;
      if (hotbar[hbSlot].stack == 0){
        hotbar[hbSlot] = null;
      }
    }
    
  }
  
  
  void takeDamage(int amt){
  }
  
  
  void gravity(){
    int feet = (int)(ycor+ pheight);
    Block mayFloor = world[feet/scale][xcor/scale];
    Block mayFloor2 = world[feet/scale][(int)(xcor + pwidth)/scale];
    
    if (mayFloor == null && mayFloor2 == null){
      ycor += yVel;
      yMove -= yVel;
      yVel += grav;
      if (yVel > scale){yVel = scale;}
    }
    else{
      yVel = 0;
      ycor = ((int)(ycor)/scale) * scale;
       yMove = -(ycor - height/2);
    }
  }
  
  int move(int direction){
    xcor += xVel * direction;
    if (direction < 0){
     Block leftBottom = world[(int)(ycor/scale) + 1][xcor/scale];
     Block leftTop = world[(int)(ycor/scale)][xcor/scale];
     if (leftBottom != null || leftTop != null && xcor <= 1){
      xcor = (xcor / scale) * scale + scale + 1;
      return 0;
     }
    }
    if (direction > 0){
     Block rightBottom = world[(int)(ycor/scale) + 1][(xcor + int(pwidth))/scale];
     Block rightTop = world[(int)(ycor/scale)][(xcor + (int)(pwidth))/scale];
     if (rightBottom != null || rightTop != null || (xcor + (int)(pwidth)) >= worldWidth - 1){
      xcor = (xcor)/ scale * scale + scale - (int)(pwidth) - 1;
      //System.out.println("Before: " + (xcor + ", " + (xcor + pwidth)));
     // System.out.println("Reached");
      return 0;
     }
    }
    
    return xVel * direction;
  }
  
  void jump(int velocity){
    if( yVel == 0){
      yVel -= velocity;
      ycor += yVel;
      yMove +=velocity;
    }
  }
  
  void eat(Food food){
  }
  
  void die(){
  }
  
  void collision(){
    
  }
  
  void hungerDrain(){
    hunger--;
    if (hunger == 0){
      die();
    }
  }
  
  void display(){
     fill(238,245,148);
    stroke(255);
    rect(hbSlot*80*0.98 + (width-780)/2, height-200,80,80);
    image(image,width/2,height/2);
    noFill();
    image(hotBarDisplay,(width-800)/2,height-200);
    for (int i = 0; i < hotbar.length; i++){
      if (hotbar[i] != null){
        //TEMPORARY -- NEED TO FIND WAY TO GET BLOCKITEM IMAGE
        hotbar[i].image.resize(50,50);
        image(hotbar[i].image,i*80*0.99 + (width-760)/2, height-180);
        textSize(20);
        fill(0);
        text("" + hotbar[i].stack,i*80*0.99 + (width-700)/2, height-160);
      }
    }
    for (int i = 1; i < health; i++){
      image(healthBar, 40*i, 60);
    }
    for (int i = 1; i < hunger; i++){
      image(hungerBar, 40* i, 120);
    }
  }
}
