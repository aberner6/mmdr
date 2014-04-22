import ddf.minim.* ;
import ddf.minim.signals.* ;
import ddf.minim.effects.* ;

Minim minim;
//AudioSample kick;
//AudioSample snare;
AudioSample lightcymbal;
AudioSample shells;

AudioSample PianoA3;
AudioSample PianoB3;
AudioSample PianoC3;
AudioSample PianoD3;
AudioSample PianoDb3;
AudioSample PianoE3;
AudioSample PianoEb3;
AudioSample PianoF3;
AudioSample PianoG3;
AudioSample PianoC4;

int[] weekHighs= {
  66, 64, 64, 71, 72, 65, 65
};
String[] rain= {
  "false", "false", "true", "false", "true", "true", "false",
};
int[] weekLows= {
  51, 46, 49, 56, 51, 50, 55
};

AudioSample[] notes;
AudioOutput au_out ;



void setup() {
  size(800, 400);
  smooth();
  background(255);

  minim = new Minim(this) ;
  au_out = minim.getLineOut() ;
  //  snare = minim.loadSample("SD.wav", 512);
  shells = minim.loadSample("shells.wav", 512);
 // lightcymbal = minim.loadSample("lightcymbal.wav", 512);

  PianoA3 = minim.loadSample("PianoA3.wav", 512);
  PianoB3 = minim.loadSample("PianoB3.wav", 512);
  PianoC3 = minim.loadSample("PianoC3.wav", 512);
  PianoD3 = minim.loadSample("PianoD3.wav", 512);
  PianoE3 = minim.loadSample("PianoE3.wav", 512);
  PianoF3 = minim.loadSample("PianoF3.wav", 512);
  PianoG3 = minim.loadSample("PianoG3.wav", 512);
  PianoC4 = minim.loadSample("PianoC4.wav", 512);

  notes=new AudioSample[8];

  notes[0]=PianoC3;
  notes[1]=PianoD3;
  notes[2]=PianoE3;
  notes[3]=PianoF3;
  notes[4]=PianoG3;
  notes[5]=PianoA3;
  notes[6]=PianoB3;
  notes[7]=PianoC4;

  fill(0);
  int spacingInterval=90;
  
  
  
  for (int i=0;i<weekHighs.length;i++) {
    text(weekHighs[i], 50+(spacingInterval*i), 50);
    text(rain[i], 50+(spacingInterval*i), 150);
  }
  
  

  for (int i=0;i<7;i++) {
    int mappedHigh = round(map(weekHighs[i], 64, 72, 0, 7));
    notes[mappedHigh].trigger(); 
    if (rain[i].equals("true")) {
      shells.trigger();
    }
    pause(1000);
  }
}


void draw() {
}


void pause(int mils) {
  int currentMils=millis();
  while (millis ()<currentMils+mils) {
  }
}

