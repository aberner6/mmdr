//This week, you learned about setting up your sketches, drawing shapes, using color, as well as using variables to define you shapes and sketches.
//You've covered a lot of ground!
//We also started getting familiar with the concept of an array.
//An array is a way to store information.
//You could store information like this:
int a = 1;
int b = 2;
int c = 3;
int d = 23;
int e = 12;
//etc. etc.
//But when we are working with data, it is more efficient to store the variables in one array, 
//which we can go through all at once, and use each piece of data to inform how our shape will be drawn.
//For example, what if I wanted to say - draw rectangles that show the number of high school graduates, per high school in NYC, this year.
//I could make a variable per high school
int highschool1 = 200;
int highschool2 = 300;
int highschool3 = 50;

//What if I really had all the high schools in the city, though?
//I wouldn't want to put each school in a separate variable
//an array CALLED schoolsDATA, CONTAINING INTEGERS, 
int[] schoolsData = { 200, 300, 50};  // each integer is a number of graduates for a given school

void setup(){
 size(500,500); 
}
void draw(){
//and then draw rectangles with those:
rect(0, 20, highschool1, 20);
rect(0, 50, highschool2, 20);
rect(0, 80, highschool3, 20);

//or, much better, draw rectangles inside of a FOR LOOP that goes through the SCHOOLS array
for (int i = 0; i<schoolsData.length; i++){ //go through the whole ARRAY called schools data WITH THE INDEX I
//draw a line per piece of data
//, spaced out by multiplying the index,
// and the length of the line is the piece of data
 line(0, height/2+i*10, schoolsData[i], height/2+i*10); 
}
}
