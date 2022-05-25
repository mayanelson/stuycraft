class Sand extends Block{
  
  Sand(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
  }
  
  void display(){
    type = "Sand";
    image(sand0, super.xcor, super.ycor);
  }
}
