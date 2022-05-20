class Block{
  float sidelength;
  float x,y;
  color thing;

  Block(float x, float y, float col, float side){
    this.x = x;
    this.y = y;
    thing = color((int)(col * 255));
    sidelength = side;
  }

  Block(float x, float y, color col, float side){
    this.x = x;
    this.y = y;
    thing = col;
    sidelength = side;
  }
  
  void display(){
    fill(thing);
    rect (x, y, sidelength, sidelength);
  }
  
  String toString(){
   return x + ", " + y + ": " + red(thing) + " " + green(thing) + " " + blue(thing); 
  }
}
