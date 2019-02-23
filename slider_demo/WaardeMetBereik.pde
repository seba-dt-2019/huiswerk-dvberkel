class WaardeMetBereik extends ConcreteObservable implements Controller {
  private int waarde;
  private int minimum;
  private int maximum;
  
  WaardeMetBereik(int waarde, int minimum, int maximum) {
    this.waarde = waarde;
    this.minimum = minimum;
    this.maximum = maximum;
  }
  
  float percentage() {
    return float(waarde - minimum) / float(maximum - minimum);
  }
  
  void setPercentage(float percentage) {
    float delta = percentage * (maximum - minimum);
    waarde = minimum + int(delta);
    signal();
  }
  
  void signal() {
    notifyOf(percentage(), waarde);
  }
  
  String toString() {
    return "" + waarde;
  }
}
