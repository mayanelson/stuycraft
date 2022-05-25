class Item{
  int stack = 0;
  PImage image;
  
  Item(){
    image  = loadImage("heart.png");
  }
  
  Item(String picFile){
    image  = loadImage(picFile);
  }
  
  void display(){
    
  }
}
