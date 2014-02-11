//are we on the same page?
//on commenting

//what is this called?
//why is it defined as floats
float[] nums = {4,4,4,3,2.5,6,6,6,4.5,6,3,3,6,7,8,5,2.5};

//set up loop
void setup() {
  //size
  size(1280,720);
  background(0);
  
  stroke(255);
  //for loop
  //through the array of nums, from their start to finish
  for(int i = 0; i < nums.length; i++) {
    float n = nums[i];
    //so now what do you think n is?
    
    //the infamous mapping function
    float x = map(i, 0, nums.length, 100, width - 100);
    
    float h = map(n, 0, 10, 0, height);
    
    float d = map(sqrt(n), 0, sqrt(10), 0, 100);
//    line(x,height,x,height - h);
//    rect(x,height,10,-h);
    ellipse(x,height/2,d,d);
    
    //before we run this, sketch on a sheet of paper what you think it will look like
  }
  
}

void draw() {
  
}
