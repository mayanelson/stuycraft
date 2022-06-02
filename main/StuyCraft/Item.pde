class Item{
  int stack = 0;
  String type;
  PImage image;
  int hungerPoints;
  
  Item(){
    image  = loadImage("heart.png"); // just so it compiles
    type = "compile";
  }
  
  Item(String picFile){
    image  = loadImage(picFile);
    type = picFile;
  }
  
  void display(){
    
  }
}
