.segment "CODE"

very_start:
	bra very_start


vblank_func:
	rti


.segment "VECTORS"

; NATIVE VECTOR (65C816 Mode)

; RESERVED
vec_nat_reserved:
	.addr $0000

; RESERVED
vec_nat_reserved_2:
	.addr $0000

; COP VECTOR   (COP Opcode)
vec_nat_cop:
	.addr $0000


; BRK VECTOR   (BRK Opcode)
vec_nat_brk:
	.addr $0000

; ABORT VECTOR (Unused)
vec_nat_abort:
	.addr $0000

; NMI VECTOR   (V-Blank Interrupt)
vec_nat_nmi:
	.addr vblank_func

; RESET VECTOR (Unused)
vec_nat_reset:
	.addr $0000

; IRQ VECTOR   (H/V-Timer/External Interrupt)
vec_nat_irq:
	.addr $0000


; EMU VECTOR (6502 Mode)
; RESERVED
vec_emu_reserved:
	.addr vec_emu_reserved 

; RESERVED
vec_emu_reserved_2:
	.addr $0000

; COP VECTOR   (COP Opcode)
vec_emu_cop:
	.addr $0000

; BRK VECTOR   (Unused)
vec_emu_brk:
	.addr $0000

; ABORT VECTOR (Unused)
vec_emu_abort:
	.addr $0000

; NMI VECTOR   (V-Blank Interrupt)
vec_emu_nmi:
	.addr vblank_func

; RESET VECTOR (CPU is always in 6502 mode on RESET)
vec_emu_reset:
	.addr very_start

; IRQ/BRK VECTOR
vec_emu_irq_brk:
	.addr $0000
