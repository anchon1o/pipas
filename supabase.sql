-- Pipas! · táboas no proxecto Supabase "xogos" (prefixo pip_)
-- Pégao enteiro en Supabase → SQL Editor → New query → Run.

create table if not exists public.pip_ranking (
  id        bigserial primary key,
  creado    timestamptz not null default now(),
  modo      text not null check (modo in ('dia','p100','s100')),
  dia       date not null default current_date,
  nome      text not null check (char_length(nome) between 1 and 20),
  cliente   text not null check (char_length(cliente) between 6 and 64),
  puntos    integer not null default 0 check (puntos between -5000 and 20000),
  tempo     real not null default 0 check (tempo between 0 and 3600),
  valor     real not null check (valor between -5000 and 20000),
  limpo     boolean not null default false,
  tira      text check (char_length(tira) <= 400)
);

-- Unha soa partida por persoa e día no reto do día
create unique index if not exists pip_ranking_un_dia
  on public.pip_ranking (cliente, dia) where modo = 'dia';

create index if not exists pip_ranking_modo_creado on public.pip_ranking (modo, creado desc);
create index if not exists pip_ranking_modo_dia on public.pip_ranking (modo, dia);

alter table public.pip_ranking enable row level security;

drop policy if exists "pip_ranking ler" on public.pip_ranking;
create policy "pip_ranking ler" on public.pip_ranking
  for select to anon, authenticated using (true);

drop policy if exists "pip_ranking engadir" on public.pip_ranking;
create policy "pip_ranking engadir" on public.pip_ranking
  for insert to anon, authenticated with check (true);

-- A carreira en liña non garda nada na base de datos:
-- usa as canles de Realtime (broadcast + presence) co nome pip_sala_XXXX.
