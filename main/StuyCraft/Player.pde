class Player{
  int health;
  int hunger;
  Item[] hotbar;
  PImage hotBarDisplay;
  PImage image;
  PImage healthBar;
  PImage hungerBar;
  float spawnX;
  float spawnY;
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
    hotBarDisplay.resize(800,120);
    healthBar = loadImage("heart.png");
    healthBar.resize(100,100);
    hungerBar = loadImage("hunger.png");
    hungerBar.resize(100,100);
    spawnX = width/2;
    spawnY = 0;
    pwidth = scale;
    pheight = scale*2;
    xVel = scale / 2;
    yVel = 0;
    //CREATE TOOLS AND ADD TO HOTBAR
    
  }
  void addToHotbar(Item item){
  }
  
  void removeHotbar(Item item){
  }
  
  void breakBlock(Block toBreak){

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
    image(image,spawnX,spawnY);
    image(hotBarDisplay,width/3,height-200); 
    for (int i = 1; i < 10; i++){
      image(healthBar, 60*i, 100);
    }
    for (int i = 1; i < 10; i++){
      image(hungerBar, 60*i, 200);
    }
  }
}
