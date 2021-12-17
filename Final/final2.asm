#
# final2.asm
#
# Derek Trinh
#
# Prints user's input until 'q' is entered
#

    .kdata
s1: .word   10
s2: .word   11

    .text
    .globl main

main:
    mfc0        $a0, $12            # Read from status register
    ori         $a0, $a0, 0xFF11    # Enable all interrupts
    mtc0        $a0, $12            # Write back to status register
    li          $s0, 0xFFFF0000     # Constant. Address of receiver control
    li          $a0, 2              # To enable keyboard interrupts
    sw          $a0, 0($s0)         # Write to receiver control

loop:
    j           loop                # Infinite loop

    .ktext  0x80000180              # Beginnning of kernel text
    sw          $v0, s1
    sw          $a0, s2             # Store $v0 and $a0

    mfc0        $k0, $13            # Read cause register
    srl         $a0, $k0, 2         # Read exception code
    andi        $a0, $a0, 0x1f      # Only need exception code (5 bits)
    