
CONFIG  FOSC = HS		; Oscillator Selection bits (RC oscillator)
CONFIG  WDTE = OFF            ; Watchdog Timer Enable bit (WDT disabled)
CONFIG  PWRTE = OFF           ; Power-up Timer Enable bit (PWRT disabled)
CONFIG  BOREN = OFF           ; Brown-out Reset Enable bit (BOR disabled)
CONFIG  LVP = OFF             ; Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital IO, HV on MCLR must be used for programming)
CONFIG  CPD = OFF             ; Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
CONFIG  WRT = OFF             ; Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
CONFIG  CP = OFF              ; Flash Program Memory Code Protection bit (Code protection off)


#include <xc.inc>

PSECT start, CLASS = CODE, DELTA=2
start:
    PAGESEL MAIN
    GOTO MAIN

    PORTB EQU 06
    STATUS EQU 03
    
    delay1 equ 0x20
    delay2 equ 0x21
    delay3 equ 0x22
    
    PSECT CODE, DELTA=2
 
    BSF STATUS, 5	

    BCF TRISB, 0	
    BCF TRISB, 1	
    BCF TRISB, 2	

    BCF STATUS, 5	

MAIN:
    BCF PORTB, 0  
    BSF PORTB, 1    
    BCF PORTB, 2   

    call Configuration
    call Scan
    call Intensity10
    call Intensity32
    
    call Digit3
    call G
    call Delay
    
    call Digit2
    call G
    call Digit3
    call O
    call Delay
    
    call Digit1
    call G
    call Digit2
    call O
    call Digit3
    call O
    call Delay
    
    call Digit0
    call G
    call Digit1
    call O
    call Digit2
    call O
    call Digit3
    call D
    call Delay
    
    call Digit0
    call O
    call Digit1
    call O
    call Digit2
    call D
    call Digit3
    call Blank
    call Delay
    
    call Digit0
    call O
    call Digit1
    call D
    call Digit2
    call Blank
    call Digit3
    call M
    call Delay
    
    call Digit0
    call D
    call Digit1
    call Blank
    call Digit2
    call M
    call Digit3
    call O
    call Delay
    
    call Digit0
    call Blank
    call Digit1
    call M
    call Digit2
    call O
    call Digit3
    call R
    call Delay
    
    call Digit0
    call M
    call Digit1
    call O
    call Digit2
    call R
    call Digit3
    call N
    call Delay
    
    call Digit0
    call O
    call Digit1
    call R
    call Digit2
    call N
    call Digit3
    call I
    call Delay
    
    call Digit0
    call R
    call Digit1
    call N
    call Digit2
    call I
    call Digit3
    call N
    call Delay
    
    call Digit0
    call N
    call Digit1
    call I
    call Digit2
    call N
    call Digit3
    call G
    call Delay
    
    call Digit0
    call I
    call Digit1
    call N
    call Digit2
    call G
    call Digit3
    call Blank
    call Delay
    
    call Digit0
    call N
    call Digit1
    call G
    call Digit2
    call Blank
    call Digit3
    call Blank
    call Delay
    
    call Digit0
    call G
    call Digit1
    call Blank
    call Digit2
    call Blank
    call Digit3
    call Blank
    call Delay
    
    call Digit0
    call Blank
    call Digit1
    call Blank
    call Digit2
    call Blank
    call Digit3
    call Blank
    call Delay

    GOTO MAIN
    
Configuration: 
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BSF PORTB, 1    ;CS HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    
return
    
Scan:  
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BSF PORTB, 1    ;CS HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    
return
    
Intensity10:	
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BSF PORTB, 1    ;CS HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    
return
    
Intensity32:	
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 0    ;DIN LOW
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BCF PORTB, 2    ;CLK LOW
    BSF PORTB, 0    ;DIN HIGH
    BSF PORTB, 2    ;CLK HIGH
    BSF PORTB, 1    ;CS HIGH
    BCF PORTB, 2    ;CLK LOW
    BCF PORTB, 1    ;CS LOW
    
return         
   
Digit0:	 
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
return
    
Digit1:	  
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
return

Digit2:		
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    
return

Digit3:	   
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
return

G: ;0100 0111
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
return

O: ;0100 1111
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
return
 
D: ;0100 0100  
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
return
  
M: ;0100 1101  
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
return
    

    
R: ;0101 0010	  
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
return
    
N: ;0100 1110	   
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
return
    
I: ;0100 1001	   
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW
return
    

  
    
Blank:	   
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BSF PORTB, 0;DIN HIGH
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 0;DIN LOW
    BSF PORTB, 2;CLK HIGH
    BSF PORTB, 1;CS HIGH
    BCF PORTB, 2;CLK LOW
    BCF PORTB, 1;CS LOW    
return

Delay:
    MOVLW 0xff
    MOVWF delay1
    MOVWF delay2
    MOVWF delay3
    
delay_time:
    DECFSZ delay1
    goto delay_time
    
    MOVLW 0xff
    MOVWF delay1
    DECFSZ delay2
    goto delay_time
    
    MOVLW 0x0f
    MOVWF delay2
    DECFSZ delay3
    goto delay_time
return
    
END