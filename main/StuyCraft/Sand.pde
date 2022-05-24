class Sand extends Block{
  
  Sand(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    super.image = loadImage("Sand0.png");
    super.image.resize(sidelength, sidelength);
  }
  
  void display(){
    image(super.image, super.xcor, super.ycor);
  }
}
