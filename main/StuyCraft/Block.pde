class Block{
  float maxDurability;
  float currentDurability;
  PImage bImage;
  PImage image2;
  PImage image3;
  BlockItem drop;
  String type;
  boolean isMouseHover;
  int xcor;
  int ycor;
  int sideLength;
  int uses;
  
  public Block (int xcor, int ycor, int sidelength){
   this.xcor = xcor; 
   this.ycor = ycor;
   this.sideLength = sidelength;
  }
  

void explode(){
  //to compile
}

void display(){
  fill(0);
  stroke(255);
  rect(xcor, ycor, sideLength, sideLength);
}
}
