	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_printArray
	.align	4, 0x90
_printArray:                            ## @printArray
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
	pushq	%rbx
Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rax
Ltmp4:
	.cfi_def_cfa_offset 48
Ltmp5:
	.cfi_offset %rbx, -40
Ltmp6:
	.cfi_offset %r14, -32
Ltmp7:
	.cfi_offset %r15, -24
Ltmp8:
	.cfi_offset %rbp, -16
	movl	%esi, %ebp
	movq	%rdi, %r14
	decl	%ebp
	leaq	L_.str1(%rip), %r15
	xorl	%ebx, %ebx
	jmp	LBB0_1
	.align	4, 0x90
LBB0_2:                                 ## %while.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	movslq	%ebx, %rax
	movl	(%r14,%rax,4), %esi
	xorl	%eax, %eax
	movq	%r15, %rdi
	callq	_printf
	incl	%ebx
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	%ebp, %ebx
	jl	LBB0_2
## BB#3:                                ## %while.end
	movslq	%ebx, %rax
	movl	(%r14,%rax,4), %esi
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	subq	$24, %rsp
Ltmp9:
	.cfi_def_cfa_offset 32
	movl	$1, (%rsp)
	movl	$1, 4(%rsp)
	movl	$2, 8(%rsp)
	movl	$3, 12(%rsp)
	movl	$5, 16(%rsp)
	leaq	(%rsp), %rdi
	movl	$5, %esi
	callq	_printArray
	leaq	L_.str(%rip), %rdi
	movl	$10, %esi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"

L_.str1:                                ## @.str1
	.asciz	"%d,"


.subsections_via_symbols
