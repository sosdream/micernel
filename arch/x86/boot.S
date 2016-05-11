.code16
.section ".btext", "ax"
.global xiaohong
xiaohong:
movw	%cs, %ax
	movw	%ax, %ds
	movw	%ax, %es
	movw	%ax, %ss
	xorw	%sp, %sp
	sti
    calll main
    movw	$bugger_off_msg, %si
msg_loop:
	lodsb
	andb	%al, %al
	jz	bs_die
	movb	$0xe, %ah
	movw	$7, %bx
	int	$0x10
	jmp	msg_loop

bs_die:
	# Allow the user to press a key, then reboot
	xorw	%ax, %ax
	int	$0x16
	int	$0x19

	# int 0x19 should never return.  In case it does anyway,
	# invoke the BIOS reset code...
	ljmp	$0xf000,$0xfff0
	.section ".bsdata", "a"
bugger_off_msg:
	.ascii	"Use a boot loader.\r\n"
	.ascii	"\n"
	.ascii	"Remove disk and press any key to reboot...\r\n"
	.byte	0
.section ".endsec","a"
.word 0xaa55
