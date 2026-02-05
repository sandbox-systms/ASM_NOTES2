section .text

global print_string 

;--------------------------------------
; mostra string na saida padrão
; IN : RDI -> endereço da string 
;      RSI -> tamanho da string
; OUT : -
; USO DE REGISTRADORES : RAX, RDI, RSI
;--------------------------------------

    print_string:
        mov rax, SYS_WRITE      ; chamada de sistema para escrita 
        mov rdi, STDOUT         ; descritor de arquivo para saída padrão
                                ; rsi já contém o endereço da string
                                ; rdx já contém o tamanho da string
        syscall
        ret

