class Wood extends Block{
  
  Wood(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Wood";
    bImage = wood0;
    uses = 2;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
  
  void display(){
    float ratio = currentDurability/maxDurability;
    if (ratio ==1){
      image(wood0, xcor, ycor);
    }
    else if (ratio > 0.5){
      image(wood1, xcor, ycor);
    }
    else{
      image(wood2, xcor, ycor);
    }
  }
}
