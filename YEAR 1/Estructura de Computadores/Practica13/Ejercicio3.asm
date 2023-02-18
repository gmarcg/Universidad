.data

datos1:	.half 4,7,2
	.align 2
	.word 1, -5
	.byte 4
	.align 1
	.half 3
	.align 2
	.word -3
	.space 2
	.byte 'c'

datos2:.byte 2,3,5,7

res1: .asciiz "\nLa suma del primer word y del half con valor 3 es: "
res2: .asciiz "\nEl byte inicializado a 4 en la etiqueta datos1 contiene el numero en ascii "

	.globl main
	.text

main:

	la $t0, datos1		#Cargo la etiqueta de datos1 en t0
	
	lw $t1, 8($t0)		#Cargo el word con valor 1 en t1
	
	lh $t2, 18($t0)		#Cargo el half con valor 3 en t2
	
	add $t3, $t1, $t2	#Almaceno en t3 la suma de t1 y t2
	
	sh $t3, 24($t0)		#Guardo en el espacio de 2 reservado el half resultado de la suma
	
	li $v0, 4
	la $a0, res1
	syscall
	
	li $v0, 1
	lh $a0, 24($t0)
	syscall
	
	la $t0, datos2		#Cargo la etiqueta de datos2 en t0
	
	lb $t4, -1($t0)		#Cargo en t4 el byte c de la etiqueta de datos
	
	addi $t5, $t4, 2	#Guardo en t5 c + 2, que en ascii es la letra e
	
	sb $t5, -11($t0)	#Guardo en el byte 4 de la etiqueta datos1 la letra e
  
	li $v0, 4
	la $a0, res2
	syscall
	
	li $v0, 1
	lb $a0, -11($t0)
	syscall
	
	li $v0, 10
	syscall
