        .file   "while_loop.c"
        .text
        .p2align 2,,3
.globl while_loop
        .type   while_loop,@function
while_loop:
        pushl   %ebp             // -
        movl    %esp, %ebp       // -
        movl    16(%ebp), %edx   // edx <- n
        testl   %edx, %edx       // n <= 0 ?
        pushl   %ebx             // salvaguarda reg ebx
        movl    12(%ebp), %eax   // eax <- y
        movl    8(%ebp), %ebx    // ebx <- x
        jle     .L3              // salta para L3
        movl    %edx, %ecx       // ecx tem cópia inicial de n
        sall    $4, %ecx         // ecx = n*16
        cmpl    %ecx, %eax       // y >= 16*n ?
        jge     .L3              // 
        .p2align 2,,3
.L6:
        addl    %edx, %ebx      // x = x + n
        imull   %edx, %eax      // y = y * n
        decl    %edx            // n--
        subl    $16, %ecx       // ecx = 16*(n-1)  ((ecx = ecx - 16))
        testl   %edx, %edx      // n <= 0
        jle     .L3             // salta para L3 se <=
        cmpl    %ecx, %eax      // y < 16*n
        jl      .L6             // salta para o início do ciclo
.L3:         Fase de término
        movl    %ebx, %eax      // coloca en eax o valor a devolver
        popl    %ebx            // recupera valor original de ebx
        leave                   // 
        ret                     // 
.Lfe1:
        .size   while_loop,.Lfe1-while_loop
        .section        .note.GNU-stack,"",@progbits
        .ident  "GCC: (GNU) 3.2.3 20030502 (Red Hat Linux 3.2.3-59)"
