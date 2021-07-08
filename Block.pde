//MAX_BLOCKS
final int MAX_BLOCKS = 16;

float[] blockX = new float[MAX_BLOCKS];
float[] blockY = new float[MAX_BLOCKS];

float[] blockWidth = new float[MAX_BLOCKS];
float[] blockHeight = new float[MAX_BLOCKS];
boolean[] blockHitFlag = new boolean[MAX_BLOCKS];

final int BLOCK_ROWS  =  16;  // ブロックの横一列の個数
final int BLOCK_GAP  =  2;    // ブロックとブロックの間隔
final int BLOCK_GAP_UPPER = 160; // 最上部の壁とブロックの間隔

//MAX_ANS_BLOCKS
int MAX_ANS_BLOCKS = 4;

float[] ans_blockX = new float[MAX_ANS_BLOCKS];
float[] ans_blockY = new float[MAX_ANS_BLOCKS];

float[] ans_blockWidth = new float[MAX_ANS_BLOCKS];
float[] ans_blockHeight = new float[MAX_ANS_BLOCKS];
boolean[] ans_blockHitFlag = new boolean[MAX_ANS_BLOCKS];

int ANS_BLOCK_ROWS  =  4;  // ブロックの横一列の個数
int ANS_BLOCK_GAP  =  (1280-140*ANS_BLOCK_ROWS)/(ANS_BLOCK_ROWS-1);    // ブロックとブロックの間隔

int[] ans_block_answer = new int[] {4,7,9,9};
String[] ans_block_alphabet = new String[] {"a","b","c","d"};


void moveBlocks() {
  // Blockは動かない
}

/* Blockの描画処理 */
void drawBlocks() {
  for (int i = 0; i < MAX_BLOCKS; i++ ) {
    if ( blockHitFlag[i]  ==  false ) {
      fill(139, 69, 19);
      rect(blockX[i], blockY[i], blockWidth[i], blockHeight[i]);
    }
  }
}

/* Blockの配置処理 */
void arrangeBlocks() {
  
  int i = 0;
  while ( i < MAX_BLOCKS ) {
    blockWidth[i] = 78.0f;
    blockHeight[i] = 15.0f;
    blockHitFlag[i] = false;
    blockX[i] = BLOCK_GAP + i % BLOCK_ROWS * (blockWidth[i] + BLOCK_GAP);
    blockY[i] = BLOCK_GAP_UPPER + i / BLOCK_ROWS * (blockHeight[i] + BLOCK_GAP);
    i++;
  }
}

void moveAnsBlocks() {
  // AnsBlockは動かない
}

/* AnsBlockの描画処理 */
void drawAnsBlocks() {
  for (int i = 0; i < MAX_ANS_BLOCKS; i++ ) {
    if ( ans_blockHitFlag[i]  ==  false ) {
      fill(30);
      noStroke();
      rect(ans_blockX[i], ans_blockY[i], ans_blockWidth[i], ans_blockHeight[i]);
      fill(255,255,255);
      textSize(40);
      text(ans_block_alphabet[i],ans_blockX[i]+56,ans_blockY[i]+26);  
    }
    if ( ans_blockHitFlag[i]  ==  true ) {
      fill(255,105,180);
      noStroke();
      rect(ans_blockX[i], ans_blockY[i], ans_blockWidth[i], ans_blockHeight[i]);
      fill(255,255,255);
      textSize(40);
      text(ans_block_alphabet[i],ans_blockX[i]+56,ans_blockY[i]+26);  
    }
  }
}

/* AnsBlockの配置処理 */
void arrangeAnsBlocks() {
  int i = 0;
  while ( i < MAX_ANS_BLOCKS ) {
    ans_blockWidth[i] = 140.0f;
    ans_blockHeight[i] = 30.0f;
    ans_blockHitFlag[i] = false;
    ans_blockX[i] = i % ANS_BLOCK_ROWS * (ans_blockWidth[i] + ANS_BLOCK_GAP);
    ans_blockY[i] = i / ANS_BLOCK_ROWS * (ans_blockHeight[i]);
    i++;
  }
}
