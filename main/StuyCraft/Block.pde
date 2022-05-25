class Block{
  float durability;
  PImage image;
  PImage image2;
  PImage image3;
  BlockItem drop;
  String type;
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
  
  void animate(){
   while (mousePressed == true) {
    PImage g1 = loadImage("Grass1.png");
     g1.resize(scale,scale);
    image(g1,xcor,ycor);
    delay(500);
    PImage g2 = loadImage("Grass2.png");
     g2.resize(scale,scale);
    image(g2,xcor,ycor);
    delay(500); 
    print("hello");
    mousePressed = false;
 }
  }


void display(){
  fill(0);
  stroke(255);
  rect(xcor, ycor, sideLength, sideLength);
}
}
