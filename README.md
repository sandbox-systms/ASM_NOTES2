Projeto técnico demonstrando **engenharia de software em Assembly**, com organização profissional de diretórios, separação rigorosa de responsabilidades, convenções formais de baixo nível e processo de build reproduzível.

Este repositório existe para provar um ponto simples:  
**Assembly pode (e deve) ser tratado como software sério.**

---

## Escopo Técnico

- Linguagem: Assembly x86-64
- Montador: NASM
- Sistema operacional: Linux
- ABI: System V AMD64
- Build: GNU Make + GNU ld
- Estilo: modular, previsível e documentado

---

Princípio adotado:  
**um arquivo = uma responsabilidade clara**.

---

## Convenções Técnicas

- Arquitetura: x86-64
- ABI: System V AMD64

### Convenção de chamada

- Parâmetros:
  - `RDI`, `RSI`, `RDX`, `RCX`, `R8`, `R9`
- Retorno:
  - `RAX`
- Registradores preservados pelo callee:
  - `RBX`, `RBP`, `R12`, `R13`, `R14`, `R15`
- Chamadas ao kernel:
  - instrução `syscall`

---

## Organização dos Módulos

### main.asm

Responsável exclusivamente por:
- inicialização do processo (`_start`)
- preparação de dados
- chamadas entre módulos
- encerramento do programa


---

### Módulo IO — output.asm

Responsável apenas por escrita em `STDOUT`.

Contrato da função `print_string`:
IN: RDI → endereço da string RSI → tamanho da string
OUT: nenhum
SIDE EFFECT: syscall write
Copiar código

---

### Módulo Matemático — add.asm

Rotina matemática isolada e reutilizável.

Contrato da função `add_numbers`:
IN: RDI → operando A RSI → operando B
OUT: RAX → resultado da soma
Copiar código

---

## Fluxo de Execução do Programa
_start | ├─ prepara operandos | ├─ call add_numbers | ├─ call print_string | └─ sys_exit
Copiar código

Fluxo linear, explícito e auditável.

---

## Processos e Chamadas

### Visão lógica de uma chamada
caller | | call função v callee ├─ parâmetros via registradores ├─ execução da rotina └─ retorno via RAX
Copiar código

Nenhuma dependência implícita entre módulos.

---

## Stack — Visão Técnica

Neste projeto, o uso da stack é mínimo e controlado.



---


## Build do Projeto

### Dependências

- nasm
- ld
- make

### Compilação
make

O processo de build:
- localiza todos os arquivos `.asm`
- gera objetos espelhando a estrutura de diretórios
- linka tudo em um binário único

Binário final:
build/app

---

## Limpeza
make clean


Remove todos os artefatos gerados.

---


## Extensões Planejadas

- leitura de entrada do usuário
- conversão ASCII ↔ inteiro
- máquina de estados
- integração ASM + C
- testes unitários de rotinas em Assembly

---

## Licença

Uso livre para estudo, modificação e redistribuição.
Este arquivo já está em nível profissional, adequado para repositório público, portfólio técnico ou base de projetos maiores em baixo nível.
O próximo avanço natural seria transformar isso em um template padrão reutilizável ou documentar clobbers e invariantes por função, elevando o rigor ainda mais.