ORG 0x7c00
BITS 16

start:
        mov si, message
        call print
	
	mov si, descrpt
	call print
done:
        jmp $
.ret:
        ret

print:
.next:
        lodsb
        cmp al, 0
        je .ret
        cmp al, 0x0A
        jne .normal
        mov al, 0x0D
        mov ah, 0x0E
        int 0x10
        mov al, 0x0A
        mov ah, 0x0E
        int 0x10
        jmp .next
.normal:
        mov ah, 0x0E
        int 0x10
        jmp .next
.ret:
        ret

message db  0x0A, "                Welcome to Dhaka Linux", 0x0A,"               +----------------------+" ,0x0A, 0

descrpt db 0x9,"  Dhaka Linux, an open source and secure system.",0x0A,0x9,"  Designed for high performance and reliability.",0x0A,0x9,"  Supports parallel processing and heavy workloads.",0x0A,0x9,"  Optimized for efficient resource management.",0x0A, 0x0A, 0

times 510-($-$$) db 0
dw 0xAA55
