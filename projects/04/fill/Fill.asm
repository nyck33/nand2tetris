// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(LOOP)
@SCREEN
D=A

@0
M=D //PUT SCREEN START LOCATION IN RAM0

///////////////////////////
(KBDCHECK)

@KBD //24576
D=M //load KBD to D (value of key or 0)

@BLACK //R12
D;JGT   //Jump to (BLACK) if any KBD pressed D>0
        
@WHITE  //R16 
D;JEQ   //if D=0, jump to (WHITE)

@KBDCHECK //R4
0;JMP //jumps to label (KBDCHECK) 
///////////////////////////
(BLACK) 
@1
M=-1    //WHAT TO FILL SCREEN WITH (-1=11111111111111)

@CHANGE //R20
0;JMP   //Jump to label (CHANGE)

(WHITE)
@1
M=0 //WHAT TO FILL SCREEN WITH

@CHANGE //R20
0;JMP
//////////////////////////
(CHANGE)
@1  //CHECK WHAT TO FILL SCREEN WITH
D=M //D CONTAINS BLACK OR WHITE (-1 or 0)

@0
A=M //GET ADRESS OF SCREEN PIXEL TO FILL (start at 16384 SCREEN)
M=D //FILL RAM[A] with black or white

@0
D=M+1   //INC TO NEXT PIXEL

@KBD
D=A-D   //KBD-SCREEN (24576-16384)=13928

@0
M=M+1   //INC TO NEXT PIXEL
A=M

@CHANGE //R20
D;JGT   //IF A=0 EXIT AS THE WHOLE SCREEN IS BLACK
/////////////////////////
@LOOP //start at beginning
0;JMP