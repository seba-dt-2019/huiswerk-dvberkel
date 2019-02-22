int gewicht = 80;
int minimumGewicht = 0;
int maximumGewicht = 300;

int sliderBreedte = 300;
int sliderHoogte = 30;
int knopBreedte = 30;
int x;
int y;
boolean volgMuis = false;

void setup(){
  size(500, 500);
  x = (width - sliderBreedte)/2;
  y = (height - sliderHoogte)/2;
}

void draw() {
  background(0);
  drawSliders();
  update();
}

void drawSliders() {
  drawSlider(gewicht, minimumGewicht, maximumGewicht, x, y, sliderBreedte, sliderHoogte);
}

void drawSlider(int waarde, int minimum, int maximum, int x, int y, int breedte, int hoogte) {
  drawBalk(x, y, breedte, hoogte);
  drawKnop(waarde, minimum, maximum, x, y, breedte, hoogte);
  drawWaarde(waarde, minimum, maximum, x, y, breedte, hoogte);
}

void drawBalk(int x, int y, int breedte, int hoogte) {
  fill(255);
  rect(x, y, breedte, hoogte);
}

void drawKnop(int waarde, int minimum, int maximum, int x, int y, int breedte, int hoogte){
  float percentage = float(waarde - minimum) / float(maximum - minimum);
  float afstand = percentage * breedte;
  float knopX = x + afstand - knopBreedte/2;
  fill(255, 0, 255);
  rect(knopX, y, knopBreedte, hoogte);
}

void drawWaarde(int waarde, int minimum, int maximum, int x, int y, int breedte, int hoogte) {
  fill(250);
  text(waarde, x, y);
}

void mousePressed() {
  if (gewichtKnopPressed()) { volgMuis = true; }
}

boolean gewichtKnopPressed() {
  return knopPressed(gewicht, minimumGewicht, maximumGewicht, x, y, sliderBreedte, sliderHoogte);
}

void update(){
}

void mouseReleased() {
  volgMuis = false;
}

boolean knopPressed(int waarde, int minimum, int maximum, int x, int y, int breedte, int hoogte) {
  float percentage = float(waarde - minimum) / float(maximum - minimum);
  float afstand = percentage * breedte;
  float knopX = x + afstand - knopBreedte/2;
  return bevatIn(float(mouseX), knopX, knopX + knopBreedte) && bevatIn(float(mouseY), y, y + hoogte);
}

boolean bevatIn(float waarde, float ondergrens, float bovengrens) {
  return ondergrens <= waarde && waarde <= bovengrens;
}
