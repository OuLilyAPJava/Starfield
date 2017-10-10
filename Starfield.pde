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
    fill(100, 100, 255);
    //ellipse((float)myX, (float)myY, 25, 25);
    beginShape();//begin drawing the shape -- It's a big star
     vertex(300,20);
     vertex(380,200);
     vertex(580,200);
     vertex(400,350);
     vertex(530,580);
     vertex(300,430);
     vertex(70,580);
     vertex(200,350);
     vertex(20,200);
     vertex(220,200);
     endShape();//end of the shape
  }
}