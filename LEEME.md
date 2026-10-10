# Pipas! · instalación

Ficheiros:
- `index.html` — o xogo.
- `ranking.html` — o ranking (tamén para incrustar en cagando).
- `config.js` — onde pegas os datos de Supabase.
- `supabase.sql` — crea a táboa `pip_ranking`.

Pasos detallados: mira a conversa con Claude.

Parámetros de `ranking.html`: `lang` (gl, ca, eu, es), `n` (número de filas), `p` (hoxe, semana, mes, sempre), `v` (dia, p100, s100) e `embed=1` para fondo transparente.
Exemplo: `ranking.html?lang=gl&n=5&p=hoxe&v=dia&embed=1`
