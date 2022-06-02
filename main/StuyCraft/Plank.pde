class Plank extends Block{
  
  Plank(int xcor, int ycor, int sidelength){
    super(xcor, ycor, sidelength);
    type = "Plank";
    image = plank0;
    uses = 2;
  }
  
  void display(){
    image(plank0, super.xcor, super.ycor);    
  }
}
