	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rbx
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbx, -16
	leaq	L_.str1(%rip), %rbx
	movl	$1, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	movl	$97, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	leaq	L_.str(%rip), %rbx
	movl	$98, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	movl	$97, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	xorl	%eax, %eax
	popq	%rbx
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%c\n"

L_.str1:                                ## @.str1
	.asciz	"%d\n"


.subsections_via_symbols
