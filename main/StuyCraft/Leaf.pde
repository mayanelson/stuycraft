class Leaf extends Block{
  
  Leaf(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    super.image = loadImage("Leaf0.png");
    super.image.resize(sidelength, sidelength);
  }
  
  void display(){
    image(super.image, super.xcor, super.ycor);
  }
}
