.model small
.stack 100h

.data
    num1 dw 5        ; First number
    num2 dw 10       ; Second number
    result dw ?      ; Variable to store the result
    buffer db 6 dup('$') ; Buffer to store the ASCII representation of the number

.code
main proc

    mov ax, @data    ; Initialize data segment 
    mov ds, ax       ; 

    ; Call the add_numbers procedure
    mov ax, num1     ; Load first number (5) into AX 
    mov bx, num2     ; Load second number (10) into BX
    call add_numbers ; Call the procedure to add numbers

    ; Store the result
    mov result, ax ; result is updated with the sum (15) after calling add_numbers.

    ; Print the result
    mov ax, result      ; AX is loaded with the result (15).
    call print_decimal ; Call the procedure to print AX as decimal

    ; Terminate program
    mov ax, 4C00h
    int 21h
main endp

; Procedure to add two numbers in AX and BX, result in AX
add_numbers proc
    add ax, bx       ; Add BX (10) to AX (5)
    ret              ; Return from the procedure
add_numbers endp

; Procedure to print AX as a decimal number
print_decimal proc
    push ax          ; Save AX (15)
    push dx          ; Save DX (Undefined)
    lea si, buffer   ; Load address of buffer into SI
    mov cx, 10       ; Set divisor to 10

    ; Convert number to ASCII string
convert_loop:
    xor dx, dx       ; Clear DX for division
    div cx           ; Divide AX by 10
    add dl, '0'      ; Convert remainder to ASCII
    dec si           ; Move to the previous position in buffer
    mov [si], dl     ; Store digit in buffer
    test ax, ax      ; Check if quotient is 0
    jnz convert_loop ; Repeat if quotient is not 0

    ; Print the number
print_loop:
    lodsb            ; Load next character from buffer
    cmp al, '$'      ; Check for end of buffer
    je print_done    ; If end, jump to done
    mov ah, 2        ; Function to print a character
    mov dl, al       ; Character to print
    int 21h          ; DOS interrupt
    jmp print_loop   ; Repeat for next character

print_done:
    ; Print newline
    mov ah, 2        ; Function to print a character
    mov dl, 13       ; Carriage return
    int 21h
    mov dl, 10       ; Line feed
    int 21h

    pop dx           ; Restore DX
    pop ax           ; Restore AX
    ret
print_decimal endp

end main
