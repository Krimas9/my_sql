--SELECT DISTINCT c1.y AS y 
--FROM c c1 
--WHERE NOT EXISTS 
-- (SELECT d.x FROM d 
--  WHERE d.x NOT IN (SELECT c2.x FROM c c2 WHERE c2.y = c1.y));

--c1 = SELECT titre, acteur FROM acteur;
--d = SELECT titre FROM film WHERE realisateur = 'François Truffaut';

SELECT DISTINCT c1.acteur  
FROM acteur c1 
WHERE NOT EXISTS 
 (SELECT d.titre FROM film d
  WHERE d.realisateur =  'François Truffaut' 
  AND   d.titre NOT IN (SELECT c2.titre FROM acteur c2 WHERE c2.acteur = c1.acteur)); 

 
