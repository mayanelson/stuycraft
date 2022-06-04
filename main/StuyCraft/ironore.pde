class ironore extends Block{
  
  ironore(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "ironore";
    bImage = ironore0;
    uses = 1;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
  
  void display(){
      float ratio = currentDurability/maxDurability;
    if (ratio ==1){
      image(ironore0, xcor, ycor);
    }
    else if (ratio > 0.5){
      image(ironore1, xcor, ycor);
    }
    else{
      image(ironore2, xcor, ycor);
    } 
  }
}
