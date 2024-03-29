;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   Pzt Mar 18 2019
; Processor: AT89C51
; Compiler:  ASEM-51 (Proteus)
;====================================================================

$NOMOD51
$INCLUDE (8051.MCU)

;====================================================================
; DEFINITIONS
;====================================================================
ORG 8000H
DB 1000000B
DB 1111001B
DB 0100100B
DB 0110000B
DB 0011001B
DB 0010010B
DB 0000010B
DB 1111000B
DB 0000000B
DB 0010000B
DB 08H
DB 03H
DB 27H
DB 21H
DB 06H
DB 0EH
;====================================================================
; VARIABLES
;====================================================================
counter EQU 30H
address EQU 31H
;====================================================================
; RESET and INTERRUPT VECTORS
;====================================================================

      ; Reset Vector
      org   0000h
      jmp   Start

;====================================================================
; CODE SEGMENT
;====================================================================

      org   0100h
Start:	
	  MOV address, #00H
	  MOV counter, #80H
	  MOV DPTR, #8000H
X1:	  
	  MOV A, address
	  MOV B, #16
	  DIV AB
	  MOVC A, @A + DPTR
	  MOV P0, A
	  MOV A, B
	  MOVC A, @A + DPTR
	  MOV P1, A
	  CALL Delay_05sec
	  CALL Delay_05sec
	  MOV P0, #7FH
	  MOV P1, #7FH
	  CALL Delay_05sec
	  MOV R0, address
	  MOV A, @R0
	  MOV B, #16
	  DIV AB
	  MOVC A, @A + DPTR
	  MOV P0, A
	  MOV A, B
	  MOVC A, @A + DPTR
	  MOV P1, A
	  CALL Delay_05sec
	  CALL Delay_05sec
	  MOV P0, #7FH
	  MOV P1, #7FH
	  CALL Delay_05sec
	  INC address
	  MOV A, address
	  CJNE A, counter, X1
	  MOV address, #00H
	  JMP X1
	  
Delay_05sec:    MOV R5, #5
	  L2: 		MOV R6, #200
	  L1: 		MOV R7, #250
	  L0: 		DJNZ R7, L0
				DJNZ R6, L1
				DJNZ R5, L2
				RET
	  
Loop:	
      jmp Loop

;====================================================================
      END
