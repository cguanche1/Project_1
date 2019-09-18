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

//Sets velocity contants
static float max_vmax = 20;
static float min_vmin = 5;

//integers to control the screen's state and wipe it every so often.
int step = 0;
static int numSteps = 3750;
int wash = 0;

//Number of machines active
static int max_active_machines = 15;
int num_active_machines = 0;
Machine machines[] = new Machine[max_active_machines];
int active_machine = 0;

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
  //fill(100,100,100);
  //rect(ledge,tedge,redge,bedge);
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
  
  
  machines[0] = new Machine();
  machines[0].x = ledge;
  machines[0].y = tedge;
  machines[0].o = -45.0;
  machines[0].signr = -1;
  machines[0].signg = -1;
  machines[0].signb = -1;
  machines[0].prefr = 0.5;
  machines[0].prefg = 0.5;
  machines[0].prefb = 0.5;
  machines[0].r = redge-ledge;
  machines[0].i = redge-ledge;
  
  for(int i = 1; i < max_active_machines; i ++){
     machines[i] = new Machine(); 
  }
  colorMode(RGB);
}
 
void draw() {
    //fill(50,50,50);
    //rect(ledge,tedge,redge,bedge);
    if(step < numSteps){ 
      if(active_machine >= num_active_machines){
         active_machine = 0; 
      }
    
      Machine m = machines[active_machine];
    
    //int xorig = m.x;
    //int yorig = m.y;
      m.stain();
      m.move();
    //stroke(255,255,255);
    //line(xorig,yorig,m.x,m.y);
      active_machine++;
    //delay(5000);
      step++;
    }
    if(step == numSteps && wash < bedge){
       stroke(0,0,0);
       line(ledge,wash,redge,wash);
       wash++;
    }
    if(step == numSteps && wash == bedge){
       step = 0;
       wash = tedge;
       for(int i = 0; i < num_active_machines; i++){
           machines[i].prefr = random(0.0001,0.50);
           machines[i].prefg = random(0.0001,0.50);
           machines[i].prefb = random(0.0001,0.50); 
       }
    }
}

