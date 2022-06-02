class Wood extends Block{
  
  Wood(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Wood";
    bImage = wood0;
    uses = 2;
  }
  
  void display(){
    image(wood0, super.xcor, super.ycor);    
  }
}
