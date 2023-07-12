create schema api;

create role web_anon nologin;
grant usage on schema api to web_anon;

drop extension if exists "uuid-ossp";
create extension if not exists "uuid-ossp";

create table api.users (
    id uuid primary key default uuid_generate_v4(),
    "name" name not null
);
grant select, update, insert, delete on table api.users to web_anon;

create table api.todos (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid not null references api.users(id),
    done boolean not null default false,
    task text not null,
    due timestamptz
);
grant select, update, insert, delete on table api.todos to web_anon;
