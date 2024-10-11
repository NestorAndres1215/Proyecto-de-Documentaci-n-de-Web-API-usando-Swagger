USE BDNOTAS2020ok
GO

select ROW_NUMBER() OVER(ORDER BY A.apealumno) as Fila,   
          * from ALUMNOS A
go

CREATE OR ALTER PROCEDURE PA_ALUMNOS_CANTIDAD_PAGOS
@inicio char(6), @final char(6)
	as
		SELECT 
		A.codalumno+'_'+semestre as clave, 
		A.codalumno,semestre, 
		CONCAT(apealumno, ' ', nomalumno) AS nomcompleto,
		nomesp,
		COUNT(monto) as cantidad_pago, 
		SUM(monto) AS total
		FROM ALUMNOS A INNER JOIN PAGOS P
			ON A.codalumno = P.codalumno INNER JOIN ESPECIALIDAD E 
				ON A.codesp = E.codesp
		WHERE P.semestre BETWEEN @inicio  AND @final
			GROUP BY A.codalumno, CONCAT(apealumno, ' ', nomalumno),
			         nomesp, semestre
		ORDER BY A.codalumno, semestre
GO

exec dbo.PA_ALUMNOS_CANTIDAD_PAGOS '2018-1', '2020-2'
go