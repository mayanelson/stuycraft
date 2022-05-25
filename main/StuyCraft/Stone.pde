class Stone extends Block{
  
  Stone(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    image = stone0;
  }
  
  void display(){
    type = "Stone";
    image(stone0, super.xcor, super.ycor);
  }
}
