.syntax unified
.cpu cortex-m4
.thumb

// Global tags
.global vtable
.global _hard_reset

/* Vector table */
.type vtable, %object
vtable:
    .word _stack_start
    .word _hard_reset + 1
.size vtable, .-vtable

/* Entry point */
.type _hard_reset, %function
_hard_reset:
    // Initializing stack
    ldr r0, =_stack_start
    mov sp, r0

    // Call main program
    bl lab1

_loop:
    b _loop
.size _hard_reset, .-_hard_reset
