class Cow extends Mob{
  
  Cow(int x, int y){
    super(x,y);
    type = "Cow";
    image = loadImage("Cow0.png");
    image.resize((int)(scale*1.8),(int)(scale*1.5));
    mwidth = scale*1.8;
    mheight = scale*1.5;
    
  }
  
  void die() {
    Beef b = new Beef();
    player.addToHotbar(b);
    ccount--;
  }
  void display(){
    image(image,xcor,ycor);
    for (int  i = 0; i < health; i++){
      image(healthBar,xcor+ (i*scale/5), ycor);
    }
  }
}
