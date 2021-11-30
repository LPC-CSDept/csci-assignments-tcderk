#
# quiz1
#
# Derek Trinh
#
# Converts single-precision temperatures from Fahrenheit to Celsius
#

    .data
prompt: .asciiz "Enter a temperature in Fahrenheit\n"
val1:   .float  32.0
val2:   .float  5.0
val3:   .float  9.0

    .text
    .globl main

main:
    # Print prompt statement
    li  $v0, 4          # Print string service
    la  $a0, prompt
    syscall

    # Read Fahrenheit value (integer)
    li  $v0, 5          # Read integer service
    syscall
    mtc1    $v0, $f1
    cvt.s.w $f1, $f1    # Convert to floating point

    # Load conversion values
    l.s $f2, val1       # $f2 = 32.0
    l.s $f3, val2       # $f3 = 5.0
    l.s $f4, val3       # $f4 = 9.0

    # Calculate ($f1 - 32.0) * 5.0/9.0
    sub.s   $f1, $f1, $f2       # $f1 - 32.0
    mul.s   $f1, $f1, $f3       # ($f1 - 32.0) * 5.0
    div.s   $f1, $f1, $f4       # ($f1 - 32.0) * 5.0/9.0

    # Print result
    mov.s   $f12, $f1
    li      $v0, 2      # Print float service
    syscall

    li      $v0, 10
    syscall