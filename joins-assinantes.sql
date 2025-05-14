
SELECT Assinante.nm_assinante, Tipo_Assinante.ds_tipo
FROM Assinante
JOIN Tipo_Assinante
ON Assinante.cd_tipo = Tipo_Assinante.cd_tipo;


SELECT Assinante.nm_assinante, Municipio.ds_municipio, Tipo_Assinante.ds_tipo
FROM Assinante
JOIN Endereco ON Assinante.cd_endereco = Endereco.cd_endereco
JOIN Municipio ON Endereco.cd_municipio = Municipio.cd_municipio
JOIN Tipo_Assinante ON Assinante.cd_tipo = Tipo_Assinante.cd_tipo;

SELECT Assinante.nm_assinante, Telefone.n_fone
FROM Assinante
JOIN Telefone ON Assinante.cd_assinante = Telefone.cd_assinante;

SELECT Assinante.nm_assinante, Telefone.n_fone, Ramo.ds_ramo
FROM Assinante
JOIN Telefone ON Assinante.cd_assinante = Telefone.cd_assinante
JOIN Ramo ON Assinante.cd_ramo = Ramo.cd_ramo;


SELECT 
  Assinante.nm_assinante,
  Endereco.ds_endereco,
  Endereco.complemento,
  Endereco.bairro,
  Endereco.cep,
  Municipio.ds_municipio
FROM Assinante
JOIN Endereco ON Assinante.cd_endereco = Endereco.cd_endereco
JOIN Municipio ON Endereco.cd_municipio = Municipio.cd_municipio;
