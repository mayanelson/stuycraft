class Pickaxe extends Tool{
  
  Pickaxe(){
    num = 1;
    type = "pickaxe.png";
    image = loadImage("pickaxe.png");
    image.resize(50,50);
    power = 3.0;
    //type = "Pick";
  }
  
 void use(Block target){
 }
}
