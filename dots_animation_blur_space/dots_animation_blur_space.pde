import spacebrew.*;

String server="sandbox.spacebrew.cc";
String name="kate";
String description ="capacitance, sound, color";

float bbycircle;
float bbycircle2;
float radius;
float blue;
boolean saveMe = false;

Spacebrew sb;

void setup() {
 size(1000, 600);
 background(255);
 
 sb = new Spacebrew( this );
 
        //sb.addSubscribe( "buttonPress", "boolean" );
        //sb.addSubscribe( "mouseMove", "boolean" );
        sb.addSubscribe("x", "range");
        sb.addSubscribe("y", "range");
        sb.addSubscribe("vol", "range");
        
        sb.connect(server, name, description );
}

void draw() {
  
  if (keyPressed && key == 's') {
    saveFrame("frame-######.png");
    saveMe = false;
  }
  
 noStroke();
 fill(blue,random(175, 225),255-blue);
 filter(BLUR, 1);
 ellipse(bbycircle,bbycircle2,radius,radius);
 
 float bl1 = map(incomingx, 49, 57, 0, 255);
 blue = bl1;
 bbycircle = random(width);
 bbycircle2 = random(height);
 
 float iny = map(incomingy, 0, 1023, 0, 50);
 radius = iny + (volume/5);
}

int incomingx = 0;
int incomingy = 0;
int volume = 0;

void mousePressed() {
  setup();
}

void onRangeMessage( String name, int value ){
  println("got range message " + name + " : " + value);

          if (name.equals("x")) {
            incomingx = value;
          }
          
          else if (name.equals("y")) {
            incomingy = value;
          }
          
          else if (name.equals("vol")) {
            volume = value;
          }
}
