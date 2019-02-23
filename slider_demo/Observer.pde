interface Observable {
  void addObserver(Observer observer);
  
  void notifyOf(float percentage, int waarde);
}

class ConcreteObservable implements Observable {
  private ArrayList<Observer> observers = new ArrayList<Observer>();
  
  void addObserver(Observer observer) {
    this.observers.add(observer);
  }
  
  void notifyOf(float percentage, int waarde) {
    for (Observer observer : observers) {
      observer.notify(percentage, waarde);
    }
  }
}

interface Observer {
  void notify(float percentage, int waarde);
}
