#
# final1.asm
#
# Derek Trinh
#
# Takes 3 digits from user through MMI/O and prints the 3-digit decimal
#

    .text
    .globl main

main:
    li      $s0, 10                 # Constant. Shifts result decimal places
    lui     $s1, 0xFFFF             # For MMI/O registers. Address of receiver control
    and     $s2, $s2, $zero         # Result register
    addi    $s3, $s3, 3             # Counter register

loop:
    lw      $t0, 0($s1)             # Read receiver control
    andi    $t0, $t0, 1             # Check ready bit
    beq     $t0, $zero, loop        # Loop if not ready
    nop
    lw      $t1, 4($s1)             # Read receiver data
    mul     $s2, $s2, $s0           # Shift result one decimal left
    add     $s2, $s2, $t1           # Add result decimal to ones place of result
    addi    $s3, $s3, -1            # Decrement counter
    bgtz    $s3, loop               # Terminate loop after 3 iterations

    or      $a0, $s2, $zero         # Copy result into $a0
    li      $v0, 1                  # Print integer
    syscall
    li      $v0, 10
    syscall