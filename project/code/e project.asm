
_automatic_traffic:

;e project.c,3 :: 		void automatic_traffic() {
;e project.c,4 :: 		while(porta.b1 == 1) {
L_automatic_traffic0:
	BTFSS      PORTA+0, 1
	GOTO       L_automatic_traffic1
;e project.c,5 :: 		for(timer = 15; timer > 0; timer--) {
	MOVLW      15
	MOVWF      _timer+0
	MOVLW      0
	MOVWF      _timer+1
L_automatic_traffic2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _timer+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic36
	MOVF       _timer+0, 0
	SUBLW      0
L__automatic_traffic36:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic3
;e project.c,6 :: 		portb = (timer % 10) + (timer / 10) * 16;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _timer+0, 0
	MOVWF      R0+0
	MOVF       _timer+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__automatic_traffic+0
	MOVF       R0+1, 0
	MOVWF      FLOC__automatic_traffic+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _timer+0, 0
	MOVWF      R0+0
	MOVF       _timer+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R3+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
L__automatic_traffic37:
	BTFSC      STATUS+0, 2
	GOTO       L__automatic_traffic38
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__automatic_traffic37
L__automatic_traffic38:
	MOVF       R2+0, 0
	ADDWF      FLOC__automatic_traffic+0, 0
	MOVWF      PORTB+0
;e project.c,7 :: 		portc =255;
	MOVLW      255
	MOVWF      PORTC+0
;e project.c,9 :: 		if(timer > 3) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _timer+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic39
	MOVF       _timer+0, 0
	SUBLW      3
L__automatic_traffic39:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic5
;e project.c,10 :: 		portd.B0 = 1; portd.B3 = 1;
	BSF        PORTD+0, 0
	BSF        PORTD+0, 3
;e project.c,11 :: 		portd.B1 = 0; portd.B2 = 0; portd.B4 = 0; portd.B5 = 0;
	BCF        PORTD+0, 1
	BCF        PORTD+0, 2
	BCF        PORTD+0, 4
	BCF        PORTD+0, 5
;e project.c,12 :: 		} else {
	GOTO       L_automatic_traffic6
L_automatic_traffic5:
;e project.c,13 :: 		portd.B4 = 1; portd.B0 = 1;
	BSF        PORTD+0, 4
	BSF        PORTD+0, 0
;e project.c,14 :: 		portd.B1 = 0; portd.B2 = 0; portd.B5 = 0; portd.B3 = 0;
	BCF        PORTD+0, 1
	BCF        PORTD+0, 2
	BCF        PORTD+0, 5
	BCF        PORTD+0, 3
;e project.c,15 :: 		}
L_automatic_traffic6:
;e project.c,17 :: 		if(porta.b1 == 0) {
	BTFSC      PORTA+0, 1
	GOTO       L_automatic_traffic7
;e project.c,18 :: 		portb = 0;
	CLRF       PORTB+0
;e project.c,19 :: 		break;
	GOTO       L_automatic_traffic3
;e project.c,20 :: 		}
L_automatic_traffic7:
;e project.c,22 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_automatic_traffic8:
	DECFSZ     R13+0, 1
	GOTO       L_automatic_traffic8
	DECFSZ     R12+0, 1
	GOTO       L_automatic_traffic8
	DECFSZ     R11+0, 1
	GOTO       L_automatic_traffic8
	NOP
	NOP
;e project.c,5 :: 		for(timer = 15; timer > 0; timer--) {
	MOVLW      1
	SUBWF      _timer+0, 1
	BTFSS      STATUS+0, 0
	DECF       _timer+1, 1
;e project.c,23 :: 		}
	GOTO       L_automatic_traffic2
L_automatic_traffic3:
;e project.c,25 :: 		for(timer = 23; timer > 0; timer--) {
	MOVLW      23
	MOVWF      _timer+0
	MOVLW      0
	MOVWF      _timer+1
L_automatic_traffic9:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _timer+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic40
	MOVF       _timer+0, 0
	SUBLW      0
L__automatic_traffic40:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic10
;e project.c,26 :: 		if(porta.b1 == 0) {
	BTFSC      PORTA+0, 1
	GOTO       L_automatic_traffic12
;e project.c,27 :: 		portb = 0;
	CLRF       PORTB+0
;e project.c,28 :: 		break;
	GOTO       L_automatic_traffic10
;e project.c,29 :: 		}
L_automatic_traffic12:
;e project.c,31 :: 		portb = (timer % 10) + (timer / 10) * 16;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _timer+0, 0
	MOVWF      R0+0
	MOVF       _timer+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__automatic_traffic+0
	MOVF       R0+1, 0
	MOVWF      FLOC__automatic_traffic+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _timer+0, 0
	MOVWF      R0+0
	MOVF       _timer+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      4
	MOVWF      R3+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R3+0, 0
L__automatic_traffic41:
	BTFSC      STATUS+0, 2
	GOTO       L__automatic_traffic42
	RLF        R2+0, 1
	BCF        R2+0, 0
	ADDLW      255
	GOTO       L__automatic_traffic41
L__automatic_traffic42:
	MOVF       R2+0, 0
	ADDWF      FLOC__automatic_traffic+0, 0
	MOVWF      PORTB+0
;e project.c,32 :: 		portc = 255;
	MOVLW      255
	MOVWF      PORTC+0
;e project.c,34 :: 		if(timer > 3) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _timer+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__automatic_traffic43
	MOVF       _timer+0, 0
	SUBLW      3
L__automatic_traffic43:
	BTFSC      STATUS+0, 0
	GOTO       L_automatic_traffic13
;e project.c,35 :: 		portd.B2 = 1; portd.B5 = 1;
	BSF        PORTD+0, 2
	BSF        PORTD+0, 5
;e project.c,36 :: 		portd.B0 = 0; portd.B1 = 0; portd.B4 = 0; portd.B3 = 0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 4
	BCF        PORTD+0, 3
;e project.c,37 :: 		} else {
	GOTO       L_automatic_traffic14
L_automatic_traffic13:
;e project.c,38 :: 		portd.B1 = 1; portd.B5 = 1;
	BSF        PORTD+0, 1
	BSF        PORTD+0, 5
;e project.c,39 :: 		portd.B0 = 0; portd.B2 = 0; portd.B4 = 0; portd.B3 = 0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 4
	BCF        PORTD+0, 3
;e project.c,40 :: 		}
L_automatic_traffic14:
;e project.c,42 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_automatic_traffic15:
	DECFSZ     R13+0, 1
	GOTO       L_automatic_traffic15
	DECFSZ     R12+0, 1
	GOTO       L_automatic_traffic15
	DECFSZ     R11+0, 1
	GOTO       L_automatic_traffic15
	NOP
	NOP
;e project.c,25 :: 		for(timer = 23; timer > 0; timer--) {
	MOVLW      1
	SUBWF      _timer+0, 1
	BTFSS      STATUS+0, 0
	DECF       _timer+1, 1
;e project.c,43 :: 		}
	GOTO       L_automatic_traffic9
L_automatic_traffic10:
;e project.c,44 :: 		}
	GOTO       L_automatic_traffic0
L_automatic_traffic1:
;e project.c,45 :: 		}
L_end_automatic_traffic:
	RETURN
