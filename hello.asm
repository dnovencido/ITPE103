.model small	; Specifies the memory model for the program.
.stack 100h		; Stack segment (reserve memory for the stack segment)

.data
    msg db 'Hello, World!', '$'		; data segment

.code
main:				; Used to mark the beginning of the code segment
    mov ax, @data	; Load the address of the data segment into the AX register
    mov ds, ax		; Set the data segment to the address stored in AX

    mov ah, 09h		; AH = 09h is the "print string" function of DOS	
    lea dx, msg		; Load the offset address of the msg string into the DX register
    int 21h			; Call interrupt 21h to print the string

    mov ah, 4Ch		; AH = 4Ch is the "terminate with return code" function of DOS
    int 21h			; Call interrupt 21h to terminate the program
end main		;end of the code segment