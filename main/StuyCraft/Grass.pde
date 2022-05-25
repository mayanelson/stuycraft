class Grass extends Block{

  Grass(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    drop = new GrassItem();
    type = "Grass";
    image = loadImage("Grass0.png");
    image.resize(scale, scale);
  }
  
  void animate(){

  }
  
  void display(){
    image(image, super.xcor, super.ycor);
  }
}
