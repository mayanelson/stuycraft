class Sand extends Block{
  
  Sand(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Sand";
    image = loadImage("Sand0.png");
    image.resize(scale, scale);
  }
  
  void display(){
    image(image, super.xcor, super.ycor);
  }
}
