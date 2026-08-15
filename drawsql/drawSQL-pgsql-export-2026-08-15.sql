CREATE TABLE "roles"(
    "id" SERIAL NOT NULL,
    "nombre_rol" TEXT NOT NULL
);
ALTER TABLE
    "roles" ADD PRIMARY KEY("id");
CREATE TABLE "users"(
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "nombre_completo" TEXT NOT NULL,
    "psswrd_encriptada" TEXT NOT NULL,
    "account_status" TEXT NOT NULL,
    "rol_id" BIGINT NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "containers"(
    "id" SERIAL NOT NULL,
    "nombre_container" TEXT NOT NULL,
    "compose_textfile_data" JSON NOT NULL,
    "workspace_id" BIGINT NOT NULL,
    "volume_id" BIGINT NULL
);
ALTER TABLE
    "containers" ADD PRIMARY KEY("id");
CREATE TABLE "volumes"(
    "id" SERIAL NOT NULL,
    "volume_command" BIGINT NOT NULL
);
ALTER TABLE
    "volumes" ADD PRIMARY KEY("id");
CREATE TABLE "workspaces"(
    "id" BIGINT NOT NULL,
    "workspace_type_id" BIGINT NOT NULL,
    "allowed_roles" BIGINT[] NOT NULL,
    "owner_id" BIGINT NOT NULL
);
ALTER TABLE
    "workspaces" ADD PRIMARY KEY("id");
CREATE TABLE "workspace_type"(
    "id" BIGINT NOT NULL,
    "nombre_type" TEXT NOT NULL
);
ALTER TABLE
    "workspace_type" ADD PRIMARY KEY("id");
CREATE TABLE "virtual_machines"(
    "id" SERIAL NOT NULL,
    "nombre_vm" TEXT NOT NULL,
    "qemu_command" JSON NOT NULL,
    "workspace_id" BIGINT NOT NULL
);
ALTER TABLE
    "virtual_machines" ADD PRIMARY KEY("id");
ALTER TABLE
    "containers" ADD CONSTRAINT "containers_workspace_id_foreign" FOREIGN KEY("workspace_id") REFERENCES "workspaces"("id");
ALTER TABLE
    "workspaces" ADD CONSTRAINT "workspaces_workspace_type_id_foreign" FOREIGN KEY("workspace_type_id") REFERENCES "workspace_type"("id");
ALTER TABLE
    "roles" ADD CONSTRAINT "roles_id_foreign" FOREIGN KEY("id") REFERENCES "workspaces"("allowed_roles");
ALTER TABLE
    "virtual_machines" ADD CONSTRAINT "virtual_machines_workspace_id_foreign" FOREIGN KEY("workspace_id") REFERENCES "workspaces"("id");
ALTER TABLE
    "workspaces" ADD CONSTRAINT "workspaces_owner_id_foreign" FOREIGN KEY("owner_id") REFERENCES "users"("id");
ALTER TABLE
    "users" ADD CONSTRAINT "users_rol_id_foreign" FOREIGN KEY("rol_id") REFERENCES "roles"("id");
ALTER TABLE
    "containers" ADD CONSTRAINT "containers_volume_id_foreign" FOREIGN KEY("volume_id") REFERENCES "volumes"("id");