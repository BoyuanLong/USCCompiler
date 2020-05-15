	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %lor.end
	pushq	%rax
Ltmp0:
	.cfi_def_cfa_offset 16
	leaq	L_.str(%rip), %rdi
	movl	$1, %esi
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
