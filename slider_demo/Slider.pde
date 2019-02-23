class Slider {
  private int x;
  private int y;
  private int breedte;
  private int hoogte;
  private int knopBreedte;
  private boolean volgMuis;
  
  Slider(int x, int y, int breedte, int hoogte, int knopBreedte) {
    this.x = x;
    this.y = y;
    this.breedte = breedte;
    this.hoogte = hoogte;
    this.knopBreedte = knopBreedte;
    this.volgMuis = false;
  }
  
  void draw(WaardeMetBereik waarde) {
    drawBalk();
    drawKnop(waarde);
    drawWaarde(waarde, x, y, breedte, hoogte);
  }
  
  void drawBalk() {
    fill(255);
    rect(x, y, breedte, hoogte);
  }
  
  void drawKnop(WaardeMetBereik waarde){
    float afstand = waarde.percentage() * breedte;
    float knopX = x + afstand - knopBreedte/2;
    fill(255, 0, 255);
    rect(knopX, y, knopBreedte, hoogte);
  }
  
  void drawWaarde(WaardeMetBereik waarde) {
    fill(250);
    text(waarde.toString(), x, y);
  }
  
  boolean isPressed(WaardeMetBereik waarde, int muisX, int muisY) {
    float afstand = waarde.percentage() * breedte;
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
      gewicht.setPercentage(percentage);
    }
  }
}

boolean bevatIn(float waarde, float ondergrens, float bovengrens) {
  return ondergrens <= waarde && waarde <= bovengrens;
}
