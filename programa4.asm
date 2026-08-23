;inicio del codigo
section .data
	mensaje: db 'presione una tecla y luego enter' ,0xa
	mensaje_tamano: equ $-mensaje
	db variable ;almacenamiento de la tecla

;bandera de texto
section .text
	global _start
	global _mensaje
	global _registro_datos
	global _tecla
	global _enter
	global _guardar_enter

_start:
	;impresion de texto 1
	mov rax,1
	mov rdi,1
	mov rsi,mensaje1
	mov rdx,mensaje_tamano

	;inicio de la segunda bandera
_mensaje:
	syscall ;syscall para primer bloque

	mov rax,0
	mov rdi,0
	mov rsi,variable
	mov rdx,N
	
_registro_datos:; bandera para datos
	syscall ;syscall para segundo bloque

_tecla: ;bandera para tecla
	;bloque para capturar el enter
	mov rax,0
	mov rdi,0
	mov rsi,enter
	mov rdx,N

_guardar_enter:
