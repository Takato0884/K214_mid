final int MAX_BALLS = 10;
int[] ball_num = new int[] {0,1,2,3,4,5,6,7,8,9};
int ball_direction = int(random(1));
float[] ballX = new float[MAX_BALLS];
float[] ballY = new float[MAX_BALLS];
float[] ballVX = new float[MAX_BALLS];
float[] ballVY = new float[MAX_BALLS];
float ballRadius = 15.0f;

int missCounter = 0;

void setup_ball(){
  for (int i = 0; i < MAX_BALLS; i++ ) {
    ballX[i] = random(width);
    ballY[i] = 300.0f;
    ballVX[i] = 3.0f;
    ballVY[i] = 3.0f;
  }
}


void moveBall() {
  for (int i = 0; i < MAX_BALLS; i++ ) {
    ballX[i] = ballX[i] + ballVX[i];
    ballY[i] = ballY[i] + ballVY[i];
    
    if (ballX[i] > width-(ballRadius/2) || ballX[i] < (ballRadius/2)){
      ballVX[i] = -ballVX[i];
    }
    if (ballY[i] < (ballRadius/2)){
      ballVY[i] = -ballVY[i];
    }
    
    /* 負け判定 */
    if ( ballY[i] > height ) {
      
      /* ボール位置のリセット */
      ballX[i] = random(width);  
      ballY[i] = 300;
      if (ball_direction==0){
        ballVY[i] = 3.0f;
      }  
      if (ball_direction==1){
        ballVY[i] = -3.0f;
     }
  
     }
   } 
}

void drawBall(){
  for (int i = 0; i < MAX_BALLS; i++ ) {
      fill(255,255,255);
      ellipse(ballX[i], ballY[i], ballRadius * 2, ballRadius * 2);
      fill(30);
      textSize(20);
      text(ball_num[i],ballX[i]-6,ballY[i]+6);  
  }
}
