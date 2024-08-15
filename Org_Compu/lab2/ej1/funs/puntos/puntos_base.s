.ifndef puntos_base
.equ puntos_base, 0

.include "data.s"
.include "core/rectangulo.s"
.include "core/circulo.s"

.globl puntos_base

/*
Fun: puntos_base
Hace: La función dibuja una numero en la letra de un reloj

Parámetros:
    X1 -> Coordenada x
    X2 -> Coordenada y
*/

puntos_base:
	// Reserva espacio en el stack, guarda las variables que queremos conservar y la dir de retorno en el stack
	SUB SP, SP, #48
    STUR X3, [SP, #0]
    STUR X4, [SP, #8]
    STUR X5, [SP, #16]
    STUR X9, [SP, #24]
    STUR X10, [SP, #32]
    STUR LR, [SP, #40]
	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    MOV X9, X1
    MOV X10, X2

	// Area donde va el fondo
	MOV X1, X9
	MOV X2, X10
	MOV X3, #30
	MOV X4, #40
	LDR X5, =BLANCO
	BL rectangulo

	// Rectangulo arriba
	ADD X1, X9, #10
	ADD X2, X10, #5
	MOV X3, #9
	MOV X4, #5
	LDR X5, =GRIS
	BL rectangulo

	// Rectangulo medio
	ADD X1, X9, #10
	ADD X2, X10, #18
	MOV X3, #9
	MOV X4, #5
	LDR X5, =GRIS
	BL rectangulo

	// Rectangulo bajo
    ADD X1, X9, #10
    ADD X2, X10, #30
	MOV X3, #9
	MOV X4, #5
	LDR X5, =GRIS
	BL rectangulo



	// Rectangulo izquierdo superior
	ADD X1, X9, #5
	ADD X2, X10, #5
	MOV X3, #4
	MOV X4, #18
	LDR X5, =GRIS
	BL rectangulo

	// Rectangulo derecho superior
	ADD X1, X9, #20
	ADD X2, X10, #5
	MOV X3, #4
	MOV X4, #18
	LDR X5, =GRIS
	BL rectangulo

	// Rectangulo izquierdo inferior
	ADD X1, X9, #5
	ADD X2, X10, #24
	MOV X3, #4
	MOV X4, #11
	LDR X5, =GRIS
	BL rectangulo

	// Rectangulo derecho inferior
	ADD X1, X9, #20
	ADD X2, X10, #24
	MOV X3, #4
	MOV X4, #11
	LDR X5, =GRIS
	BL rectangulo


	// Regresando lso valores de los parámetros
	MOV X1, X9
	MOV X2, X10

 	// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	// Carga la dirección de retorno, devuelve los valores previos de las variables usadas y libera la memoria del stack
	LDUR X3, [SP, #0]
    LDUR X4, [SP, #8]
    LDUR X5, [SP, #16]
    LDUR X9, [SP, #24]
    LDUR X10, [SP, #32]
    LDUR LR, [SP, #40]
	ADD SP, SP, #48
ret

.endif