class diaore extends Block{
  
  diaore(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "diamondore";
    bImage = diaore0;
    uses = 1;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
   
  void display(){
      float ratio = currentDurability/maxDurability;
    if (ratio ==1 || !isMining){
      image(diaore0, xcor, ycor);
      currentDurability = maxDurability;
    }
    else if (ratio > 0.5){
      image(diaore1, xcor, ycor);
    }
    else{
      image(diaore2, xcor, ycor);
    }
  }
}
