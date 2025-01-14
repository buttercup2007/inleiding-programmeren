int mijnGetal;

void setup(){
println( mijnFunctie(30,70));
mijnGetal = mijnFunctie(40,50);
println(mijnGetal);
}

void draw(){
  
}
int mijnFunctie(int getal1, int getal2){
  int antwoord;
  antwoord = (getal1 + getal2)/2;
  return(antwoord);
  
}
