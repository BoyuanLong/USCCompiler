	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rax
Ltmp0:
	.cfi_def_cfa_offset 16
	movl	$10, %eax
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	LBB0_1
	.align	4, 0x90
LBB0_3:                                 ## %if.else
                                        ##   in Loop: Header=BB0_1 Depth=1
	movl	$50, %esi
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	testl	%eax, %eax
	jle	LBB0_4
## BB#2:                                ## %if.cond
                                        ##   in Loop: Header=BB0_1 Depth=1
	decl	%eax
	movl	$100, %esi
	testb	%cl, %cl
	jne	LBB0_1
	jmp	LBB0_3
LBB0_4:                                 ## %while.end
	leaq	L_.str(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	popq	%rdx
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"


.subsections_via_symbols
