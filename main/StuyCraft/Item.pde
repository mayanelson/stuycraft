class Item{
  //String type;
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
