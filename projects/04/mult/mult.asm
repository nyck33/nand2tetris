// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@2	//GO TO FINAL ANSWER BOX
M=0	//initialize R2 to 0

@0
D=M
@END
D;JEQ	//IF ONE PRODUCT IS ZERO, jump to label (END)

@1
D=M
@END
D;JEQ	//Jump if D=0

@0	//take the R0 value and we will add R1 to itself R0 times
D=M	//D has R0
@3	//set counter at R3
M=D	//R3 has count, count down to 0


(LOOP)
@1	//GET R1
D=M	//D has R1

@2	//at R2
M=D+M	//R2 compute, ie. add itself

@3	//go to counter at R3
M=M-1	//decrement counter towards 0

D=M	//D has current count
@LOOP	//Jump to (LOOP) if D>0
D;JGT	//


(END)
@END  //Jump to label (END)
0;JMP	//infinite loop 