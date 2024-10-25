create database tbl_clientes2;
use tbl_clientes2;

create table clientes(
id int not null primary key auto_increment,
nome varchar (100) not null,
idade int  not null,
sexo char (1) not null,
email varchar(100) not null,
telefone  varchar (15) not  null,
endereco varchar (255) not null
);

insert into clientes (nome,idade,sexo,email,telefone,endereco)
values ("Alana Teixeira","28","F","alana@gmail.com","(11)9856722","Vila La Brunetti, rua Dr.Marcio Costa"),
 ("Bernardo Simões", "20","M","ber.simoes@gmail.com","(11)2288762","Vila Barth, rua Maria.Mendes"),
("Lorena Silva", "12","F","lorensilva@gmail.com","(15)9925222","Vila Regina, rua Lucas Martins"),
 ("Marcos Soares", "38","M","marco@gmail.com","(11)99232562","Vila Aurora, rua Judas Tadeu"),
  ("Isaías de Moura", "10","M","isaias@gmail.com","(15)987522","Vila Rio Branco, rua Ipanema Melo");

select * from clientes;

DELIMITER $$ # abrir o comando  Stored procedure 
CREATE PROCEDURE lista_clientes(in opcao int) 
 BEGIN 
  IF opcao > 18 then 
    SELECT * FROM clientes WHERE idade  >=18;
    ELSEIF opcao < 18 THEN
    SELECT * FROM clientes WHERE idade <18;
    ELSE
  SELECT * FROM clientes
  END $$
DELIMITER ;

#idade maior de 18
CALL lista_clientes(19);
#idade menor de 18
CALL lista_clientes(17);
#idade igual a 18
CALL lista_clientes(18);



