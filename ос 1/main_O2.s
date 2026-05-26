	.file	"main.cpp"
	.text
	.p2align 4,,15
	.def	__tcf_0;	.scl	3;	.type	32;	.endef
	.seh_proc	__tcf_0
__tcf_0:
.LFB2081:
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	jmp	_ZNSt8ios_base4InitD1Ev
	.seh_endproc
	.p2align 4,,15
	.globl	_Z9factoriali
	.def	_Z9factoriali;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9factoriali
_Z9factoriali:
.LFB1594:
	.seh_endprologue
	testl	%ecx, %ecx
	jle	.L6
	subl	$1, %ecx
	movl	$1, %edx
	movl	$1, %eax
	addq	$2, %rcx
	.p2align 4,,10
.L5:
	imulq	%rdx, %rax
	addq	$1, %rdx
	cmpq	%rcx, %rdx
	jne	.L5
	ret
	.p2align 4,,10
.L6:
	movl	$1, %eax
	ret
	.seh_endproc
	.p2align 4,,15
	.globl	_Z9fibonaccii
	.def	_Z9fibonaccii;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9fibonaccii
_Z9fibonaccii:
.LFB1595:
	.seh_endprologue
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jle	.L8
	cmpl	$1, %ecx
	movl	$1, %eax
	je	.L8
	movl	$1, %r8d
	xorl	%r9d, %r9d
	movl	$2, %edx
	.p2align 4,,10
.L10:
	leaq	(%r9,%r8), %rax
	addl	$1, %edx
	movq	%r8, %r9
	cmpl	%edx, %ecx
	movq	%rax, %r8
	jge	.L10
.L8:
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
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1596:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	$13, %r8d
	leaq	.LC0(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	$10, %edx
	call	_ZNSolsEi
	leaq	.LC1(%rip), %rdx
	movl	$4, %r8d
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$1, %eax
	movl	$1, %edx
	.p2align 4,,10
.L16:
	imulq	%rax, %rdx
	addq	$1, %rax
	cmpq	$11, %rax
	jne	.L16
	movq	%rbx, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	$13, %r8d
	leaq	.LC3(%rip), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movq	.refptr._ZSt4cout(%rip), %rcx
	movl	$10, %edx
	call	_ZNSolsEi
	leaq	.LC1(%rip), %rdx
	movl	$4, %r8d
	movq	%rax, %rcx
	movq	%rax, %rbx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x
	movl	$9, %eax
	movl	$1, %edx
	xorl	%ecx, %ecx
	.p2align 4,,10
.L17:
	leaq	(%rcx,%rdx), %r8
	subl	$1, %eax
	movq	%rdx, %rcx
	movq	%r8, %rdx
	jne	.L17
	movq	%rbx, %rcx
	call	_ZNSo9_M_insertIyEERSoT_
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4,,15
	.def	_GLOBAL__sub_I__Z9factoriali;	.scl	3;	.type	32;	.endef
	.seh_proc	_GLOBAL__sub_I__Z9factoriali
_GLOBAL__sub_I__Z9factoriali:
.LFB2082:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	leaq	_ZStL8__ioinit(%rip), %rcx
	call	_ZNSt8ios_base4InitC1Ev
	leaq	__tcf_0(%rip), %rcx
	addq	$40, %rsp
	jmp	atexit
	.seh_endproc
	.section	.ctors,"w"
	.align 8
	.quad	_GLOBAL__sub_I__Z9factoriali
.lcomm _ZStL8__ioinit,1,1
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x;	.scl	2;	.type	32;	.endef
	.def	_ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	_ZNSo9_M_insertIyEERSoT_;	.scl	2;	.type	32;	.endef
	.def	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	atexit;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZSt4cout, "dr"
	.globl	.refptr._ZSt4cout
	.linkonce	discard
.refptr._ZSt4cout:
	.quad	_ZSt4cout
