org 0x7C00
bits 16

start:
  ;Setup stack
  mov ax, 0
  mov ss, ax
  mov sp, 0x7C00

  ;Setup data segments
  mov ax, 0
  mov ds, ax
  mov es, ax

  ;Call main
  call main
  hlt

main:
  ;Load the second sector
  mov ax, 0x8000
  mov es, ax
  mov bx, 0
  mov ax, 0
  mov cx, 1
  mov dx, 0
  int 0x13
  ret

times 510 - ($-$$) db 0
db 0x55AA
