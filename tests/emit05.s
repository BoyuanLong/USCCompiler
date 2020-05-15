	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 19, 3
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	subq	$24, %rsp
Ltmp0:
	.cfi_def_cfa_offset 32
	movabsq	$7308060643404313673, %rax ## imm = 0x656B726F77207449
	movq	%rax, 8(%rsp)
	movb	$0, 18(%rsp)
	movw	$8548, 16(%rsp)         ## imm = 0x2164
	leaq	L_.str(%rip), %rdi
	leaq	8(%rsp), %rsi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%s\n"

L_.str1:                                ## @.str1
	.asciz	"It worked!"


.subsections_via_symbols
