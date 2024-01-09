-- Crear la tabla "programa" 
CREATE TABLE programa (
    id serial PRIMARY KEY,
    estado_ori text,
    caracter_ori text,
    estado_nue text,
    caracter_nue text,
    desplazamiento text
);

--Verifica que el string tenga la misma cantidad de 1s y 0s
INSERT INTO programa (estado_ori, caracter_ori, estado_nue, caracter_nue, desplazamiento) VALUES
    ('Qa', '0', 'Qb', '0', 'R'),  
    ('Qa', '1', 'Qc', '1', 'R'),  
    ('Qb', '0', 'Qe', '0', 'R'), 
    ('Qb', '1', 'Qd', '1', 'R'), 
    ('Qc', '0', 'Qd', '0', 'R'), 
    ('Qc', '1', 'Qe', '1', 'R'), 
    ('Qd', '0', 'Qc', '0', 'R'), 
    ('Qd', '1', 'Qb', '1', 'R'), 
    ('Qe', '0', 'Qb', '0', 'R'), 
    ('Qe', '1', 'Qc', '1', 'R'), 
    ('Qe', 'B', 'Qf', 'B', 'N'); 
    
--Te devuelva la reversa del string en la cinta
INSERT INTO programa (estado_ori, caracter_ori, estado_nue, caracter_nue, desplazamiento) VALUES
    ('Q0', '0', 'Q0', '0', 'L'),
    ('Q0', '1', 'Q0', '1', 'L'),
    ('Q0', 'B', 'Q1', 'A', 'R'),

    ('Q1', '0', 'Q1', '0', 'R'),  
    ('Q1', '1', 'Q1', '1', 'R'),
    ('Q1', 'B', 'Q2', 'Z', 'L'),
    
    ('Q2', 'B', 'Q2', 'B', 'L'),
    ('Q2', 'A', 'Q8', 'B', 'L'),
    ('Q2', '1', 'Q3', 'B', 'R'),
    ('Q2', '0', 'Q6', 'B', 'R'),
    
    ('Q8', 'B', 'Q8', 'B', 'R'),
    ('Q8', 'Z', 'Q9', 'B', 'R'),
    
    ('Q3', 'B', 'Q3', 'B', 'R'),
    ('Q3', 'Z', 'Q4', 'Z', 'R'),
    
    ('Q4', 'B', 'Q5', '1', 'L'),
    ('Q4', '0', 'Q4', '0', 'R'),
    ('Q4', '1', 'Q4', '1', 'R'),
    
    ('Q5', '0', 'Q5', '0', 'L'),
    ('Q5', '1', 'Q5', '1', 'L'),
    ('Q5', 'Z', 'Q2', 'Z', 'L'),
    
    ('Q6', 'B', 'Q6', 'B', 'R'),
    ('Q6', 'Z', 'Q7', 'Z', 'R'),

    ('Q7', 'B', 'Q5', '0', 'L'),
    ('Q7', '0', 'Q7', '0', 'R'),
    ('Q7', '1', 'Q7', '1', 'R');

--verifica si el input es palindromo

INSERT INTO programa (estado_ori, caracter_ori, estado_nue, caracter_nue, desplazamiento) VALUES
   ('Q0','0','Q1','B','R'),
('Q0','1','Q2','B','R'),
('Q0','B','Q6','B','R'),

('Q1','0','Q1','0','R'),
('Q1','1','Q1','1','R'),
('Q1','B','Q3','B','L'),

('Q2','0','Q2','0','R'),
('Q2','1','Q2','1','R'),
('Q2','B','Q4','B','L'),

('Q3','0','Q5','B','L'),
('Q3','B','Q6','B','R'),

('Q4','1','Q5','B','L'),
('Q4','B','Q6','B','R'),

('Q5','0','Q5','0','L'),
('Q5','1','Q5','1','L'),
('Q5','B','Q0','B','R');

-- programa de resta 
INSERT INTO programa (estado_ori, caracter_ori, estado_nue, caracter_nue, desplazamiento) VALUES
    ('Q0', '1', 'Q1', '1', 'R'),

    ('Q1', '1', 'Q1', '1', 'R'),
    ('Q1', '0', 'Q2', 'X', 'R'),

    ('Q2', '0', 'Q2', 'X', 'R'),  
    ('Q2', '1', 'Q2', '0', 'R'),
    ('Q2', 'B', 'Q3', 'B', 'L'),
    
    ('Q3', '0', 'Q3', '0', 'L'),
    ('Q3', 'X', 'Q4', '0', 'R'),
    
    ('Q4', '0', 'Q5', 'X', 'R'),
    
    ('Q5', '0', 'Q8', '0', 'L'),
    ('Q5', 'B', 'Q6', 'B', 'L'),
    
    ('Q6', 'X', 'Q7', 'B', 'L'),
    
    ('Q7', '0', 'Q8', '0', 'L'),

    ('Q8', '0', 'Q8', '0', 'L'),
    ('Q8', 'X', 'Q4', '0', 'R'),
    ('Q8', '1', 'Q9', '1', 'R'),

    ('Q9', '0', 'Q9', '0', 'R'),
    ('Q9', 'B', 'Q10', 'B', 'L'),
    
    ('Q10', '0', 'Q11', '0', 'L'),
    
    ('Q11', '0', 'Q11', '0', 'L'),
    ('Q11', '1', 'Q12', '0', 'R'),

    ('Q12', '0', 'Q13', '0', 'R'),

    ('Q13', '0', 'Q14', '0', 'R'),
    ('Q13', 'B', 'Q17', 'B', 'L'),

    ('Q14', '0', 'Q14', '0', 'R'),
    ('Q14', 'B', 'Q15', 'B', 'L'),
    
    ('Q15', '0', 'Q16', 'B', 'L'),
    
    ('Q16', '0', 'Q11', 'B', 'L'),

    ('Q17', '0', 'Q17', 'B', 'L'),
    ('Q17', '1', 'Q18', '1', 'R'),
    ('Q17', 'B', 'Q18', 'B', 'R');
