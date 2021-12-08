        .file   "autentica.c"
        .text
        .p2align 2,,3
.globl autentica
        .type   autentica,@function
autentica:
        pushl   %ebp
        movl    %esp, %ebp
#       código "hacked" 
        movl    8(%ebp),%eax
        movl    (%eax),%eax
#       código original em comentário
#       movl    8(%ebp), %eax
#       movl    (%eax), %eax    
#       cmpl    %eax, 12(%ebp)  
#       sete    %al
#       movzbl  %al, %eax
        leave
        ret
.Lfe1:
        .size   autentica,.Lfe1-autentica
        .section        .note.GNU-stack,"",@progbits
        .ident  "GCC: (GNU) 3.2.3 20030502 (Red Hat Linux 3.2.3-59)"

# int autentica(int *s, int p);