	.file	"main.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "Algoritmos para ensamblador\12\0"
.LC2:
	.ascii "Menu: \0"
.LC3:
	.ascii "1. Invertir arreglo\0"
.LC4:
	.ascii "2. Multiplicacion de matrices\0"
	.align 8
.LC5:
	.ascii "3. Saber si un numero es primo\0"
.LC6:
	.ascii "4. Salir\12\0"
.LC7:
	.ascii "Elegir algoritmo: \0"
.LC8:
	.ascii "%d\0"
	.align 8
.LC9:
	.ascii "Ingresa el valor #%d del arreglo: \0"
.LC10:
	.ascii "%d \0"
.LC11:
	.ascii "\12\0"
.LC12:
	.ascii "Matriz 1\0"
	.align 8
.LC13:
	.ascii "Ingrese un valor para matriz en la posici\363n (%d,%d): \0"
.LC14:
	.ascii "\12Matriz 2\0"
.LC15:
	.ascii "\12Matriz producto:\0"
.LC16:
	.ascii "%-3d\11\0"
	.align 8
.LC17:
	.ascii "Saber si un numero es primo (1-100)\0"
	.align 8
.LC18:
	.ascii "Ingrese un numero (1-100) para saber si es primo: \0"
.LC19:
	.ascii "Entrada invalida.\0"
	.align 8
.LC20:
	.ascii "Numero fuera del rango permitido (1-100).\0"
.LC21:
	.ascii "%d es un numero primo.\12\0"
.LC22:
	.ascii "%d no es un numero primo.\12\0"
.LC23:
	.ascii "Opcion no valida\12\0"
	.align 8
.LC24:
	.ascii "Presione entrar para continuar...\0"
	.data
	.align 32
.LC0:
	.long	0
	.long	1
	.long	1
	.long	1
	.long	2
	.long	2
	.long	2
	.long	2
	.long	2
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	4
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	5
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	6
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	7
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	9
	.long	10
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	subq	$592, %rsp
	.seh_stackalloc	592
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	movl	$1, 460(%rbp)
	movl	$1, 456(%rbp)
	movq	$0, 320(%rbp)
	movq	$0, 328(%rbp)
