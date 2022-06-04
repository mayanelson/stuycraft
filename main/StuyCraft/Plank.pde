class Plank extends Block{
  
    
  Plank(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
<<<<<<< HEAD
    type = "plank";
=======
    type = "Plank";
>>>>>>> c54c2116f622395dc2330e6d9d57d5e4bfe83ec0
    bImage = plank0;
    uses = 2;
    maxDurability = 100.0;
    currentDurability = maxDurability;
  }
  
  void display(){
    float ratio = currentDurability/maxDurability;
    if (ratio ==1){
      image(plank0, xcor, ycor);
    }
    else if (ratio > 0.5){
      image(plank1, xcor, ycor);
    }
    else{
      image(plank2, xcor, ycor);
    }
  }
}
