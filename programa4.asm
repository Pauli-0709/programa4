;inicio del codigo
section .data
	mensaje: db 'presione una tecla y luego enter' ,0xa
	mensaje_tamano: equ $-mensaje

section .bss
	tecla resb 2


;bandera de texto
section .text
	global _start
	global _mensaje
	global _registro_datos
	global _tecla

_start:
	;impresion de texto 1
	mov rax,1
	mov rdi,1
	mov rsi,mensaje
	mov rdx,mensaje_tamano

	;inicio de la segunda bandera
_mensaje:
	syscall ;syscall para primer bloque

	;se captura la tecla pulsada y el enter
	mov rax,0
	mov rdi,0
	mov rsi,tecla
	mov rdx,2

_registro_datos:; bandera para datos
	syscall ;syscall para segundo bloque

_tecla: ;bandera para verificar la tecla

	;liberacion de recursos
	mov rax,60
	mov rdi,0
	syscall

