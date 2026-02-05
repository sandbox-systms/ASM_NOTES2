section .text 
global add_numbers

;-----------------------------------------
; add_numbers: soma dois números inteiros 
; IN : RDI, RSI -> números a serem somados
; OUT : RAX = RDI + RSI adicionados
; USO DE REGISTRADORES : RAX, RDI, RSI
;--------------------------------------------
    add_numbers:
        mov rax, rdi          ; move o primeiro número para RAX
        add rax, rsi          ; adiciona o segundo número a RAX
        ret                   ; retorna com o resultado em RAX