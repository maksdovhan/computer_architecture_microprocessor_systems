.syntax unified
.cpu cortex-m4
.thumb

.global bootload

.section .rodata
image: .incbin "kernel.bin"
end_of_image:

str_boot_start: .asciz "Program started"
str_boot_end: .asciz "Program finished"

.section .text
bootload:
    ldr r0, =str_boot_start
    bl dbgput_line

    ldr r0, =end_of_image
    ldr r1, =image
    ldr r2, =_ram_start

    sub r4, r0, r1
    add r2, r2, r4

copy_loop:
    ldrb r3, [r0, #-1]!
    strb r3, [r2, #-1]!
    cmp r0, r1
    bhi copy_loop

    bl newline

    ldr r0, =str_boot_end
    bl dbgput_line

    ldr r2, =_ram_start
    add r2, #4
    ldr r0, [r2]
    bx r0

bootload_end:
    b bootload_end
