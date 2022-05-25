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
    for (int i = 0; i < hotbar.length; i++){
      if (hotbar[i] == null){
        hotbar[i] = b;
        placed = true;
        i = 11;
      }
      else if (hotbar[i].image == b.image && hotbar[i].stack <= 64) {
        hotbar[i].stack ++;
        placed = true;
      }
      else if (hotbar[i].stack > 65 && i < 9){
        hotbar[i+1] = b;
        placed = true;
        i = 11;
    }
    }
    if (!placed){
      print("Inventory full!");
    }

  }
  
  void place(Block toPlace){
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
    image(image,xcor,ycor);
    image(hotBarDisplay,(width-800)/2,height-200);
    for (int i = 0; i < hotbar.length; i++){
      if (hotbar[i] != null){
        //TEMPORARY -- NEED TO FIND WAY TO GET BLOCKITEM IMAGE
        hotbar[i].image.resize(50,50);
        image(hotbar[i].image,i*80*0.99 + (width-760)/2, height-180);
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
