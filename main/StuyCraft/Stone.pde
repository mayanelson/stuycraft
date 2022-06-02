class Stone extends Block{
  
  Stone(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Stone";
    bImage = stone0;
    uses = 1;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
  
  void display(){
    float ratio = currentDurability/maxDurability;
    if (ratio ==1){
      image(stone0, xcor, ycor);
    }
    else if (ratio > 0.5){
      image(stone1, xcor, ycor);
    }
    else{
      image(stone2, xcor, ycor);
    }
  }
}
