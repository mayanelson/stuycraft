class Shovel extends Tool{
  
  Shovel(){
    num = 3;
    type = "shovel.png";
    image = loadImage("shovel.png");
    image.resize(50,50);
    range = 5;
    //type = "Shovel";
  }
  
 void use(Block target){
 }
}
