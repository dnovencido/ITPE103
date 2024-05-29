.model small
.stack 100h

.data
LF EQU 0AH           ; Define LF as the line feed (new line) character
CR EQU 0DH           ; Define CR as the carriage return character
MSG DB 'Hello, world!', CR, LF, '$'  ; Define a message with CR and LF

.code
main:
    mov ax, @data    ; Initialize DS with the address of the data segment
    mov ds, ax

    ; Display the message MSG
    mov ah, 09h      ; DOS function to display a string
    lea dx, MSG      ; Load the address of MSG into DX
    int 21h          ; Call DOS interrupt

    ; Example of using LF directly
    mov ah, 02h      ; DOS function to display a character
    mov dl, LF       ; Load DL with the LF constant
    int 21h          ; Call DOS interrupt to display LF (new line)

    ; Example of using CR directly
    mov ah, 02h      ; DOS function to display a character
    mov dl, CR       ; Load DL with the CR constant
    int 21h          ; Call DOS interrupt to display CR (carriage return)

    ; Terminate the program
    mov ah, 4Ch      ; DOS function to terminate the program
    int 21h

end main

