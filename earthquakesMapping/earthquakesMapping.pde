Quake[] quakes;
// A Table object
Table table;
PFont font;
int fontSize = 14;

void setup() {
  size(300, 300);
  loadData();
}

void draw() {
  background(255);
  // Display all quakes
  for (Quake q : quakes) {
    q.update();
    q.render();
  }
}

void loadData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  table = loadTable("all_day.csv", "header");

  // The size of the array of Tweet objects is determined by the total number of rows in the CSV
  quakes = new Quake[table.getRowCount()]; 

  // You can access the CSV and iterate over all the rows in a table
  int rowCount = 0;
  for (TableRow row : table.rows()) {
    // You can access the fields via their column name (or index)
    float thisLat = row.getFloat("latitude");
    float thisLon = row.getFloat("longitude");
    println(thisLat+"thisLat");

    // Make a Quake object out of the data read
    quakes[rowCount] = new Quake(thisLat, thisLon); //make a new quake object, send it the string of text loaded in n

    rowCount++;
  }
  println (table.getRowCount()+"this is the number of rows in the table");
}

void show() {
  for (int i = 1; i< quakes.length; i++) {
    quakes[i].tpos.y = 10+quakes[i].lat; //send tweet object a target x position
    quakes[i].tpos.x = 10+quakes[i].lon*-1; //send tweet object a target x position
    println (quakes[i].tpos.y +"quakes[i].lon");
  }
}

void keyPressed() {
  if (key=='h') { 
    show();
  }
}

