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

    li.s    $f1, 1.0        # Current approximation, x = 1.0
    li.s    $f2, 1.0        # Next approximation x'
    li.s    $f3, 2.0        # Constant

    # Calculate approximation
