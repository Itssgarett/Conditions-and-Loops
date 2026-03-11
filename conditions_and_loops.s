.syntax unified
.global main
.func main
.thumb_func

.data
.balign 4

a:      .word 48
b:      .word 18
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

    ldr r4, =a
    ldr r4, [r4]

    ldr r5, =b
    ldr r5, [r5]

    mov r6, r4
    mov r7, r5

gcd_loop:
    cmp r4, r5
    beq done

    bgt a_greater

    subs r5, r5, r4
    b gcd_loop

a_greater:
    subs r4, r4, r5
    b gcd_loop

done:

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