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
  if (((OddballParticle)aBunch[0]).myX > 350)
  {
    ((OddballParticle)aBunch[0]).mySpeed = -((OddballParticle)aBunch[0]).mySpeed;
  }
  else if (((OddballParticle)aBunch[0]).myX < 150)
  {
    ((OddballParticle)aBunch[0]).mySpeed = -((OddballParticle)aBunch[0]).mySpeed;
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
    mySpeed = Math.random()*4;
    myColor = color(255);
    size = (int)(Math.random()*3)+1;
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
  int myX, myY, mySpeed;
  OddballParticle()
  {
    myX = 250;
    myY = 230;
    mySpeed = 1;
  }
  public void move()
  {
    myX = myX + mySpeed;
  }
  
  public void show()
  {
    //spaceship
    fill(230, 204, 255);
    arc(myX, myY, 100, 100, PI, 2*PI);
    //alien
    noStroke();
    fill(200, 200, 200);
    ellipse(myX, myY - 15, 20, 30);
    stroke(204, 204, 204);
    strokeWeight(2);
    line(myX - 5, myY - 25, myX - 10, myY - 40);
    line(myX + 5, myY - 25, myX + 10, myY - 40);
    //spaceship
    strokeWeight(4);
    stroke(105, 0, 204);
    line(myX - 20, myY, myX - 40, myY + 35);
    line(myX + 20, myY, myX + 40, myY + 35);
    strokeWeight(1);
    stroke(0);
    fill(40, 0, 77);
    ellipse(myX, myY, 175, 20);
    ellipse(myX - 40, myY + 35, 10, 10);
    ellipse(myX + 40, myY + 35, 10, 10);
  }
}

class JumboParticle extends NormalParticle//uses inheritance
{
  /*public void move()
  {
    myX += mySpeed/1.5 * Math.cos(myDir);
    myY += mySpeed/1.5 * Math.sin(myDir);
  }*/
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