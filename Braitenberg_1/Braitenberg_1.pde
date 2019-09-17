/*
Based on the work of Valentino Braitenberg, this visual should represent
a number of very simple machines exuding different colors based on their
"moods" and "intentions," with red corresponding to aggression, yellow
corresponding to fear, blue corresponding to love, and green corresponding
to "explorative instinct"

The main display in the Becton Café will show the "devices" themselves moving
around, and the panels outside should change according to their interactions
with one another. Each device (or pair of devices) will have an associated panel

Credit to Joe Swensen for his work on the initial Panel UI as seen in walltest_3
in https://github.com/cguanche1/Project1

Credit to Yuki de Pourbaix and Julia Shi for their work in helping determine the
borders of the main screens and the hall panels, seen in the github repository
listed above.
*/


// width and height of the hall panels in 1024x768 Resolution
static int sizex = 24;
static int sizey = 21;

//width and height limits of main panels:
static int ledge = 676;
static int redge = 1023;
static int tedge = 0;
static int bedge = 767;

//Number of machines active
static int max_active_machines = 15;
int num_active_machines = 0;
Machine machines[] = new Machine[max_active_machines];

//Array of hall panels
Panel panels[] = new Panel[15];

/*
  Instantiating each panel with its corresponding x and y coords, also in 
  1024x768 Resolution
  Color each panel in a gradient as they are activated
*/
void setup() {
  fullScreen(2);
  background(0, 0, 0);
  noStroke();
  
  panels[0] = new Panel(578, 660);
  panels[1] = new Panel(521, 590);
  panels[2] = new Panel(498, 570);
  panels[3] = new Panel(472, 680);
  panels[4] = new Panel(444, 590);
  panels[5] = new Panel(420, 611);
  panels[6] = new Panel(396, 611);
  panels[7] = new Panel(362, 570);
  
  panels[8] = new Panel(306, 570);
  panels[9] = new Panel(283, 590);
  panels[10] = new Panel(183, 592);
  panels[11] = new Panel(125, 612);
  
  panels[12] = new Panel(88, 592);
  panels[13] = new Panel(64, 612);
  panels[14] = new Panel(0, 573);
  
  for (int i = 0; i < 15; i++) {
    panels[i].colourMe(255 / (i + 1), i * (255 / 15), i * i);
    panels[i].show();
  }
  
  for(int i = 0; i < max_active_machines; i ++){
     machines[i] = new Machine(); 
  }
}
 
void draw() {
    for(int i = 0; i < num_active_machines; i++){
        
    }
}

void keyPressed() {
  if (key == CODED) {
  }
}

class Device {
 int x, y;
 int r, g, b;
 int panel;
 
  
}




class Panel {
  int x, y;
  int r, g, b;
  Panel(int setx, int sety) {
    x = setx;
    y = sety;
  }
  
  Panel(int setx, int sety, int setr, int setg, int setb) {
    x = setx;
    y = sety;
    r = setr;
    g = setg;
    b = setb;
  }
  
  void colourMe(int setr, int setg, int setb) {
    r = setr;
    g = setg;
    b = setb;
  }
  
  void show() {
    fill(r, g, b);
    rect(x, y, sizex, sizey);
  }
  
  void hide() {
    fill(0,  0, 0);
    rect(x, y, sizex, sizey);
  }
}

class Machine{
 int x,y,i,r; // x,y position, intensity of color radius, radius of sensors
 float o; // -180 < o <= 180, angle measured from horizontal right of machine
 float vmax,vmin; //maximum and minimum velocity, respectively
 float prefr, prefg, prefb; // "preference" for each color base
 int assocPanel; //panel associated with this machine's mood
 int crossed; //boolean that determines whether the machine's wires are crossed or not
 Machine(){
   x = int(random(ledge,redge));
   y = int(random(tedge,bedge));
   r = int(random(0,((1/4) * redge-ledge)));
   i = int(random(0,((1/2) * redge-ledge)));
   o = random(-180,180);
   vmax = random(5,10);
   vmin = random(0,5);
   prefr = random(0.5);
   prefg = random(prefr,0.66);
   prefb = 1 - prefr - prefg;
   assocPanel = num_active_machines;
   num_active_machines++;
   crossed = int(random(0,2));
   if(crossed == 2){crossed = 1;}
 }
 
  
}
