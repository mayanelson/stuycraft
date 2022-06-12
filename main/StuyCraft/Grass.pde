class Grass extends Block{
  Grass(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
   // drop = new GrassItem();
    type = "Grass";
    bImage = grass0;
    uses = 3;
    maxDurability = 100.0;
    currentDurability = maxDurability;
    //System.out.println("\t" + grass0);
    //System.out.println(bImage);
  }
  
  void animate(){
    //print("this one!");
    isAnimate = true;
    //image = grass1;
    //display();
  }
  
  void display(){
    float ratio = currentDurability/maxDurability;
    if (ratio ==1 || !isMining){
      image(grass0, xcor, ycor);
      currentDurability = maxDurability;
    }
    else if (ratio > 0.5){
      image(grass1, xcor, ycor);
    }
    else{
      image(grass2, xcor, ycor);
    }
  }
}
