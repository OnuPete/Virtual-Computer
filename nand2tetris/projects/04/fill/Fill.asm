// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.



(LISTEN)
	@SCREEN
	D = A
	@saddress
	M = D
	@KBD
	D = A
	@send
	M = D - 1
	@KBD
	D = M
	@BLACKEN
	D; JNE
	@KBD
	D = M
	@WHITEN
	D; JEQ
	@LISTEN
	0; JMP

(BLACKEN)
	@saddress
	D = M
	@send
	D = D - M
	@LISTEN
	D; JGT

	@saddress
	A = M
	M = -1

	//@32
	//D = A
	@saddress
	M = M + 1
	@BLACKEN
	0; JMP

(WHITEN)
	@saddress
	D = M
	@send
	D = D - M
	@LISTEN
	D; JGT

	@saddress
	A = M
	M = 0

	@saddress
	M = M + 1
	@WHITEN
	0;JMP