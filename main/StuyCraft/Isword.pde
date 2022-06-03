class ISword extends Tool{
  
  ISword(){
    type = "ironsword.png";
    image = loadImage("ironsword.png");
    image.resize(50,50);
    range = 5;
  }
  
 void attack(Mob m){
 }
}
