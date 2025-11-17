USE unibook;

-- 1) Lista geral de empréstimos com nome do usuário e título da obra
SELECT 
    e.id_emprestimo,
    u.nome  AS usuario,
    o.titulo AS obra,
    e.data_emprestimo,
    e.data_prevista_devolucao,
    e.data_devolucao
FROM EMPRESTIMO e
JOIN USUARIO  u  ON e.id_usuario  = u.id_usuario
JOIN EXEMPLAR ex ON e.id_exemplar = ex.id_exemplar
JOIN OBRA     o  ON ex.id_obra    = o.id_obra
ORDER BY e.data_emprestimo DESC;

-- 2) Top 3 obras mais emprestadas
SELECT 
    o.titulo,
    COUNT(*) AS total_emprestimos
FROM EMPRESTIMO e
JOIN EXEMPLAR ex ON e.id_exemplar = ex.id_exemplar
JOIN OBRA     o  ON ex.id_obra    = o.id_obra
GROUP BY o.id_obra, o.titulo
ORDER BY total_emprestimos DESC
LIMIT 3;

-- 3) Reservas ativas, com dados do usuário e da obra
SELECT
    r.id_reserva,
    u.nome  AS usuario,
    o.titulo AS obra,
    r.data_reserva,
    r.data_limite
FROM RESERVA r
JOIN USUARIO u ON r.id_usuario = u.id_usuario
JOIN OBRA    o ON r.id_obra    = o.id_obra
WHERE r.status_reserva = 'ativa'
ORDER BY r.data_reserva;

-- 4) Multas pendentes (não pagas) com nome do usuário
SELECT
    m.id_multa,
    u.nome AS usuario,
    m.dias_atraso,
    m.valor_total
FROM MULTA m
JOIN EMPRESTIMO e ON m.id_emprestimo = e.id_emprestimo
JOIN USUARIO   u ON e.id_usuario    = u.id_usuario
WHERE m.pago = FALSE
ORDER BY m.valor_total DESC;
