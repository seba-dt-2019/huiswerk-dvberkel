class Slider implements Observer {
  private Controller controller;
  private int x;
  private int y;
  private int breedte;
  private int hoogte;
  private int knopBreedte;
  private boolean volgMuis;
  private float percentage;
  private int waarde;
  
  Slider(Controller controller, int x, int y, int breedte, int hoogte, int knopBreedte) {
    this.controller = controller;
    this.x = x;
    this.y = y;
    this.breedte = breedte;
    this.hoogte = hoogte;
    this.knopBreedte = knopBreedte;
    this.volgMuis = false;
    this.percentage = 0.0;
    this.waarde = 0;
  }
  
  void draw() {
    drawBalk();
    drawKnop();
    drawWaarde();
  }
  
  void drawBalk() {
    fill(255);
    rect(x, y, breedte, hoogte);
  }
  
  void drawKnop(){
    float afstand = percentage * breedte;
    float knopX = x + afstand - knopBreedte/2;
    fill(255, 0, 255);
    rect(knopX, y, knopBreedte, hoogte);
  }
  
  void drawWaarde() {
    fill(250);
    text(waarde, x, y);
  }
  
  boolean isPressed(int muisX, int muisY) {
    float afstand = percentage * breedte;
    float knopX = x + afstand - knopBreedte/2;
    return bevatIn(float(muisX), knopX, knopX + knopBreedte) && bevatIn(float(muisY), y, y + hoogte);
  }
  
  void startVolgenVanMuis() {
    volgMuis = true;
  }
  
  void stopVolgenVanMuis() {
    volgMuis = false;
  }
  
  void update(int muisX, int muisY) {
    if (volgMuis) {
      int afstand = constrain(muisX, x, x + breedte);
      float percentage = float(afstand - x) / float(breedte);
      controller.setPercentage(percentage);
    }
  }
  
  void notify(float percentage, int waarde) {
    this.percentage = percentage;
    this.waarde = waarde;
  }
}

boolean bevatIn(float waarde, float ondergrens, float bovengrens) {
  return ondergrens <= waarde && waarde <= bovengrens;
}
