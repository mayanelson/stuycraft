class Sword extends Tool{
  
  Sword(){
    num = 0;
    type = "sword.png";
    image = loadImage("sword.png");
    image.resize(50,50);
    range = 5;
  }
  
 void attack(Mob m){
 }
}
