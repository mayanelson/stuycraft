class Stone extends Block{
  
  Stone(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    super.image = loadImage("Stone0.png");
    super.image.resize(sidelength, sidelength);
  }
  
  void display(){
    image(super.image, super.xcor, super.ycor);
  }
}
