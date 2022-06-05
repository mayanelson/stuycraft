class Axe extends Tool{
  
  Axe(){
    num = 2;
    type = "axe.png";
    image = loadImage("axe.png");
    image.resize(50,50);
    power = 3.0;
  }
  
 void use(Block target){
 }
}
