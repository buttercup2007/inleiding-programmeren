String[] Tekst = {"H", "o", "i", " ", "", "", " ", "b", "e", "n", " ", "P", "i", "e", "t", "."};
String zin;
void setup() {
  //Print Tekst als 1 zin
  //Maak een programma die controleert of het woordje ik in 'Tekst' staat
 for(String s : Tekst){
   zin += s;
 }
if (zin.contains("ik")) {
  println("\"ik\" staat in de zin.");
}else{
  println("\"ik\" staat niet in de zin.");
}
}
