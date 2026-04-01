// --- COLORS --- 
color thistle = #CBC0D3;
color white   = #F7F7FF;
color sky   = #AFC9D8;
color steel = #89A9B8;
color slate = #647A88;
color black   = #22223b;

// --- VARIABLES FOR SELECTED COLOR ---
color selectedColor;

// --- SET UP ---
void setup() {
  size(700, 800);
  strokeWeight(5);
  stroke(white);
  selectedColor = white;
}

void draw() {
  background(black);

  // --- SKY BUTTON ---
  if (dist(250, 720, mouseX, mouseY) < 30) {
    stroke(white);
  } else {
    stroke(thistle);
  }
  fill(sky);
  circle(250, 720, 60);

  // --- STEEL BUTTON ---
  if (dist(350, 720, mouseX, mouseY) < 30) {
    stroke(white);
  } else {
    stroke(thistle);
  }
  fill(steel);
  circle(350, 720, 60);

  // --- SLATE BUTTON ---
  if (dist(450, 720, mouseX, mouseY) < 30) {
    stroke(white);
  } else {
    stroke(thistle);
  }
  fill(slate);
  circle(450, 720, 60);

  // --- INDICATOR CANVAS ---
  stroke(thistle);
  fill(selectedColor);
  square(100, 50, 500);
}

void mouseReleased() {
  // --- SKY ---
  if (dist (250, 720, mouseX, mouseY) < 50) {
    selectedColor = sky;
  }
  /// --- STEEL ---
  if (dist (350, 720, mouseX, mouseY) < 50) {
    selectedColor = steel;
  }
    /// --- SLATE ---
  if (dist (450, 720, mouseX, mouseY) < 50) {
    selectedColor = slate;
  }
}
