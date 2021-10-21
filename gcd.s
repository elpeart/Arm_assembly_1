.text		/* executable code follows */

GCD:
	POP		{R6}		// R6 = b
	POP		{R5}		// R5 = a
	
LOOP:
	CMP		R5, R6		// compare a and b
	BEQ		END			// done if a = b
	BPL		AB			// if a > b
	B		REV			// else
	
AB:
	SUB		R5, R5, R6	// a = a - b
	B 		LOOP		// recursion
	
REV:
	SUB		R6, R6, R5	// b = b - a
	B		LOOP		// recursion
	
END:
	PUSH	{R5}		// push answer
	BX LR				// return to main
	