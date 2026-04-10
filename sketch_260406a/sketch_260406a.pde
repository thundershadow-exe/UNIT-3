// --- UI COLORS --- 
color thistle = #CBC0D3;
color white   = #F7F7FF;
color sky     = #AFC9D8;
color steel   = #89A9B8;
color slate   = #647A88;
color black   = #22223B; 

// pallete colors
color red     = #FFADAD;
color orange  = #FFD6A5;
color yellow  = #FDFFB6;
color green   = #CAFFBF;
color blue    = #A0C4FF;
color purple  = #BDB2FF; 

color indicatorColor = white;

void setup() {
  size(800, 850);
}

void draw() {
  background(white);

  // --- TOP---
  fill(black);
  rect(0, 0, 800, 100);

  // left bar
  fill(steel);
  rect(0, 100, 90, 850);

  int s = 30;       // button size
  int y = 130;        // starting Y
  int gap = 40;     // spacing

  // palette buttons
  drawButton(30, y, s, red);
  drawButton(30, y+gap, s, orange);
  drawButton(30, y+gap*2, s, yellow);
  drawButton(30, y+gap*3, s, green);
  drawButton(30, y+gap*4, s, blue);
  drawButton(30, y+gap*5, s, purple);
  drawButton(30, y+gap*6+10, s, 0);
  drawButton(30, y+gap*7+10, s, 225);

 // color  indicator
  stroke(thistle);
  strokeWeight(3);
  fill(indicatorColor);
  circle(750, 50, 40);

  //  canvas
  fill(white);
  rect(90, 100, width - 90, height - 150);
}

// --- BUTTON FUNCTION---
void drawButton(int x, int y, int size, color c) {

  // tactile hover detection 
  if (mouseX > x && mouseX < x + size &&
      mouseY > y && mouseY < y + size) {
    stroke(white);      // highlight stroke
    strokeWeight(4);      // thicker on hover
    indicatorColor = c;
  } else {
    stroke(black);  // default stroke
    strokeWeight(2);
  }

  fill(c);
  rect(x, y, size, size);
}
