class Plank extends Block{
  
    
  Plank(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "plank";
    bImage = plank0;
    uses = 2;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
  
  void display(){
    float ratio = currentDurability/maxDurability;
    if (ratio ==1 || !isMining){
      image(plank0, xcor, ycor);
      currentDurability = maxDurability;
    }
    else if (ratio > 0.5){
      image(plank1, xcor, ycor);
    }
    else{
      image(plank2, xcor, ycor);
    }
  }
}
