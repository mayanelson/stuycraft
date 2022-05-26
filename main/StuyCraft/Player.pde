class Player{
  int health;
  int hunger;
  Item[] hotbar;
  PImage hotBarDisplay;
  PImage image;
  PImage healthBar;
  PImage hungerBar;
  float xcor;
  float ycor;
  float pwidth;
  float pheight;
  Item equipped;
  int hbSlot;
  float xVel;
  float yVel;


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
    hungerBar.resize(50,50);
    xcor = (width - scale*10)/2; // PLAYER SPAWNS IN MIDDLE OF SCREEN
    ycor = (height - scale* 20)/2;
    pwidth = 100*scale;
    pheight = 100*scale*2;
    
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
     // if (hotBar[hbSlot]
      world[y][x] = new Grass(x*scale,y*scale,scale);;
      hotbar[hbSlot].stack--;
    }
    
  }
  
  void attack(Mob attacked){
  }
  
  void takeDamage(int amt){
  }
  
  void move(int direction, int velocity){
    
  }
  
  void jump(int velocity){
  }
  
  void eat(Food food){
  }
  
  void die(){
  }
  
  void collision(){
  }
  
  void hungerDrain(){
  }
  
  void display(){
    fill(238,245,148);
    stroke(255);
    rect(hbSlot*80*0.98 + (width-780)/2, height-200,80,80);
    noFill();
    image(image,xcor,ycor);
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
    for (int i = 1; i < 10; i++){
      image(healthBar, 40*i, 60);
    }
    for (int i = 1; i < 10; i++){
      image(hungerBar, 40* i, 120);
    }
  }
}
