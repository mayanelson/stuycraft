class Cow extends Mob{
  
  Cow(int x, int y){
    super(x,y);
    type = "Cow";
    image = loadImage("Cow0.png");
    image.resize(scale*2,(int)(scale*1.5));
    mwidth = scale*2;
    mheight = scale*1.5;
    
  }
  
  void die() {
    //Beef b = new Beef();
    ccount--;
  }
  void display(){
    image(image,xcor,ycor);
  }
}
