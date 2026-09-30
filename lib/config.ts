/**
 * Configuração portátil: em qualquer fork, DATASUS_RELEASES_REPOSITORY aponta para "dono/repositorio".
 */
export const DEFAULT_RELEASES_REPOSITORY = "chvcti/sisaih01-instaladores";

export function getReleasesRepository(value = process.env.DATASUS_RELEASES_REPOSITORY) {
  const repository = value?.trim();
  return repository && /^[A-Za-z0-9_.-]+\/[A-Za-z0-9_.-]+$/.test(repository)
    ? repository
    : DEFAULT_RELEASES_REPOSITORY;
}
