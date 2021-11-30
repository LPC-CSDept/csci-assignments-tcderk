#
# quiz2
#
# Derek Trinh
#
# Calculates ax^2 + bx + c, taking in values from the user
#

    .data
prompt1:    .asciiz "Enter a value for x: "
prompt2:    .asciiz "Enter a value for a: "
prompt3:    .asciiz "Enter a value for b: "
prompt4:    .asciiz "Enter a value for c: "

    .text
    .globl main

main:
    # Print prompts and read floats
    la  $a0, prompt1
    li  $v0, 4
    syscall
    li  $v0, 6
    syscall
    mov.s   $f1, $f0

    la  $a0, prompt2
    li  $v0, 4
    syscall
    li  $v0, 6
    syscall
    mov.s   $f2, $f0
    
    la  $a0, prompt3
    li  $v0, 4
    syscall
    li  $v0, 6
    syscall
    mov.s   $f3, $f0
    
    la  $a0, prompt4
    li  $v0, 4
    syscall
    li  $v0, 6
    syscall
    mov.s   $f4, $f0
    
    # Calculate ax^2 + bx + c
    mov.s   $f5, $f1            # Save a copy of x
    mul.s   $f1, $f1, $f1       # x^2
    mul.s   $f1, $f1, $f2       # ax^2
    mul.s   $f3, $f3, $f5       # bx
    add.s   $f1, $f1, $f3       # ax^2 + bx
    add.s   $f1, $f1, $f4       # ax^2 + bx + c

    # Print result
    mov.s   $f12, $f1
    li      $v0, 2          # Print float service
    syscall

    li      $v0, 10
    syscall