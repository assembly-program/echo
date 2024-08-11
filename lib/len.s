.section .text

# rdi holds the first argument
.global len
.type len, @function
len:
    pushq %rbp
    movq %rsp, %rbp

    pushq %r8
    movq $0, %r8

sectionL0:
    movq %rdi, %rsi
.LPL0:
    lodsb
    cmpb $0, %al
    je .LLL
    incq %r8
    jmp .LPL0

.LLL:
    movq %r8, %rax
    popq %r8
    leave
    ret
