/*
실행 방법
 1. 눈에 보이는 답안대로 sun 또는 SUN을 친다. (키보드 자판)
 2. 엔터를 누른다.
 3. 마우스로 움직이며 확인한다.
 4. 화살표 버튼을 누르면 초기화가 된다.
 */

PFont font;
int keyX1 = 10;
int keyX2 = 76;
int keyX3 = 91;
int keyX4 = 112;
int keyX5 = 10;
int clickedIndex = -1; // 클릭된 사각형의 인덱스
float circleX; // 움직이는 원이 모니터 안에만 있게하기 위해
float myMouse;
int triNum = 8;
int fin = 0;
String[] texts = new String[5];


void setup() {
  size(640, 630);
  noStroke();
  font = loadFont("ChakraPetch-Medium-20.vlw");
  textFont(font);
  textSize(16);
}

void draw() {
  background(236, 236, 239);
  myMouse = map(mouseX, 0, height, 255, 0);

  // 모니터 화면 (사각형)
  if ( fin == 1 ) {
    if (circleX >= width / 2 - 100) {
      fill(0, 150);
    } else {
      fill(myMouse, 60, 80, 55);
    }
  } else {
    fill(63, 62, 70, 150);
  }
  rect(40, 40, 555, 330, 10);

  // 초기화 화살표
  fill(63, 62, 70, 100);
  triangle(30+20, 40+20, 40+20, 30+20, 40+20, 50+20);
  stroke(63, 62, 70, 100);
  line(60, 60, 70, 60);
  noStroke();

  // 해 or 달
  fill(255, 180);
  ellipse(width / 2, 150, 100, 100);

  // 해 바깥 삼각형
  for (int i = 0; i < triNum; i++ ) {
    pushMatrix();
    translate(width/2, 150);
    rotate(TWO_PI / triNum * i);
    if (fin == 1) {
      fill(255, myMouse-155);
    } else {
      fill(255, 150);
    }
    triangle(0, -83, 10, -60, -10, -60);
    popMatrix();
  }

  // 해 바깥 원
  fill(255, 10);
  ellipse(width / 2, 150, 120, 120);
  ellipse(width / 2, 150, 140, 140);

  // 움직이는 원
  if (fin == 1) {
    if (circleX >= width / 2 - 100) {
      fill(63, 62, 70);
    } else {
      fill(myMouse-100, 60, 80, 100);
    }
    circleX = constrain(mouseX, 43 + 47.5, 40 + 552 - 47.5);
    ellipse(circleX, 150, 95, 95);
  }

  // 모니터 안 글자
  if ( fin == 1) {
    if (circleX >= width / 2 - 100) {
      fill(255, 180);
      stroke(255, 180);
    } else {
      fill(63, 62, 70, 200);
      stroke(63, 62, 70, 150);
    }
  } else {
    fill(63, 62, 70, 200);
    stroke(63, 62, 70, 150);
  }
  textSize(17);
  text("W h a t    i s    t h i s ?", 130, 300);
  strokeWeight(3);
  line(width/2-10, 305, width/2+160, 305);
  noStroke();


  // 모니터 키보드 치면 나타내는 글씨
  for (int i = 0; i < texts.length; i++) {
    if (texts[i] != null) {
      if (fin == 1 && circleX >= width / 2 - 100) {
        fill(255, 180);
      } else {
        fill(63, 62, 70, 200);
      }
      text(texts[i], width/2+27+(i*20), 299);
    }
  }

  // 마우스 움직임에 따라 정답 글짜 변경
  if (fin == 1 && circleX >= width / 2 - 100) {
    texts[0] = " ";
    texts[1] = "M";
    texts[2] = "O";
    texts[3] = "O";
    texts[4] = "N";
    for (int i = 0; i < 30; i ++) {
      frameRate(6);
      fill(random(100, 255), 100);
      ellipse(random(50, 560), random(50, 350), 3, 3);
    }
  } else if (fin == 1 && circleX < width / 2 - 100) {
    texts[0] = " ";
    texts[1] = "S";
    texts[2] = "U";
    texts[3] = "N";
    texts[4] = " ";
  }


  // 키보드 자판 시작
  // 첫 번째 열
  for (int i = 0; i < 13; i++) {
    fill(255); // 기본 색상
    rect(10 + i * 43, 400, 40, 40, 10);
  }
  rect(569, 400, 63, 40, 10);

  // 두 번째 열
  rect(10, 443, 63, 40, 10);
  for (int i = 0; i < 13; i++) {
    fill(255);
    rect(keyX2 + i * 43, 443, 40, 40, 10);
  }

  // 세 번째 열
  rect(10, 486, 78, 40, 10);
  rect(564, 486, 68, 40, 10);
  for (int i = 0; i < 11; i++) {
    fill(255);
    rect(keyX3 + i * 43, 486, 40, 40, 10);
  }

  // 네 번째 열
  rect(10, 529, 99, 40, 10);
  rect(542, 529, 90, 40, 10);
  for (int i = 0; i < 10; i++) {
    fill(255);
    rect(keyX4 + i * 43, 529, 40, 40, 10);
  }

  // 다섯 번째 열
  rect(139, 572, 57, 40, 10);
  rect(199, 572, 213, 40, 10);
  rect(199+213+3, 572, 57, 40, 10);
  rect(199+213+63, 572, 40, 40, 10);
  rect(199+213+63+43, 572, 38, 40, 10);
  rect(199+213+63+41+43, 572, 30, 19, 7);
  rect(199+213+63+41+43, 572+21, 30, 19, 7);
  rect(199+213+63+41+76, 572, 39, 40, 10);
  for (int i = 0; i < 3; i++) {
    fill(255);
    rect(keyX5 + i * 43, 572, 40, 40, 10);
  }


  // keyborad 글씨
  fill(210, 203, 193);
  textSize(16);
  text("S", 72+43*2, 506);
  text("D", 72+43*3, 506);
  text("F", 71+43*4, 506);
  text("M", 49+43*8, 547);
  text("C", 49+43*4, 547);
  text("Z", 49+43*2, 547);
  text("X", 49+43*3, 547);
  text("<", 50+43*9, 547);
  text(">", 49+43*10, 547);
  text("W", 56+43*2, 462);
  text("G", 70+43*5, 506);
  text("N", 50+43*7, 547);
  text("E", 57+43*3, 462);
  text("R", 57+43*4, 462);
  text("U", 57+43*7, 462);
  text("O", 57+43*9, 462);
  text("{", 57+43*11, 462);
  text("}", 57+43*12, 462);
  text("J", 71+43*8, 506);
  text("K", 71+43*9, 506);
}

void keyPressed() {
  if (keyCode == 's' || keyCode == 'S') {
    texts[0] = "E";
  } else if (keyCode == 'u' || keyCode == 'U') {
    texts[1] = "R";
    texts[2] = "R";
  } else if (keyCode == 'n' || keyCode == 'N') {
    texts[3] = "O";
    texts[4] = "R";
  } else if (keyCode == ENTER) {
    fin = 1;
  }
}

void mousePressed() {
  if (mouseX >= 50 && mouseX <= 70 && mouseY >= 60 && mouseY <= 80) {
    texts[0] = " ";
    texts[1] = " ";
    texts[2] = " ";
    texts[3] = " ";
    texts[4] = " ";
    fin = 0;
  }
}
