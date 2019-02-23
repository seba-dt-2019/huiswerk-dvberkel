interface Observable {
  void add(Observer observer);
  
  void notifyOf(float percentage);
}

class ConcreteObservable implements Observable {
  private ArrayList<Observer> observers = new ArrayList<Observer>();
  
  void add(Observer observer) {
    this.observers.add(observer);
  }
  
  void notifyOf(float percentage) {
    for (Observer observer : observers) {
      observer.notify(percentage);
    }
  }
}

interface Observer {
  void notify(float percentage);
}
