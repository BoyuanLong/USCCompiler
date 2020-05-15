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
	movl	$1, %ebx
	leaq	L_.str3(%rip), %r15
	leaq	L_.str2(%rip), %r12
	leaq	L_.str1(%rip), %r13
	leaq	L_.str(%rip), %rbp
	jmp	LBB0_1
	.align	4, 0x90
LBB0_6:                                 ## %if.body6
                                        ##   in Loop: Header=BB0_1 Depth=1
	movl	$5, %edx
	xorl	%eax, %eax
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_printf
	incl	%ebx
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	$11, %ebx
	jge	LBB0_14
## BB#2:                                ## %if.cond
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%r15, %rdi
	movl	%ebx, %esi
	callq	_printf
	movl	%ebx, %eax
	shrl	$31, %eax
	addl	%ebx, %eax
	andl	$-2, %eax
	cmpl	%eax, %ebx
	jne	LBB0_7
## BB#3:                                ## %if.cond1
                                        ##   in Loop: Header=BB0_1 Depth=1
	movl	$2, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	_printf
	movslq	%ebx, %r14
	imulq	$1431655766, %r14, %rax ## imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	leal	(%rax,%rax,2), %eax
	cmpl	%eax, %ebx
	jne	LBB0_5
## BB#4:                                ## %if.body2
                                        ##   in Loop: Header=BB0_1 Depth=1
	movl	$3, %edx
	xorl	%eax, %eax
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_printf
LBB0_5:                                 ## %if.cond5
                                        ##   in Loop: Header=BB0_1 Depth=1
	imulq	$1717986919, %r14, %rax ## imm = 0x66666667
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$33, %rax
	addl	%ecx, %eax
	leal	(%rax,%rax,4), %eax
	cmpl	%eax, %ebx
	je	LBB0_6
	jmp	LBB0_13
	.align	4, 0x90
LBB0_7:                                 ## %if.cond9
                                        ##   in Loop: Header=BB0_1 Depth=1
	movslq	%ebx, %rdx
	imulq	$1431655766, %rdx, %rax ## imm = 0x55555556
	movq	%rax, %rcx
	shrq	$63, %rcx
	shrq	$32, %rax
	addl	%ecx, %eax
	leal	(%rax,%rax,2), %eax
	cmpl	%eax, %ebx
	jne	LBB0_10
## BB#8:                                ## %if.body10
                                        ##   in Loop: Header=BB0_1 Depth=1
	movl	$3, %esi
	jmp	LBB0_9
LBB0_10:                                ## %if.cond14
                                        ##   in Loop: Header=BB0_1 Depth=1
	imulq	$1717986919, %rdx, %rax ## imm = 0x66666667
	movq	%rax, %rcx
	shrq	$63, %rcx
	sarq	$33, %rax
	addl	%ecx, %eax
	leal	(%rax,%rax,4), %eax
	cmpl	%eax, %ebx
	jne	LBB0_12
## BB#11:                               ## %if.body15
                                        ##   in Loop: Header=BB0_1 Depth=1
	movl	$5, %esi
LBB0_9:                                 ## %if.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	_printf
	incl	%ebx
	jmp	LBB0_1
LBB0_12:                                ## %if.else18
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%rbp, %rdi
	callq	_printf
	.align	4, 0x90
LBB0_13:                                ## %if.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	incl	%ebx
	jmp	LBB0_1
LBB0_14:                                ## %while.end
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
	.align	4                       ## @.str
L_.str:
	.asciz	" is not a multiple of 2, 3 or 5.\n"

	.align	4                       ## @.str1
L_.str1:
	.asciz	"%d is a multiple of %d.\n"

	.align	4                       ## @.str2
L_.str2:
	.asciz	" is a multiple of %d.\n"

L_.str3:                                ## @.str3
	.asciz	"%d"


.subsections_via_symbols
