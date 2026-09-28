# SISAIH01 Instaladores — TI HGVC

Catálogo interno que espelha instaladores do **SISAIH01, BPA, SIA, CIHA01 e SIGTAP** (DATASUS/Ministério da Saúde) em [GitHub Releases](../../releases), com download HTTPS — para uso quando o FTP oficial (`ftp2.datasus.gov.br` e outros hosts DATASUS) estiver fora do ar ou bloqueado na rede.

> **Uso interno da TI do HGVC.** Este projeto não é afiliado ao Ministério da Saúde nem ao DATASUS, e não substitui os portais oficiais. Sempre que a fonte oficial estiver acessível, prefira baixar direto de lá.

## Por que existe

Parte da distribuição oficial do DATASUS só existe via FTP, protocolo que costuma ser bloqueado por firewalls corporativos e que os navegadores atuais não tratam mais como cidadão de primeira classe. Quando isso trava um download urgente (ex.: fechamento de competência), este catálogo serve de contingência: baixa o mesmo arquivo oficial e republica com link HTTPS estável.

## Como funciona

Workflow do GitHub Actions (`.github/workflows/sync-datasus.yml`), agendado diariamente:

1. consulta as páginas HTML/RSS oficiais do DATASUS diretamente (`sihd.datasus.gov.br`, `sia.datasus.gov.br`, `ciha.saude.gov.br`, `sigtap.datasus.gov.br`);
2. interpreta cada resposta, valida o nome do arquivo esperado por programa;
3. baixa o instalador exatamente da URL oficial encontrada;
4. publica como asset de [GitHub Releases](../../releases) deste repositório;
5. atualiza `public/releases.json`, consumido pelo catálogo web.

Este fork **não depende de nenhum repositório de terceiros** — a sincronização fala direto com as fontes oficiais do DATASUS.

## Executar o catálogo localmente

```bash
npm install
npm run build
npm run start   # http://localhost:3000
```

(O projeto original foi feito para `bun`; `npm` funciona igual, só não tem o lockfile dedicado.)

## Rodar a sincronização manualmente

```bash
GH_TOKEN=seu_token_com_permissao_de_escrita npm run sync:datasus
```

Não versione tokens. No GitHub Actions, o workflow usa o token temporário do próprio job (`${{ github.token }}`), sem segredo adicional a configurar.

## Verificação de origem — SISAIH01 v25.30 (primeiro item mirrorado)

O primeiro instalador publicado aqui (antes do sincronizador automático assumir) foi conferido manualmente:

| Campo | Valor |
| --- | --- |
| Arquivo | `sisaih01_ver2530.exe` |
| Competência | 09/2026 |
| Tamanho | 16.190.125 bytes |
| SHA-256 | `f3c1a8d5faba65d9f3b2957febe7c1f379600c03511eebe9f24ee81eeb905bdd` |
| Tipo | PE32 (Windows GUI, Intel i386) — instalador Inno Setup 5.1.7 |
| Assinatura digital | Não assinado (característica do instalador oficial do DATASUS, não deste espelho) |
| Fonte oficial | `http://sihd.datasus.gov.br/versao/versao_sisaih01.php` → `ftp://ftp2.datasus.gov.br/public/sistemas/dsweb/SIHD/Programas/sisaih01_ver2530.exe` |

**Não foi rodado antivírus/EDR neste arquivo** (ambiente sem ClamAV/VirusTotal). Rode o AV corporativo antes de instalar em qualquer máquina de produção/faturamento.

## Origem do projeto

Este repositório começou como fork de [`BRConnect/datasus-releases`](https://github.com/BRConnect/datasus-releases), catálogo público independente com a mesma proposta. Código adaptado e republicado sob a mesma licença Apache 2.0 (ver `LICENSE`).

## Segurança e limites

Os executáveis e arquivos compactados são baixados e anexados às releases, mas **nunca são executados** pelo projeto ou pelo workflow. GitHub Releases é uma camada de distribuição, não uma certificação de segurança do conteúdo — valide origem, nome, competência, tamanho e (quando possível) hash antes de instalar.

Repositório **privado**, uso interno da TI do HGVC.
