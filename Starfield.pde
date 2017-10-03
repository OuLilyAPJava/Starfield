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
    aBunch[i].move();
    aBunch[i].show();
  }
}
class NormalParticle
{
	Double myX, myY, myDir, mySpeed;
  int myColor, size;
  NormalParticle()
  {
    myX = 250;
    myY = 250;
    myDir = Math.random()*360;
    mySpeed = Math.random()*5;
    myColor = color(0);
  }
  public void move()
  {
    myX += mySpeed * Math.cos(myDir);
    myY += mySpeed * Math.sin(myDir);
  }
  public void show()
  {
    fill(myColor);
    ellipse(myX, myY, size, size);
  }
}
interface Particle
{
	public void show();
  public void move();
}
class OddballParticle //uses an interface
{
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
	//your code here
  }
}