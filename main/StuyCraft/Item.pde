class Item{
  int stack = 0;
  String type;
  PImage image;
  int hungerPoints;
  int num;
  int power;
  
  Item(){
    num = -1;
    image  = loadImage("heart.png"); // just so it compiles
    type = "compile";
  }
  Item (Item source, int amount){
    this.type = source.type;
    this.image = source.image;
    this.hungerPoints = source.hungerPoints;
    this.num = source.num;
    this.power = source.power;
    stack = amount;
  }
  Item(String picFile){
    num = -1;
    image  = loadImage(picFile);
    type = picFile;
    if (picFile.equals("ironsword.png") || picFile.equals("sword.png") || picFile.equals("diasword.png")){
      num = 1;
    }
    if (picFile.equals("ironpickaxe.png") || picFile.equals("pickaxe.png") || picFile.equals("diapickaxe.png")){
      num = 2;
    }
    if (picFile.equals("ironaxe.png") || picFile.equals("axe.png") || picFile.equals("diaaxe.png")){
      num = 3;
    }
    if (picFile.equals("ironshovel.png") || picFile.equals("shovel.png") || picFile.equals("diashovel.png")){
      num = 4;
    }

    
  }
  
  void display(){
    
  }
}
