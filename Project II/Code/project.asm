
_main:

;project.c,22 :: 		void main() {
;project.c,24 :: 		TRISC=0;               // portc output
	CLRF       TRISC+0
;project.c,25 :: 		TRISB=0;              // portb input
	CLRF       TRISB+0
;project.c,26 :: 		TRISA=1;             // porta input
	MOVLW      1
	MOVWF      TRISA+0
;project.c,27 :: 		PORTB=0;            // portb low voltage logic
	CLRF       PORTB+0
;project.c,28 :: 		PORTC=0;           //  portc low voltage logic
	CLRF       PORTC+0
;project.c,30 :: 		lcd_init( );                       // lCD interface with pic
	CALL       _Lcd_Init+0
;project.c,31 :: 		ADC_Init();                       // ADC interface with pic
	CALL       _ADC_Init+0
;project.c,32 :: 		Lcd_cmd(_lcd_cursor_off);        // disable cursor
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project.c,33 :: 		LCD_cmd(_LCD_CLEAR);            // clear LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;project.c,35 :: 		while(1){
L_main0:
;project.c,36 :: 		x=adc_read(0);       // digital value
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVF       R0+1, 0
	MOVWF      _x+1
;project.c,37 :: 		v=x*(5.0/1023);     //analog value
	CALL       _int2double+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      119
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _v+0
	MOVF       R0+1, 0
	MOVWF      _v+1
	MOVF       R0+2, 0
	MOVWF      _v+2
	MOVF       R0+3, 0
	MOVWF      _v+3
;project.c,38 :: 		temp=(v*100);        // Tempeature according to analog value
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
	MOVF       R0+2, 0
	MOVWF      _temp+2
	MOVF       R0+3, 0
	MOVWF      _temp+3
;project.c,39 :: 		floattostr(temp,temp_txt); // convert numbers to string
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _temp_txt+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;project.c,41 :: 		if ( v <= 0.4 ) {           // if voltage equal or less than 0.4 volt
	MOVF       _v+0, 0
	MOVWF      R4+0
	MOVF       _v+1, 0
	MOVWF      R4+1
	MOVF       _v+2, 0
	MOVWF      R4+2
	MOVF       _v+3, 0
	MOVWF      R4+3
	MOVLW      205
	MOVWF      R0+0
	MOVLW      204
	MOVWF      R0+1
	MOVLW      76
	MOVWF      R0+2
	MOVLW      125
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;project.c,42 :: 		portc=0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;project.c,43 :: 		lcd_out(1,3,"Temperature ");         // print all
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_project+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project.c,44 :: 		lcd_out(2,1,temp_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project.c,45 :: 		}
L_main2:
;project.c,47 :: 		if ( v > 0.4 ) {                // if voltage greater than 0.4 volt
	MOVF       _v+0, 0
	MOVWF      R4+0
	MOVF       _v+1, 0
	MOVWF      R4+1
	MOVF       _v+2, 0
	MOVWF      R4+2
	MOVF       _v+3, 0
	MOVWF      R4+3
	MOVLW      205
	MOVWF      R0+0
	MOVLW      204
	MOVWF      R0+1
	MOVLW      76
	MOVWF      R0+2
	MOVLW      125
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;project.c,48 :: 		portc=0b00000010;
	MOVLW      2
	MOVWF      PORTC+0
;project.c,49 :: 		lcd_out(1,3,"Temperature ");       // print all
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_project+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project.c,50 :: 		lcd_out(2,1,temp_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;project.c,51 :: 		}
L_main3:
;project.c,52 :: 		}
	GOTO       L_main0
;project.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
