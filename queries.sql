SELECT C.name FROM Chracters WHERE C.name IN (SELECT K.name FROM Kind_of K WHERE K.speciename = "Human")
--This query finds characters whose specie is human
---------------------------------
SELECT P.planetname, P.moon_number FROM Planets P WHERE (SELECT MAX(P2.moon_number) FROM Planets P2)=P.moon_number 
--This query finds the planet which has maximum moon number
--------------------------
SELECT S.speciename, COUNT(*) AS speciecount FROM Species S, Kind_of K WHERE S.speciename=K.speciename GROUP BY S.speciename
--This query shows how many characters are belong to each specie
--------------------------
SELECT C.affilation,COUNT(*) AS affilationcount FROM Characters C GROUP BY C.affilation HAVING COUNT(*)>1 
--This query gives count of members of affilations which have more than one member
---------------------------
SELECT C.affilation,COUNT(*) AS affilationcount FROM Characters C GROUP BY C.affilation
--This query gives count of members of ALL affilations(different from the above)
---------------------------
SELECT S.speciename,P.planetname FROM Species S, Planets P, Lives L WHERE L.status="Immigrant" AND L.speciename=S.speciename AND P.planetname=L.planetname
--This query shows the specie names and planetnames which species are immigrant of that planet
---------------------------
SELECT S.speciename,P.planetname FROM Species S, Planets P, Lives L WHERE L.status="Native" AND L.speciename=S.speciename AND P.planetname=L.planetname
--This query shows the specie names and planetnames which species are native specie of that planet