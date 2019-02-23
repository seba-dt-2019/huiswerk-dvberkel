WaardeMetBereik gewicht = new WaardeMetBereik(80, 20, 300);
Slider gewichtSlider;

void setup(){
  size(500, 500);
  int sliderBreedte = 300;
  int sliderHoogte = 30;
  int x = (width - sliderBreedte)/2;
  int y = (height - sliderHoogte)/2;
  gewichtSlider = new Slider(x, y, sliderBreedte, sliderHoogte, 30);
}

void draw() {
  background(0);
  drawSliders();
  update();
}

void drawSliders() {
  gewichtSlider.draw(gewicht);
}

void mousePressed() {
  if (gewichtSlider.isPressed(gewicht, mouseX, mouseY)) { gewichtSlider.startVolgenVanMuis(); }
}

void mouseReleased() {
  gewichtSlider.stopVolgenVanMuis();
}

void update(){
  gewichtSlider.update(gewicht, mouseX, mouseY);
}
