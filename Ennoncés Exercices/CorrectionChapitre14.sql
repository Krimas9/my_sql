--Nous pouvons utiliser INNER JOIN et NATURAL JOIN
--Les jointures externes fonctionnent aussi car il y bien une correspondance entre jean dupond et une destination

--Solution 1
SELECT d.name FROM 
CUSTOMER c NAURAL JOIN TRAVEL t NATURAL JOIN DESTINATION d
WHERE c.first_name = 'jean' AND c.last_name = 'Dupond' ;

--Solution 2
SELECT d.name FROM 
CUSTOMER c JOIN TRAVEL t NATURAL JOIN DESTINATION d
ON c.no_customer = t.no_customer AND t.no_destination = d.no_destination
WHERE c.first_name = 'jean' AND c.last_name = 'Dupond' ;

--Solution 3
SELECT d.name FROM 
CUSTOMER c LEFT JOIN TRAVEL t NATURAL LEFT JOIN DESTINATION d
ON c.no_customer = t.no_customer AND t.no_destination = d.no_destination
WHERE c.first_name = 'jean' AND c.last_name = 'Dupond' ;

--Solution 4
SELECT d.name FROM 
CUSTOMER c RIGHT JOIN TRAVEL t NATURAL RIGHT JOIN DESTINATION d
ON c.no_customer = t.no_customer AND t.no_destination = d.no_destination
WHERE c.first_name = 'jean' AND c.last_name = 'Dupond' ;

-------------------------------------------------------------------------------
--Nous pouvons utiliser INNER JOIN et NATURAL JOIN
--Les jointures externes fonctionnent aussi car il y bien une correspondance entre la destination Madrid et une les étapes
--Solution 1
SELECT s.name FROM DESTINATION d NATURAL JOIN STEP s
WHERE d.name = 'Madrid' ;

--Solution 2
SELECT s.name FROM DESTINATION d JOIN STEP s
ON s.no_destination = d.no_destination
WHERE d.name = 'Madrid' ;

--Solution 1
SELECT s.name FROM DESTINATION d LEFT JOIN STEP s
ON s.no_destination = d.no_destination
WHERE d.name = 'Madrid' ;

--Solution 1
SELECT s.name FROM DESTINATION d RIGHT JOIN STEP s
ON s.no_destination = d.no_destination
WHERE d.name = 'Madrid' ;
