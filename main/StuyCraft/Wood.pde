class Wood extends Block{
  
  Wood(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
  }
  
  void display(){
    image(wood0, super.xcor, super.ycor);
  }
}
