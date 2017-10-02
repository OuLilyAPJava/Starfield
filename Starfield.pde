Particle[] aBunch = new NormalParticle[500];
void setup()
{
	size(500, 500);
  for (int i = 0; i < aBunch.length; i++)
  {
    aBunch[i] = new NormalParticle();
    aBunch[0] = new OddballParticle();
  }
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
    int myX = 250;
    int myY = 250;
    myColor = color(0);
  }
  public void move()
  {
  }
  public void show()
  {
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
class JumboParticle //uses inheritance
{
	//your code here
}