String zin;

void setup() {
  zin = Langzin("Hoi", "Doei", "Kort", "Lang");
  println(zin);
}
void draw() {
}
String Langzin(String a, String b, String c, String d) {
  String antwoord;
  antwoord = a + " " + b + " " + c + " " + d;
  return antwoord;
}
