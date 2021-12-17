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
    li  $s0, 10         # Constant. Shifts result decimal places
    lui $s1, 0xFFFF    # For MMI/O registers. Address of receiver control

loop:
    