//int[] temperatures = new int [6];
//temperatures [0] = 43; //max temperature 2.3
//temperatures [1] = 35; //max temperarure 2.4
//temperatures [2] = 34; //max temperature 2.5
//temperatures [3] = 32; //max temperature 2.6
//temperatures [4] = 32; //max temperature 2.7
//temperatures [5] = 29; //max temperature 2.8
int[]temperatures ={43, 35, 34, 32, 32, 29};

//determine average temperature for the week

float min = 0;
float max = 0;
//Compute the average
float average = 0;


void setup(){
  size(300,300);
  background(255);
  smooth();
  noStroke();
 parse(); 
}

void parse(){
for (int i = 0; i < temperatures.length; ++i)
{
  min = min(temperatures);
  max = max(temperatures);
  average += temperatures[i];
}
average /=(float)(temperatures.length);
println(average);
println(min);  
println(max);
}

void draw(){
 for (int i = 0; i<temperatures.length; i++){
  float mapTemp = map (temperatures[i], min, max, 100, 255);
 fill(mapTemp, 0, 0);
 ellipse(40+i*40, height/2, 10,10);
 
   float mapAverage = map (average, min, max, 100, 255);
   fill(mapAverage, 0, 0);
   ellipse(width/2, height/2+80, 20,20);
 }
}
