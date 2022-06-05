class Shovel extends Tool{
  
  Shovel(){
    num = 3;
    type = "shovel.png";
    image = loadImage("shovel.png");
    image.resize(50,50);
    power = 3.0;
    //type = "Shovel";
  }
  
 void use(Block target){
 }
}