.L50:
	leaq	.LC1(%rip), %rcx
	call	puts
	leaq	.LC2(%rip), %rcx
	call	puts
	leaq	.LC3(%rip), %rcx
	call	puts
	leaq	.LC4(%rip), %rcx
	call	puts
	leaq	.LC5(%rip), %rcx
	call	puts
	leaq	.LC6(%rip), %rcx
	call	puts
	leaq	.LC7(%rip), %rcx
	call	printf
	leaq	432(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	scanf
	call	getchar
	movl	$10, %ecx
	call	putchar
	movl	432(%rbp), %eax
	cmpl	$2, %eax
	je	.L2
	cmpl	$2, %eax
	jg	.L3
	cmpl	$1, %eax
	je	.L4
	jmp	.L5
.L3:
	cmpl	$3, %eax
	je	.L6
	cmpl	$4, %eax
	je	.L7
	jmp	.L5
.L4:
	movl	$0, 452(%rbp)
	movl	$1, 448(%rbp)
	jmp	.L8
.L9:
	movl	448(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC9(%rip), %rcx
	call	printf
	leaq	400(%rbp), %rax
	movl	452(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	scanf
	addl	$1, 452(%rbp)
	addl	$1, 448(%rbp)
.L8:
	cmpl	$4, 452(%rbp)
	jle	.L9
	call	getchar
	movl	$0, 452(%rbp)
	jmp	.L10
.L11:
	movl	452(%rbp), %eax
	cltq
	movl	400(%rbp,%rax,4), %eax
	movl	%eax, %edx
	leaq	.LC10(%rip), %rcx
	call	printf
	addl	$1, 452(%rbp)
.L10:
	cmpl	$4, 452(%rbp)
	jle	.L11
	movl	$0, 448(%rbp)
	jmp	.L12
.L14:
	subl	$1, 452(%rbp)
	movl	452(%rbp), %eax
	cltq
	movl	400(%rbp,%rax,4), %edx
	movl	448(%rbp), %eax
	cltq
	movl	%edx, 368(%rbp,%rax,4)
	addl	$1, 448(%rbp)
.L12:
	cmpl	$4, 448(%rbp)
	jg	.L13
	cmpl	$0, 452(%rbp)
	jns	.L14
.L13:
	movl	$10, %ecx
	call	putchar
	movl	$0, 452(%rbp)
	jmp	.L15
.L16:
	movl	452(%rbp), %eax
	cltq
	movl	368(%rbp,%rax,4), %eax
	movl	%eax, %edx
	leaq	.LC10(%rip), %rcx
	call	printf
	addl	$1, 452(%rbp)
.L15:
	cmpl	$4, 452(%rbp)
	jle	.L16
	leaq	.LC11(%rip), %rcx
	call	puts
	jmp	.L49
.L2:
	leaq	.LC12(%rip), %rcx
	call	puts
	movl	$0, 452(%rbp)
	jmp	.L18
.L21:
	movl	$0, 448(%rbp)
	jmp	.L19
.L20:
	movl	448(%rbp), %eax
	leal	1(%rax), %edx
	movl	452(%rbp), %eax
	addl	$1, %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC13(%rip), %rcx
	call	printf
	leaq	352(%rbp), %rax
	movl	448(%rbp), %edx
	movslq	%edx, %rdx
	movl	452(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rcx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	scanf
	addl	$1, 448(%rbp)
.L19:
	cmpl	$1, 448(%rbp)
	jle	.L20
	addl	$1, 452(%rbp)
.L18:
	cmpl	$1, 452(%rbp)
	jle	.L21
	leaq	.LC14(%rip), %rcx
	call	puts
	movl	$0, 452(%rbp)
	jmp	.L22
.L25:
	movl	$0, 448(%rbp)
	jmp	.L23
.L24:
	movl	448(%rbp), %eax
	leal	1(%rax), %edx
	movl	452(%rbp), %eax
	addl	$1, %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC13(%rip), %rcx
	call	printf
	leaq	336(%rbp), %rax
	movl	448(%rbp), %edx
	movslq	%edx, %rdx
	movl	452(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rcx
	addq	%rcx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	scanf
	addl	$1, 448(%rbp)
.L23:
	cmpl	$1, 448(%rbp)
	jle	.L24
	addl	$1, 452(%rbp)
.L22:
	cmpl	$1, 452(%rbp)
	jle	.L25
	call	getchar
	movl	$0, 452(%rbp)
	jmp	.L26
.L31:
	movl	$0, 448(%rbp)
	jmp	.L27
.L30:
	movl	$0, 444(%rbp)
	jmp	.L28
.L29:
	movl	448(%rbp), %eax
	cltq
	movl	452(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movl	320(%rbp,%rax,4), %ecx
	movl	444(%rbp), %eax
	cltq
	movl	452(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movl	352(%rbp,%rax,4), %r8d
	movl	448(%rbp), %eax
	cltq
	movl	444(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movl	336(%rbp,%rax,4), %eax
	imull	%r8d, %eax
	leal	(%rcx,%rax), %edx
	movl	448(%rbp), %eax
	cltq
	movl	452(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	%rcx, %rcx
	addq	%rcx, %rax
	movl	%edx, 320(%rbp,%rax,4)
	addl	$1, 444(%rbp)
.L28:
	cmpl	$1, 444(%rbp)
	jle	.L29
	addl	$1, 448(%rbp)
.L27:
	cmpl	$1, 448(%rbp)
	jle	.L30
	addl	$1, 452(%rbp)
.L26:
	cmpl	$1, 452(%rbp)
	jle	.L31
	leaq	.LC15(%rip), %rcx
	call	puts
	movl	$0, 452(%rbp)
	jmp	.L32
.L35:
	movl	$0, 448(%rbp)
	jmp	.L33
.L34:
	movl	448(%rbp), %eax
	cltq
	movl	452(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movl	320(%rbp,%rax,4), %eax
	movl	%eax, %edx
	leaq	.LC16(%rip), %rcx
	call	printf
	addl	$1, 448(%rbp)
.L33:
	cmpl	$1, 448(%rbp)
	jle	.L34
	leaq	.LC11(%rip), %rcx
	call	puts
	addl	$1, 452(%rbp)
.L32:
	cmpl	$1, 452(%rbp)
	jle	.L35
	jmp	.L49
.L6:
	leaq	.LC17(%rip), %rcx
	call	puts
	leaq	-96(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movl	$404, %ecx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	memcpy
	leaq	.LC18(%rip), %rcx
	call	printf
	leaq	316(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC8(%rip), %rcx
	call	scanf
	cmpl	$1, %eax
	je	.L36
	leaq	.LC19(%rip), %rcx
	call	puts
	nop
.L37:
	call	getchar
	cmpl	$10, %eax
	jne	.L37
	jmp	.L49
.L36:
	call	getchar
	movl	316(%rbp), %eax
	testl	%eax, %eax
	jle	.L38
	movl	316(%rbp), %eax
	cmpl	$100, %eax
	jle	.L39
.L38:
	leaq	.LC20(%rip), %rcx
	call	puts
	jmp	.L40
.L39:
	movl	316(%rbp), %eax
	cmpl	$1, %eax
	jg	.L41
	movl	$0, 456(%rbp)
	jmp	.L42
.L41:
	movl	316(%rbp), %eax
	cmpl	$2, %eax
	jne	.L43
	movl	$1, 456(%rbp)
	jmp	.L42
.L43:
	movl	316(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L44
	movl	$0, 456(%rbp)
	jmp	.L42
.L44:
	movl	316(%rbp), %eax
	cltq
	movl	-96(%rbp,%rax,4), %eax
	movl	%eax, 436(%rbp)
	movl	$1, 456(%rbp)
	movl	$3, 440(%rbp)
	jmp	.L45
.L47:
	movl	316(%rbp), %eax
	cltd
	idivl	440(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L46
	movl	$0, 456(%rbp)
	jmp	.L42
.L46:
	addl	$2, 440(%rbp)
.L45:
	movl	440(%rbp), %eax
	cmpl	436(%rbp), %eax
	jle	.L47
.L42:
	cmpl	$1, 456(%rbp)
	jne	.L48
	movl	316(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC21(%rip), %rcx
	call	printf
	jmp	.L40
.L48:
	movl	316(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC22(%rip), %rcx
	call	printf
.L40:
	movl	$10, %ecx
	call	putchar
	jmp	.L49
.L7:
	movl	$0, 460(%rbp)
	jmp	.L49
.L5:
	leaq	.LC23(%rip), %rcx
	call	puts
.L49:
	leaq	.LC24(%rip), %rcx
	call	printf
	call	getchar
	movl	$10, %ecx
	call	putchar
	cmpl	$0, 460(%rbp)
	jne	.L50
	movl	$0, %eax
	addq	$592, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	getchar;	.scl	2;	.type	32;	.endef
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	memcpy;	.scl	2;	.type	32;	.endef
