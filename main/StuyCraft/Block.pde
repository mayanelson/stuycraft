class Block{
  float durability;
  BlockItem drop;
  PImage image;
  boolean isMouseHover;
  int xcor;
  int ycor;
  int sideLength;
  Tool uses;
  
  public Block (int xcor, int ycor, int sidelength){
   this.xcor = xcor; 
   this.ycor = ycor;
   this.sideLength = sidelength;
  }
/*
BlockItem break(){
  
}
*/

void display(){
  fill(0);
  stroke(255);
  rect(xcor, ycor, sideLength, sideLength);
}
}
