char debut[] = "Now launching AMOS";
char cmd[10];
char memStr[100];
int memInt[100];
int comptInt = 0;

void setup() {
  Serial.begin(9600);
  Serial.println();
  Serial.println(debut);
}  
   
void loop() {
  Serial.print("> ");
  int i = 0;
  while (Serial.available()) {
    cmd[i] = Serial.read();
    i++;
  }
  
  if (cmd == "nstr") {
    Serial.print("str> ");
    int istr = 0;
    while (Serial.available()) {
      memStr[istr] = Serial.read();
      istr++;
    }
  }
  
  if (cmd == "pstr") {
    Serial.println(memStr);
  }
  
  if (cmd == "int+") {
    int contenuInt[100];
    int iint = 0;
    Serial.print("int+> ");
    while (Serial.available()) {
      contenuInt[iint] = Serial.read();
      iint++;
    }
    
    if (memInt[comptInt + 1]) {
      int icontint = 0;
      while (contenuInt[icontint]) {
        memInt[comptInt + 1] = memInt[comptInt + 1] + contenuInt[icontint];
        icontint++;
      }
      comptInt++;
    }
  }
  
  if (cmd == "int-") {
    memInt[comptInt] = 0;
    comptInt--;
    Serial.println("finish !");
  }
  
  if (cmd == "pint") {
    int contenuNumInt[100];
    int iContNumInt;
    Serial.print("numero> ");
    while (Serial.available()) {
      contenuNumInt[iContNumInt] = Serial.read();
      iContNumInt++;
    }
    
    int numInt = 0;
    int iContNumInt2 = 0;
    while (contenuNumInt[iContNumInt2]) {
      numInt = numInt + contenuNumInt[iContNumInt2];
      iContNumInt2++;
    }
    
    Serial.println(memInt[numInt]);
  }
  
  if (cmd == "aint") {
    int iAint = 0;
    for (iAint = 0; iAint < comptInt; iAint++) {
      Serial.println(memInt[iAint]);
    }
  }
  
}
