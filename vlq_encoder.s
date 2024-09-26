.global putvlq

putvlq:

    AND     R2, R0, #0x7F

L1: MOVS    R0, R0, LSR #7
    MOVNE   R2, R2, LSL #8
    ORRNE   R2, R2, #0x80
    ANDNE   R3, R0, #0x7F
    ADDNE   R2, R2, R3
    BNE     L1

L2: STRB    R2, [R1], #1
    TST     R2, #0x80
    MOVNE   R2, R2, LSR #8
    BNE     L2

    MOV     R0, R1
    BX      LR
