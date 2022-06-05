class Tool extends Item{
  Tool(int power, int num){
    String name = "";
    switch(power){
      case 7:
        name += "dia";
        break;
      case 5:
        name += "iron";
        break;
    }
    switch (num){
      case 1:
        name += "sword";
        break;
      case 2:
        name += "pickaxe";
        break;
      case 3:
        name += "axe";
        break;
      case 4:
        name += "shovel";
        break;
    }
    name += ".png";
    this.num = num;
    this.power = power;
    this.type = name;
    image = loadImage(name);
    image.resize(50,50);    
  }

}
