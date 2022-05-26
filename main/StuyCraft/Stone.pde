class Stone extends Block{
  
  Stone(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Stone";
    image = stone0;
    uses = 1;
  }
  
  void display(){
    image(stone0, super.xcor, super.ycor);
  }
}
