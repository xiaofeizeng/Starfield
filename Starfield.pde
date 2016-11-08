PImage photo;
//
//
Particle [] star = new Particle[300];

void setup()
{
	photo = loadImage("NoMansSky.jpg");
  size(900,500);
  frameRate(15);
  for (int i=0; i<star.length; i++)
  {
    if (i%100==0)
    {
      star[i] = new Jumbo();
    }
    else if (i%50==0)
    {
      star[i] = new Oddball();
    }
    else
    {
      star [i] = new Normal();
    }
  }
}

void draw()
{
	
  noStroke();
  rect(0,0,900,600);
  image(photo, 0, 0);
  for (int i=0; i<star.length; i++)
  {
    star[i].move();
    star[i].show();

    if (((Normal)star[0]).normX < -50 || ((Normal)star[0]).normX > 850 || ((Normal)star[0]).normY < -50 || ((Normal)star[0]).normY > 450)
    {
      for (i=0; i<star.length; i++)
      {
        if (i%100==0)
        {
          star[i] = new Jumbo();
        }
        else if (i%50==0)
        {
          star[i] = new Oddball();
        }
        else
        {
          star [i] = new Normal();
        }
      }
    }
  }
}

interface Particle
{
  public void move();
  public void show();
}
class Normal implements Particle
{
  double normX, normY, normAngle, normSpeed, normMoveX, normMoveY, normSize;
  int normColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  Normal()
  {
    normX = 450;
    normY = 250;
    normAngle = (Math.random()*2*Math.PI);
    normSpeed=10;
    normMoveX=normSpeed*Math.cos(normAngle);
    normMoveY=normSpeed*Math.sin(normAngle);
    normSize=10;
  }

  public void move()
  {
    normX = normX + normMoveX;
    normY = normY + normMoveY;
  }

  public void show()
  {
    fill(normColor);
    ellipse((float)normX, (float)normY, (float)normSize, (float)normSize);
  }
}

class Oddball implements Particle
{
  double oddX, oddY, oddSize;
  int oddColor;

  Oddball()
  {
    oddX=450;
    oddY=250;
    oddSize=20;
    oddColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), 100);
  }
  public void move()
  {
    oddX = Math.random()*400;
    oddY = Math.random()*400;
  
  }
  public void show()
  {
    fill(oddColor);
    ellipse((float)oddX, (float)oddY, (float)oddSize, (float)oddSize);
  }
}

class Jumbo extends Normal
{
  Jumbo()
  {
    normSize = 35;
  }
}
