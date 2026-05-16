// didn't have time to work today. tomorrow is 7 minutes away so i'll wait till then :>
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

boolean stampOn = false;
PImage currentStamp;


// slider position
int sliderX = 310;
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

  // --- SLIDER KNOB ---
  float knobX = sliderX + map(brushSize, 1, 40, 0, sliderW);
  circleButton(indicatorColor, knobX, sliderY, 25);

  // left bar
  fill(steel);
  rect(0, 100, 90, 850);

  int s = 30;
  int y = 130;
  int gap = 40;

  // palette buttons
  rectButton(red,    30, y, s, s);
  rectButton(orange, 30, y+gap, s, s);
  rectButton(yellow, 30, y+gap*2, s, s);
  rectButton(green,  30, y+gap*3, s, s);
  rectButton(blue,   30, y+gap*4, s, s);
  rectButton(purple, 30, y+gap*5, s, s);
  rectButton(black,  30, y+gap*6, s, s);
  rectButton(white,  30, y+gap*7, s, s);
  // --- TOP-LEFT BUTTONS ---
rectButton(white, 20, 35, 60, 30);   // NEW
rectButton(white, 100, 35, 60, 30);  // SAVE
rectButton(white, 180, 35, 60, 30);  // LOAD

fill(black);
textAlign(CENTER, CENTER);
textSize(14);

text("NEW", 20 + 30, 35 + 15);
text("SAVE", 100 + 30, 35 + 15);
text("LOAD", 180 + 30, 35 + 15);

  // color indicator
  stroke(thistle);
  strokeWeight(3);
  fill(indicatorColor);
  circle(750, 50, brushSize);

  // --- DRAWING ---
  if (mousePressed &&
      mouseX > 90 && mouseX < width &&
      mouseY > 100 && mouseY < height - 50) {

if (stampOn) {
  imageMode(CENTER);
  image(currentStamp, mouseX, mouseY, brushSize*3, brushSize*3);
} else {
  stroke(indicatorColor);
  strokeWeight(brushSize);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

  }

  // --- SLIDER DRAG LOGIC ---
  if (draggingSlider) {
    float newX = constrain(mouseX, sliderX, sliderX + sliderW);
    brushSize = map(newX - sliderX, 0, sliderW, 1, 40);
  }

  // --- STAMP BUTTONS ---
float stampY1 = y + gap*8 + 25;
float stampY2 = y + gap*9 + 40;

// highlight if nerdy is selected
if (stampOn && currentStamp == nerdy) {
  stroke(#5e2bff);   // bright purple highlight
  strokeWeight(5);
  noFill();
  circle(45, stampY1, 50);
}

// highlight if yipee is selected
if (stampOn && currentStamp == yipee) {
  stroke(#5e2bff);
  strokeWeight(5);
  noFill();
  circle(45, stampY2, 50);
}

// draw the actual stamp buttons
circleButton(225, 45, stampY1, 40);
circleButton(225, 45, stampY2, 40);

imageMode(CENTER);
image(nerdy, 45, stampY1, 30, 30);
image(yipee, 45, stampY2, 30, 30);
}

void mousePressed() {
  float knobX = sliderX + map(brushSize, 1, 40, 0, sliderW);
  if (dist(mouseX, mouseY, knobX, sliderY) < 20) {
    draggingSlider = true;
    return;
  }
}

void mouseReleased() {
  draggingSlider = false;

  int s = 30;
  int y = 130;
  int gap = 40;

// --- COLOR BUTTONS (also turn off stamp mode) ---
if (mouseX > 30 && mouseX < 30+s && mouseY > y && mouseY < y+s) {
  indicatorColor = red;
  stampOn = false;
  currentStamp = null;
}

if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap && mouseY < y+gap+s) {
  indicatorColor = orange;
  stampOn = false;
  currentStamp = null;
}

if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*2 && mouseY < y+gap*2+s) {
  indicatorColor = yellow;
  stampOn = false;
  currentStamp = null;
}

if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*3 && mouseY < y+gap*3+s) {
  indicatorColor = green;
  stampOn = false;
  currentStamp = null;
}

if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*4 && mouseY < y+gap*4+s) {
  indicatorColor = blue;
  stampOn = false;
  currentStamp = null;
}

if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*5 && mouseY < y+gap*5+s) {
  indicatorColor = purple;
  stampOn = false;
  currentStamp = null;
}

if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*6+10 && mouseY < y+gap*6+10+s) {
  indicatorColor = black;
  stampOn = false;
  currentStamp = null;
}

if (mouseX > 30 && mouseX < 30+s && mouseY > y+gap*7+10 && mouseY < y+gap*7+10+s) {
  indicatorColor = white;
  stampOn = false;
  currentStamp = null;
}

  // --- STAMP BUTTONS CLICK DETECTION ---
float stampY1 = y + gap*8 + 25;
float stampY2 = y + gap*9 + 40;

// nerdy stamp button
if (dist(mouseX, mouseY, 45, stampY1) < 20) {
  stampOn = true;
  currentStamp = nerdy;
}

// yipee stamp button
if (dist(mouseX, mouseY, 45, stampY2) < 20) {
  stampOn = true;
  currentStamp = yipee;
}

// --- NEW BUTTON PROCESS ---
if (mouseX > 20 && mouseX < 80 &&
    mouseY > 35 && mouseY < 65){
  noStroke();
  fill(white);
  rect(90, 100, width - 90, height - 150);
    }

// --- SAVE BUTTON PROCES---
if (mouseX > 100 && mouseX < 160 &&
    mouseY > 35 && mouseY < 65) {
  selectOutput("Choose a name for your image file:", "saveImage");
    }
}

  
  void saveImage(File f) {
 
  if (f != null) {
    // capture  drawing area
    PImage canvas = get(90, 100, width - 90, height - 150);
    canvas.save(f.getAbsolutePath());
  }
  }

// --- TACTILE BUTTON FUNCTIONS ---

void rectButton(color c, float x, float y, float w, float h) {

  boolean hover = (mouseX > x && mouseX < x + w &&
                   mouseY > y && mouseY < y + h);

  if (hover) {
    stroke(white);
    strokeWeight(4);
  } else {
    stroke(black);
    strokeWeight(2);
  }

  fill(c);
  rect(x, y, w, h);

  stroke(255, 80);
  strokeWeight(1.5);
  rect(x + 2, y + 2, w - 4, h - 4);
}

void circleButton(color c, float x, float y, float d) {

  boolean hover = dist(mouseX, mouseY, x, y) < d/2;

  if (hover) {
    stroke(white);
    strokeWeight(4);
  } else {
    stroke(black);
    strokeWeight(2);
  }

  fill(c);
  circle(x, y, d);

  stroke(255, 80);
  strokeWeight(1.5);
  circle(x, y, d - 4);
}
