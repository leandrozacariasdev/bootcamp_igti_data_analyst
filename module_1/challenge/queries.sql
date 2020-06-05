-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
--	Qual a média salarial nessa empresa?

SELECT AVG(emp.salario) 
      FROM empregado emp


-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
-- Quem é a pessoa que possui mais tempo de alocação no projeto 'Newbenefits'?

    SELECT emp.pnome, trb.horas 
      FROM empregado emp
INNER JOIN trabalha_em trb 
        ON trb.essn = emp.ssn
INNER JOIN projeto prj 
        ON prj.pnumero = trb.pno
     WHERE prj.pjnome = 'Newbenefits'
  ORDER BY trb.horas DESC

-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
-- Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?

    SELECT COUNT(1) QTD_MESMO_NOME
      FROM empregado emp
INNER JOIN dependente dep 
        ON dep.essn = emp.ssn
     WHERE DEP.nome_dependente = emp.pnome

-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
-- Quantos empregados do departamento 5 trabalham mais de 10h por semana no projeto chamado "ProductX"?

    SELECT *
      FROM empregado emp
INNER JOIN trabalha_em trb 
        ON trb.essn = emp.ssn
INNER JOIN projeto prj 
        ON prj.pnumero = trb.pno
INNER JOIN departamento dep 
        ON dep.dnumero = emp.dno
     WHERE dep.dnumero = 5 
       AND trb.horas > 10 
       AND prj.pjnome = 'ProductX'

-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
-- Qual é a soma dos salários de todos os empregados do departamento chamado 'Research'?

    SELECT sum(emp.salario) 
      FROM empregado emp
INNER JOIN departamento dep 
        ON dep.dnumero = emp.dno
     WHERE dep.dnome = 'Research'

-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
-- Qual seria o custo do projeto com folha salarial (soma de todos os salários), caso a empresa desse 10% de aumento para todos os empregados que trabalham no projeto 'ProductX'?
   
    SELECT sum(emp.salario) * 1.1 SALARIO_COM_10_PORCENTO
      FROM empregado emp
INNER JOIN trabalha_em trb 
        ON trb.essn = emp.ssn
INNER JOIN projeto prj 
        ON prj.pnumero = trb.pno
     WHERE prj.pjnome = 'ProductX'

-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
-- Quais os nomes de todos os empregados que são diretamente supervisionados por Franklin Wong?

    SELECT emp.* 
      FROM empregado sup
INNER JOIN empregado emp 
        ON emp.superssn = sup.ssn
     WHERE sup.pnome = 'Franklin' 
       AND sup.unome = 'Wong'

-- Considere o banco de dados do enunciado. Crie uma consulta em SQL e responda: 
-- Qual o nome do departamento com a menor média de salário entre seus funcionários?

    SELECT dep.dnome, avg(emp.salario) 
      FROM empregado emp 
INNER JOIN departamento dep 
        ON dep.dnumero = emp.dno
  GROUP BY dep.dnome
  ORDER BY avg(emp.salario) 