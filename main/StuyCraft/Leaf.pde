class Leaf extends Block{
  
  Leaf(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Leaf";
    bImage = leaf0;
    uses = 2;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
  
  void display(){
    float ratio = currentDurability/maxDurability;
    if (ratio ==1){
      image(leaf0, xcor, ycor);
    }
    else if (ratio > 0.5){
      image(leaf1, xcor, ycor);
    }
    else{
      image(leaf2, xcor, ycor);
    }
  }
}
