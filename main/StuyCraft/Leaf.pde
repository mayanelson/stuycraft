class Leaf extends Block{
  
  Leaf(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Leaf";
    bImage = leaf0;
    uses = 2;
  }
  
  void display(){
    image(leaf0, super.xcor, super.ycor);
  }
}
