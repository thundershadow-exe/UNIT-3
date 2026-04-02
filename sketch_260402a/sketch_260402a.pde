// --- COLORS --- 
color thistle = #CBC0D3;
color white   = #F7F7FF;
color sky     = #AFC9D8;
color steel   = #89A9B8;
color slate   = #647A88;
color black   = #22223B; 

// --- VARIABLES ---
color selectedColor;
int btnSize = 60;

int centerX;
int btnY;

void setup() {
  size(700, 800);
  strokeWeight(5);
  selectedColor = white;

  centerX = width / 2;
  btnY = height - 120;   
}

void draw() {
  background(black);

  drawButton(centerX - 110, btnY, sky);
  drawButton(centerX - 30,  btnY, steel);
  drawButton(centerX + 50,  btnY, slate);

  // --- INDICATOR CANVAS ---
  stroke(thistle);
  fill(selectedColor);
  square(100, 50, 500);
}

// --- BUTTON FUNCTION---
void drawButton(int x, int y, color c) {
  if (isHovering(x, y, btnSize)) {
    stroke(white);
  } else {
    stroke(thistle);
  }

  fill(c);
  square(x, y, btnSize);
}

// ---TACTILE ---
boolean isHovering(int x, int y, int size) {
  return mouseX > x && mouseX < x + size &&
         mouseY > y && mouseY < y + size;
}

void mouseReleased() {

  if (isHovering(centerX - 110, btnY, btnSize)) {
    selectedColor = sky;
  }

  if (isHovering(centerX - 30, btnY, btnSize)) {
    selectedColor = steel;
  }

  if (isHovering(centerX + 50, btnY, btnSize)) {
    selectedColor = slate;
  }
}
