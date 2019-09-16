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
int sizex = 24;
int sizey = 21;

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
}
 
void draw() {
  
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
