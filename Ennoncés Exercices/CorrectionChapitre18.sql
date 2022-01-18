--Déterminez l’âge des animaux
SELECT nom, naissance, mort, FLOOR((TO_DAYS (NOW())- TO_DAYS(naissance))/365) AS Age FROM animaux;

--Rechercher l'âge des animaux morts
SELECT nom, naissance, mort, FLOOR((TO_DAYS (mort)- TO_DAYS(naissance))/365) AS Age FROM animaux WHERE mort IS NOT NULL and naissance IS NOT NULL;

--Rechercher les animaux dont l’anniversaire sera le mois prochain
SELECT nom, naissance FROM animaux WHERE MONTH(naissance) = MONTH(DATE_ADD(NOW(), INTERVAL 1 MONTH)) ;