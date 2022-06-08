class TNT extends Block{
  boolean isExplode;
  int explodeTick;  
  int randTick;
  PImage explosion;

  TNT(int xcor,int ycor,int sidelength){
    super(xcor,ycor,sidelength);
    type = "TNT";
    bImage = TNT0;
    uses = 3;
    maxDurability = 100.0;
    currentDurability = maxDurability;
    explosion = loadImage("Explosion.png");
    randTick = 120;
  }
  
  void explode(){
    explode = true;
    if (explodeTick > randTick + 25){
      for (int i = 0; i < 4; i++){
      for (int j = 0; j < 4; j++){
        if (i != 3 || j != 3){
          if ((int)ycor/scale + i < 250 && xcor/scale +j < 500){
          world[(int)ycor/scale + i][xcor/scale +j] = null;
          }
          if ((int)ycor/scale - i >= 0 && xcor/scale -j >= 0){
          world[(int)ycor/scale - i][xcor/scale -j] = null;
          }
          if ((int)ycor/scale + i < 250 && xcor/scale -j >= 0){
          world[(int)ycor/scale + i][xcor/scale -j] = null;
          }
          if ((int)ycor/scale + i >= 0 && xcor/scale +j < 500){
          world[(int)ycor/scale - i][xcor/scale +j] = null;
          }
        }
      }
    }
    int rand2 = (int)random(2)+7;
    player.health -= rand2;
    if (player.health <= 0){      
      player.die(); 
    }  
     world[(int)ycor/scalei][xcor/scale] = null;
    }
    
  }
  
  void display(){
     if(explode){
      explodeTick++;
    }
    if (explode && explodeTick > randTick){
      image(explosion,xcor-375,ycor-375);
    }
    else if (explode && explodeTick%30 > 5 && explodeTick%30 < 15){
      image(TNT1,xcor,ycor);
    }
    if (!explode){
      image(bImage,xcor,ycor);
    }
}
