soma_grandes:
        pushl   %ebp
        movl    %esp, %ebp # inicialização da stack
        pushl   %ebx       # salvaguarda ebx
        pushl   %esi       # salvaguarda esi
        movl    0x8(%ebp), %esi   # esi <- n
        movl    0xc(%ebp), %ebx   # ebx <- a ; &a[0]
        xorl    %eax, %eax        # eax <- r; r = 0;
        xorl    %ecx, %ecx        # ecx <- i; i = 0;
TESTE:
        cmpl    %esi, %ecx  # i >= n ?
        jge     FIM_CICLO   # salta para fim do ciclo
        movl    (%ebx, %ecx, 4), %edx    # edx <- a[i]
        cmpl    $1000, %edx   # a[i] <= 1000 ?
        jle     FIM_IF   # salta para fim do if
        addl    %edx, %eax    # r = r + a[i];
FIM_IF:
        incl    %ecx   # i++;
        jmp     TESTE  # salto não condicional para TESTE
FIM_CICLO:
        popl    %esi  # recuperar valor original de esi
        popl    %ebx  # recuperar valor original de ebx
        leave
        ret


