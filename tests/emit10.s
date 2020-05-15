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
	subq	$48, %rsp
Ltmp1:
	.cfi_def_cfa_offset 64
Ltmp2:
	.cfi_offset %rbx, -16
	movaps	L_.str1+16(%rip), %xmm0
	movaps	%xmm0, 16(%rsp)
	movaps	L_.str1(%rip), %xmm0
	movaps	%xmm0, (%rsp)
	movl	$6778724, 32(%rsp)      ## imm = 0x676F64
	leaq	L_.str(%rip), %rbx
	leaq	(%rsp), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	leaq	8(%rsp), %rsi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	callq	_printf
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%s\n"

	.align	4                       ## @.str1
L_.str1:
	.asciz	"thequickbrownfoxjumpsoverthelazydog"


.subsections_via_symbols
