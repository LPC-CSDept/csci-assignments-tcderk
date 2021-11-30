#
# quiz3
#
# Derek Trinh
#
# Calculates Newton's method
#

    .data
prompt1:     .asciiz "Enter a value for n: "
prompt2:     .asciiz "From Newton's method: "

    .text
    .globl main

main:
    # Print prompt and read n
    la  $a0, prompt1
    li  $v0, 4
    syscall
    li  $v0, 6
    syscall

    mov.s   $f1, $f0
    li.s    $f2, 1.0        # Current approximation, x = 1.0
    li.s    $f3, 1.0        # Next approximation x'
    li.s    $f4, 2.0        # Constant
    li.s    $f10, 1.0e-5    # Precision limit

    # Calculate approximation
loop:
    div.s   $f5, $f1, $f2   # n / x
    add.s   $f3, $f2, $f5   # x + (n / x)
    div.s   $f3, $f3, $f4   # (x + (n / x)) / 2.0

    # Check precision
    sub.s   $f6, $f3, $f2   # x' - x
    abs.s   $f6, $f6        # |x' - x|
    c.lt.s  $f6, $f10       # if $f6 < $f10
    bc1t    end             # then break loop
    nop
    mov.s   $f2, $f3        # current = next
    j       loop            # else loop
    nop

