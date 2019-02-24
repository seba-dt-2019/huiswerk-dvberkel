WaardeMetBereik gewicht = new WaardeMetBereik(80, 20, 300);
Slider gewichtSlider;

void setup(){
  size(500, 500);
  setupSliders();
}

void setupSliders() {
  setupGewichtSlider();
}

void setupGewichtSlider() {
  int sliderBreedte = 300;
  int sliderHoogte = 30;
  int x = (width - sliderBreedte)/2;
  int y = (height - sliderHoogte)/2;
  gewichtSlider = new Slider(gewicht, x, y, sliderBreedte, sliderHoogte, 30);
  gewicht.addObserver(gewichtSlider);
  gewicht.signal();
}

void draw() {
  background(0);
  drawSliders();
  update();
}

void drawSliders() {
  gewichtSlider.draw();
}

void mousePressed() {
  gewichtSlider.beslisOmMuisTeVolgen(mouseX, mouseY);
}

void mouseReleased() {
  gewichtSlider.stopVolgenVanMuis();
}

void update(){
  gewichtSlider.update(mouseX, mouseY);
}
