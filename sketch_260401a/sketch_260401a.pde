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

  // --- SKY BUTTON ---
  if (mouseX > centerX - 110 && mouseX < centerX - 110 + btnSize && mouseY > btnY && mouseY < btnY + btnSize) {
    stroke(white);
  } else {
    stroke(thistle);
  }
  fill(sky);  
  square(centerX - 110, btnY, btnSize);

  // --- STEEL BUTTON ---
  if (mouseX > centerX - 30 && mouseX < centerX - 30 + btnSize && mouseY > btnY && mouseY < btnY + btnSize) {
    stroke(white);
  } else {
    stroke(thistle);
  }
  fill(steel);
  square(centerX - 30, btnY, btnSize);

  // --- SLATE BUTTON ---
  if (mouseX > centerX + 50 && mouseX < centerX + 50 + btnSize && mouseY > btnY && mouseY < btnY + btnSize) {
    stroke(white);
  } else {
    stroke(thistle);
  }
  fill(slate);
  square(centerX + 50, btnY, btnSize);  

  // --- INDICATOR CANVAS ---
  stroke(thistle);
  fill(selectedColor);
  square(100, 50, 500);
}

void mouseReleased() { 

  // SKY
  if (mouseX > centerX - 110 && mouseX < centerX - 110 + btnSize && mouseY > btnY && mouseY < btnY + btnSize) {
    selectedColor = sky;
  }

  // STEEL
  if (mouseX > centerX - 30 && mouseX < centerX - 30 + btnSize && mouseY > btnY && mouseY < btnY + btnSize) {
    selectedColor = steel;
  }   

  // SLATE
  if (mouseX > centerX + 50 && mouseX < centerX + 50 + btnSize && mouseY > btnY && mouseY < btnY + btnSize) {
    selectedColor = slate;
  }
}
