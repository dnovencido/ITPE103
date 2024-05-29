.model small
.stack 100h

.data
w_array db 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10    ; Define an array of bytes

.code
main:
    mov ax, @data               ; Initialize Data Segment
    mov ds, ax

    mov si, offset w_array      ; Load the address of w_array into SI
    mov cx, 11                  ; Set the loop counter to the number of elements in the array

print_loop:
    mov dl, [si]                ; Load the byte at the address in SI into DL
    add dl, 30h                 ; Convert the byte to ASCII (assuming it contains values in the range 0-9)
    mov ah, 02h                 ; Function to print character
    int 21h                     ; Print the character in DL

    inc si                      ; Move to the next element in the array
    loop print_loop             ; Repeat until all elements are printed

    mov ah, 4Ch                 ; Exit program
    int 21h

end main




