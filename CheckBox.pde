class Checkbox {
  PShape unchecked, checked, indeterminate; // States of checkboxes

  String label = ""; String  value="";// Label: Name
  String items [] = {""};
  
  int lastHoveredIndex = -1; // Holds index of last hovered item index

  float x = 480, y = 180;
  float w = 220, h = 47;

  float minTextSize = 14, maxTextSize = 16;
  float iconW, iconH;

  color accentColor = purple;
  color hoveredFill = blueLight, pressedFill = blueFaint; // For containers fill
  color uncheckedFill = gray, checkedFill = accentColor, indeterminateFill = accentColor;
  color unhoveredMenuFill = white, hoveredMenuFill = lightGray;
  color labelFill = white;
  color listFill = white;
  color errorFill = reddishBrown;

  boolean error = false;
  boolean required = false;
  boolean states [] = {false};
  boolean draggingStarted = false;

  Fonts fonts;

  Periodically ipPeriod;

  Checkbox (String label, String [] list, float x, float y, float w, float h) {
    this.label = label;
    this.items = list;
    this.x = x; 
    this.y = y;
    this.w = w; 
    this.h = h;

    fonts = new Fonts ();

    unchecked = loadShape ("dataCheck/icons/unchecked_checkbox.svg");
    unchecked.disableStyle();
    checked = loadShape ("dataCheck/icons/checked_checkbox.svg");
    checked.disableStyle();
    indeterminate = loadShape ("dataCheck/icons/indeterminate_checkbox.svg");
    indeterminate.disableStyle ();

    iconW = h*0.45;
    iconH = unchecked.height*(iconW/unchecked.width);

    states = new boolean [list.length];
  }

  void draw () {
    // Label text
    fill (labelFill);
    textFont (fonts.roboto.regular);
    textAlign (LEFT, BOTTOM);
    text (label, x, y - 7 - textDescent ()/2);

    // Containers
    if (items.length > 1) {
      for (int i = 0; i < items.length; i ++) {
        float cw = w, ch = h;
        float cx = x, cy = y + i*ch;
        noStroke ();
        if (hoveredItem (i)) fill (mousePressed? pressedFill : hoveredFill);
        else noFill ();
        rect (cx, cy, cw, ch);

        float ckx = cx + 7 + iconW/2, cky = cy + h/2; // ck: checkbox
        noStroke ();
        fill (states [i]? checkedFill : uncheckedFill);
        shapeMode (CENTER);
        shape (states [i]? checked : unchecked, ckx, cky, iconW, iconH);

        float ix = ckx + 34, iy = cky; // i: item
        textFont (fonts.roboto.medium);
        textAlign (LEFT, CENTER);
        fill (listFill);
        textSize (maxTextSize);
        text (items [i], ix, iy - textDescent ()/2);
      }
    }
  }

  boolean getState (int i) {
    return states [i];
  }
  void setState (int i, boolean state) {
    states [i] = state;
  }
  void check (int i) {
    states [i] = true;
  }
  void uncheck (int i) {
    states [i] = false;
  }

  boolean hoveredItem (int i) {
    float cw = w, ch = h;
    float cx = x, cy = y + i*ch;

    return rectHovered (cx, cy, cw, ch, CORNER);
  }
  boolean hoveredItem () {
    for (int a = 0; a < items.length; a ++)
      if (hoveredItem (a)) return true;

    return false;
  }
  int getHoveredItemIndex () {
    for (int a = 0; a < items.length; a ++)
      if (hoveredItem (a)) return a;

    return -1;
  }
  String getHoveredItemValue () {
    int menuIndex = getHoveredItemIndex ();
    if (menuIndex != -1) return items [menuIndex];

    return null;
  }
  boolean hovered () {
    return rectHovered (x, y, w, h, CORNER);
  }
  boolean rectHovered (float x, float y, float w, float h, float orientation) {
    return (((orientation == CORNER && mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h)
      || (orientation == CENTER && mouseX >= x - w/2 && mouseX <= x + w/2 && mouseY >= y - h/2 && mouseY <= y + h/2))? true : false);
  }

  void mousePressed () {
    if (hoveredItem ()) {
      int hoveredIndex = getHoveredItemIndex();
      states [hoveredIndex] = !states [hoveredIndex];
    value=items[hoveredIndex];
      draggingStarted = true;
      lastHoveredIndex = hoveredIndex;
    }
  }
  
  void mouseReleased () {
    draggingStarted = false;
  }
  
  void mouseDragged () {
    if (draggingStarted && lastHoveredIndex != -1) {
      int nowHoveredIndex = getHoveredItemIndex();
      if (nowHoveredIndex != -1 && nowHoveredIndex != lastHoveredIndex) {
        states [nowHoveredIndex] = !states [nowHoveredIndex];
        lastHoveredIndex = nowHoveredIndex;
      }
    }
  }
   void mouseWheel(int factor){

      y =  constrain (y,-1200, 200);
     if ( y < 210){
       y = y - factor * 8; 
     }
  }
}
