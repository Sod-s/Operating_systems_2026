	.file	"main.cpp"
	.text
	.section .rdata,"dr"
_ZStL19piecewise_construct:
	.space 1
.lcomm _ZStL8__ioinit,1,1
	.text
	.globl	_Z9factoriali
	.def	_Z9factoriali;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9factoriali
_Z9factoriali:                   # Функция факториала
.LFB1573:                        # Подготовка стека
	pushq	%rbp                 # Сохраняем указатель кадра стека
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	         # Устанавливаем новый указатель кадра (теперь rbp указывает на начало кадра)
	.seh_setframe	%rbp, 0
	subq	$16, %rsp            # Выделяем 16 байт в стеке для локальных переменных
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)       # 16(%rbp) — это аргумент 'n' (пришел из регистра ecx)
	movq	$1, -8(%rbp)         # -8(%rbp) — это переменная 'res' = 1 (занимает 8 байт, так как long long)
	movl	$1, -12(%rbp)        # -12(%rbp) — это счетчик цикла 'i' = 1 (занимает 4 байта)
.L3:                             # Тело цикла
	movl	-12(%rbp), %eax      # Загружаем счетчик 'i' в регистр eax
	cmpl	16(%rbp), %eax       # Сравниваем 'i' с аргументом 'n' (16(%rbp))
	jg	.L2                      # Если i > n, цикл завершен, прыгаем на выход в .L2
	movl	-12(%rbp), %eax      # Снова берем 'i' в eax
	cltq                         # Расширяем 32-битный eax до 64-битного rax (так как res у нас 64-битный)
	movq	-8(%rbp), %rdx       # Загружаем текущее значение 'res' в регистр rdx
	imulq	%rdx, %rax           # Умножаем rdx (res) на rax (i). Результат сохраняется в rax
	movq	%rax, -8(%rbp)       # Записываем полученный результат обратно в 'res' (-8(%rbp))
	addl	$1, -12(%rbp)        # Инкремент счетчика: i++ (-12(%rbp))
	jmp	.L3                      # Возвращаемся на начало цикла
.L2:
	movq	-8(%rbp), %rax       # Помещаем финальное значение 'res' в регистр rax
	addq	$16, %rsp            # Освобождаем 16 байт стека, которые выделяли ранее
	popq	%rbp                 # Восстанавливаем указатель кадра вызывающей функции
	ret                          # Возврат в main
	.seh_endproc
	.globl	_Z9fibonaccii
	.def	_Z9fibonaccii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9fibonaccii
_Z9fibonaccii:
.LFB1574:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	cmpl	$0, 16(%rbp)
	jg	.L6
	movl	$0, %eax
	jmp	.L7
.L6:
	cmpl	$1, 16(%rbp)
	jne	.L8
	movl	$1, %eax
	jmp	.L7
.L8:
	movq	$0, -8(%rbp)
	movq	$1, -16(%rbp)
	movq	$0, -32(%rbp)
	movl	$2, -20(%rbp)
.L10:
	movl	-20(%rbp), %eax
	cmpl	16(%rbp), %eax
	jg	.L9
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	addl	$1, -20(%rbp)
	jmp	.L10
.L9:
	movq	-16(%rbp), %rax
.L7:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Factorial of \0"
.LC1:
	.ascii " is \0"
.LC2:
	.ascii "\12\0"
.LC3:
	.ascii "Fibonacci of \0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1575:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	movl	$10, -84(%rbp)
	leaq	.LC0(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movl	-84(%rbp), %eax
	movl	%eax, %edx
	call	_ZNSolsEi
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rbx
	movl	-84(%rbp), %eax
	movl	%eax, %ecx
	call	_Z9factoriali
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	_ZNSolsEy
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	leaq	.LC3(%rip), %rdx
	movq	.refptr._ZSt4cout(%rip), %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rcx
	movl	-84(%rbp), %eax
	movl	%eax, %edx
	call	_ZNSolsEi
	leaq	.LC1(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	%rax, %rbx
	movl	-84(%rbp), %eax
	movl	%eax, %ecx
	call	_Z9fibonaccii
	movq	%rax, %rdx
	movq	%rbx, %rcx
	call	_ZNSolsEy
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$0, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB2061:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitD1Ev
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_Z41__static_initialization_and_destruction_0ii;	.scl	3;	.type	32;	.endef
	.seh_proc	_Z41__static_initialization_and_destruction_0ii
_Z41__static_initialization_and_destruction_0ii:
.LFB2060:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	cmpl	$1, 16(%rbp)
	jne	.L16
	cmpl	$65535, 24(%rbp)
	jne	.L16
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	call	atexit
.L16:
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	_GLOBAL__sub_I__Z9factoriali;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__Z9factoriali
_GLOBAL__sub_I__Z9factoriali:
.LFB2062:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$65535, %edx
	movl	$1, %ecx
	call	_Z41__static_initialization_and_destruction_0ii
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I__Z9factoriali
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEy;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
