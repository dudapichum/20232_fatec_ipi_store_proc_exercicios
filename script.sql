-- EXERCICIOS STORE PROCEDURE
-- 1.1Adicione uma tabela de log ao sistema do restaurante. Ajuste cada procedimento para que ele registre
CREATE TABLE tb_log (
    id SERIAL PRIMARY KEY,
    data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    nome_procedimento VARCHAR(100)
);

CREATE OR REPLACE PROCEDURE sp_cadastrar_cliente (
    IN p_nome VARCHAR(200),
    IN p_codigo INT DEFAULT NULL
) LANGUAGE plpgsql
AS $$
BEGIN
    IF p_codigo IS NULL THEN
        INSERT INTO tb_cliente(nome) VALUES (p_nome);
    ELSE
        INSERT INTO tb_cliente(codigo, nome) VALUES (p_codigo, p_nome);
    END IF;

    -- Registro do log
    INSERT INTO tb_log (nome_procedimento) VALUES ('sp_cadastrar_cliente');
END;
$$