<h1 align="center">DELIVERY&FARMA</h1>
<h1 align="center">
  <img height="64px" src="https://img.icons8.com/color/48/000000/delphi-ide.png"> Delphi
</h1>
<p align="center">🚀 Projeto de entrega de produtos farmacêuticos, desenvolvido na linguagem de programação Delphi. Avaliação para a PHARMAPELE.</p>
<p></p>
<p></p>
<h4 align="center"> 
	🚧  Projeto DELIVERY&FARMA  🚀 Em construção...  🚧
</h4>

<!--ts-->
   * [Sobre](#Sobre)
   * [Instalação](#instalacao)
   * [Tecnologias](#tecnologias)
   * [Desenvolvimento](#desenvolvimento)
<!--te-->

## Sobre
<p>
	Principal ferramenta utilizada pelos atendentes para gerenciar o processo de entrega dos
produtos aos clientes feito pelos entregadores. Esse sistema será usado para criar pedidos,
selecionar os produtos desejados e instruir os entregadores sobre os detalhes da entrega,
como rotas e detalhes dos pedidos enviados.
</p>

## Instalação
### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Delphi CE 11.3](https://www.embarcadero.com/br/products/delphi/starter/free-download), [Firebird 3.0](https://firebirdsql.org/en/firebird-3-0-10/#Win32) e um Sistema Gerenciador de Banco de Dados ( [DBeaver](https://dbeaver.io/) / [FlameRobin](http://www.flamerobin.org/) / [IBExpert](https://www.ibexpert.net/downloadcenter/) ).


### 🎲 Rodando o Back End (servidor)

```bash
# Clone este repositório
$ git clone <https://github.com/leoabsalao/DELIVERY_FARMACIA.git>

# Coloque o projeto, preferencialmente, na Unidade C do Desktop. Caminho atual: 
$ C:\DEV\PROJETOS\...

# O  banco de dados esta dentro da pasta:
$ ...\PROJFARMACIA\bd\..

# Aponte o caminho do banco Firebird com a classe de conexão do projeto através do arquivo .Ini
$ ...\PROJFARMACIA\Win32\Debug\Config.ini

# O Executável do projeto encontra-se na pasta chmamada "Debug"
$ C:\DEV\PROJETOS\PROJFARMACIA\Win32\Debug

# Configuração do banco de dados:
$ Firebird 3.0 32bits - Login: SYSDBA / Password: masterkey / Port: 3050
```

## Tecnologias 
🛠 Ferramentas utilizadas

As seguintes ferramentas foram usadas na construção do projeto:

- [Delphi Community Edition 11.3 Alexandria](https://www.embarcadero.com/br/products/delphi/starter/free-download)
- [Firebird 3.0 Win32-bits](https://firebirdsql.org/en/firebird-3-0-10/#Win32)
- [DBeaver Community](https://dbeaver.io/)

## Desenvolvimento

<p> Sistema desenvolvido baseando-se nos mais numerosos critérios de boas práticas, tendo como referência o livro "Código Limpo" de Robert Martin, comum nas programações de liguagens P.O.O (Programação Orientada a Objeto), 
ou seja, viabilizando a eficiência de principios e padrôes que designam a criação de um código limpo. 

O Sistema <b>DELIVERY&FARMA</b> foi desenvolvido conforme o escopo apresentado logo abaixo:
- 80% das transações em STORED PROCEDURE e TRIGGERS;
- Programação Orientado a Objeto (Herança, Polimofismo, Abstração e Encapsulamento);
- Criação de Interfaces e Classes, para o bom controle do código;
 
</p>

