
import java.util.*;
import java.text.*;

SimpleDateFormat sdf;
SimpleDateFormat format;
SimpleDateFormat hours_of_date;
SimpleDateFormat minutes_of_date;
SimpleDateFormat day_of_date;
SimpleDateFormat smallformat;
SimpleDateFormat month_date;
SimpleDateFormat year_date;

String pieces;

Entry[] entries;

int numincsv = 4984;

int numCircles = 14;
int[] entryCount = new int [numCircles];

long[]diffArray = new long[numincsv];
int radiv = 6;
int marginl = radiv*30; //FOR 0TH CIRCLE //not 40
int margint=radiv*18;
int thiswidth= 1200; //(1440 x 900)
int thisheight = 800; //1920 x 1080
float yspace=thisheight/5.1;
float xspace = thiswidth/8; //not 7.5
Date[]timeArray = new Date[numincsv];


int radius;
float hoursRadius;

void setup() {
  background(255);
  size(thiswidth, thisheight);
  sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm");
  hours_of_date = new SimpleDateFormat("HH");
  minutes_of_date= new SimpleDateFormat("mm");
  day_of_date = new SimpleDateFormat ("dd");
  format = new SimpleDateFormat("MM/dd/yyyy");
  month_date = new SimpleDateFormat("MM");
  year_date = new SimpleDateFormat("yyyy");
  smallformat = new SimpleDateFormat("MM/dd/yyyy");
  entries = new Entry[numincsv];
  String[] dates = loadStrings ("swipe.csv");
  parse(dates);
}

void parse(String[]dates) {
  println(dates.length);
  for (int i = 1; i<entries.length; i++) {
    String[] pieces = splitLine(dates[i]);
    println(pieces);
    if (pieces.length>0) {
      try {
        Entry entry = new Entry();
        //get date, parse and send to entries object
        String dateString = pieces[0];
  println(dateString);
        entry.timeStamp = sdf.parse(dateString);
        timeArray[i] = format.parse(dateString);

        diffArray[i] = (timeArray[i].getTime()-timeArray[1].getTime())/(1000 * 60 * 60 * 24);
        //        diffinArray[i] = (timeArray[i].getTime())/(1000 * 60 * 60 * 24);
        entryCount[(int) diffArray[i]]++;

        entry.hours = int (hours_of_date.format(entry.timeStamp));
        entry.minutes = int(minutes_of_date.format(entry.timeStamp));

        entry.dayis = int (day_of_date.format(entry.timeStamp));
        entry.monthis = int (month_date.format(entry.timeStamp));
        entry.yearis = int(year_date.format(entry.timeStamp));

        entries[i]=entry;
      }

      catch(Exception e) {
        println("error parsing this: " + pieces[0]);
      }
    }
  }
}

void draw() {
  background(255);
  for (int i = 1; i< entries.length; i++) {
    if (entries[i] != null) {
      entries[i].update();
      entries[i].render();
    }
  }  
  show();
}

void show() {
  for (int i = 1; i< entries.length; i++) {
    if (entries[i] != null) {
      float turnBy = map (entries[i].hours+norm(entries[i].minutes, 0, 60), 0, 24, 0, TWO_PI)-HALF_PI; //hours+norm(entries[i].minutes, 0, 60)
      entries[i].hourly = turnBy;

      for (int z=0; z<entryCount.length; z++) {
        if (diffArray[i]==z) {
          radius = entryCount[z];
          hoursRadius = radius/radiv;
        }
      }

      entries[i].tpos.x = hoursRadius;
      entries[i].cx = (marginl+(diffArray[i]%7)*xspace); 
      entries[i].cy = margint+(floor(diffArray[i]/7)*yspace);

      float lineLength = 30;
      entries[i].tposi.y =0;      
      hoursRadius = radius; //* 0.50; for any floaties
      entries[i].tpos.y = 0;//cy;//height/2; //cy + sin(hourly)*hoursRadius;
      entries[i].tposi.x =entries[i].tpos.x+lineLength;
    }
  }
}

String[] splitLine(String line) {

  char[] c = line.toCharArray();
  ArrayList pieces = new ArrayList();
  int prev = 0;
  boolean insideQuote = false;
  for (int i = 0; i<c.length; i++) {
    if (c[i]== ',') {
      if (!insideQuote) {
        String s = new String (c, prev, i-prev).trim();
        pieces.add(s);
        prev = i+1;
      }
    } 
    else if (c[i] == '\"') {
      insideQuote = !insideQuote;
    }
  }
  if (prev != c.length) {
    String s = new String(c, prev, c.length-prev).trim();
    pieces.add(s);
  }

  String[] outgoing = new String[pieces.size()];

  pieces.toArray(outgoing);
  return outgoing;
}

