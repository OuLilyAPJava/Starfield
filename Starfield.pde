Particle[] aBunch = new Particle[500];
void setup()
{
  size(500, 500);
  for (int i = 0; i < aBunch.length; i++)
  {
    aBunch[i] = new NormalParticle();
  }
  aBunch[0] = new OddballParticle();
  aBunch[1] = new JumboParticle();
}
void draw()
{
  fill(0, 0, 0, 50);
  rect(0, 0, 500, 500);
  for (int i = 0; i < aBunch.length; i++)
  {
    aBunch[i].show();
    aBunch[i].move();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, myDir, mySpeed;
  int myColor, size;
  NormalParticle()
  {
    myX = 250;
    myY = 250;
    myDir = Math.random()*360;
    mySpeed = Math.random()*5;
    myColor = color(255);
    size = (int)(Math.random()*3)+2;
  }
  public void move()
  {
    myX += mySpeed * Math.cos(myDir);
    myY += mySpeed * Math.sin(myDir);
  }
  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, size, size);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle//uses an interface
{
  int myX, myY;
  OddballParticle()
  {
  }
  public void move()
  {
  }
  public void show()
  {
    fill(230, 204, 255);
    arc(250, 250, 100, 100, PI, 2*PI);
    fill(40, 0, 77);
    ellipse(250, 250, 175, 20);
    strokeWeight(5);
    stroke(40, 0, 77);
    line(230, 250, 210, 285);
    line(270, 250, 290, 285);
    strokeWeight(1);
    stroke(0);
  }
}

class JumboParticle extends NormalParticle//uses inheritance
{
  public void move()
  {
    myX += mySpeed/1.5 * Math.cos(myDir);
    myY += mySpeed/1.5 * Math.sin(myDir);
  }
  public void show()
  {
    //star
    noStroke();
    fill(255);
    beginShape();
    vertex((float)myX, (float)myY);
    vertex((float)myX + 3.5, (float)myY + 8.5);
    vertex((float)myX + 14, (float)myY + 9);
    vertex((float)myX + 5, (float)myY + 15);
    vertex((float)myX + 10, (float)myY + 27);
    vertex((float)myX, (float)myY + 20);
    vertex((float)myX - 10, (float)myY + 27);
    vertex((float)myX - 5, (float)myY + 15);
    vertex((float)myX - 14, (float)myY + 9);
    vertex((float)myX - 3.5, (float)myY + 8.5);
    endShape();
    stroke(0);
  }
}