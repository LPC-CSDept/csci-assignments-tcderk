#
# final2.asm
#
# Derek Trinh
#
# Prints user's input until 'q' is entered
#

    .text
    .globl main

main:
    mfc0        $a0, $12            # Read from status register
    ori         $a0, $a0, 0xFF11    # Enable all interrupts
    mtc0        $a0, $12            # Write back to status register
    li          $s0, 0xFFFF0000     # Constant. Address of receiver control
    li          $a0, 2              # To enable keyboard interrupts
    sw          $a0, 0($s0)         # Write to receiver control