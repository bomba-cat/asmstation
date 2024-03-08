org 0x8000
bits 16

print:
  push ax
  push si
.loop:
  lodsb
  cmp al, 0
  je .done
  mov ah, 0x0E
  int 0x10
  jmp .loop
.done:
  pop si
  pop ax
  ret

start:
  mov si, choose_program
  call print
  hlt

choose_program:
  db "Choose your program: ", 0
