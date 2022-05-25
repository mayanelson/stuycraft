class Sand extends Block{
  
  Sand(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Sand";
    image = sand0;
  }
  
  void display(){
    image(sand0, super.xcor, super.ycor);
  }
}
