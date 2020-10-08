.data
ingreso: .asciiz "Ingrese un numero: "

.text
.globl main
main:

# Pedis y almacenas el numero
	li $v0, 4
	la $a0, ingreso
	syscall
	li $v0, 5
	syscall
	move $a0, $v0

#Llamo a factorial
jal factorial

#Imprime resultado
move      $a0, $v0
li        $v0, 1
syscall


#Salida
li $v0, 10
syscall


factorial:
#Prologo
	addi $sp, $sp, -4
	sw $a0, 0($sp)

	li $s0, 1

loop:
	beq $a0, $zero, return		#while(t0 != 0){
	mul $s0, $s0, $a0			#	t1 *= t0;
	addi $a0, $a0, -1			#	Le restamos 1 a a0;
	j loop

return:
	move $v0, $s0

#Epilogo
	lw $a0, 0($sp)
	addi $sp, $sp, 4

	jr $ra 				
