-- 1.3 Reescrever o procedimento 1.2 com uma variável de saída
CREATE OR REPLACE PROCEDURE sp_total_pedidos_cliente (
    IN p_codigo_cliente INT,
    OUT p_total_pedidos INT
) LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COUNT(*) INTO p_total_pedidos FROM tb_pedido WHERE cod_cliente = p_codigo_cliente;

    -- Registro do log
    INSERT INTO tb_log (nome_procedimento) VALUES ('sp_total_pedidos_cliente');
END;
$$


-- 1.2 Adicionar um procedimento para exibir o total de pedidos de um cliente
-- CREATE OR REPLACE PROCEDURE sp_total_pedidos_cliente (
--     IN p_codigo_cliente INT
-- ) LANGUAGE plpgsql
-- AS $$
-- DECLARE
--     v_total_pedidos INT;
-- BEGIN
--     SELECT COUNT(*) INTO v_total_pedidos FROM tb_pedido WHERE cod_cliente = p_codigo_cliente;
--     RAISE NOTICE 'O cliente de código % possui % pedidos.', p_codigo_cliente, v_total_pedidos;

--     -- Registro do log
--     INSERT INTO tb_log (nome_procedimento) VALUES ('sp_total_pedidos_cliente');
-- END;
-- $$


-- EXERCICIOS STORE PROCEDURE
-- 1.1Adicione uma tabela de log ao sistema do restaurante. Ajuste cada procedimento para que ele registre
-- CREATE TABLE tb_log (
--     id SERIAL PRIMARY KEY,
--     data_operacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     nome_procedimento VARCHAR(100)
-- );

-- CREATE OR REPLACE PROCEDURE sp_cadastrar_cliente (
--     IN p_nome VARCHAR(200),
--     IN p_codigo INT DEFAULT NULL
-- ) LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     IF p_codigo IS NULL THEN
--         INSERT INTO tb_cliente(nome) VALUES (p_nome);
--     ELSE
--         INSERT INTO tb_cliente(codigo, nome) VALUES (p_codigo, p_nome);
--     END IF;

--     -- Registro do log
--     INSERT INTO tb_log (nome_procedimento) VALUES ('sp_cadastrar_cliente');
-- END;
-- $$