class Grass extends Block{

  Grass(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    drop = new GrassItem();
  }
  
  void display(){
    type = "Grass";
    image(grass0, super.xcor, super.ycor);
  }
}
