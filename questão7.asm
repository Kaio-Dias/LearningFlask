;Kaio Dias, Noel Gama e Emílio

section .data

msg1 db "Digite a idade em anos, meses e dias, separadamente.", 0
msg2 db " Anos: ", 10, 0
msg3 db "meses, além dos anos: ", 10, 0
msg4 db "dias, além dos meses: ", 10, 0
msg5 db "A idade total em dias é %d",0

fmt db "%d" ;formato inteiro definido

;variáveis 
years   dd 0
months   dd 0
days dd 0

section .bss

totalAge resb 1

section .text
    global main
    extern printf, scanf
    
    main:
    push rbp
    mov rbp, rsp
    
    ;Anos
    mov rdi, msg1
    mov rax, 0
    call printf

    mov rdi, msg2
    mov rax, 0
    call printf

    mov rdi, fmt
    mov rsi, years
    mov rax, 0
    call scanf
    
    ;Meses
    mov rdi, msg3
    mov rax, 0
    call printf
    
    mov rdi, fmt
    mov rsi, months
    mov rax, 0
    call scanf
    
    ;Dias
    mov rdi, msg4
    mov rax, 0
    call printf
    
    mov rdi, fmt
    mov rsi, days
    mov rax, 0
    call scanf  
    
    
    ;Cálculo
    mov rax, [years]
    mov rbx, 360
    mul rbx
    mov [totalAge], rax
    
    mov rax, [months]
    mov rbx,30
    mul rbx
    add [totalAge], rax
    
    mov rax, [days]
    add [totalAge],rax
    
    ;Resultado final    
    mov rdi, msg5
    mov rsi, [totalAge]
    mov rax, 0
    call printf


    leave
    mov rax, 0
    ret