
_main:

;number_count.c,1 :: 		void main() {
;number_count.c,3 :: 		TRISC = 0;             // port c is output
	CLRF        TRISC+0 
;number_count.c,4 :: 		portc = 0b00000000;  // portC starts with zero
	CLRF        PORTC+0 
;number_count.c,6 :: 		for (i=0; i<255; i++){
	CLRF        R1 
L_main0:
	MOVLW       255
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
;number_count.c,7 :: 		portc = portc+00000001;   // increament the value
	INCF        PORTC+0, 1 
;number_count.c,8 :: 		delay_ms (400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
;number_count.c,6 :: 		for (i=0; i<255; i++){
	INCF        R1, 1 
;number_count.c,9 :: 		}
	GOTO        L_main0
L_main1:
;number_count.c,10 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
