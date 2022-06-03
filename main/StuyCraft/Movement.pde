class Movement{
  boolean[] inputs;
  
  public Movement(){
   inputs = new boolean[3]; 
  }
  
  void activate(char input){
    //SHOULD PROB CHANGE TO INCLUDE CAP KEYS
    switch(input){
     case 'a':
       inputs[0] = true;
       break;
     case 'w':
       inputs[1] = true;
       break;
     case 'd':
       inputs[2] = true;
       break;
    }
  }
  
    void deactivate(char input){
    switch(input){
     case 'a':
       inputs[0] = false;
       break;
     case 'w':
       inputs[1] = false;
       break;
     case 'd':
       inputs[2] = false;
       break;
    }
  }
}
