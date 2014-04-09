// An Array of Bubble objects
Tweet[] tweets;
// A Table object
Table table;
PFont font;
int fontSize = 14;
void setup() {
  size(640, 960);
  loadData();
  font = createFont("GeosansLight",14);
  textFont(font);
  fill(255);
}

void draw() {
  background(100);
  // Display all bubbles
  for (Tweet t : tweets) {
    t.update();
    t.render();
  }
}

void loadData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  table = loadTable("allresponses.csv", "header");
  
  // The size of the array of Tweet objects is determined by the total number of rows in the CSV
  tweets = new Tweet[table.getRowCount()]; 
  
  // You can access the CSV and iterate over all the rows in a table
  int rowCount = 0;
  for (TableRow row : table.rows()) {
    // You can access the fields via their column name (or index)
    //In this case I only have 1 column - "BrainTweets"
    String thisTweet = row.getString("BrainTweets");
    // Make a Tweet object out of the data read
    tweets[rowCount] = new Tweet(thisTweet); //make a new tweet object, send it the string of text loaded in n
    rowCount++;
  }
  println (table.getRowCount()+"this is the number of rows in the table");
}

void show(){
  for (int i = 1; i< tweets.length; i++) {
      float turnBy = map (i, 0, width/2, 0, TWO_PI)-HALF_PI; //mapping the index count - which row are we in - to an angle for rotation
      tweets[i].hourly = turnBy; //send this number to our tweet object

      tweets[i].tpos.x = 10; //send tweet object a target x position
      tweets[i].tpos.y = map (i, 0, tweets.length, 1, height*4);  //send tweet object a target y position
  }
}
void highlight() {
  for (int i = 1; i< tweets.length; i++) {
      if (tweets[i].thisTweet.contains("Fact")) { //evaluate if a tweet contains the word fact
        tweets[i].hourly = 0;  //if it does, change the rotation to zero
        tweets[i].tpos.x = 10; //change the x position to 10
        tweets[i].tpos.y = map (i, 0, tweets.length, 10, height*4) ; //make the y go up and down
      }
  }
}
void keyPressed() {
  if (key=='s') show(); //if you press h, it will run the function of show()
  if (key=='h') highlight(); //if you press s, it will run the function of highlight()
}
