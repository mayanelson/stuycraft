class Grass extends Block{

  Grass(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    drop = new GrassItem();
  }
  
  void display(){
    image(grass0, super.xcor, super.ycor);
  }
}
