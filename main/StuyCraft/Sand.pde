class Sand extends Block{
  
  Sand(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Sand";
    bImage = sand0;
    uses = 3;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
  
  void display(){
    float ratio = currentDurability/maxDurability;
    if (ratio ==1){
      image(sand0, xcor, ycor);
    }
    else if (ratio > 0.5){
      image(sand1, xcor, ycor);
    }
    else{
      image(sand2, xcor, ycor);
    }
  }
}
