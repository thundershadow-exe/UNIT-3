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

float brushSize = 5;
boolean draggingSlider = false;

// slider position (moved down)
int sliderX = 150;
int sliderY = 80;      // <-- moved down for RGB sliders later
int sliderW = 400;

void setup() {
  size(800, 850);
  background(white);
}

void draw() {
  

  // --- TOP---
strokeWeight(1);
 fill(black);
  rect(0, 0, 800, 100);

  // --- SLIDER BAR ---
  stroke(thistle);
  strokeWeight(4);
  line(sliderX, sliderY, sliderX + sliderW, sliderY);

  // --- SLIDER KNOB ---
  float knobX = sliderX + map(brushSize, 1, 40, 0, sliderW);
  fill(indicatorColor);
  stroke(white);
  strokeWeight(3);
  circle(knobX, sliderY, 25);

  // left bar
  fill(steel);
  rect(0, 100, 90, 850);

  int s = 30;       // button size
  int y = 130;      // starting Y
  int gap = 40;     // spacing

  // palette buttons
  drawButton(30, y, s, red);
  drawButton(30, y+gap, s, orange);
  drawButton(30, y+gap*2, s, yellow);
  drawButton(30, y+gap*3, s, green);
  drawButton(30, y+gap*4, s, blue);
  drawButton(30, y+gap*5, s, purple);
  drawButton(30, y+gap*6+10, s, black);
  drawButton(30, y+gap*7+10, s, white);

 // color  indicator
  stroke(thistle);
  strokeWeight(3);
  fill(indicatorColor);
  circle(750, 50, brushSize * 2);   // <-- indicator scales with brush size

  // --- DRAWING ---
  if (mousePressed &&
      mouseX > 90 && mouseX < width &&
      mouseY > 100 && mouseY < height - 50) {

    stroke(indicatorColor);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }

  // --- SLIDER DRAG LOGIC ---
  if (draggingSlider) {
    float newX = constrain(mouseX, sliderX, sliderX + sliderW);
    brushSize = map(newX - sliderX, 0, sliderW, 1, 40);
  }
}

// --- BUTTON FUNCTION---
void drawButton(int x, int y, int size, color c) {

  // tactile hover detection 
  if (mouseX > x && mouseX < x + size &&
      mouseY > y && mouseY < y + size) {
    stroke(white);
    strokeWeight(4);
  } else {
    stroke(black);
    strokeWeight(2);
  }

  fill(c);
  rect(x, y, size, size);
}

void mousePressed() {

  // check if slider knob is grabbed
  float knobX = sliderX + map(brushSize, 1, 40, 0, sliderW);

  if (dist(mouseX, mouseY, knobX, sliderY) < 20) {
    draggingSlider = true;
  }
}

void mouseReleased() {
  draggingSlider = false;

  int s = 30;
  int y = 130;
  int gap = 40;

  // RED
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y && mouseY < y + s) {
    indicatorColor = red;
  }

  // ORANGE
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y+gap && mouseY < y+gap + s) {
    indicatorColor = orange;
  }

  // YELLOW
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y+gap*2 && mouseY < y+gap*2 + s) {
    indicatorColor = yellow;
  }

  // GREEN
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y+gap*3 && mouseY < y+gap*3 + s) {
    indicatorColor = green;
  }

  // BLUE
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y+gap*4 && mouseY < y+gap*4 + s) {
    indicatorColor = blue;
  }

  // PURPLE
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y+gap*5 && mouseY < y+gap*5 + s) {
    indicatorColor = purple;
  }

  // BLACK
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y+gap*6+10 && mouseY < y+gap*6+10 + s) {
    indicatorColor = black;
  }

  // WHITE
  if (mouseX > 30 && mouseX < 30 + s &&
      mouseY > y+gap*7+10 && mouseY < y+gap*7+10 + s) {
    indicatorColor = white;
  }
}
