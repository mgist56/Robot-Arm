import processing.serial.*;
Serial serialBruh;
// The lovely name of our serial monitor
int x = 0;
int y = 0;

void setup() {
  frameRate(40);
  size(500, 650);
  serialBruh = new Serial(this, Serial.list()[2], 9600);
  print(Serial.list());
}

void draw() {
  background(0, 255, 0);
  // Obnoxious green that fits this assignment
  float cx = constrain(mouseX, 0, 500);
  float cy = constrain(mouseY, 0, 500);
  // Constrains the coordinates to the grid box thing

  float mx = map(cx, 0, 500, 0, 180);
  float my = map(cy, 0, 500, 0, 180);
  // Coordinates of cx and cy mapped betwen 0 and 180

  int xdata = (int) mx;
  int ydata = (int) my;
  // Mapped data turned into integers
  String xstring = nf(xdata,3);
  String ystring = nf(ydata,3);
  // Turning those mapped ints into strings
  String data = xstring+","+ystring+" ";
  // Mu can read string as an int with a space
  stroke(255);
  strokeWeight(5);
  line(250, 500, 250, 0);
  line(0, 250, 500, 250);
  // Drawing the axis of the grid

  stroke(255);
  strokeWeight(5);
  line(0, 500, 500, 500);
  // Line between grid and coordinate reading thing

  textSize(25);
  text("Servo 1:", 100, 550);
  text("Servo 2:", 100, 600);
  text(mx, 200, 550);
  text(my, 200, 600);
  // Displays which servo has which data

  ellipse(cx, cy, 10, 10);
  // Draws my son
  println(data);
  serialBruh.write(data);
}
