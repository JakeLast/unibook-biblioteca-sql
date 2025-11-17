USE unibook;

-- ====================
-- COMANDOS DE UPDATE
-- ====================

-- 1) Atualizar o e-mail de um usuário
UPDATE USUARIO
SET email = 'ana.silva@unibook.edu'
WHERE id_usuario = 1;

-- 2) Atualizar o estado de conservação de um exemplar
UPDATE EXEMPLAR
SET estado_conservacao = 'danificado'
WHERE id_exemplar = 3;

-- 3) Marcar uma multa como paga
UPDATE MULTA
SET pago = TRUE
WHERE id_multa = 1;

-- ====================
-- COMANDOS DE DELETE
-- ====================

-- 1) Remover uma reserva cancelada
DELETE FROM RESERVA
WHERE id_reserva = 3
  AND status_reserva = 'cancelada';

-- 2) Remover multas com valor total igual a zero (se existirem)
DELETE FROM MULTA
WHERE valor_total = 0;

-- 3) Remover um usuário sem empréstimos nem reservas associadas
DELETE FROM USUARIO u
WHERE u.id_usuario = 4
  AND NOT EXISTS (
        SELECT 1 FROM EMPRESTIMO e
        WHERE e.id_usuario = u.id_usuario
  )
  AND NOT EXISTS (
        SELECT 1 FROM RESERVA r
        WHERE r.id_usuario = u.id_usuario
  );
