0x08048400 <getline+0>: push   %ebp  // salvaguarda antigo base pointer
0x08048401 <getline+1>: mov    %esp,%ebp   // base pointer = stack pointer
0x08048403 <getline+3>: sub    $0x18,%esp  //
0x08048406 <getline+6>: sub    $0xc,%esp   // esp = esp - 36
0x08048409 <getline+9>: lea    0xfffffff8(%ebp),%eax // eax = ebp - 8;
0x0804840c <getline+12>:        push   %eax   //
0x0804840d <getline+13>:        call   0x8048304
0x08048412 <getline+18>:        add    $0x10,%esp
0x08048415 <getline+21>:        sub    $0xc,%esp
0x08048418 <getline+24>:        lea    0xfffffff8(%ebp),%eax
0x0804841b <getline+27>:        push   %eax
0x0804841c <getline+28>:        call   0x8048324
0x08048421 <getline+33>:        add    $0x4,%esp
0x08048424 <getline+36>:        push   %eax
0x08048425 <getline+37>:        call   0x8048314
0x0804842a <getline+42>:        add    $0x10,%esp
0x0804842d <getline+45>:        mov    %eax,0xfffffff4(%ebp)
0x08048430 <getline+48>:        sub    $0x8,%esp
0x08048433 <getline+51>:        lea    0xfffffff8(%ebp),%eax
0x08048436 <getline+54>:        push   %eax
0x08048437 <getline+55>:        pushl  0xfffffff4(%ebp)
0x0804843a <getline+58>:        call   0x8048344
0x0804843f <getline+63>:        add    $0x10,%esp
0x08048442 <getline+66>:        mov    0xfffffff4(%ebp),%eax
0x08048445 <getline+69>:        leave
0x08048446 <getline+70>:        ret
