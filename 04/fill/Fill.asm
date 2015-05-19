// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@color
M=0

// initialize i
@i
M=0

// this is the offset from start to end of the screen
@8192
D=A
@N
M=D

(LISTEN_KBD)
	// initialize i
	@i
	M=0

	// read the keyboard input
	@KBD
	D=M

	@color
	M=0
	@FILL_SCREEN
	D;JEQ

	@color
	M=-1
	@FILL_SCREEN
	0;JMP

(FILL_SCREEN)
	// stop if i == N
	@N
	D=M
	@i
	D=D-M
	@LISTEN_KBD
	D;JEQ

	// perform RAM[SCREEN+i] = color
	@i
	D=M
	@SCREEN
	A=A+D 		// compute the address offset

	D=A
	@offset_addr
	M=D 		// save the address of RAM[SCREEN+i] in @offset_addr
	
	@color
	D=M
	@offset_addr
	A=M
	M=D

	// do i++
	@i
	M=M+1

	@FILL_SCREEN
	0;JMP
