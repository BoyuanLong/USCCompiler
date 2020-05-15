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
	pushq	%r12
Ltmp3:
	.cfi_def_cfa_offset 40
	pushq	%rbx
Ltmp4:
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
Ltmp5:
	.cfi_def_cfa_offset 64
Ltmp6:
	.cfi_offset %rbx, -48
Ltmp7:
	.cfi_offset %r12, -40
Ltmp8:
	.cfi_offset %r14, -32
Ltmp9:
	.cfi_offset %r15, -24
Ltmp10:
	.cfi_offset %rbp, -16
	movabsq	$9363768820586272, %rax ## imm = 0x21444C524F5720
	movq	%rax, 5(%rsp)
	movabsq	$5717073776924706120, %rax ## imm = 0x4F57204F4C4C4548
	movq	%rax, (%rsp)
	movl	$5, %r15d
	movl	$2, %ebx
	movsbl	(%rsp), %eax
	leaq	L_.str(%rip), %r12
	addl	$32, %eax
	movsbl	%al, %ebp
	leaq	L_.str1(%rip), %r14
	jmp	LBB0_1
	.align	4, 0x90
LBB0_5:                                 ## %while.end3
                                        ##   in Loop: Header=BB0_1 Depth=1
	decl	%r15d
LBB0_1:                                 ## %while.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	testl	%r15d, %r15d
	jle	LBB0_6
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	xorl	%eax, %eax
	movq	%r12, %rdi
	callq	_printf
	jmp	LBB0_3
	.align	4, 0x90
LBB0_4:                                 ## %while.body2
                                        ##   in Loop: Header=BB0_3 Depth=2
	xorl	%eax, %eax
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_printf
	decl	%ebx
LBB0_3:                                 ## %while.cond1
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	testl	%ebx, %ebx
	jg	LBB0_4
	jmp	LBB0_5
LBB0_6:                                 ## %while.end
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Outer loop\n"

L_.str1:                                ## @.str1
	.asciz	"%c\n"

L_.str2:                                ## @.str2
	.asciz	"HELLO WORLD!"


.subsections_via_symbols
