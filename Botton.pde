class Button extends Fonts {
  String label = "Next";

  float x = 600, y = 400;
  float w = 145, h = 64;
  float cornerRadius = 38;

  boolean clicked = false;

  int ORIENTATION = RIGHT;

  PShape icon;
  
  color unhoveredFill = backGround, hoveredFill = blueLight, pressedFill = blueFaint;
  color textFill = white;
  
  void init (String label, float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.label = label;
  }
  Button (String label, float x, float y, float w, float h) {
    init (label, x, y, w, h);
  }
  Button (String label, float x, float y) {
    init (label, x, y, w, h);
  }
  
  void setContainerFill (color unhoveredFill, color hoveredFill, color pressedFill) {
    this.unhoveredFill = unhoveredFill;
    this.hoveredFill = hoveredFill;
    this.pressedFill = pressedFill;
  }
  void setTextFill (color textFill) {
    this.textFill = textFill;
  }

  void setIcon (String path, int ORIENTATION) {
    icon = loadShape (path);
    icon.disableStyle();
    icon.scale (0.5);

    this.ORIENTATION = ORIENTATION;
  }

  void draw () {
    noStroke ();
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      if (mousePressed) {
        fill (pressedFill);
      } else {
        fill (hoveredFill);
      }
    } else {
      fill (unhoveredFill);
    }
    rectMode (CORNER);
    stroke(255);
    strokeWeight(3);
    rect (x, y, w, h, cornerRadius);

    fill (textFill);
    textFont (new Roboto ().medium);
    textSize (24);
    textAlign (CENTER, CENTER);      
    if (icon == null)
      text (label, x + w/2, y + h/2 - textDescent ()/2);
    

    shapeMode (CENTER);
    fill (255);
    if (icon != null) {
      if (ORIENTATION == RIGHT)
        shape (icon, x + w - 35, y + h/2 + icon.height*0.5/2);
      else if (ORIENTATION == LEFT)
        shape (icon, x + 35, y + h/2 + icon.height*0.5/2);
    }
  }

  void mouseClicked () {
    clicked = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
}
