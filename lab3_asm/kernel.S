.syntax unified
.cpu cortex-m4
.thumb

.global vtable_kernel
.global __kernel_reset__
.type vtable_kernel, %object
.type __kernel_reset__, %function
.section .interrupt_vector

vtable_kernel:
    .word __stack_start
    .word __kernel_reset__ + 1
    .size vtable_kernel, .-vtable_kernel

.section .rodata
data: .asciz "Start kernel"
final: .asciz "Result: "

.section .text
__kernel_reset__:
    ldr r0, =data
    bl dbgput_line

    mov r0, #5
    mov r1, #2
    mov r2, #3
    sub r0, r0, r1
    mov r4, #3
    mul r0, r0, r4
    mov r4, #1
    lsl r4, r4, r2
    add r0, r0, r4

    mov r3, r0

    ldr r0, =final
    bl dbgput_line

    mov r0, r3
    bl dbgput_num
    bl newline

end:
    b end
