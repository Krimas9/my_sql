--Trouver le nombre de voyages qui passent par Paris
SELECT COUNT(*)
 FROM TRAVEL 
 WHERE no_destination IN
	(
	 SELECT no_destination 
	  FROM STEP 
	  WHERE name = 'Paris'
	);


--Donner le prix du voyage ayant le prix le plus haut
SELECT price
FROM TRAVEL
WHERE price <=  ALL (
SELECT price
FROM TRAVEL

)
;

--Donner le prix du/des voyage(s) ayant le plus d’étapes
SELECT price 
FROM TRAVEL
WHERE no_destination IN (
SELECT no_destination
FROM STEP 
    WHERE no_order >= ALL 
    (
        SELECT no_order
        FROM step
    )
);

--Donner les dates des voyages qui ne font pas étape à Madrid

SELECT travel_date 
FROM TRAVEL
WHERE no_destination NOT IN (
SELECT no_destination
FROM STEP 
    WHERE name = 'Madrid' 
 
);