; end of _automatic_traffic

_manual_traffic:

;e project.c,47 :: 		void manual_traffic() {
;e project.c,48 :: 		if(porta.b1 == 0 && porta.b2 == 0) {
	BTFSC      PORTA+0, 1
	GOTO       L_manual_traffic18
	BTFSC      PORTA+0, 2
	GOTO       L_manual_traffic18
L__manual_traffic34:
;e project.c,49 :: 		if(portd.B2 == 1 || portd.B1 == 1) {
	BTFSC      PORTD+0, 2
	GOTO       L__manual_traffic33
	BTFSC      PORTD+0, 1
	GOTO       L__manual_traffic33
	GOTO       L_manual_traffic21
L__manual_traffic33:
;e project.c,50 :: 		portd.B1 = 1; portd.B5 = 1;
	BSF        PORTD+0, 1
	BSF        PORTD+0, 5
;e project.c,51 :: 		portd.B2 = 0; portd.B0 = 0; portd.B3 = 0; portd.B4 = 0;
	BCF        PORTD+0, 2
	BCF        PORTD+0, 0
	BCF        PORTD+0, 3
	BCF        PORTD+0, 4
;e project.c,52 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_manual_traffic22:
	DECFSZ     R13+0, 1
	GOTO       L_manual_traffic22
	DECFSZ     R12+0, 1
	GOTO       L_manual_traffic22
	DECFSZ     R11+0, 1
	GOTO       L_manual_traffic22
	NOP
;e project.c,53 :: 		portd.B0 = 1; portd.B3 = 1;
	BSF        PORTD+0, 0
	BSF        PORTD+0, 3
;e project.c,54 :: 		portd.B2 = 0; portd.B1 = 0; portd.B5 = 0; portd.B4 = 0;
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
;e project.c,55 :: 		} else if(portd.B3 == 1 || portd.B4 == 1) {
	GOTO       L_manual_traffic23
L_manual_traffic21:
	BTFSC      PORTD+0, 3
	GOTO       L__manual_traffic32
	BTFSC      PORTD+0, 4
	GOTO       L__manual_traffic32
	GOTO       L_manual_traffic26
L__manual_traffic32:
;e project.c,56 :: 		portd.B4 = 1; portd.B0 = 1;
	BSF        PORTD+0, 4
	BSF        PORTD+0, 0
;e project.c,57 :: 		portd.B2 = 0; portd.B1 = 0; portd.B3 = 0; portd.B5 = 0;
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
;e project.c,58 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_manual_traffic27:
	DECFSZ     R13+0, 1
	GOTO       L_manual_traffic27
	DECFSZ     R12+0, 1
	GOTO       L_manual_traffic27
	DECFSZ     R11+0, 1
	GOTO       L_manual_traffic27
	NOP
;e project.c,59 :: 		portd.B5 = 1; portd.B2 = 1;
	BSF        PORTD+0, 5
	BSF        PORTD+0, 2
;e project.c,60 :: 		portd.B0 = 0; portd.B1 = 0; portd.B3 = 0; portd.B4 = 0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BCF        PORTD+0, 4
;e project.c,61 :: 		}
L_manual_traffic26:
L_manual_traffic23:
;e project.c,62 :: 		}
L_manual_traffic18:
;e project.c,63 :: 		}
L_end_manual_traffic:
	RETURN
