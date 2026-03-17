.global lab1
.syntax unified
.thumb

lab1:
    push {lr}

    mov r0, #5
    mov r1, #2
    mov r2, #3

    bl calc_variant1

    pop {pc}

calc_variant1:
    push {r4, lr}

    sub r0, r0, r1

    mov r4, #3
    mul r0, r0, r4

    mov r4, #1
    lsl r4, r4, r2

    add r0, r0, r4

    pop {r4, pc}
