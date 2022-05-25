class Wood extends Block{
  
  Wood(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Wood";
    image = loadImage("Wood0.png");
    image.resize(scale, scale);
  }
  
  void display(){
    image(image, super.xcor, super.ycor);    
  }
}
