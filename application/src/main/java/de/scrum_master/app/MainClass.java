package de.scrum_master.app;

import de.scrum_master.common.YourAnnotation;

public class MainClass {
  public static void main(String[] args) {
    MainClass yourClass = new MainClass();
    yourClass.yourMethodAround();
  }

  @YourAnnotation
  public void yourMethodAround() {
    System.out.println("Executing TestTarget.yourMethodAround()");
  }
}
