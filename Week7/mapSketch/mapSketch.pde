//a sketch to play with the idea of map()

int[] x = {
  5, 10, 15, 20
};

void setup() {
  size(600, 200);
  mapSomething(); //function called here
}

void draw() { 
  //don't need to draw anything in the draw loop because we are only drawing once
}

void mapSomething() {
  for (int i = 0; i<x.length; i++) {
    float thing = map(x[i], 5, 20, 10, width-10); //i go fro 10 to width-10 in order to have some margins
    println(thing);
    ellipse(thing, height/2, 10, 10);
  }
}

