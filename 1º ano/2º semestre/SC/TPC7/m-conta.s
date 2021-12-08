Dump of assembler code for function contaN:
0x080483c0 <contaN+0>:  push   %ebp                            // salvaguarda base pointer antigo
0x080483c1 <contaN+1>:  mov    %esp,%ebp                       // atualiza frame pointer
0x080483c3 <contaN+3>:  push   %esi                            // salvaguarda do esi
0x080483c4 <contaN+4>:  push   %ebx                            // salvaguarda do ebx
0x080483c5 <contaN+5>:  mov    0x8(%ebp),%esi                  // esi <- s == esi <- &s[0]
0x080483c8 <contaN+8>:  mov    0xc(%ebp),%ecx                  // ecx <- c
0x080483cb <contaN+11>: mov    (%ecx,%esi,1),%dl               // dl <- s[i]
0x080483ce <contaN+14>: xor    %ebx,%ebx                       // result = 0
0x080483d0 <contaN+16>: test   %dl,%dl                         // s[i] == 0 ? <───────────────┐
0x080483d2 <contaN+18>: je     0x80483ec <contaN+44>           // salta para FASE TÉRMINO se ─┘ -- condição de teste do ciclo
CORPO DO CICLO FOR ----------------------------------------------
0x080483d4 <contaN+20>: lea    -0x30(%edx),%eax                // eax <- s[i] - 48 (obter valor numérico de s[i])
0x080483d7 <contaN+23>: cmp    $0x9,%al                        // valor numérico de s[i] (eax) > 9 ? <─┐
0x080483d9 <contaN+25>: ja     0x80483e2 <contaN+34>           // salta para controlo ciclo for se ────┘
0x080483db <contaN+27>: movsbl %dl,%eax                        // eax = dl (s[i]) com extensão do bit do sinal
0x080483de <contaN+30>: lea    -0x30(%eax,%ebx,1),%ebx         // result = result + s[i] - 48 /./ (em C) result += s[i] - '0'  --  expressão que atualiza result no ciclo
CONTROLO CICLO --------------------------------------------------
0x080483e2 <contaN+34>: inc    %ecx                            // ecx <- i; i++
0x080483e3 <contaN+35>: mov    (%ecx,%esi,1),%al               // al <- s[i] 
0x080483e6 <contaN+38>: test   %al,%al                         // s[i] != 0 ? <──────────────────┐ -- condição de
0x080483e8 <contaN+40>: mov    %al,%dl                         // dl <- s[i]                     │      teste do
0x080483ea <contaN+42>: jne    0x80483d4 <contaN+20>           // salta para corpo do ciclo se  ─┘ --   ciclo for
FASE DE TÉRMINO -------------------------------------------------
0x080483ec <contaN+44>: mov    %ebx,%eax                       // ebx <- result
0x080483ee <contaN+46>: pop    %ebx                            // repor valor original de ebx
0x080483ef <contaN+47>: pop    %esi                            // repor valor original de esi
0x080483f0 <contaN+48>: leave                                  // recupera stack pointer e base pointer
0x080483f1 <contaN+49>: ret                                    // 
0x080483f2 <contaN+50>: nop                                    // 
0x080483f3 <contaN+51>: nop                                    // 
