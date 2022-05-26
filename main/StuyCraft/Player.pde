class Player{
  int health;
  int hunger;
  Item[] hotbar;
  PImage hotBarDisplay;
  PImage image;
  PImage healthBar;
  PImage hungerBar;
  int xcor;
  float ycor;
  float pwidth;
  float pheight;
  Item equipped;
  int xVel;
  float yVel;
  float grav;

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
    xcor = (int)(worldWidth/2);
    ycor = 0;
    pwidth = scale;
    pheight = scale*2;
    xVel = scale / 5;
    yVel = 0;
    grav = 0.5;
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
  
  void move(){}
  
  void gravity(){
    ycor += yVel;
    yVel += grav;
    yMove += yVel;
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
    image(image, width/2, height/2);
    image(hotBarDisplay,width/3,height-200); 
    for (int i = 1; i < 10; i++){
      image(healthBar, 60*i, 100);
    }
    for (int i = 1; i < 10; i++){
      image(hungerBar, 60*i, 200);
    }
  }
}
