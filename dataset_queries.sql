-- Crear un dataset simple con decodificación de variables
SELECT 
    CASE 
        WHEN "DPTO" = 1 THEN 'Montevideo'
        WHEN "DPTO" = 2 THEN 'Artigas'
        WHEN "DPTO" = 3 THEN 'Canelones'
        WHEN "DPTO" = 4 THEN 'Cerro largo'
        WHEN "DPTO" = 5 THEN 'Colonia'
        WHEN "DPTO" = 6 THEN 'Durazno'
        WHEN "DPTO" = 7 THEN 'Flores'
        WHEN "DPTO" = 8 THEN 'Florida'
        WHEN "DPTO" = 9 THEN 'Lavalleja'
        WHEN "DPTO" = 10 THEN 'Maldonado'
        WHEN "DPTO" = 11 THEN 'Paysandú'
        WHEN "DPTO" = 12 THEN 'Río negro'
        WHEN "DPTO" = 13 THEN 'Rivera'
        WHEN "DPTO" = 14 THEN 'Rocha'
        WHEN "DPTO" = 15 THEN 'Salto'
        WHEN "DPTO" = 16 THEN 'San jose'
        WHEN "DPTO" = 17 THEN 'Soriano'
        WHEN "DPTO" = 18 THEN 'Tacuarembó'
        WHEN "DPTO" = 19 THEN 'Treinta y tres'
    END AS Departamento,
    CASE
        WHEN "Niveledu_r" = 1 THEN 'Preescolar'
        WHEN "Niveledu_r" = 2 THEN 'Primaria común'
        WHEN "Niveledu_r" = 3 THEN 'Primaria especial'
        WHEN "Niveledu_r" = 4 THEN 'Ciclo básico'
        WHEN "Niveledu_r" = 5 THEN 'Bachillerato'
        WHEN "Niveledu_r" = 6 THEN 'Enseñanza técnica/Formación profesional UTU'
        WHEN "Niveledu_r" = 7 THEN 'Magisterio o Profesorado'
        WHEN "Niveledu_r" = 8 THEN 'Terciario no universitario'
        WHEN "Niveledu_r" = 9 THEN 'Universidad o similar'
        WHEN "Niveledu_r" = 10 THEN 'Posgrado (Diploma/Maestría/Doctorado)'
        WHEN "Niveledu_r" = 11 THEN 'Terciario sin especificar'
        WHEN "Niveledu_r" = 12 THEN 'Nunca asistió'
        WHEN "Niveledu_r" = 13 THEN 'Ignorado'
        WHEN "Niveledu_r" = 88 THEN 'No relevado'
    END AS NivelEducativo,
    CASE
        WHEN "PERPH02" = 1 THEN 'Hombre'
        WHEN "PERPH02" = 2 THEN 'Mujer'
    END AS Sexo,
    CASE
        WHEN "PERER01_1" = 1 THEN 'Sí'
        WHEN "PERER01_1" = 2 THEN 'No'
        WHEN "PERER01_1" = 8 THEN 'No relevado'
        WHEN "PERER01_1" = 9 THEN 'Ignorado'
    END AS Ascendencia_Afro 
FROM personas

--Crear un dataset con porcentajes previamente calculados y geocódigos:
SELECT 
    CASE 
        WHEN "DPTO" = 1 THEN 'Montevideo'
        WHEN "DPTO" = 2 THEN 'Artigas'
        WHEN "DPTO" = 3 THEN 'Canelones'
        WHEN "DPTO" = 4 THEN 'Cerro largo'
        WHEN "DPTO" = 5 THEN 'Colonia'
        WHEN "DPTO" = 6 THEN 'Durazno'
        WHEN "DPTO" = 7 THEN 'Flores'
        WHEN "DPTO" = 8 THEN 'Florida'
        WHEN "DPTO" = 9 THEN 'Lavalleja'
        WHEN "DPTO" = 10 THEN 'Maldonado'
        WHEN "DPTO" = 11 THEN 'Paysandú'
        WHEN "DPTO" = 12 THEN 'Río negro'
        WHEN "DPTO" = 13 THEN 'Rivera'
        WHEN "DPTO" = 14 THEN 'Rocha'
        WHEN "DPTO" = 15 THEN 'Salto'
        WHEN "DPTO" = 16 THEN 'San jose'
        WHEN "DPTO" = 17 THEN 'Soriano'
        WHEN "DPTO" = 18 THEN 'Tacuarembó'
        WHEN "DPTO" = 19 THEN 'Treinta y tres'
    END AS Departamento,
    CASE 
        WHEN "DPTO" = 1 THEN 'UY-MO'
        WHEN "DPTO" = 2 THEN 'UY-AR'
        WHEN "DPTO" = 3 THEN 'UY-CA'
        WHEN "DPTO" = 4 THEN 'UY-CL'
        WHEN "DPTO" = 5 THEN 'UY-CO'
        WHEN "DPTO" = 6 THEN 'UY-DU'
        WHEN "DPTO" = 7 THEN 'UY-FS'
        WHEN "DPTO" = 8 THEN 'UY-FD'
        WHEN "DPTO" = 9 THEN 'UY-LA'
        WHEN "DPTO" = 10 THEN 'UY-MA'
        WHEN "DPTO" = 11 THEN 'UY-PA'
        WHEN "DPTO" = 12 THEN 'UY-RN'
        WHEN "DPTO" = 13 THEN 'UY-RV'
        WHEN "DPTO" = 14 THEN 'UY-RO'
        WHEN "DPTO" = 15 THEN 'UY-SA'
        WHEN "DPTO" = 16 THEN 'UY-SJ'
        WHEN "DPTO" = 17 THEN 'UY-SO'
        WHEN "DPTO" = 18 THEN 'UY-TA'
        WHEN "DPTO" = 19 THEN 'UY-TT'
    END AS Geocode,
    (SUM(CASE WHEN "PERER01_1" = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*)) * 100 AS Porcentaje_Ascendencia_Afro
FROM personas
GROUP BY "DPTO"

--Métrica custom con código SQL
SUM(CASE WHEN ascendencia_afro = 'Sí' THEN 1 ELSE 0 END)