; end of _manual_traffic

_main:

;e project.c,65 :: 		void main() {
;e project.c,66 :: 		adcon1 = 7;
	MOVLW      7
	MOVWF      ADCON1+0
;e project.c,67 :: 		trisa =  0b11111;
	MOVLW      31
	MOVWF      TRISA+0
;e project.c,68 :: 		trisb = 0;
	CLRF       TRISB+0
;e project.c,69 :: 		trisc = 0;
	CLRF       TRISC+0
;e project.c,70 :: 		trisd = 0;
	CLRF       TRISD+0
;e project.c,72 :: 		porta = 0b11111;
	MOVLW      31
	MOVWF      PORTA+0
;e project.c,73 :: 		portb = 0;
	CLRF       PORTB+0
;e project.c,74 :: 		portc = 0xff;
	MOVLW      255
	MOVWF      PORTC+0
;e project.c,75 :: 		portd = 0;
	CLRF       PORTD+0
;e project.c,77 :: 		while(porta.b0 == 1);
L_main28:
	BTFSS      PORTA+0, 0
	GOTO       L_main29
	GOTO       L_main28
L_main29:
;e project.c,79 :: 		while(1) {
L_main30:
;e project.c,80 :: 		automatic_traffic();
	CALL       _automatic_traffic+0
;e project.c,81 :: 		manual_traffic();
	CALL       _manual_traffic+0
;e project.c,82 :: 		}
	GOTO       L_main30
;e project.c,83 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
