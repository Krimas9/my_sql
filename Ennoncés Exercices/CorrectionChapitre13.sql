--Afficher la moyenne du nombre d’habitants
SELECT AVG(population) FROM VILLE ;

--Afficher la moyenne du nombre d’habitants des villes de chaque pays
SELECT AVG(population) FORM VILLE GROUP BY code_pays ;

--Afficher le nombre d’habitants de la ville la plus peuplée de chaque pays
SELECT MAX(population) FROM ville GROUP BY code_pays ;

--Afficher le nombre de villes
SELECT COUNT(DISTINCT nom_ville) FROM VILLE ;

--Afficher le nombre de villes de chaque pays
SELECT COUNT(DISTINCT nom_ville) FROM VILLE GROUPE BY code_pays

--Afficher le nombre d’habitants de la ville la moins peuplée
SELECT MIN(population) FROM ville

--Afficher le nombre de villes qui commence par L
SELECT COUNT(*) FROM VILLE WHERE nom_ville LIKE 'L%';
