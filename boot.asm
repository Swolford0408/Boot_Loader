BITS 16 ;Puts the program in 16 mode
org 0x7c00 ;Tells the segment to start the program at

mov [drive], dl

mov ah, 0
mov al, 03
int 10h

puts:
    mov si, 0
    mov ah, 0eh
    mov bh, 0
print_loop:
    mov al, [message + si]
    int 10h
    inc si
    cmp si, message_length
    jne print_loop

halt:
    hlt

drive: resb 1 ;creates a label to hold the drive number
message: db "Loaded Boot Sector" ;creates a message to let be known when the boot loader has been created
message_length equ $ - message

times 510 - ($-$$) db 0
dw 0xAA55
