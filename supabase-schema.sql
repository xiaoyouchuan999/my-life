-- 在 Supabase Dashboard > SQL Editor 中执行一次。
create table if not exists public.my_life_state (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.my_life_state enable row level security;

drop policy if exists "Users can read their own My Life data" on public.my_life_state;
create policy "Users can read their own My Life data"
on public.my_life_state for select
using (auth.uid() = user_id);

drop policy if exists "Users can insert their own My Life data" on public.my_life_state;
create policy "Users can insert their own My Life data"
on public.my_life_state for insert
with check (auth.uid() = user_id);

drop policy if exists "Users can update their own My Life data" on public.my_life_state;
create policy "Users can update their own My Life data"
on public.my_life_state for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

drop policy if exists "Users can delete their own My Life data" on public.my_life_state;
create policy "Users can delete their own My Life data"
on public.my_life_state for delete
using (auth.uid() = user_id);
