class Leaf extends Block{
  
  Leaf(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Leaf";
    image = loadImage("Leaf0.png");
    image.resize(scale, scale);
  }
  
  void display(){
    image(image, super.xcor, super.ycor);
  }
}
