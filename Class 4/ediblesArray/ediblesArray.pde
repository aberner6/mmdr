void setup() {
  size(400,400);
  background(255);
  smooth();
  noStroke();
  
String[]edibles = {"banana", "apples", "berries", "pineapple"};

for (int i = 0; i<edibles.length; i++) {
  fill(0);
  text (edibles[i], width/2, 20+30*i); 
} 

}
