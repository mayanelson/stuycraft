class Sand extends Block{
  
  Sand(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
  }
  
  void display(){
    image(sand0, super.xcor, super.ycor);
  }
}
