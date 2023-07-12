create schema auth;

create role app_user nologin;
grant usage on schema auth to app_user;
grant usage on schema api to app_user;

create function auth.current_user() returns uuid AS
$$
  begin
    return uuid(current_setting('request.jwt.claims', true)::json->>'sub');
  end;
$$ language 'plpgsql';

revoke select, update, insert, delete on table api.users from web_anon;
alter table api.users alter id set default auth.current_user();
alter table api.users enable row level security;
create policy access_policy on api.users using (
    id = auth.current_user ()
);
grant select, insert, update, delete on table api.users to app_user;

revoke select, update, insert, delete on table api.todos from web_anon;
alter table api.todos alter user_id set default auth.current_user();
alter table api.todos enable row level security;
create policy access_policy on api.todos using (
    user_id = auth.current_user ()
);
grant select, insert, update, delete on table api.todos to app_user;
