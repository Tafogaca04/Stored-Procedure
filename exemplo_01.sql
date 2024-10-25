create database bd_clientes; # cria-se a tabela cliente "comando DDL"
use bd_clientes; # coloca-se use para utilizar  e manipular o banco "FICA EM NEGRITO"

create table tbl_clientes(      #cria=-se a tabela clientes com os seguintes campos:código,nome e sexo  "Comando DDL"
codigo int not null primary key auto_increment,   #Este campo é do tipo inteiro,não pode ter campo sem informações,então ele auto se incrementa
nome varchar (40) not null,   # Este campo (nome) tipo varchar  específico para texto, não pode ter campo sem informação (vazio)
sexo char(1) not null         # Este campo (sexo) tipo char no qual é específico para utilizar em dados semelhantes  "UMA LETRA"
);

insert into tbl_clientes(nome,sexo)  #Insere-se os campos da tabela que seja colocar os dados "comando DML"
values ("Humberto","M"),("Ayrton Sena","M"),("Xuxa","F");  # Através do comando insert do DML  insere os dados de cada campo da tabela

select*from tbl_clientes;  # Comando para mostrar a tabela "Clientes" com  os dados inseridos anteriormente "Comando DML"

DELIMITER $$ # abrir o comando  Stored procedure 
create  procedure sp_lista_clientes(in opcao int)  # o nome do Stored procedure é sp_lista_clientes  que aceita a opcao do tipo inteiro
begin 
if opcao = 0 then 
select * from tbl_clientes where sexo  = "F";
elseif opcao=1 then
select * from tbl_clientes where sexo = "M";
else
select * from tbl_clientes;
end if;
END $$
DELIMITER ; #fechar o comando

Show procedure status;

#Lsita sexo Feminino
CALL sp_lista_clientes(0);
#Lista masculino:
CALL sp_lista_clientes(1);
#Lista todos:
CALL sp_lista_clientes(2);
    
    #Exemplo  2  Stored  Procedure
    
DELIMITER $$  
CREATE PROCEDURE busca_clientes_por_nome(IN nome_parcial VARCHAR(100))   
BEGIN
	SELECT * FROM tbl_clientes 
	WHERE nome LIKE CONCAT('%', nome_parcial, '%');                   
END $$ 
DELIMITER ; 
    
call  busca_clientes_por_nome ('Ay'); #retorna o cliente 'Ayrton Sena'
call  busca_clientes_por_nome ('x');
    