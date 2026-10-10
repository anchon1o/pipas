# Pipas! · instalación

- `index.html` — o xogo.
- `ranking.html` — só o ranking, para incrustar en cagando.
- `config.js` — os datos de Supabase (proxecto "xogos").
- `supabase.sql` — crea a táboa `pip_ranking`.
- `vercel.json` — permite mostrar `ranking.html` nun iframe.
- `pipas.png` — icona para cagando.

ranking.html: `lang` (gl, ca, eu, es) · `n` (posicións, 10) · `p` (hoxe, semana, mes, sempre) · `v` (dia, p100, s100)
Exemplo: `https://comepipas.vercel.app/ranking.html?lang=gl&n=10`
