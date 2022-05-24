class Stone extends Block{
  PImage stone;
  
  Stone(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    stone = loadImage("Stone0.png");
    stone.resize(sidelength, sidelength);
  }
  
  void display(){
    image(stone, super.xcor, super.ycor);
  }
}
