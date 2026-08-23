;inicio del codigo
section .data
	db variable ;almacenamiento de la tecla

;bandera de texto
section .text
	global_start

_start:
mov rax,0
mov rdi,0
mov rsi,variable
mov rdx,N
syscall
