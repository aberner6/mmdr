String[] colors = {
 "red", "orange", "yellow", "green", "blue", "purple"
};

int whatShows = parseInt (random(0, colors.length));
//int whatShows;
boolean n;



void setup() {
 size(600, 600);
 background(200);
 textAlign(CENTER);
 textSize(84);
}

void draw(){
//  if (n){
//    findNewColor();
  
if (whatShows == 0) {
 fill (255, 0, 0);
 text(colors[whatShows], width/2, height/2);
}

if (whatShows == 1) {
fill (255, 111, 0);
 text(colors[whatShows], width/2, height/2);
}

if (whatShows == 2) {
 fill (250, 255, 0);
 text(colors[whatShows], width/2, height/2);
}

if (whatShows == 3) {
 fill (71, 255, 0);
 text(colors[whatShows], width/2, height/2);
}

if (whatShows == 4) {
 fill (0, 146, 255);
 text(colors[whatShows], width/2, height/2);
}

if (whatShows == 5) {
 fill (139, 103, 203);
 text(colors[whatShows], width/2, height/2);
}
}
//}

//void findNewColor(){
// whatShows = parseInt (random(0, colors.length)); 
//}

//void keyPressed(){
// if (key=='n') n=!n; 
//}










//void setup() {
// size(600, 600);
// background(200);
// textAlign(CENTER);
// textSize(84);
// text(colors[whatShows], width/2, height/2);
//if (whatShows == 0) {
// fill (255, 0, 0);
//}
//
//if (whatShows == 1) {
//fill (255, 111, 0);
//}
//
//if (whatShows == 2) {
// fill (250, 255, 0);
//}
//
//if (whatShows == 3) {
// fill (71, 255, 0);
//}
//
//if (whatShows == 4) {
// fill (0, 146, 255);
//}
//
//if (whatShows == 5) {
// fill (139, 103, 203);
//}
//}
