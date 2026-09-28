# SISAIH01 — instaladores (espelho interno)

Espelho interno de instaladores do **SISAIH01** (DATASUS/Ministério da Saúde), mantido pela TI para uso quando o FTP oficial (`ftp2.datasus.gov.br`) está inacessível.

Os arquivos **não são commitados no histórico do git** — ficam como assets de [GitHub Releases](../../releases), igual ao padrão adotado pelo projeto de origem.

## Versão atual

| Campo | Valor |
| --- | --- |
| Arquivo | `sisaih01_ver2530.exe` |
| Competência | 09/2026 |
| Versão | 25.30 |
| Tamanho | 16.190.125 bytes |
| SHA-256 | `f3c1a8d5faba65d9f3b2957febe7c1f379600c03511eebe9f24ee81eeb905bdd` |
| Tipo | PE32 executable (Windows GUI, Intel i386, 8 seções) — instalador Inno Setup 5.1.7 |
| Assinatura digital (Authenticode) | **Não assinado** — igual ao padrão histórico dos instaladores DATASUS, não é peculiaridade deste espelho |

## Origem

Baixado de [`BRConnect/datasus-releases`](https://github.com/BRConnect/datasus-releases), um catálogo independente (sem afiliação ao Ministério da Saúde) que republica instaladores do DATASUS em GitHub Releases com HTTPS, porque parte da distribuição oficial só existe via FTP.

O release usado: [`sih-sisaih01-09-2026-v25-30`](https://github.com/BRConnect/datasus-releases/releases/tag/sih-sisaih01-09-2026-v25-30), publicado em 25/09/2026.

Fonte primária original, segundo o manifesto do BRConnect:

- Página oficial: `http://sihd.datasus.gov.br/versao/versao_sisaih01.php`
- Link direto usado pelo sincronizador: `ftp://ftp2.datasus.gov.br/public/sistemas/dsweb/SIHD/Programas/sisaih01_ver2530.exe`

## Verificação feita antes de publicar aqui

1. **Hash e tamanho**: conferidos contra o asset publicado no release do BRConnect (bateram).
2. **Estrutura do executável**: cabeçalho PE válido, sem sinais de arquivo corrompido ou renomeado (é de fato um binário Windows, não um script disfarçado).
3. **Revisão do código-fonte do sincronizador** (`scripts/sync/*.ts` do BRConnect): o pipeline busca a URL de download direto do HTML/RSS das páginas oficiais do DATASUS (`sihd.datasus.gov.br`, `sia.datasus.gov.br`, `ciha.saude.gov.br`, `sigtap.datasus.gov.br`), baixa exatamente essa URL via `curl` e publica sem executar ou modificar o conteúdo. Não há redirecionamento pra terceiros nem lógica ofuscada.
4. **Antivírus**: **não foi possível rodar scan de AV/EDR neste ambiente** (sem ClamAV nem acesso a VirusTotal configurado). Isso **não substitui** o scan do antivírus corporativo — rode o AV padrão da SES-BA antes de instalar em qualquer máquina de produção/faturamento.

## Limitações e responsabilidade

- Este é um espelho de conveniência, não um canal oficial. Sempre que o FTP oficial estiver acessível, prefira baixar direto de `ftp2.datasus.gov.br` ou confira a versão publicada em `sihd.datasus.gov.br/versao/versao_sisaih01.php`.
- O binário não é assinado digitalmente — isso é característica do instalador original do DATASUS, não foi introduzido por este espelho, mas significa que não há garantia criptográfica de autoria além da correspondência de hash/tamanho com a fonte oficial documentada.
- Repositório privado, uso interno da TI.
