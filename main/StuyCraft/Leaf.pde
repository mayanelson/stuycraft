class Leaf extends Block{
  
  Leaf(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
  }
  
  void display(){
    type = "Leaf";
    image(leaf0, super.xcor, super.ycor);
  }
}
