;inicio del codigo
section .data
	mensaje: db 'presione una tecla y luego enter' ,0xa
	mensaje_tamano: equ $-mensaje

	mensaje2: db 'usted preciono la tecla: '
	mensaje2_tamano: equ $-mensaje2

section .bss
	tecla resb 2


;bandera de texto
section .text
	global _start
	global _mensaje
	global _registro_datos
	global _tecla
	global _error_ingreso
	global _mensaje2
	global _cierre

_start:
_error_ingreso:
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

;bloque para verificar si se pulso el enter en posicion 2 de tecla
	movzx rax, byte [tecla +1]  ;se carga segundo byte en rax
	cmp al, 0x0A   ;comparacion de registros
	jne _error_ingreso ;sino se preciona enter se repite mensaje 1 "precione la tecla y luego enter"

;bloque para imprimir en pantalla
	mov rax,1
	mov rdi,1
	mov rsi,mensaje2
	mov rdx,mensaje2_tamano
_mensaje2_tamano:
	syscall

;bloque para imprimir tecla
	mov rax,1
	mov rdi,1
	mov rsi,tecla
	mov rdx,1

_cierre:
	syscall

;-----------------cierra del codigo
	;liberacion de recursos
	mov rax,60
	mov rdi,0
	syscall

