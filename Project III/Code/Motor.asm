
_main:

;Motor.c,2 :: 		void main()
;Motor.c,4 :: 		TRISB= 0;
	CLRF       TRISB+0
;Motor.c,5 :: 		portb=0;
	CLRF       PORTB+0
;Motor.c,6 :: 		PWM1_Init(1000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Motor.c,7 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Motor.c,8 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Motor.c,10 :: 		while(1)
L_main0:
;Motor.c,13 :: 		v = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _v+0
	MOVF       R0+1, 0
	MOVWF      _v+1
;Motor.c,14 :: 		duty = (V)/4;
	MOVLW      4
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _duty+0
	MOVF       R0+1, 0
	MOVWF      _duty+1
;Motor.c,15 :: 		PWM1_Set_Duty(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Motor.c,18 :: 		PORTB.B0 = 0 ;
	BCF        PORTB+0, 0
;Motor.c,19 :: 		PORTB.B1 = 1;
	BSF        PORTB+0, 1
;Motor.c,20 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;Motor.c,22 :: 		PORTB.B0 = 1;
	BSF        PORTB+0, 0
;Motor.c,23 :: 		PORTB.B1 = 0;
	BCF        PORTB+0, 1
;Motor.c,24 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Motor.c,27 :: 		}
	GOTO       L_main0
;Motor.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
