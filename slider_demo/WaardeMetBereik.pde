class WaardeMetBereik {
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
  
  String toString() {
    return "" + waarde;
  }
}
