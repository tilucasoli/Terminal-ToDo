# Terminal-ToDo

A description of this package.
![IMAGE](https://user-images.githubusercontent.com/62367544/78246026-dc7cdc00-74be-11ea-8ea8-4725f0741ca7.jpg)

## Como instalar

    $ git clone https://github.com/tilucasoli/Terminal-ToDo
    $ cd Terminal-ToDo
    $ swift build -c release
    $ cd .build/release
    $ sudo su
    $ mv Terminal-ToDo /usr/local/bin
    $ Terminal-ToDo
    
    Pronto o script está pronto para uso!😍

## Funções:
### Adicionar uma nova tarefa
    $ Terminal-ToDo add-task {Nome_da_Categoria} "{Texto_da_Tarefa}"
    exemplo: $ Terminal-ToDo add-task Academy "Estudar Swift"
    
### Mostrar tasks filtradas por um categoria
    $ Terminal-ToDo show-goals {Nome_da_Categoria}
    exemplo: $ Terminal-ToDo show-goals Academy
    
### Marcar quais tarefas já foram feitas
    $ Terminal-ToDo check {Nome_da_Categoria} {Numero_da_task}
    exemplo: $ Terminal-ToDo check Academy 0
    
### Mostrar todas as Tasks
    $ Terminal-ToDo show-all

### Remover um determinada task
    $ Terminal-ToDo remove {Nome_da_Categoria} {Numero_da_task}
    exemplo: $ Terminal-ToDo remove Academy 0

#### Sugestões de funcionalidades
 1. Escreva aqui ...
