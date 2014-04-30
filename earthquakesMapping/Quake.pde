// A Quake class

class Quake {

  float lat;
  float lon;

  float hourly;

  PVector pos = new PVector(); //the famous PVector
  PVector tpos = new PVector(); //the amazingness of PVectors: we can define a target

  // Create  the Tweet
  Quake(float thisLat, float thisLon) { //receiving the data
    lat = thisLat; //filling up our empty variable with the received lat/lon
    lon = thisLon;
  }

  void update() {
//    println(lat+"in quake");

    pos.x = lerp(pos.x, tpos.x, .1); //magical lerping function - goes from the initial pos (0) to tpos
    pos.y = lerp(pos.y, tpos.y, .1); //magical lerping from 0 to target
    float thisLat; //this number gets updated if we pass a new number to it
    float thisLon;
  }

  void render() {
    pushMatrix();
    ellipse(pos.x, pos.y, 5, 5);
    popMatrix();
  }
}

