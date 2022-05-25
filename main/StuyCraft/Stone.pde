class Stone extends Block{
  
  Stone(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Stone";
    image = loadImage("Stone0.png");
    image.resize(scale, scale);
  }
  
  void display(){
    image(image, super.xcor, super.ycor);
  }
}
