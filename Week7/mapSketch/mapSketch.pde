//a sketch to play with the idea of map()

int[] x = {
  5, 10, 15, 20
};

void setup() {
  size(600, 200);
  mapSomething(); 
  //this is called "calling a function" - we are activating the function, mapSomething, to run. 
  //if we don't call it, it won't run.
  //the setup() and draw() loops always run.
}

void draw() { 
  //don't need to draw anything in the draw loop because we are only drawing once
}

void mapSomething() {
  float thing; //we declare a variable to use in our mapping - must be a float because we do not get straight integers back from our mapping
  for (int i = 0; i<x.length; i++) {
    thing = map(x[i], 5, 20, 10, width-10); //i go fro 10 to width-10 in order to have some margins
    println(thing);
    ellipse(thing, height/2, 10, 10);

    //next we are going to send the variable we made inside this function - the variable called thing -
    // down to another function, to be used again
    //this is not necessary, just to demonstrate the idea of passing variables
    mapSomethingElse(thing); //send thing to another function, called mapSomethingElse
  }
}

void mapSomethingElse(float thing) { //here I receive the variable thing, and "cast" it as a float - this function needs to know what type of variable is coming in
  rect(thing, height/4, 10, 10);
}

