CREATE DATABASE IF NOT EXISTS `ex01` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `ex01`;

CREATE TABLE Produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    foto TEXT,
    tamanhos JSON, -- Armazena como array JSON: ["P", "M", "G", "GG"]
    cores JSON, -- Armazena como array JSON: ["Vermelho", "Azul", "Preto"]
    tipo_peca VARCHAR(50) NOT NULL,
    moda VARCHAR(20) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

INSERT INTO Produtos (nome, preco, foto, tamanhos, cores, tipo_peca, moda) VALUES
-- Camisetas Básicas
('Camiseta Básica Algodão', 39.90, 'camiseta_basica.jpg', '["P", "M", "G"]', '["Preto", "Branco", "Cinza"]', 'camiseta', 'casual'),
('Camiseta Estampada Vintage', 59.90, 'camiseta_vintage.jpg', '["M", "G", "GG"]', '["Vermelho", "Azul", "Verde"]', 'camiseta', 'casual'),

-- Calças
('Calça Jeans Skinny', 129.90, 'calca_jeans.jpg', '["36", "38", "40", "42"]', '["Azul", "Preto"]', 'calca', 'casual'),
('Calça Social Slim Fit', 159.90, 'calca_social.jpg', '["38", "40", "42", "44"]', '["Cinza", "Preto", "Marrom"]', 'calca', 'formal');