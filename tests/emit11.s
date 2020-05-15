	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
	pushq	%r15
Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%r14
Ltmp2:
	.cfi_def_cfa_offset 32
	pushq	%r13
Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%r12
Ltmp4:
	.cfi_def_cfa_offset 48
	pushq	%rbx
Ltmp5:
	.cfi_def_cfa_offset 56
	pushq	%rax
Ltmp6:
	.cfi_def_cfa_offset 64
Ltmp7:
	.cfi_offset %rbx, -56
Ltmp8:
	.cfi_offset %r12, -48
Ltmp9:
	.cfi_offset %r13, -40
Ltmp10:
	.cfi_offset %r14, -32
Ltmp11:
	.cfi_offset %r15, -24
Ltmp12:
	.cfi_offset %rbp, -16
	movl	$1, %r14d
	movl	$5, %ebx
	leaq	L_.str1(%rip), %r12
	leaq	L_.str(%rip), %r13
	jmp	LBB0_1
	.align	4, 0x90
LBB0_7:                                 ## %if.else
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%r13, %rdi
	callq	_printf
	movl	%ebp, %ebx
	movl	%r15d, %r14d
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	movl	%r14d, %r15d
	testl	%r15d, %r15d
	je	LBB0_2
## BB#4:                                ## %and.rhs
                                        ##   in Loop: Header=BB0_1 Depth=1
	testl	%ebx, %ebx
	setne	%al
	jmp	LBB0_5
	.align	4, 0x90
LBB0_2:                                 ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
LBB0_5:                                 ## %and.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	testb	%al, %al
	je	LBB0_3
## BB#6:                                ## %if.cond
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%r14d, %r14d
	xorl	%eax, %eax
	movq	%r12, %rdi
	movl	%ebx, %esi
	callq	_printf
	leal	-1(%rbx), %ebp
	cmpl	$2, %ebx
	movl	%ebp, %ebx
	je	LBB0_1
	jmp	LBB0_7
LBB0_3:                                 ## %while.end
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"y != 1\n"

L_.str1:                                ## @.str1
	.asciz	"%d\n"


.subsections_via_symbols
