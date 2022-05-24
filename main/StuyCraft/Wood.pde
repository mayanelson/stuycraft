class Wood extends Block{
  
  Wood(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    super.image = loadImage("Wood0.png");
    super.image.resize(sidelength, sidelength);
  }
  
  void display(){
    image(super.image, super.xcor, super.ycor);
  }
}
