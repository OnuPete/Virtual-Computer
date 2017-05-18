// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//If R0 or R1 is zero, R2 = 0
@R0
D = M 		// D = RAM[0]
@ZERO
D; JEQ
@R1
D = M 		// D = RAM[1]
@ZERO
D; JEQ

//If R0 or R1 is 1, R2 = the one that isnt 1
@R0
D = M 		// D = RAM[0]
@ONEA
D-1; JEQ
@R1
D = M 		// D = RAM[1]
@ONEB
D-1; JEQ

//Initialize Mult and i variables
@R0
D = M
@mult
M = D 		// mult = RAM[0]
@R1
D = M
@i
M = D 		// i = RAM[1]

// mult = mult + RAM[0]
// i = i - 1
// End loop when i = 1
(MULTIPLY)
@i
D = M
@STOP
D-1; JEQ
@R0
D = M
@mult
D = D + M  	// D = D + RAM[0]
@mult
M = D	// temp = D

@i
D = M - 1	// RAM[0] = RAM[0] - 1
@i
M = D
@MULTIPLY
0; JMP

(ZERO)
@0
D = A
@R2
M = D
@END
0; JMP

(ONEA)
@R1
D = M
@R2
M = D
@END
0; JMP

(ONEB)
@R0
D = M
@R2
M = D
@END
0; JMP

(STOP)
@mult
D = M	//D = temp
@R2
M = D		// RAM[2] = D

(END)
@END
0; JMP