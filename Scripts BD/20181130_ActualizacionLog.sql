/*
	Script para preparar la base datos en mira de la generación de log de 

*/


ALTER TABLE public."Log" DROP COLUMN "dFecha";

ALTER TABLE public."Log"
    ALTER COLUMN "vLog" TYPE character varying (200) COLLATE pg_catalog."default";
COMMENT ON COLUMN public."Log"."vLog"
    IS 'Descripción de la acción';

ALTER TABLE public."Log"
    ADD COLUMN "iIdUsuario" integer NOT NULL;

ALTER TABLE public."Log"
    ADD COLUMN "dFecha" timestamp without time zone NOT NULL;
ALTER TABLE public."Log"
    ADD CONSTRAINT "FKLogUsuario" FOREIGN KEY ("iIdUsuario")
    REFERENCES public."Usuario" ("iIdUsuario") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

CREATE TABLE public."DetalleLog"
(
    "iIdDetalleLog" serial NOT NULL,
    "iIdLog" integer NOT NULL,
    "jDatos" jsonb NOT NULL,
    "vTabla" character varying(100) NOT NULL,
    "vAccion" character varying(1) NOT NULL,
    PRIMARY KEY ("iIdDetalleLog"),
    CONSTRAINT "FKDetalleLogLog" FOREIGN KEY ("iIdLog")
        REFERENCES public."Log" ("iIdLog") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."DetalleLog"
    OWNER to postgres;

COMMENT ON COLUMN public."DetalleLog"."jDatos"
    IS 'Datos de la tabla en JSON';

COMMENT ON COLUMN public."DetalleLog"."vTabla"
    IS 'Nombre de la tabla en la base datos';

COMMENT ON COLUMN public."DetalleLog"."vAccion"
    IS 'Acción realizada sobre la información. A=Alta; B=Baja; C=Cambio;';