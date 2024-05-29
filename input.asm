.model small
.stack 100h

.data
    msg1 db 13,10, 'Enter your name: $'
    msg2 db 13,10, 'Your name is: $'   
    buffer db 21, ?, 20 dup('$')  

.code
main:
    mov ax, @data
    mov ds, ax

    mov ah, 09h         ; print prompt
    lea dx, msg1
    int 21h

    mov ah, 0Ah         ; read string
    lea dx, buffer
    int 21h

    mov ah, 09h         ; print message with input
    lea dx, msg2
    int 21h

    mov ah, 09h         ; print user input
    lea dx, buffer + 2  ; get to the actual input
    int 21h

    mov ah, 4Ch         ; terminate program
    int 21h

end main
