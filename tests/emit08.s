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
	xorl	%esi, %esi
	jmp	LBB0_1
	.align	4, 0x90
LBB0_2:                                 ## %while.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	incl	%esi
LBB0_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	$1999999999, %esi       ## imm = 0x773593FF
	jle	LBB0_2
## BB#3:                                ## %while.end
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
