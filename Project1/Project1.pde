//pong

//variables
int stage = 1;
int bSpeed = 4;
int xD = 1;
int yD = 1;
int roof = 80;
int floor = 480;
int p1y = 280;
int p2y = 280;
int p1s = 0;
int p2s = 0;

float xpos = 400.0;
float ypos = 280.0;

boolean wP = false;
boolean sP = false;
boolean upP = false;
boolean downP = false;
boolean scored = false;

void setup()
{
  size(800, 500);
}

void draw()
{
  if (stage == 1)
  {
    background(0);
    fill(255);
    rect(-10, 60, 900, 20);
    rect(-10, 480, 900, 20);
    ellipse(xpos,ypos,20,20);
    rect(30,p1y,20,80);
    rect(750,p2y,20,80);
    
  } 
  if (stage == 2)
  {
    // Stage 2 Code
  }
  
  if (stage == 3)
  {
    // Stage 3 code
  }
  
  if (stage == 0)
  {
    // Menu 3 boxs for each stage and numbers 1-3 for ball speed
  }
   if (scored)
  {
    delay(5000);
    scored = false;
  }
  
  // ball physics
    xpos = xpos + ( bSpeed * xD );
    ypos = ypos + ( bSpeed * yD );
    
    // losing condition
    if (xpos > width || xpos < 0)
    {
      xD = xD * 0;
      yD = yD * 0;
      
      if (xpos > width)
      {
        p1s++;
        xpos = 400.0;
        ypos = 280.0;
        xD = -1;
        yD = -1;
        scored = true;
      }
      if (xpos < 0)
      {
        p2s++;
        xpos = 400.0;
        ypos = 280.0;
        xD = 1;
        yD = 1;
        scored = true;
      }

      
      
    }
    
    // wall bounce
    if ( ypos > floor - 20 || ypos < roof + 20)
    {
      yD = yD * -1;
    }
    // paddle bounce
    if ((xpos < 50 && xpos > 30) && (ypos > p1y && ypos < p1y + 80))
    {
      xD = xD * -1;
    }
    if ((xpos < 780 && xpos > 750) && (ypos > p2y && ypos < p2y + 80))
    {
      xD = xD * -1;
    }
    
    //Paddle Mechanics
    if(wP && p1y > 80)
    {
      p1y = p1y - 5;
    }
    if(sP && p1y < 400)
    {
      p1y = p1y + 5;
    }
    if(upP && p2y > 80)
    {
      p2y = p2y - 5;
    }
    if(downP && p2y < 400)
    {
      p2y = p2y + 5;
    }
}

void keyPressed()
{
  if (key == 'w')
  {
    wP = true;
  }
  if (key == 's')
  {
    sP = true;
  }
  if(key == CODED && keyCode == UP)
  {
    upP = true;
  }
  if(key == CODED && keyCode == DOWN)
  {
    downP = true;
  }
}

void keyReleased()
{
  if (key == 'w')
  {
    wP = false;
  }
  if (key == 's')
  {
    sP = false;
  }
  if(key == CODED && keyCode == UP)
  {
    upP = false;
  }
  if(key == CODED && keyCode == DOWN)
  {
    downP = false;
  }
}
