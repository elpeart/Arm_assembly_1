.include	"gcd.s"
.equ		DDR_END,	0x3FFFFFFF

.text		/* executable code follows */
.global		_start
_start:
	MOV		SP, #DDR_END - 3
	LDR		R1, a			// R1 = a
	LDR		R2, b			// R2 = b
	
	PUSH	{R1}			// push a
	PUSH	{R2}			// push b
	
	BL		GCD				// call subroutine
	
	POP		{R3}			// R3 = ANSWER
	LDR		R4, =ANS		// location for answer
	STR		R3, [R4]		// store answer
	
STOP:
	B		STOP
	
a:		.word	1261
b:		.word	2425
ANS:	.space	4
