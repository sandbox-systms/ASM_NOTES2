section .text 

global read_string
;--------------------------------------
; lê string da entrada padrão
; IN : RDI -> endereço do buffer
;      RSI -> tamanho máxima a ler
; OUT : RAX -> número de bytes lidos
; USO DE REGISTRADORES : RAX, RDI, RSI
;--------------------------------------
    read_string:
        mov rax, SYS_READ       ; chamada de sistema para leitura 
        mov rdi, STDIN          ; descritor de arquivo para entrada padrão
                                ; rsi já contém o endereço do buffer
                                ; rdx já contém o tamanho máxima a ler
        syscall
        ret 