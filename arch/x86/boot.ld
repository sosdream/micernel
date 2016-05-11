ENTRY(xiaohong)

SECTIONS{
    . = 0;
    .btext : {*(.btext)}
    .header		: { *(.header) }
	.entrytext	: { *(.entrytext) }
	.inittext	: { *(.inittext) }
	.initdata	: { *(.initdata) }
	.text32		: { *(.text32) }
	.text		: { *(.text) }
	.rodata		: { *(.rodata*) }
	.data		: { *(.data*) }
	.bss		: {*(.bss)}
	. = ALIGN(16);
	
    . = 510;
    .endsec : {*(.endsec)}
}
