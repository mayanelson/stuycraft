class Item{
  int stack = 0;
  String type;
  PImage image;
  int hungerPoints;
  int num;
  float power;
  
  Item(){
    num = -1;
    image  = loadImage("heart.png"); // just so it compiles
    type = "compile";
  }
  
  Item(String picFile){
    num = -1;
    image  = loadImage(picFile);
    type = picFile;
    if (picFile.equals("ironsword.png") || picFile.equals("sword.png") || picFile.equals("diasword.png")){
      num = 0;
    }
    if (picFile.equals("ironpick.png") || picFile.equals("pickaxe.png") || picFile.equals("diapick.png")){
      num = 1;
    }
    if (picFile.equals("ironaxe.png") || picFile.equals("axe.png") || picFile.equals("diaaxe.png")){
      num = 2;
    }
    if (picFile.equals("ironshov.png") || picFile.equals("shovel.png") || picFile.equals("diashov.png")){
      num = 3;
    }
    if (picFile.substring(0,3).equals("dia")){
     this.power = 7.0;
    }
    else if (picFile.substring(0,4).equals("iron")){ 
      this.power = 5.0;
    }
    else{
      this.power = 3.0;
    }
    
  }
  
  void display(){
    
  }
}
