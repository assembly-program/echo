.include "lib/len.s"
.include "lib/sys_write.s"
.include "lib/sys_exit.s"

.section .text
.global _start
_start:
    movq %rsp, %rbp
    subq $8, %rsp

    movq (%rbp), %rbx
    movq %rbx, -8(%rbp)

section0:
    cmpq $1, %rbx
    je exit

    movq %rbp, %rbx # copy of the current value of rbp
    addq $8, %rbx   # skip argv[0], the name of the file

section1:
.LP0:
    addq $8, %rbx
    movq (%rbx), %rdi
    call len

    write $1, (%rbx), %rax,
    writes $1

    decq -8(%rbp)     # decrease counter
    cmpq $1, -8(%rbp)
    jg .LP0

exit:
    writeln $1
    exit $0
