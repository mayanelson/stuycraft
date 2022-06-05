class Sword extends Tool{
  
  Sword(){
    num = 0;
    type = "sword.png";
    image = loadImage("sword.png");
    image.resize(50,50);
    power = 3.0;
  }
  
 void attack(Mob m){
 }
}
