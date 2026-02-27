.syntax unified
.thumb
.global main

.data
.balign 4

v1:     .word 50
v2:     .word 15
delay:  .word 1000

msg_a:  .asciz "a is %d\n"
msg_b:  .asciz "b is %d\n"
msg_g:  .asciz "GCD of a and b is %d\n\n"

.text
main:
    bl stdio_init_all

loop:

    ldr r0, =delay
    ldr r0, [r0]
    bl sleep_ms

    ldr r4, [r4]

    ldr r5, =v2
    ldr r5, [r5]

    mov r6, r4
    mov r7, r5      

gcd:
    cmp r4, r5
    beq print

    bgt greater

    subs r5, r5, r4
    b gcd

greater:
    subs r4, r4, r5
    b gcd

print:

    ldr r0, =msg_a
    mov r1, r6
    bl printf

    ldr r0, =msg_b
    mov r1, r7
    bl printf

    ldr r0, =msg_g
    mov r1, r4
    bl printf

    b loop
