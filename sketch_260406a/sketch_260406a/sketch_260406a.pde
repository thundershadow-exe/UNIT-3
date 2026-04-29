// --- STAMP IMAGES ---
PImage nerdy, yipee;

// --- UI COLORS --- 
color thistle = #CBC0D3;
color white   = #F7F7FF;
color sky     = #AFC9D8;
color steel   = #89A9B8;
color slate   = #647A88;
color black   = #22223B; 

// palette colors
color red     = #FFADAD;
color orange  = #FFD6A5;
color yellow  = #FDFFB6;
color green   = #CAFFBF;
color blue    = #A0C4FF;
color purple  = #BDB2FF; 

color indicatorColor = white;

float brushSize = 5;
boolean draggingSlider = false;

// slider position
int sliderX = 275;
int sliderY = 50;
int sliderW = 400;

void setup() {
  size(800, 850);
  background(white);
  nerdy = loadImage("nerdy stamp.png");
  yipee = loadImage("yipee stamp.png");
}

void draw() {

  // --- TOP ---
  strokeWeight(1);
  fill(black);
  rect(0, 0, 800, 100);

  // --- SLIDER BAR ---
  stroke(thistle);
  strokeWeight(4);
  line(sliderX, sliderY, sliderX + sliderW, sliderY);

  // --- SLIDER KNOB (tactile circle) ---
  float knobX = sliderX + map(brushSize, 1, 40, 0, sliderW);
  circleButton(indicatorColor, knobX, sliderY, 25);

  // left bar
  fill(steel);
  rect(0, 100, 90, 850);

  int s = 30;       // button size
  int y = 130;      // starting Y
  int gap = 40;     // spacing

  // palette buttons (square tactile)
  rectButton(red,    30, y, s, s);
  rectButton(orange, 30, y+gap, s, s);
  rectButton(yellow, 30, y+gap*2, s, s);
  rectButton(green,  30, y+gap*3, s, s);
  rectButton(blue,   30, y+gap*4, s, s);
  rectButton(purple, 30, y+gap*5, s, s);
  rectButton(black,  30, y+gap*6+10, s, s);
  rectButton(white,  30, y+gap*7+10, s, s);

  // color indicator
  stroke(thistle);
  strokeWeight(3);
  fill(indicatorColor);
  circle(750, 50, brushSize);

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
  if (mouseX > 30 && mouseX < 30+s && mouseY > y && mouseY < y+s) indicatorColor = red;

  // ORANGE
  if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap && mouseY < y+gap+s) indicatorColor = orange;

  // YELLOW
  if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*2 && mouseY < y+gap*2+s) indicatorColor = yellow;

  // GREEN
  if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*3 && mouseY < y+gap*3+s) indicatorColor = green;

  // BLUE
  if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*4 && mouseY < y+gap*4+s) indicatorColor = blue;

  // PURPLE
  if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*5 && mouseY < y+gap*5+s) indicatorColor = purple;

  // BLACK
  if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*6+10 && mouseY < y+gap*6+10+s) indicatorColor = black;

  // WHITE
  if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*7+10 && mouseY < y+gap*7+10+s) indicatorColor = white;
}

// stamp buttons
circleButton(white, 45, y + gap*8 + 40, 40);   // nerdy stamp button
circleButton(white, 45, y + gap*9 + 40, 40);   // yipee stamp button

// draw stamp previews inside the buttons
imageMode(CENTER);
image(nerdy, 45, y + gap*8 + 40, 30, 30);
image(yipee, 45, y + gap*9 + 40, 30, 30);


// ------------------------------------------------------------
// --- TACTILE BUTTON FUNCTIONS ---
// ------------------------------------------------------------

void rectButton(color c, float x, float y, float w, float h) {

  boolean hover = (mouseX > x && mouseX < x + w &&
                   mouseY > y && mouseY < y + h);

  // outer tactile frame
  if (hover) {
    stroke(white);
    strokeWeight(4);
  } else {
    stroke(black);
    strokeWeight(2);
  }

  fill(c);
  rect(x, y, w, h);

  // inner highlight
  stroke(255, 80);
  strokeWeight(1.5);
  rect(x + 2, y + 2, w - 4, h - 4);
}

void circleButton(color c, float x, float y, float d) {

  boolean hover = dist(mouseX, mouseY, x, y) < d/2;

  // outer tactile ring
  if (hover) {
    stroke(white);
    strokeWeight(4);
  } else {
    stroke(black);
    strokeWeight(2);
  }

  fill(c);
  circle(x, y, d);

  // inner highlight ring
  stroke(255, 80);
  strokeWeight(1.5);
  circle(x, y, d - 4);
}