void keyPressed() {
  if (key == CODED) {
  }
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
    show();
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
 float signr, signg, signb; // determines whether preference is positive or negative
 int assocPanel; //panel associated with this machine's mood
 int crossed; //boolean that determines whether the machine's wires are crossed or not
 
 Machine(){
   x = int(random(ledge,redge));
   y = int(random(tedge,bedge));
   r = int(random(0,(redge-ledge)/2));
   i = int(random(0,50));
   o = random(-180,180);
   vmax = random((max_vmax + min_vmin)/2,max_vmax);
   vmin = random(min_vmin,(max_vmax+ min_vmin)/2);
   prefr = random(0.0001,0.50);
   prefg = random(0.0001,0.50);
   prefb = random(0.0001,0.50);
   
   signr = random(-1,1);
   if(signr < 0){
      signr = -1; 
   }
   else{
     signr = 1;
   }
   
   signg = random(-1,1);
   if(signg < 0){
      signg = -1; 
   }
   else{
       signg = 1;
   }
   
   signb = random(-1,1);
   if(signb < 0){
      signb = -1; 
   }
   else{
       signb = 1;
   }
   
   assocPanel = num_active_machines;
   num_active_machines++;
   crossed = int(random(0,2));
   if(crossed == 1){crossed = 2;}
   
   print("Machine " + assocPanel + " has an i of " + i +" and an r of " + r + "\n");
   //delay(3000);
   
 }
 
 int getX(float mag, float ang){
    int changeX = ceil(mag * cos(ang));
    
    int newX = x + changeX;
    if(newX > redge){
      newX = newX - (redge - ledge);
    }
    else if(newX < ledge){
      newX = newX + (redge - ledge);
    }
    
    
    return newX;
    
 }
 
 int getY(float mag, float ang){
    int changeY = ceil(mag*sin(ang));
    
    int newY = y + changeY;
    if(newY > bedge){
      newY = newY - (bedge-tedge);
    }
    else if(newY < tedge){
      newY = newY + (bedge - tedge);
    }
    
    return newY;
 }
 
 void stain(){
   //print("Staining machine " +assocPanel+" right now!\n");
   //print("Machine " + assocPanel + " has i = " + i + "\n");
    for(int c = 0; c < i; c++){
       //float angleStep = ((i - c)/(i * 8)) * 180;
       for(float ang = -180; ang <= 180; ang += 5){
          int ptx = getX(ang,c);
         
          int pty = getY(ang,c);
          
          //print("ang: "+ang +" y: " + y + " pty: "+ pty+ "\n");
          color old = get(ptx,pty);
          float ptr = red(old);
          float ptg = green(old);
          float ptb = blue(old);
          
          //print("old red: " + ptr);
          ptr = ptr + (signr * prefr *prefr* 255 * ((i-c)/i));
          if(ptr < 0){
              ptr = 0;
              signr = -1 * signr;
          }
          else if(ptr > 255){
              ptr = 255;
              signr = -1 * signr;
          }
          //print(" new red: " + ptr +"\n old green: " + ptg);
          ptg += signg * prefg *prefg* 255 * ((i-c)/i);
          if(ptg < 0){
              ptg = 0;
              signg = -1 * signg;
          }
          else if(ptg > 255){
              ptg = 255;
              signg = -1* signg;
          }
          //print(" new green: " + ptg + "\n old blue: " + ptb);
          ptb += signb * prefb *prefb * 255 * ((i-c)/i);
          if(ptb < 0){
              ptb = 0;
              signb = -1 * signb;
          }
          else if(ptb > 255){
              ptb = 255;
              signb = -1 * signb;
          }
          //print(" new blue: " + ptb + "\n");
          
          set(ptx,pty,color(ptr,ptg,ptb));
          
       }
    }
    //print("new color has been set for " + assocPanel +"\n");
 }
 
 void move(){  
     //print("machine " + assocPanel + " is moving!\n");
     float lang = o + 90;
     if(lang > 180){
        lang = lang - 360; 
     }
     
     float rang = 0 - 90;
     if(rang < -180){
        rang = rang + 360; 
     }
     
     int lx = getX(r, lang);
     int ly = getY(r, lang);
     
     //fill(255,255,255);
     //circle(lx,ly,5);
     
     int rx = getX(r, rang);
     int ry = getY(r, rang);
     //circle(rx,ry,5);
     
     color lc = get(lx,ly);
     color rc = get(rx,ry);
     
     float lr = red(lc);
     float lg = green(lc);
     float lb = blue(lc);
     
     float rr = red(rc);
     float rg = green(rc);
     float rb = blue(rc);
     
     color mid = lerpColor(lc, rc, 0.5);
     
     float rmid = red(mid);
     float gmid = green(mid);
     float bmid = blue(mid);
     
     panels[assocPanel].colourMe(int(rmid),int(gmid),int(bmid));
     
     prefr = ((rmid % 5)/255) * signr + prefr;
     if(prefr >= 1){
       prefr = 1;
       signr = -1*signr;
     }
     else if(prefr <= 0){
      prefr = 0.0001;
      signr = -1* signr;
     }
     prefg = ((gmid % 5)/255) * signg + prefg;
     if(prefg >= 1){
       prefg = 1;
       signg = -1*signg;
     }
     else if(prefg <= 0){
      prefg = 0.0001;
      signg = -1* signg;
     }
     prefb = ((bmid % 5)/255) * signb + prefb;
     if(prefb >= 1){
       prefb = 1;
       signb = -1*signb;
     }
     else if(prefb <= 0){
      prefb = 0.0001;
      signb = -1* signb;
     }
     
     float scale = vmax/255;
     
     float lv = scale * (lr*prefr + lg * prefg + lb * prefb);
     //print("scale: " + scale + " lr: " +lr+ " prefr: " + prefr + " lg: " + lg +" prefg: " + prefg + " lb: " + lb + " prefb: " + prefb + "\n");
     if(lv < vmin){
      lv = vmin; 
     }
     float rv = scale * (rr * prefr + rg * prefg + rb * prefb);
     if(rv < vmin){
       rv = vmin; 
     }
     

     if(crossed > 1){
        float temp = rv;
        rv = lv;
        lv = temp;
     }
     
     float oChange = (lv - rv) * (180/vmax);
     float oNew = o + oChange;
     if(oNew > 180){
       oNew = oNew - 360;
     }
     else if(oNew < -180){
        oNew = oNew + 360; 
     }
     
     float avgO = (o + oNew)/2;

     x = getX(lv+rv, avgO);
     
     y = getY(lv+rv,avgO);
     o = oNew;
     
 }
  
}
