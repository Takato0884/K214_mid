//student-number:2110136
//name:Takato Hayashi

import ddf.minim.*;
Minim minim;

void setup() {
  size(1280, 1024);
  arrangeBlocks();
  arrangeAnsBlocks();
  setup_ball();
  q1 = loadImage("./data/image/q1.png");
  minim = new Minim(this);
  correctSE = minim.loadSample("./data/bgm/correct.mp3");
  incorrectSE = minim.loadSample("./data/bgm/incorrect.mp3");
  completeSE = minim.loadSample("./data/bgm/complete.mp3");
  bgm = minim.loadFile("./data/bgm/bgm.mp3");
}
void draw() {  
  background(54, 216, 55,1.5);
  bgm.play();
  
  //終了判定および表示項目
  if(ans_blockHitFlag[0]==true && ans_blockHitFlag[1]==true && ans_blockHitFlag[2]==true && ans_blockHitFlag[3]==true){
  //if(ans_blockHitFlag[0]==false){ //テスト用
      noLoop();
      bgm.close();
      completeSE.trigger();
      fill(255,0,204);
      textSize(300);
      text("CLEAR",width/2-450,height/2);  
      fill(255);
      textSize(50);
      int time = millis() - base_time;
      text("your time", 700, 600);
      fill(255);
      text(time/1000.0, 1000, 600);
    } else {
      image(q1,width/2-160,300);
          fill(255);
          textSize(50);
          int time = millis() - base_time;
          text(time/1000.0, 1000, 600);
    }

  for (int i = 0; i < MAX_BALLS; i++ ) {
      /* BallとBarの衝突判定 */
      if (ballY[i] > barY && ballY[i] < barY + barHeight) {
        if (ballX[i] > barX && ballX[i] < barX + barWidth/2) {
          ballVY[i] = -ballVY[i];
          if (ballVX[i]>0){
            ballVX[i] = -ballVX[i];
          }else{
            ballVX[i] = ballVX[i];
          }          
        }else if(ballX[i] > barX + barWidth/2 && ballX[i] < barX + barWidth){
          ballVY[i] = -ballVY[i];
          if (ballVX[i]<0){
            ballVX[i] = -ballVX[i];
          }else{
            ballVX[i] = ballVX[i];
          }
        }
      }
  }

  /* Ballと複数Blockの衝突判定 */
  for ( int i = 0; i < MAX_BLOCKS; i++ ) {
    for ( int j = 0; j < MAX_BALLS; j++ ) {
      if  ( blockHitFlag[i] == false ) {
        if ( ballX[j] > blockX[i] && ballX[j] < blockX[i] + blockWidth[i] ) {
          if ( ballY[j] > blockY[i] && ballY[j] < blockY[i] + blockHeight[i] ) {
            ballVY[j] = -ballVY[j];     
            blockHitFlag[i] = true;
          }
        }
    }
    }
  }
  
  /* BallとAnsBlockの衝突判定 */
  for ( int i = 0; i < MAX_ANS_BLOCKS; i++ ) {
    for ( int j = 0; j < MAX_BALLS; j++ ) {
        if ( ballX[j] > ans_blockX[i] && ballX[j] < ans_blockX[i] + ans_blockWidth[i] ) {
          if ( ballY[j] > ans_blockY[i] && ballY[j] < ans_blockY[i] + ans_blockHeight[i] ) {
            ballVY[j] = -ballVY[j];
            if (ans_block_answer[i] == ball_num[j]){
              ans_blockHitFlag[i] = true;
              correctSE.trigger();
            }else{
              incorrectSE.trigger();
            }
          }
      }
    }
  }

  /* Ball */
  moveBall();
  drawBall();

  /* Bar */
  moveBar();
  drawBar();

  /* Block */
  moveBlocks();
  moveAnsBlocks();
  drawBlocks();
  drawAnsBlocks();
  
  
}
