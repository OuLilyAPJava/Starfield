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
	background(0);
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
    size = 5;
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
  public void show()
  {
    fill(myColor);
    ellipse((float)myX, (float)myY, size * 2, size * 2);
  }
}