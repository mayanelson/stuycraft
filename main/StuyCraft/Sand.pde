class Sand extends Block{
  
  Sand(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Sand";
    bImage = sand0;
    uses = 3;
  }
  
  void display(){
    image(sand0, super.xcor, super.ycor);
  }
}
