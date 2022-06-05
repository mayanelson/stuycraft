class ISword extends Tool{
  
  ISword(){
    type = "ironsword.png";
    image = loadImage("ironsword.png");
    image.resize(50,50);
    power = 5.0;
  }
  
 void attack(Mob m){
 }
}
