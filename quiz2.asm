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
    