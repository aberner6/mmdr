//this is a sketch to generate a random name out of the class list
String[] names = {
  "Gabriella", "Caitlin", "Julia", "Kristen", "Nora", "Victoria", "Clare", "Claire", "Isabelle", "Ana Sophia", "Mr. Walters"
};

int whoShows = parseInt(random(0, names.length));

// println (names[whoShows]); 

void setup() {
  size(600, 600);
  background(200);
  textAlign(CENTER);
  textSize(84);
  fill(20, 200, 200); 
  text(names[whoShows], width/2, height/2);
}

