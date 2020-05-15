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
Ltmp3:
	.cfi_offset %rbx, -32
Ltmp4:
	.cfi_offset %r14, -24
Ltmp5:
	.cfi_offset %rbp, -16
	leaq	L_.str(%rip), %r14
	xorl	%esi, %esi
	xorl	%eax, %eax
	movq	%r14, %rdi
	callq	_printf
	movl	$5, %ebp
	jmp	LBB0_1
	.align	4, 0x90
LBB0_2:                                 ## %while.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_printf
	decl	%ebp
	movl	$8, %ebx
	jmp	LBB0_3
	.align	4, 0x90
LBB0_4:                                 ## %while.body2
                                        ##   in Loop: Header=BB0_3 Depth=2
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	_printf
	incl	%ebx
LBB0_3:                                 ## %while.cond1
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	$9, %ebx
	jle	LBB0_4
LBB0_1:                                 ## %while.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	testl	%ebp, %ebp
	jg	LBB0_2
## BB#5:                                ## %while.end
	sete	%al
	movzbl	%al, %esi
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"


.subsections_via_symbols
