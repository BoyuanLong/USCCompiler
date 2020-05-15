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
	pushq	%r14
Ltmp1:
	.cfi_def_cfa_offset 24
	pushq	%rbx
Ltmp2:
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
Ltmp3:
	.cfi_def_cfa_offset 48
Ltmp4:
	.cfi_offset %rbx, -32
Ltmp5:
	.cfi_offset %r14, -24
Ltmp6:
	.cfi_offset %rbp, -16
	movl	$1, (%rsp)
	movl	$3, 4(%rsp)
	movl	$5, 8(%rsp)
	movl	$10, %ebx
	movl	4(%rsp), %ebp
	addl	$10, %ebp
	leaq	L_.str(%rip), %r14
	jmp	LBB0_1
	.align	4, 0x90
LBB0_2:                                 ## %while.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_printf
	decl	%ebx
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	testl	%ebx, %ebx
	jg	LBB0_2
## BB#3:                                ## %while.end
	movl	8(%rsp), %esi
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"


.subsections_via_symbols
