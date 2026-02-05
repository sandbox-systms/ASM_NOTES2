%include  "constantes.inc"
%include  "macros.inc"

extern print_string 
extern add_numbers

section .data 
    msg db "Resultado calculado: ", 10
    msg_len equ $ - msg

section .text

global _start
_start:
    mov rdi, 5              ; primeiro número
    mov rsi, 10             ; segundo número
    call add_numbers        ; chama a função para somar os números

    lea rdi, [rel msg]     ; carrega o endereço da mensagem 
    mov rsi, msg_len       ; carrega o tamanho da mensagem
    call print_string      ; imprime a mensagem
    SYS_EXIT               ; chamada de sistema para sair