class Slider implements Observer {
  private SliderConfiguratie configuratie = new DefaultSliderConfiguratie();
  private Controller controller;
  private int x;
  private int y;
  private int breedte;
  private boolean volgMuis;
  private float percentage;
  private int waarde;
  
  Slider(Controller controller, int x, int y, int breedte) {
    this.controller = controller;
    this.x = x;
    this.y = y;
    this.breedte = breedte;
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
    rect(x, y, breedte, configuratie.hoogte);
  }
  
  void drawKnop(){
    float afstand = percentage * breedte;
    fill(255, 0, 255);
    rect(knopX(afstand), y, configuratie.knopBreedte, configuratie.hoogte);
  }
  
  void drawWaarde() {
    fill(250);
    text(waarde, x, y);
  }
  
  float knopX(float afstand) {
    return x + afstand - configuratie.knopBreedte/2;
  }
  
  boolean isPressed(int muisX, int muisY) {
    float afstand = percentage * breedte;
    float knopX = this.knopX(afstand);
    return bevatIn(float(muisX), knopX, knopX + configuratie.knopBreedte) && bevatIn(float(muisY), y, y + configuratie.hoogte);
  }
  
  void beslisOmMuisTeVolgen(int muisX, int muisY) {
    if (gewichtSlider.isPressed(muisX, muisY)) { 
      gewichtSlider.startVolgenVanMuis(); 
    }
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
  
  void setConfiguratie(SliderConfiguratie configuratie) {
    this.configuratie = configuratie;
  }
}

boolean bevatIn(float waarde, float ondergrens, float bovengrens) {
  return ondergrens <= waarde && waarde <= bovengrens;
}

class SliderConfiguratie {
  public final int hoogte;
  public final int knopBreedte;
  
  SliderConfiguratie(int hoogte, int knopBreedte) {
    this.hoogte = hoogte;
    this.knopBreedte = knopBreedte;
  }
}

class DefaultSliderConfiguratie extends SliderConfiguratie {
  DefaultSliderConfiguratie() {
    super(30, 30);
  }
}
