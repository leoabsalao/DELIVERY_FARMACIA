<h1 align="center">DELIVERY&FARMA</h1>
<h1 align="center">
  <img height="64px" src="https://img.icons8.com/color/48/000000/delphi-ide.png"> Delphi
</h1>
<p align="left">🚀 O Projeto <b>DELIVERY&FARMA</b> foi desenvolvido com a finalidade de gerenciar os envios de produtos adquiridos pelos clientes registrado no sistema.   
	Demostrando cuidado e respeito com o cliente final, o sistema gerencia a entrega dos produtos pela ordem de prioridade desiginado em sua regra de negócio, ou seja, 
        medicamentos que são do tipo sensíveis e controlados, possuem a sua entrega na primeira escala de prioridade.</p>
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
   * [Usabilidade](#usabilidade) 
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

# O Executável do projeto encontra-se na pasta chamada "Debug"
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

<p> Sistema desenvolvido baseando-se nos mais numerosos critérios de boas práticas, tendo como referência o livro "Código Limpo" de Robert Martin, comum nas programações de liguagens P.O.O (Programação Orientada a Objeto).
Proporcionando a eficiência de principios e padrôes que designam a criação de um código limpo. 

O Sistema <b>DELIVERY&FARMA</b> foi codificado conforme o escopo apresentado logo abaixo:
- 80% das transações em STORED PROCEDURE e TRIGGERS;
- Programação Orientado a Objeto (Herança, Polimofismo, Abstração e Encapsulamento);
- Uso de Interfaces e Classes, para o bom controle do código, evitando assim a redundância na programação;
- API Rest;
- Para a conexão com o Banco de Dados foi criada a Classe de conexão chamada de "TConexão" e o componente FIREDAC.
</p>

## Usabilidade

<p>
 Logo abaixo, segue o acompanhamento de usabilidade so Software:
 
- O sistema possui um cadastro inicial da tabela de PESSOAS, é nessa tabela que definimos qual o tipo daquela pessoa (ATENDENTE, ENTREGADOR ou CLIENTE);
- Na tela principal do sistema, poderá usar as Telas de CADASTRO DE PRODUTOS, PEDIDOS, CRIAR ROTA DE ENTREGA e STATUS DOS PEDIDOS, nos botões HEADER ou pelo seu Menu principal;
- Na tela de REALIZAR PEDIDOS, o atendente colocará os dados do cliente, endereço e em seguida os produtos que alimentará aquele pedido. Os produtos selecionados ficarão na grid;
- Quando for buscar o endereço pelo campo de <b>CEP</b>, o sistema consumirá uma API do ViaCEP, contendo aquele endereço, retornará alimentando os campos, caso não encontre, o sistema deixará colocar a mão;
- Em Cadastro de PRODUTOS, campos adicionais aparecerão dinâmicamente dependendo do tipo de medicamento;
- Na tela de ROTAS DOS PEDIDOS, selecionará a pessoa do tipo ENTREGADOR e logo abaixo, na Grid, aparecerão os pedidos ORDENADOS conforme a regra de negócio proposta no documento de criação do software. Logo em seguida,
  quando salvar as Rotas, aquela Rota ficará para aquele entregador, e o mesmo receberá, automaticamente, até no maximo 5 pedidos;
- Na tela de STATUS DOS PEDIDOS, será o acompanhamento dos pedidos que foram gerados para aquele entregador na tela de Rota. Nessa tela, o usuário poderá verificar o status daquele pedido e o mesmo alterar o seu estado.
</p>






