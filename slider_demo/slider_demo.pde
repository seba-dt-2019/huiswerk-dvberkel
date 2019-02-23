WaardeMetBereik gewicht = new WaardeMetBereik(80, 20, 300);

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
  drawSlider(gewicht, x, y, sliderBreedte, sliderHoogte);
}

void drawSlider(WaardeMetBereik waarde, int x, int y, int breedte, int hoogte) {
  drawBalk(x, y, breedte, hoogte);
  drawKnop(waarde, x, y, breedte, hoogte);
  drawWaarde(waarde, x, y, breedte, hoogte);
}

void drawBalk(int x, int y, int breedte, int hoogte) {
  fill(255);
  rect(x, y, breedte, hoogte);
}

void drawKnop(WaardeMetBereik waarde, int x, int y, int breedte, int hoogte){
  float afstand = waarde.percentage() * breedte;
  float knopX = x + afstand - knopBreedte/2;
  fill(255, 0, 255);
  rect(knopX, y, knopBreedte, hoogte);
}

void drawWaarde(WaardeMetBereik waarde, int x, int y, int breedte, int hoogte) {
  fill(250);
  text(waarde.toString(), x, y);
}

void mousePressed() {
  if (gewichtKnopPressed()) { volgMuis = true; }
}

boolean gewichtKnopPressed() {
  return knopPressed(gewicht, minimumGewicht, maximumGewicht, x, y, sliderBreedte, sliderHoogte);
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

void mouseReleased() {
  volgMuis = false;
}

void update(){
  updateGewicht();
}

void updateGewicht() {
  if (volgMuis) {
    int afstand = constrain(mouseX, x, x + sliderBreedte);
    float percentage = float(afstand - x) / float(sliderBreedte);
    float delta = percentage * (maximumGewicht - minimumGewicht);
    gewicht = minimumGewicht + int(delta);
  }
}
