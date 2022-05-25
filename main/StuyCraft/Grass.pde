class Grass extends Block{
  Grass(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    drop = new GrassItem();
    type = "Grass";
    image = grass0;
    
  }
  
  void animate(){
    //print("this one!");
    isAnimate = true;
    display();
  }
  
  void display(){
    if (! isAnimate){
    image(grass0, super.xcor, super.ycor);
    }
    if (isAnimate){
      image(grass1, super.xcor, super.ycor);
      delay(500);
      image(grass2,super.xcor, super.ycor);
      isAnimate = false;
    }


  }
}
