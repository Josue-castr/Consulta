--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-11-16 18:09:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 21239)
-- Name: Asentamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Asentamiento" (
    "iIdAsentamiento" integer NOT NULL,
    "vAsentamiento" character varying(155) NOT NULL,
    "iCodigoPostal" integer NOT NULL,
    "iIdLocalidad" integer,
    "iIdTipoAsentamiento" integer NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Asentamiento" OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE "Asentamiento"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Asentamiento" IS 'Los datos usados provienen del Catálogo de códigos postales de SEPOMEX 2018';


--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 196
-- Name: COLUMN "Asentamiento"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Asentamiento"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 197 (class 1259 OID 21243)
-- Name: Asentamiento_iIdAsentamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Asentamiento_iIdAsentamiento_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Asentamiento_iIdAsentamiento_seq" OWNER TO postgres;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 197
-- Name: Asentamiento_iIdAsentamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Asentamiento_iIdAsentamiento_seq" OWNED BY public."Asentamiento"."iIdAsentamiento";


--
-- TOC entry 198 (class 1259 OID 21245)
-- Name: Comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comentario" (
    "iIdComentario" integer NOT NULL,
    "vComentario" character varying(150) NOT NULL,
    "iEstatus" smallint DEFAULT 1 NOT NULL,
    "iIdPropuesta" integer NOT NULL,
    "iIdUsuario" integer NOT NULL,
    "iIdReplicaDe" integer DEFAULT 0,
    "dFecha" timestamp without time zone
);


ALTER TABLE public."Comentario" OWNER TO postgres;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN "Comentario"."iEstatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Comentario"."iEstatus" IS '0=Eliminado, 1=Pendiente de revisión, 2=Aprobado';


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN "Comentario"."iIdReplicaDe"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Comentario"."iIdReplicaDe" IS 'Si es distinto de 0, indica que es replica de otro comentario, hace referencia a esta misma tabla';


--
-- TOC entry 199 (class 1259 OID 21250)
-- Name: ComentarioLike; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ComentarioLike" (
    "iIdCometario" integer NOT NULL,
    "iIdUsuario" integer NOT NULL,
    "iLike" smallint NOT NULL,
    "dFecha" timestamp without time zone
);


ALTER TABLE public."ComentarioLike" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 21253)
-- Name: Comentario_iIdComentario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Comentario_iIdComentario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Comentario_iIdComentario_seq" OWNER TO postgres;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 200
-- Name: Comentario_iIdComentario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Comentario_iIdComentario_seq" OWNED BY public."Comentario"."iIdComentario";


--
-- TOC entry 201 (class 1259 OID 21255)
-- Name: GradoEstudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GradoEstudio" (
    "iIdGradoEstudio" integer NOT NULL,
    "vGradoEstudio" character varying(100) NOT NULL,
    "iActivo" smallint NOT NULL
);


ALTER TABLE public."GradoEstudio" OWNER TO postgres;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN "GradoEstudio"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."GradoEstudio"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 202 (class 1259 OID 21258)
-- Name: GradoEstudio_iIdGradoEstudio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GradoEstudio_iIdGradoEstudio_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GradoEstudio_iIdGradoEstudio_seq" OWNER TO postgres;

--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 202
-- Name: GradoEstudio_iIdGradoEstudio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GradoEstudio_iIdGradoEstudio_seq" OWNED BY public."GradoEstudio"."iIdGradoEstudio";


--
-- TOC entry 203 (class 1259 OID 21260)
-- Name: Localidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Localidad" (
    "iIdLocalidad" integer NOT NULL,
    "vClaveInegi" character varying(10) NOT NULL,
    "vLocalidad" character varying(100) NOT NULL,
    "nLatDec" double precision,
    "nLongDec" double precision,
    "iIdMunicipio" integer NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Localidad" OWNER TO postgres;

--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN "Localidad"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Localidad"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 204 (class 1259 OID 21264)
-- Name: Localidad_iIdLocalidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Localidad_iIdLocalidad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Localidad_iIdLocalidad_seq" OWNER TO postgres;

--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 204
-- Name: Localidad_iIdLocalidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Localidad_iIdLocalidad_seq" OWNED BY public."Localidad"."iIdLocalidad";


--
-- TOC entry 205 (class 1259 OID 21266)
-- Name: Log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Log" (
    "iIdLog" integer NOT NULL,
    "vLog" character varying(200) NOT NULL,
    "dFecha" time with time zone NOT NULL
);


ALTER TABLE public."Log" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 21269)
-- Name: Log_iIdLog_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Log_iIdLog_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Log_iIdLog_seq" OWNER TO postgres;

--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 206
-- Name: Log_iIdLog_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Log_iIdLog_seq" OWNED BY public."Log"."iIdLog";


--
-- TOC entry 207 (class 1259 OID 21271)
-- Name: Municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Municipio" (
    "iIdMunicipio" integer NOT NULL,
    "vMunicipio" character varying(50) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "vClaveInegi" character varying(10) NOT NULL
);


ALTER TABLE public."Municipio" OWNER TO postgres;

--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN "Municipio"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Municipio"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 208 (class 1259 OID 21275)
-- Name: Municipio_iIdMunicipio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Municipio_iIdMunicipio_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Municipio_iIdMunicipio_seq" OWNER TO postgres;

--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 208
-- Name: Municipio_iIdMunicipio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Municipio_iIdMunicipio_seq" OWNED BY public."Municipio"."iIdMunicipio";


--
-- TOC entry 209 (class 1259 OID 21277)
-- Name: Ocupacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ocupacion" (
    "iIdOcupacion" integer NOT NULL,
    "vClaveInegi" character varying(10) NOT NULL,
    "vOcupacion" character varying(250) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Ocupacion" OWNER TO postgres;

--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE "Ocupacion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Ocupacion" IS 'Los datos usados provienen del Catálogo del SINCO (Sistema Nacional de Clasificación de Ocupaciones) del INEGI 2011';


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN "Ocupacion"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Ocupacion"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 210 (class 1259 OID 21281)
-- Name: Ocupacion_iIdOcupacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ocupacion_iIdOcupacion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ocupacion_iIdOcupacion_seq" OWNER TO postgres;

--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 210
-- Name: Ocupacion_iIdOcupacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ocupacion_iIdOcupacion_seq" OWNED BY public."Ocupacion"."iIdOcupacion";


--
-- TOC entry 233 (class 1259 OID 21557)
-- Name: Parametro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Parametro" (
    "iIdParametro" integer NOT NULL,
    "vParametro" character varying(60) NOT NULL,
    "vDescripcion" character varying(150) NOT NULL,
    "vValor" character varying(50) NOT NULL,
    "vId" character varying(50) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Parametro" OWNER TO postgres;

--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "Parametro"."vParametro"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Parametro"."vParametro" IS 'Nombre del parámetro';


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "Parametro"."vDescripcion"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Parametro"."vDescripcion" IS 'Descripción del parámetro, objetivo o función';


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "Parametro"."vValor"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Parametro"."vValor" IS 'Valor del parámetro, puede ser de cualquier tipo según se requiera';


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "Parametro"."vId"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Parametro"."vId" IS 'Campo para identificar el parámetro desde código';


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN "Parametro"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Parametro"."iActivo" IS '0=Activo, 1Inactivo';


--
-- TOC entry 232 (class 1259 OID 21555)
-- Name: Parametro_iIdParametro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Parametro_iIdParametro_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Parametro_iIdParametro_seq" OWNER TO postgres;

--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 232
-- Name: Parametro_iIdParametro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Parametro_iIdParametro_seq" OWNED BY public."Parametro"."iIdParametro";


--
-- TOC entry 211 (class 1259 OID 21288)
-- Name: Permiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permiso" (
    "iIdPermiso" integer NOT NULL,
    "vPermiso" character varying(50) NOT NULL,
    "vDescripcion" character varying(150) NOT NULL,
    "vIdentificador" character varying(50),
    "vUrl" character varying(100),
    "vImagen" character varying(50),
    "iOrden" smallint DEFAULT 0,
    "iIdPermisoPadre" integer DEFAULT 0,
    "iTipo" smallint DEFAULT 1 NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Permiso" OWNER TO postgres;

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN "Permiso"."vImagen"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."vImagen" IS 'Para los permiso tipo menú, permite agregar un icono al momento de genera el menú vía código';


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN "Permiso"."iOrden"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iOrden" IS 'Indica el orden para los permisos de tipo módulo';


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN "Permiso"."iIdPermisoPadre"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iIdPermisoPadre" IS 'Para los permisos de tipo modulo, este campo ayuda a crear los sub-menús. Hace referencia a esta misma tabla.';


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN "Permiso"."iTipo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iTipo" IS '1=Módulo, 2=Acción';


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN "Permiso"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 212 (class 1259 OID 21295)
-- Name: Permiso_iIdPermiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Permiso_iIdPermiso_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Permiso_iIdPermiso_seq" OWNER TO postgres;

--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 212
-- Name: Permiso_iIdPermiso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Permiso_iIdPermiso_seq" OWNED BY public."Permiso"."iIdPermiso";


--
-- TOC entry 238 (class 1259 OID 21624)
-- Name: Pregunta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pregunta" (
    "iIdPregunta" integer NOT NULL,
    "vPregunta" character varying(200) NOT NULL,
    "iIdTabla" integer DEFAULT 0 NOT NULL,
    "vTabla" character varying(100) NOT NULL,
    "iTipo" smallint NOT NULL,
    "iActivo" smallint NOT NULL
);


ALTER TABLE public."Pregunta" OWNER TO postgres;

--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "Pregunta"."iIdTabla"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Pregunta"."iIdTabla" IS 'Id de la tabla a la que esta vinculada la pregunta';


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "Pregunta"."vTabla"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Pregunta"."vTabla" IS 'Nombre de la tabla a la que esta vinculada la pregunta';


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "Pregunta"."iTipo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Pregunta"."iTipo" IS 'Tipo de pregunta 1=Opción múltiple, 2=Cerrada, 3=Abierta';


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN "Pregunta"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Pregunta"."iActivo" IS '0=No, 1=Activo';


--
-- TOC entry 237 (class 1259 OID 21622)
-- Name: Pregunta_iIdPregunta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pregunta_iIdPregunta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Pregunta_iIdPregunta_seq" OWNER TO postgres;

--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 237
-- Name: Pregunta_iIdPregunta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pregunta_iIdPregunta_seq" OWNED BY public."Pregunta"."iIdPregunta";


--
-- TOC entry 234 (class 1259 OID 21577)
-- Name: PresupuestoUsuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PresupuestoUsuario" (
    "iIdTema" integer NOT NULL,
    "iIdUsuario" integer NOT NULL,
    "dFecha" timestamp without time zone NOT NULL
);


ALTER TABLE public."PresupuestoUsuario" OWNER TO postgres;

--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "PresupuestoUsuario"."iIdTema"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."PresupuestoUsuario"."iIdTema" IS 'Id a la tabla Tema para indicar el Tema al que el usuario sugiere se le destine el presupesto';


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "PresupuestoUsuario"."iIdUsuario"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."PresupuestoUsuario"."iIdUsuario" IS 'Usuario que hace la sugerencia de presupuesto';


--
-- TOC entry 3145 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN "PresupuestoUsuario"."dFecha"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."PresupuestoUsuario"."dFecha" IS 'Fecha y hora de la sugerencia';


--
-- TOC entry 213 (class 1259 OID 21297)
-- Name: Propuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Propuesta" (
    "iIdPropuesta" integer NOT NULL,
    "vTitulo" character varying(200) NOT NULL,
    "tDescripcion" text NOT NULL,
    "iIdTema" integer NOT NULL,
    "vUrlVideoExterno" character varying(150),
    "nLatDec" double precision,
    "nLongDec" double precision,
    "iEstatus" smallint DEFAULT 1 NOT NULL,
    "iIdUsuario" integer NOT NULL,
    "vCodigo" character varying(20),
    "dFecha" timestamp without time zone,
    "iIdMunicipio" integer DEFAULT 0
);


ALTER TABLE public."Propuesta" OWNER TO postgres;

--
-- TOC entry 3146 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN "Propuesta"."iEstatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Propuesta"."iEstatus" IS '0=No viable, 1=Pendiente de revisión, 2=Integrada, 3=Aprobada';


--
-- TOC entry 3147 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN "Propuesta"."iIdUsuario"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Propuesta"."iIdUsuario" IS 'Usuario que crea la propuesta';


--
-- TOC entry 3148 (class 0 OID 0)
-- Dependencies: 213
-- Name: COLUMN "Propuesta"."vCodigo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Propuesta"."vCodigo" IS 'Código para hacer referencia a la propuesta';


--
-- TOC entry 214 (class 1259 OID 21305)
-- Name: PropuestaAdjunto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PropuestaAdjunto" (
    "iIdPropuestaAdjunto" integer NOT NULL,
    "vNombreAdjunto" character varying(150) NOT NULL,
    "vRutaAdjunto" character varying(150) NOT NULL,
    "iTipo" smallint NOT NULL,
    "vExtension" character varying(5) NOT NULL,
    "iIdPropuesta" integer NOT NULL,
    "dFecha" timestamp without time zone,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."PropuestaAdjunto" OWNER TO postgres;

--
-- TOC entry 3149 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "PropuestaAdjunto"."vRutaAdjunto"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."PropuestaAdjunto"."vRutaAdjunto" IS 'Ruta física del archivo';


--
-- TOC entry 3150 (class 0 OID 0)
-- Dependencies: 214
-- Name: COLUMN "PropuestaAdjunto"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."PropuestaAdjunto"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 215 (class 1259 OID 21308)
-- Name: PropuestaAdjunto_iIdPropuestaAdjunto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PropuestaAdjunto_iIdPropuestaAdjunto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PropuestaAdjunto_iIdPropuestaAdjunto_seq" OWNER TO postgres;

--
-- TOC entry 3151 (class 0 OID 0)
-- Dependencies: 215
-- Name: PropuestaAdjunto_iIdPropuestaAdjunto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PropuestaAdjunto_iIdPropuestaAdjunto_seq" OWNED BY public."PropuestaAdjunto"."iIdPropuestaAdjunto";


--
-- TOC entry 216 (class 1259 OID 21310)
-- Name: PropuestaLike; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PropuestaLike" (
    "iIdPropuesta" integer NOT NULL,
    "iIdUsuario" integer NOT NULL,
    "iLike" smallint NOT NULL,
    "dFecha" timestamp without time zone
);


ALTER TABLE public."PropuestaLike" OWNER TO postgres;

--
-- TOC entry 3152 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN "PropuestaLike"."iLike"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."PropuestaLike"."iLike" IS '0=Dislike, 1=Like';


--
-- TOC entry 217 (class 1259 OID 21313)
-- Name: PropuestaOrigen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PropuestaOrigen" (
    "iIdPropuesta" integer NOT NULL,
    "iIdPropuestaOrigen" integer NOT NULL
);


ALTER TABLE public."PropuestaOrigen" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 21316)
-- Name: Propuesta_iIdPropuesta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Propuesta_iIdPropuesta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Propuesta_iIdPropuesta_seq" OWNER TO postgres;

--
-- TOC entry 3153 (class 0 OID 0)
-- Dependencies: 218
-- Name: Propuesta_iIdPropuesta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Propuesta_iIdPropuesta_seq" OWNED BY public."Propuesta"."iIdPropuesta";


--
-- TOC entry 236 (class 1259 OID 21594)
-- Name: ProyectoEstrategico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProyectoEstrategico" (
    "iIdProyectoEstrategico" integer NOT NULL,
    "vProyectoEstrategico" character varying(100) NOT NULL,
    "iActivo" smallint NOT NULL
);


ALTER TABLE public."ProyectoEstrategico" OWNER TO postgres;

--
-- TOC entry 3154 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "ProyectoEstrategico"."vProyectoEstrategico"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."ProyectoEstrategico"."vProyectoEstrategico" IS 'Nombre del proyecto estratégico';


--
-- TOC entry 3155 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN "ProyectoEstrategico"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."ProyectoEstrategico"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 235 (class 1259 OID 21592)
-- Name: ProyectoEstrategico_iIdProyectoEstrategico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ProyectoEstrategico_iIdProyectoEstrategico_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProyectoEstrategico_iIdProyectoEstrategico_seq" OWNER TO postgres;

--
-- TOC entry 3156 (class 0 OID 0)
-- Dependencies: 235
-- Name: ProyectoEstrategico_iIdProyectoEstrategico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ProyectoEstrategico_iIdProyectoEstrategico_seq" OWNED BY public."ProyectoEstrategico"."iIdProyectoEstrategico";


--
-- TOC entry 240 (class 1259 OID 21633)
-- Name: Respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Respuesta" (
    "iIdRespuesta" integer NOT NULL,
    "iIdPregunta" integer NOT NULL,
    "vRespuesta" character varying(150) NOT NULL,
    "iTipoElemento" smallint NOT NULL,
    "iActivo" smallint NOT NULL
);


ALTER TABLE public."Respuesta" OWNER TO postgres;

--
-- TOC entry 3157 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "Respuesta"."vRespuesta"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Respuesta"."vRespuesta" IS 'Texto de la respuesta';


--
-- TOC entry 3158 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "Respuesta"."iTipoElemento"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Respuesta"."iTipoElemento" IS 'Tipo de elemento HTML 1=RadioButton, 2=CheckBox, 3=CheckBox con text (R: otro__), 4=Text';


--
-- TOC entry 3159 (class 0 OID 0)
-- Dependencies: 240
-- Name: COLUMN "Respuesta"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Respuesta"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 239 (class 1259 OID 21631)
-- Name: Respuesta_iIdRespuesta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Respuesta_iIdRespuesta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Respuesta_iIdRespuesta_seq" OWNER TO postgres;

--
-- TOC entry 3160 (class 0 OID 0)
-- Dependencies: 239
-- Name: Respuesta_iIdRespuesta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Respuesta_iIdRespuesta_seq" OWNED BY public."Respuesta"."iIdRespuesta";


--
-- TOC entry 219 (class 1259 OID 21318)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol" (
    "iIdRol" integer NOT NULL,
    "vRol" character varying(50) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Rol" OWNER TO postgres;

--
-- TOC entry 3161 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN "Rol"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Rol"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 220 (class 1259 OID 21322)
-- Name: RolPermiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolPermiso" (
    "iIdRol" integer NOT NULL,
    "iIdPermiso" integer NOT NULL,
    "iTipoAcceso" smallint
);


ALTER TABLE public."RolPermiso" OWNER TO postgres;

--
-- TOC entry 3162 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN "RolPermiso"."iTipoAcceso"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."RolPermiso"."iTipoAcceso" IS '0=Denegado, 1=Lectura, 2=Escritura';


--
-- TOC entry 221 (class 1259 OID 21325)
-- Name: Rol_iIdRol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Rol_iIdRol_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Rol_iIdRol_seq" OWNER TO postgres;

--
-- TOC entry 3163 (class 0 OID 0)
-- Dependencies: 221
-- Name: Rol_iIdRol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Rol_iIdRol_seq" OWNED BY public."Rol"."iIdRol";


--
-- TOC entry 222 (class 1259 OID 21327)
-- Name: Sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sector" (
    "iIdSector" integer NOT NULL,
    "vSector" character varying(50) NOT NULL,
    "iActivo" smallint NOT NULL
);


ALTER TABLE public."Sector" OWNER TO postgres;

--
-- TOC entry 3164 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN "Sector"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Sector"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 223 (class 1259 OID 21330)
-- Name: Sector_iIdSector_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sector_iIdSector_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sector_iIdSector_seq" OWNER TO postgres;

--
-- TOC entry 3165 (class 0 OID 0)
-- Dependencies: 223
-- Name: Sector_iIdSector_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sector_iIdSector_seq" OWNED BY public."Sector"."iIdSector";


--
-- TOC entry 224 (class 1259 OID 21332)
-- Name: Tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tema" (
    "iIdTema" integer NOT NULL,
    "vTema" character varying(100) NOT NULL,
    "iIdSector" integer NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Tema" OWNER TO postgres;

--
-- TOC entry 3166 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN "Tema"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Tema"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 225 (class 1259 OID 21336)
-- Name: Tema_iIdTema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tema_iIdTema_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tema_iIdTema_seq" OWNER TO postgres;

--
-- TOC entry 3167 (class 0 OID 0)
-- Dependencies: 225
-- Name: Tema_iIdTema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tema_iIdTema_seq" OWNED BY public."Tema"."iIdTema";


--
-- TOC entry 226 (class 1259 OID 21338)
-- Name: TipoAsentamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoAsentamiento" (
    "iIdTipoAsentamiento" integer NOT NULL,
    "vTipoAsentamiento" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."TipoAsentamiento" OWNER TO postgres;

--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE "TipoAsentamiento"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."TipoAsentamiento" IS 'Clasificación usada por SEPOMEX 2018';


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN "TipoAsentamiento"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."TipoAsentamiento"."iActivo" IS '0=No, 1=Si';


--
-- TOC entry 227 (class 1259 OID 21342)
-- Name: TipoAsentamiento_iIdTipoAsentamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TipoAsentamiento_iIdTipoAsentamiento_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TipoAsentamiento_iIdTipoAsentamiento_seq" OWNER TO postgres;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 227
-- Name: TipoAsentamiento_iIdTipoAsentamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TipoAsentamiento_iIdTipoAsentamiento_seq" OWNED BY public."TipoAsentamiento"."iIdTipoAsentamiento";


--
-- TOC entry 228 (class 1259 OID 21344)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "iIdUsuario" integer NOT NULL,
    "vNombre" character varying(100) NOT NULL,
    "vApellidoPaterno" character varying(100) NOT NULL,
    "vApellidoMaterno" character varying(100),
    "vCorreo" character varying(100) NOT NULL,
    "vContrasenia" character varying(150) NOT NULL,
    "dFechaNacimiento" date NOT NULL,
    "iGenero" smallint NOT NULL,
    "iIdAsentamiento" integer NOT NULL,
    "iIdGradoEstudio" integer NOT NULL,
    "iIdOcupacion" integer NOT NULL,
    "iEstatus" smallint DEFAULT 1 NOT NULL,
    "iIdRol" integer NOT NULL,
    "vToken" character varying(100),
    "iRegistroCon" smallint DEFAULT 1 NOT NULL,
    "dFechaRegistro" timestamp without time zone
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "Usuario"."iGenero"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Usuario"."iGenero" IS '1=Hombre, 2=Mujer, 3=Otro';


--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "Usuario"."iEstatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Usuario"."iEstatus" IS '0=Inactivo, 1=Registrado, 2=Validación realizada';


--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "Usuario"."vToken"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Usuario"."vToken" IS 'Este campo es usado para guardar un token, que sirve para pedir al usuario validación vía correo electrónico';


--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN "Usuario"."iRegistroCon"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Usuario"."iRegistroCon" IS 'Indica el método que usó el usuario para registrase: 1=Ingreso un correo electrónico, 2= Login vía Facebook, 3=Login vía Gmail, 4=Login vía Twitter';


--
-- TOC entry 229 (class 1259 OID 21352)
-- Name: UsuarioPermiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UsuarioPermiso" (
    "iIdUsuario" integer NOT NULL,
    "iIdPermiso" integer NOT NULL,
    "iTipoAcceso" smallint NOT NULL
);


ALTER TABLE public."UsuarioPermiso" OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 229
-- Name: COLUMN "UsuarioPermiso"."iTipoAcceso"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."UsuarioPermiso"."iTipoAcceso" IS '0=Denegado, 1=Lectura, 2=Escritura';


--
-- TOC entry 241 (class 1259 OID 21644)
-- Name: UsuarioRespuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UsuarioRespuesta" (
    "iIdUsuario" integer NOT NULL,
    "iIdRespuesta" integer NOT NULL,
    "vRespuesta" character varying(150) NOT NULL
);


ALTER TABLE public."UsuarioRespuesta" OWNER TO postgres;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 241
-- Name: COLUMN "UsuarioRespuesta"."vRespuesta"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."UsuarioRespuesta"."vRespuesta" IS 'Valor de la respuesta, para los casos en los que son necesarios que el usuario  ingrese un texto ';


--
-- TOC entry 230 (class 1259 OID 21355)
-- Name: Usuario_iIdUsuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Usuario_iIdUsuario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Usuario_iIdUsuario_seq" OWNER TO postgres;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 230
-- Name: Usuario_iIdUsuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Usuario_iIdUsuario_seq" OWNED BY public."Usuario"."iIdUsuario";


--
-- TOC entry 231 (class 1259 OID 21357)
-- Name: VotoPropuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VotoPropuesta" (
    "iIdPropuesta" integer NOT NULL,
    "iIdUsuario" integer NOT NULL,
    "vVoto" character varying(50) NOT NULL,
    "dFecha" timestamp without time zone
);


ALTER TABLE public."VotoPropuesta" OWNER TO postgres;

--
-- TOC entry 2813 (class 2604 OID 21360)
-- Name: Asentamiento iIdAsentamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asentamiento" ALTER COLUMN "iIdAsentamiento" SET DEFAULT nextval('public."Asentamiento_iIdAsentamiento_seq"'::regclass);


--
-- TOC entry 2816 (class 2604 OID 21361)
-- Name: Comentario iIdComentario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comentario" ALTER COLUMN "iIdComentario" SET DEFAULT nextval('public."Comentario_iIdComentario_seq"'::regclass);


--
-- TOC entry 2817 (class 2604 OID 21362)
-- Name: GradoEstudio iIdGradoEstudio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GradoEstudio" ALTER COLUMN "iIdGradoEstudio" SET DEFAULT nextval('public."GradoEstudio_iIdGradoEstudio_seq"'::regclass);


--
-- TOC entry 2819 (class 2604 OID 21363)
-- Name: Localidad iIdLocalidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localidad" ALTER COLUMN "iIdLocalidad" SET DEFAULT nextval('public."Localidad_iIdLocalidad_seq"'::regclass);


--
-- TOC entry 2820 (class 2604 OID 21364)
-- Name: Log iIdLog; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Log" ALTER COLUMN "iIdLog" SET DEFAULT nextval('public."Log_iIdLog_seq"'::regclass);


--
-- TOC entry 2822 (class 2604 OID 21365)
-- Name: Municipio iIdMunicipio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Municipio" ALTER COLUMN "iIdMunicipio" SET DEFAULT nextval('public."Municipio_iIdMunicipio_seq"'::regclass);


--
-- TOC entry 2824 (class 2604 OID 21366)
-- Name: Ocupacion iIdOcupacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ocupacion" ALTER COLUMN "iIdOcupacion" SET DEFAULT nextval('public."Ocupacion_iIdOcupacion_seq"'::regclass);


--
-- TOC entry 2845 (class 2604 OID 21560)
-- Name: Parametro iIdParametro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parametro" ALTER COLUMN "iIdParametro" SET DEFAULT nextval('public."Parametro_iIdParametro_seq"'::regclass);


--
-- TOC entry 2829 (class 2604 OID 21368)
-- Name: Permiso iIdPermiso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permiso" ALTER COLUMN "iIdPermiso" SET DEFAULT nextval('public."Permiso_iIdPermiso_seq"'::regclass);


--
-- TOC entry 2848 (class 2604 OID 21627)
-- Name: Pregunta iIdPregunta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pregunta" ALTER COLUMN "iIdPregunta" SET DEFAULT nextval('public."Pregunta_iIdPregunta_seq"'::regclass);


--
-- TOC entry 2831 (class 2604 OID 21369)
-- Name: Propuesta iIdPropuesta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Propuesta" ALTER COLUMN "iIdPropuesta" SET DEFAULT nextval('public."Propuesta_iIdPropuesta_seq"'::regclass);


--
-- TOC entry 2833 (class 2604 OID 21370)
-- Name: PropuestaAdjunto iIdPropuestaAdjunto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaAdjunto" ALTER COLUMN "iIdPropuestaAdjunto" SET DEFAULT nextval('public."PropuestaAdjunto_iIdPropuestaAdjunto_seq"'::regclass);


--
-- TOC entry 2847 (class 2604 OID 21597)
-- Name: ProyectoEstrategico iIdProyectoEstrategico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProyectoEstrategico" ALTER COLUMN "iIdProyectoEstrategico" SET DEFAULT nextval('public."ProyectoEstrategico_iIdProyectoEstrategico_seq"'::regclass);


--
-- TOC entry 2850 (class 2604 OID 21636)
-- Name: Respuesta iIdRespuesta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Respuesta" ALTER COLUMN "iIdRespuesta" SET DEFAULT nextval('public."Respuesta_iIdRespuesta_seq"'::regclass);


--
-- TOC entry 2836 (class 2604 OID 21371)
-- Name: Rol iIdRol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol" ALTER COLUMN "iIdRol" SET DEFAULT nextval('public."Rol_iIdRol_seq"'::regclass);


--
-- TOC entry 2837 (class 2604 OID 21372)
-- Name: Sector iIdSector; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sector" ALTER COLUMN "iIdSector" SET DEFAULT nextval('public."Sector_iIdSector_seq"'::regclass);


--
-- TOC entry 2839 (class 2604 OID 21373)
-- Name: Tema iIdTema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema" ALTER COLUMN "iIdTema" SET DEFAULT nextval('public."Tema_iIdTema_seq"'::regclass);


--
-- TOC entry 2841 (class 2604 OID 21374)
-- Name: TipoAsentamiento iIdTipoAsentamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoAsentamiento" ALTER COLUMN "iIdTipoAsentamiento" SET DEFAULT nextval('public."TipoAsentamiento_iIdTipoAsentamiento_seq"'::regclass);


--
-- TOC entry 2844 (class 2604 OID 21375)
-- Name: Usuario iIdUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN "iIdUsuario" SET DEFAULT nextval('public."Usuario_iIdUsuario_seq"'::regclass);


--
-- TOC entry 3056 (class 0 OID 21239)
-- Dependencies: 196
-- Data for Name: Asentamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Asentamiento" ("iIdAsentamiento", "vAsentamiento", "iCodigoPostal", "iIdLocalidad", "iIdTipoAsentamiento", "iActivo") FROM stdin;
1	Uayalceh	97825	1	12	1
2	Abalá	97825	1	12	1
3	Mukuiche	97825	1	12	1
4	Cacao	97826	1	12	1
5	Sinhuchen	97826	1	12	1
6	Peba	97826	1	12	1
7	Temozon Sur	97827	1	12	1
8	Acanceh	97380	38	12	1
9	Ticopó	97380	38	13	1
10	Santiago	97380	38	2	1
11	Canicab	97380	38	13	1
12	El Zapotal	97380	38	2	1
13	Tepich Carrillo	97382	38	13	1
14	Petectunich	97383	38	12	1
15	Cibceh	97383	38	16	1
16	Sacchich	97383	38	12	1
17	Akil Centro	97990	112	2	1
18	Baca	97450	145	12	1
19	Kankabchen	97452	145	12	1
20	Tixkuncheil	97452	145	12	1
21	San Isidro Kuxub	97453	145	12	1
22	San Nicolás	97453	145	12	1
23	Bokobá	97466	245	12	1
24	Buctzotz	97620	260	12	1
25	X-bec	97623	260	14	1
26	Chanmotul	97623	260	12	1
27	La Gran Lucha	97624	260	12	1
28	Nohyaxche	97624	260	12	1
29	Nup-Dzonot	97625	260	12	1
30	Grano de Oro	97625	260	12	1
31	Chuntzalan	97625	260	12	1
32	San Francisco	97625	260	12	1
33	U. Juárez	97625	260	12	1
34	B. Esperanza	97625	260	12	1
35	San Pedro	97626	260	12	1
36	San Juan	97626	260	12	1
37	Santo Domingo	97627	260	12	1
38	Cacalchen	97460	644	12	1
39	Santa Teresa	97460	644	2	1
40	Calotmul	97745	697	14	1
41	Tahcabo	97746	697	14	1
42	Pocoboch	97747	697	14	1
43	Yokdzonot	97748	697	12	1
44	Cansahcab	97410	776	19	1
45	Santa María	97414	776	12	1
46	San Antonio Xiat	97415	776	12	1
47	Kankabchen de Molina	97415	776	12	1
48	San Antonio	97417	776	12	1
49	Cantamayec	97915	810	12	1
50	Nenela	97917	810	12	1
51	Cholul	97918	810	12	1
52	Chac Canché	97367	868	16	1
53	Santa Cruz Xixim	97367	868	16	1
54	Celestún	97367	868	12	1
55	Sinkehuel	97368	868	12	1
56	Cenotillo	97640	907	12	1
57	X-Lobos	97645	907	16	1
58	Tucina	97645	907	12	1
59	Tixbacab	97645	907	12	1
60	Jardines de Conkal	97345	1012	1	1
61	Paseo del Ángel	97345	1012	1	1
62	Pedregales de Conkal	97345	1012	1	1
63	Conkal	97345	1012	12	1
64	Real de Conkal	97345	1012	1	1
65	Villas de Conkal	97345	1012	1	1
66	Palma Real	97345	1012	1	1
67	Bosques de Conkal	97345	1012	1	1
68	Los Laureles	97345	1012	1	1
69	Verde Limón	97345	1012	1	1
70	Santa Cruz	97345	1012	1	1
71	Vega del Mayab	97346	1012	1	1
72	X-Cuyum	97346	1012	13	1
73	Santa María Rosas	97346	1012	12	1
74	Praderas del Mayab	97347	1012	1	1
75	Kantoyna	97347	1012	12	1
76	San Francisco	97766	1126	12	1
77	Cuncunul	97766	1126	12	1
78	San Diego	97766	1126	12	1
79	Chebalam	97767	1126	16	1
80	Cuzama	97577	1144	12	1
81	Nohchacan	97577	1144	12	1
82	Eknacan	97577	1144	12	1
83	Chunkanan	97578	1144	12	1
84	Yaxkukul	97578	1144	12	1
85	San Francisco Sisal	97579	1144	16	1
86	Chacsinkin	97955	1158	12	1
87	Xno-Huayab	97956	1158	14	1
88	Xbox	97957	1158	12	1
89	Tzukmuc	97758	1174	14	1
90	Chankom	97758	1174	12	1
91	Ticimul	97758	1174	12	1
92	Nicte-Ha	97758	1174	12	1
93	San Juan	97758	1174	12	1
94	Pambá	97758	1174	12	1
95	Xanlá	97758	1174	12	1
96	Muchucuxcáh	97758	1174	12	1
97	Xcopteil	97758	1174	12	1
98	Xtohil	97758	1174	12	1
99	X-Cocail	97758	1174	12	1
100	Xcatun	97758	1174	12	1
101	San Isidro	97758	1174	12	1
102	X-Bohom	97758	1174	12	1
103	Yokdzonot	97758	1174	12	1
104	San Juan Xkalakdzonot	97759	1174	16	1
105	Xcalakdzonot	97759	1174	12	1
106	Chapab	97857	1196	12	1
107	Hunabchen	97858	1196	12	1
108	Citincabchen	97858	1196	12	1
109	San Cristóbal	97858	1196	12	1
110	Chemax	97770	1211	12	1
111	Benito Juárez García	97770	1211	2	1
112	Uspibil	97773	1211	12	1
113	Xalaú	97773	1211	12	1
114	Kuxeb	97773	1211	12	1
115	Xmaab	97773	1211	12	1
116	Xuneb	97773	1211	12	1
117	X-Catzín (Catzín)	97773	1211	12	1
118	Chechmil	97773	1211	12	1
119	San Andrés	97774	1211	12	1
120	San Pedro Chemax	97774	1211	12	1
121	San Juan Chen	97774	1211	12	1
122	Santa Elena	97774	1211	12	1
123	Cholul	97774	1211	12	1
124	Mucel	97774	1211	12	1
125	Santa Cruz	97774	1211	12	1
126	X-can	97774	1211	14	1
127	San Roman	97774	1211	12	1
128	Xtejas	97774	1211	12	1
129	Santa Rita	97775	1211	12	1
130	Buenavista	97775	1211	12	1
131	Cocoyol	97775	1211	12	1
132	Pabalam	97776	1211	12	1
133	Champolin	97776	1211	12	1
134	Sisbichén	97776	1211	12	1
135	Yaxche	97777	1211	12	1
136	Chachadzonot	97777	1211	12	1
137	Chuluntan	97777	1211	12	1
138	Lol-Bé	97777	1211	14	1
139	Chicxulub	97340	1499	12	1
140	Quintas Baspul	97342	1499	1	1
141	Celtun	97760	1543	12	1
142	Chichimilá	97760	1543	12	1
143	Chay	97760	1543	12	1
144	San José Cruz	97760	1543	12	1
145	Chan X-Cail	97760	1543	12	1
146	San Pedro	97760	1543	12	1
147	Tixcancal Dzonot	97760	1543	12	1
148	Dzitox	97761	1543	12	1
149	Chikindzonot	97940	1590	12	1
150	Xcampana	97943	1590	12	1
151	Chanchimila	97943	1590	12	1
152	Chan Santa María	97943	1590	12	1
153	X-Poxil	97943	1590	16	1
154	Ichmul	97944	1590	12	1
155	Chochola	97816	1610	12	1
156	San Antonio Chable	97816	1610	12	1
157	Chumayel	97904	1687	12	1
158	Dzemul	97404	1731	12	1
159	INFONAVIT	97404	1731	2	1
160	Xcambó	97405	1731	16	1
161	Xtampú	97405	1731	16	1
162	San Eduardo	97406	1731	16	1
163	San Diego	97406	1731	12	1
164	San Juan	97500	1789	2	1
165	Dzidzantún	97500	1789	12	1
166	San Diego Chumul	97500	1789	2	1
167	Vicente Guerrero	97500	1789	2	1
168	Emiliano Zapata	97500	1789	2	1
169	Mina de Oro	97504	1789	16	1
170	Santa Clara	97504	1789	12	1
171	San Francisco Manzanilla	97506	1789	13	1
172	Dzilam de Bravo	97606	1868	12	1
173	Chun-Xaan	97608	1868	12	1
174	Kennedy	97609	1868	16	1
175	Dzilam González	97600	1977	12	1
176	Dzonot Sabila	97604	1977	12	1
177	Dzitás	97660	2195	12	1
178	Yaxche	97666	2195	11	1
179	Xocempich	97666	2195	12	1
180	Dzoncauich	97646	2220	12	1
181	Chacmay	97647	2220	12	1
182	Espita	97730	2270	19	1
183	Santa Cruz Regario	97730	2270	2	1
184	Nacuche	97733	2270	14	1
185	San Pedro Chenchelo	97734	2270	12	1
186	Kunche	97734	2270	12	1
187	San Antonio Xuilub	97734	2270	12	1
188	Holcá	97739	2270	12	1
189	Halacho	97830	2417	12	1
190	San José	97833	2417	2	1
191	Cucholoch	97835	2417	12	1
192	Guadalupe	97835	2417	12	1
193	Concepción	97835	2417	12	1
194	Cepeda	97835	2417	12	1
195	Siho	97835	2417	13	1
196	Dzbzibachi	97836	2417	12	1
197	Kankabchen	97836	2417	12	1
198	San Mateo	97836	2417	12	1
199	Santa Sofia	97837	2417	12	1
200	Santa Maria Acu	97837	2417	13	1
201	Hocabá	97560	2495	12	1
202	El Nance	97563	2495	12	1
203	Sahcaba	97564	2495	12	1
204	Hoctun	97480	2530	12	1
205	Dziuche	97483	2530	12	1
206	San José Oriente	97486	2530	12	1
207	Homun	97580	2556	12	1
208	Viva	97582	2556	1	1
209	Polabán	97583	2556	12	1
210	Yalahau	97585	2556	12	1
211	San Isidro Ochil	97586	2556	12	1
212	Huhí	97590	2597	12	1
213	San Miguel	97594	2597	12	1
214	Tixcacal Quintero	97596	2597	13	1
215	Centro Hunucmá	97350	2623	2	1
216	Papagayos	97350	2623	2	1
217	Texán de Palomeque	97353	2623	12	1
218	San Antonio Chel	97353	2623	12	1
219	Hunkanab	97353	2623	12	1
220	Sisal	97356	2623	12	1
221	San Rafael	97343	2727	12	1
222	Ixil	97343	2727	12	1
223	Concepción	97343	2727	12	1
224	Izamal	97540	2758	2	1
225	Real del Sol	97540	2758	1	1
226	San Juan Izamal	97540	2758	2	1
227	San Genaro	97542	2758	2	1
228	Benito Juárez	97542	2758	2	1
229	Quinta Real	97542	2758	1	1
230	Sitilpech	97545	2758	12	1
231	Citilcum	97550	2758	12	1
232	Kimbila	97550	2758	12	1
233	San José Kanán	97553	2758	12	1
234	Cuauhtémoc	97555	2758	12	1
235	Xanabá	97556	2758	12	1
236	Popolá	97556	2758	12	1
237	Yaxché	97556	2758	12	1
238	San Antonio	97557	2758	12	1
239	San José	97557	2758	12	1
240	Arecas	97370	2869	1	1
241	La Ceiba	97370	2869	1	1
242	Mulchechén II	97370	2869	2	1
243	CROC	97370	2869	2	1
244	San Camilo	97370	2869	2	1
245	Cecilio Chi	97370	2869	2	1
246	Leona Vicario II	97370	2869	2	1
247	Villas Turquesa	97370	2869	1	1
248	Villa Mercedes	97370	2869	1	1
249	Palmas San Pedro	97370	2869	1	1
250	Los Robles III	97370	2869	1	1
251	Santa Cecilia	97370	2869	1	1
252	Valle Azul	97370	2869	1	1
253	Los Pinos de Mulchechen	97370	2869	1	1
254	Amalia Solorzano II	97370	2869	7	1
255	Colibrí	97370	2869	2	1
256	Pablo Moreno	97370	2869	1	1
257	Los Encinos	97370	2869	1	1
258	Jardines de Mulchechen	97370	2869	1	1
259	Los Robles	97370	2869	1	1
260	Leona Vicario	97370	2869	2	1
261	Puerta del Sol	97370	2869	1	1
262	Puerta Esmeralda	97370	2869	1	1
263	Pedregales del Oriente	97370	2869	2	1
264	Cielo Alto	97370	2869	1	1
265	Residencial	97370	2869	1	1
266	San Pedro Noh Pat	97370	2869	13	1
267	Las Flores	97370	2869	1	1
268	Privada del Sol	97370	2869	1	1
269	Las Palmeras	97370	2869	1	1
270	San Haroldo San José Tzal	97370	2869	2	1
271	Jardines de San Pedro Noh Pat	97370	2869	1	1
272	Xelpac	97370	2869	2	1
273	El Encanto Kanasín	97370	2869	1	1
274	Pedregales de Kanasín	97370	2869	1	1
275	Mulchechén	97370	2869	2	1
276	Reparto las Granjas	97370	2869	2	1
277	Flor de Mayo	97370	2869	2	1
278	Las Haciendas	97370	2869	1	1
279	Girasoles	97370	2869	1	1
280	Fontana I	97370	2869	1	1
281	Álamos de Oriente	97370	2869	2	1
282	San Ignacio	97370	2869	1	1
283	Santa Ana	97370	2869	1	1
284	Condesa	97370	2869	1	1
285	Arboleda Kanasín	97370	2869	1	1
286	Rinconada Kanasín	97370	2869	1	1
287	Valle Oriente de San Pedro Noh Pat	97370	2869	1	1
288	VIVAH	97370	2869	1	1
289	Jardines de Kanasín	97370	2869	1	1
290	Villas del Oriente	97370	2869	1	1
291	Despertare	97370	2869	1	1
292	Coyoles	97370	2869	1	1
293	Villa Bonita	97370	2869	1	1
294	Kanasín Centro	97370	2869	2	1
295	Francisco Villa Oriente	97370	2869	2	1
296	Los Tulipanes	97370	2869	1	1
297	Pedregales de Kanasín II	97370	2869	1	1
298	Valle Oriente	97370	2869	1	1
299	Cuauhtémoc	97370	2869	2	1
300	Las Palmas Yucatán	97370	2869	1	1
301	Ampliación Xelpac	97370	2869	2	1
302	San José Kanasín	97370	2869	1	1
303	Las Perlas	97370	2869	1	1
304	La Piedra	97370	2869	1	1
305	San Antonio Kaua III	97370	2869	2	1
306	Hector Victoria	97370	2869	1	1
307	La Joya	97370	2869	1	1
308	Santa Isabel	97373	2869	2	1
309	San Pedro (Deshuesadero)	97374	2869	18	1
310	San Aroldo	97374	2869	12	1
311	Teya	97374	2869	12	1
312	San Antonio Tehuitz	97376	2869	12	1
313	Kantunil	97670	3013	12	1
314	Holcá	97675	3013	12	1
315	Kaua	97764	3038	12	1
316	Xtzeal	97764	3038	12	1
317	San Esteban	97765	3038	12	1
318	Kinchil	97360	3057	12	1
319	Tamchén	97362	3057	12	1
320	San Bernardo	97818	3105	12	1
321	Kopomá	97818	3105	12	1
322	Mama	97900	3127	12	1
323	Mani	97850	3148	12	1
324	Tipikal	97851	3148	12	1
325	Maxcanu	97800	3196	12	1
326	La Sirena	97800	3196	2	1
327	Guadalupe	97800	3196	2	1
328	Santa Cruz	97803	3196	12	1
329	Kanachén	97803	3196	12	1
330	Granada (Chican Granada)	97803	3196	12	1
331	Chan Chocholá (Santa Eduviges Chan Chocholá)	97803	3196	12	1
332	Santo Domingo	97804	3196	13	1
333	Santa Rosa	97804	3196	14	1
334	Coahuila (Santa Teresa Coahuila)	97804	3196	12	1
335	Yaxcaba	97804	3196	12	1
336	Lázaro Cárdenas	97804	3196	16	1
337	X-Cacal	97804	3196	16	1
338	Kochol	97804	3196	12	1
339	San Fernando	97804	3196	13	1
340	Paraíso	97804	3196	12	1
341	Chunchucmil	97805	3196	13	1
342	San Simón Sinkehuel	97805	3196	12	1
343	San Rafael	97806	3196	12	1
344	Chencoh	97807	3196	12	1
345	Mayapan	97908	3349	12	1
346	Los Cocos	97000	3381	1	1
347	Mérida Centro	97000	3381	2	1
348	Privada Garcia Gineres C - 29	97000	3381	2	1
349	Jardines de San Sebastian	97000	3381	1	1
350	Privada Del Maestro	97000	3381	1	1
351	La Quinta	97000	3381	1	1
352	Los Reyes	97003	3381	1	1
353	Alcalá Martín	97050	3381	2	1
354	Yucatán	97050	3381	2	1
355	Señorial	97059	3381	1	1
356	Carrillo Ancona	97060	3381	2	1
357	Itzaes	97068	3381	1	1
358	Inalámbrica	97069	3381	2	1
359	Garcia Gineres	97070	3381	2	1
360	El Pedregal	97070	3381	1	1
361	Dolores Patron	97070	3381	2	1
362	La Huerta	97080	3381	1	1
363	Santa Cecilia	97088	3381	1	1
364	Cupules	97089	3381	2	1
365	Lourdes	97098	3381	2	1
366	Waspa	97099	3381	1	1
367	Itzimna 2	97100	3381	1	1
368	Rinconada Itzmina	97100	3381	1	1
369	Itzimna	97100	3381	2	1
370	Itzimna	97100	3381	1	1
371	Manola	97107	3381	1	1
372	Las Arboledas	97108	3381	1	1
373	Ferrocarrileros	97109	3381	2	1
374	Jesús Carranza	97109	3381	2	1
375	Revolución (Cordemex)	97110	3381	3	1
376	San Antonio	97113	3381	4	1
377	Montebello	97113	3381	1	1
378	Montebello II	97113	3381	1	1
379	Xaman-Tan	97113	3381	1	1
380	Residencial Sol Campestre	97114	3381	1	1
381	Monte Alban	97114	3381	1	1
382	Privada Monterreal Plus	97114	3381	2	1
383	Gonzalo Guerrero	97115	3381	1	1
384	Residencial Montejo Norte	97115	3381	1	1
385	Montes de Ame	97115	3381	2	1
386	Sodzil Norte	97115	3381	2	1
387	Residencial San Angelo	97115	3381	1	1
388	Ampliación Revolución	97115	3381	2	1
389	San Antonio Cucul	97116	3381	1	1
390	Privada San Antonio Cucul	97116	3381	2	1
391	San Ramon Norte	97117	3381	2	1
392	San Ramon Norte I	97117	3381	2	1
393	Xaman-Kab	97117	3381	1	1
394	San Ramon Sur	97117	3381	2	1
395	Villareal	97117	3381	1	1
396	Villas Del Sol	97118	3381	1	1
397	Ampliación Plan de Ayala (Villas del Sol)	97118	3381	2	1
398	Plan de Ayala	97118	3381	1	1
399	Villas La Hacienda	97119	3381	1	1
400	Gonzalo Guerrero	97119	3381	1	1
401	Benito Juárez Nte	97119	3381	2	1
402	Villas del Rey	97119	3381	1	1
403	Campestre	97120	3381	1	1
404	Tecnológico	97120	3381	1	1
405	Del Norte	97120	3381	1	1
406	Ampliación del Norte (1a. Ampliación)	97120	3381	1	1
407	Centro Sct Yucatán	97121	3381	5	1
408	México	97125	3381	2	1
409	Privada Nuevo México	97125	3381	2	1
410	Buenavista	97127	3381	2	1
411	Montejo	97127	3381	1	1
412	Residencial Colonia México	97128	3381	1	1
413	México Norte	97128	3381	2	1
414	Privada Mediterráneo	97128	3381	2	1
415	Emiliano Zapata Nte	97129	3381	2	1
416	Torremolinos	97130	3381	1	1
417	San Carlos	97130	3381	1	1
418	Missan II	97130	3381	1	1
419	Residencial Altabrisa	97130	3381	1	1
420	Montecarlo	97130	3381	1	1
421	Altabrisa	97130	3381	1	1
422	San Remo	97130	3381	1	1
423	Residencial Palmerales de Altabrisa	97130	3381	1	1
424	Vista Alegre Norte	97130	3381	1	1
425	Vista Alegre	97130	3381	2	1
426	Santa Rita Cholul	97130	3381	2	1
427	Diaz Ordaz	97130	3381	2	1
428	Vista Alegre	97130	3381	1	1
429	Montevideo	97133	3381	2	1
430	Monterreal	97133	3381	1	1
431	Montecristo	97133	3381	1	1
432	Residencial Camara de Comercio Norte	97133	3381	1	1
433	Privada Villa Cholul	97134	3381	1	1
434	Paraíso Maya	97134	3381	1	1
435	Jose Maria Iturralde	97134	3381	1	1
436	Maya	97134	3381	2	1
437	Jardines de Mérida	97135	3381	1	1
438	Felipe Carrillo Puerto Nte	97136	3381	2	1
439	México Oriente	97137	3381	2	1
440	La Florida	97138	3381	1	1
441	Los Pinos	97138	3381	1	1
442	Santa Maria	97138	3381	2	1
443	Jardines del Noreste	97138	3381	1	1
444	Residencial Del Arco	97138	3381	1	1
445	San Pedro Cholul	97138	3381	2	1
446	El Arco	97138	3381	1	1
447	Jardines de Vista Alegre II	97138	3381	1	1
448	Jardines de Vista Alegre	97138	3381	1	1
449	Residencial Bancarios	97138	3381	1	1
450	Pinos Norte II	97138	3381	1	1
451	Jardines Del Norte	97138	3381	1	1
452	Vista Alegre Lotificacion	97138	3381	2	1
453	Los Álamos	97138	3381	1	1
454	Mail Express	97139	3381	5	1
455	Jardines del Norte de Prado Norte	97139	3381	1	1
456	San Antonio Cinta	97139	3381	1	1
457	Prado Norte	97139	3381	1	1
458	San Luis	97140	3381	1	1
459	San Miguel	97140	3381	1	1
460	Lopez Mateos	97140	3381	2	1
461	Antonia Jimenez Trava	97142	3381	1	1
462	Unidad Habitacional CTM	97142	3381	1	1
463	San Vicente Oriente	97142	3381	1	1
464	Antonia Jimenez Trava II	97142	3381	1	1
465	Luis Donaldo Colosio	97143	3381	2	1
466	Confederación de Trabajadores Del Estado de Yucatán	97143	3381	2	1
467	Brisas Del Bosque	97143	3381	2	1
468	La Isla	97143	3381	1	1
469	Leandro Valle	97143	3381	2	1
470	Polígono 108	97143	3381	1	1
471	Vicente Guerrero	97143	3381	2	1
472	Itzimna 108	97143	3381	1	1
473	Boulevares de Oriente	97143	3381	1	1
474	Las Brisas Del Norte	97144	3381	1	1
475	Emiliano Zapata Ote	97144	3381	2	1
476	Ampliación las Brisas	97144	3381	1	1
477	Las Brisas	97144	3381	1	1
478	Las Palmas	97145	3381	1	1
479	Noria II	97145	3381	1	1
480	San Juan Grande	97145	3381	2	1
481	Los Álamos Alemán	97145	3381	1	1
482	Pet-kanche	97145	3381	2	1
483	Nueva Alemán	97146	3381	2	1
484	Las Flores	97146	3381	1	1
485	Nuevo Yucatán	97147	3381	1	1
486	San Nicolás Del Norte	97147	3381	1	1
487	San Nicolás	97147	3381	2	1
488	Miguel Alemán	97148	3381	2	1
489	San Esteban	97149	3381	2	1
490	Trava Quintero	97150	3381	2	1
491	Industrial	97150	3381	2	1
492	Fenix	97155	3381	2	1
493	Lourdes Industrial	97155	3381	2	1
494	Villa Fontana	97155	3381	1	1
495	Los Reyes	97156	3381	1	1
496	Nueva Mayapan	97157	3381	2	1
497	Lázaro Cárdenas Ote	97157	3381	2	1
498	Chuminopolis	97158	3381	2	1
499	Mayapan	97159	3381	2	1
500	Lotificacion las Brisas	97159	3381	1	1
501	Manuel Avila Camacho	97159	3381	2	1
502	Máximo Ancona	97159	3381	2	1
503	Nueva Pacabtun	97159	3381	2	1
504	Nueva Mayapan	97159	3381	2	1
505	Privada Del Autotransporte CTM	97160	3381	2	1
506	Manuel Avila Camacho	97160	3381	1	1
507	Del Parque	97160	3381	1	1
508	Pacabtun	97160	3381	2	1
509	Melchor Ocampo II	97165	3381	2	1
510	Melchor Ocampo	97165	3381	2	1
511	Salvador Alvarado Oriente	97166	3381	2	1
512	Fidel Velázquez 2a Etapa	97166	3381	1	1
513	Fidel Velázquez	97166	3381	1	1
514	Privada Emilio Portes Gil	97167	3381	1	1
515	Bosques de Oriente	97167	3381	1	1
516	Emilio Portes Gil	97167	3381	1	1
517	Cortes Sarmiento	97168	3381	2	1
518	Cerillera	97168	3381	1	1
519	Jardines de Miraflores	97168	3381	2	1
520	Madrid	97168	3381	1	1
521	Del Carmen	97168	3381	2	1
522	Esperanza	97169	3381	2	1
523	Wallis	97169	3381	1	1
524	Nueva Chichen-itza	97170	3381	2	1
525	Chichen-itza	97170	3381	2	1
526	Vergel II	97173	3381	1	1
527	San Jose Vergel	97173	3381	2	1
528	Real San José	97173	3381	1	1
529	Vergel III	97173	3381	1	1
530	Vergel I	97173	3381	1	1
531	Vergel IV	97173	3381	1	1
532	Misne III	97173	3381	1	1
533	Villas La Macarena	97174	3381	1	1
534	Morelos Oriente	97174	3381	2	1
535	Amalia Solorzano	97175	3381	2	1
536	Vergel 65	97176	3381	1	1
537	Unidad Habitacional Ricardo Flores Magón	97176	3381	1	1
538	San Pablo Oriente	97176	3381	2	1
539	El Vergel	97176	3381	1	1
540	Aquaparque	97176	3381	1	1
541	San Antonio Kaua	97176	3381	1	1
542	Misné II	97176	3381	1	1
543	Azcorra	97177	3381	2	1
544	Benito Juárez Ote	97178	3381	1	1
545	Miraflores	97179	3381	2	1
546	Privada Miraflores	97179	3381	2	1
547	Vicente Solis	97180	3381	2	1
548	Canto	97189	3381	2	1
549	San Jose	97189	3381	2	1
550	Morelos	97190	3381	1	1
551	Morelos Issste Fovissste	97190	3381	1	1
552	Nueva Kukulkan	97195	3381	2	1
553	Jardines de San Antonio Kaua	97195	3381	1	1
554	San Antonio Kaua II	97195	3381	1	1
555	San Antonio Kaua	97195	3381	2	1
556	San Antonio Kaua I	97195	3381	1	1
557	Miraflores II	97195	3381	2	1
558	Militar	97196	3381	3	1
559	Salvador Alvarado Sur II	97196	3381	2	1
560	Ampliación Salvador Alvarado Sur	97196	3381	2	1
561	Salvador Alvarado Sur	97196	3381	2	1
562	San Antonio Del Sur	97196	3381	1	1
563	Granjas	97197	3381	1	1
564	Kukulcan	97198	3381	1	1
565	Reparto Granjas	97198	3381	1	1
566	Ampliación Granjas	97198	3381	2	1
567	Maria Luisa	97199	3381	2	1
568	Almendros	97203	3381	2	1
569	Magnolias	97203	3381	1	1
570	Privada Palma Corozal	97203	3381	1	1
571	El Prado	97203	3381	1	1
572	Tulias de Chuburna	97203	3381	1	1
573	Brisas de Chuburna	97203	3381	1	1
574	Puesta del Sol	97203	3381	1	1
575	Terranova	97203	3381	1	1
576	Privada Villa Palma Real	97203	3381	1	1
577	Villas las Palmas	97203	3381	1	1
578	Chuburna de Hidalgo V	97203	3381	2	1
579	Lotificacion Chuburna de Hidalgo I	97203	3381	2	1
580	Mérida	97203	3381	2	1
581	Arcos del Sol	97203	3381	1	1
582	Del Bosque	97203	3381	1	1
583	San Francisco Chuburna II	97203	3381	1	1
584	Lotificacion Chuburna de Hidalgo II	97203	3381	2	1
585	La Castellana	97203	3381	1	1
586	Aurea Residencial	97203	3381	1	1
587	Cocoteros	97203	3381	1	1
588	Villas Del Prado	97203	3381	1	1
589	Privada Chuburna de Hidalgo (II)	97203	3381	2	1
590	Nueva San Jose Chuburna	97203	3381	2	1
591	Rincón Colonial	97203	3381	2	1
592	Francisco de Montejo II	97203	3381	1	1
593	Francisco de Montejo III	97203	3381	1	1
594	Francisco de Montejo V	97203	3381	1	1
595	Arekas	97203	3381	1	1
596	Camara de La Construcción	97203	3381	1	1
597	Vista Alegre de Chuburna	97203	3381	1	1
598	Chuburna de Hidalgo IV	97203	3381	2	1
599	Industrias No Contaminantes	97203	3381	2	1
600	Francisco de Montejo IV	97203	3381	1	1
601	San Pedro Uxmal	97203	3381	2	1
602	San Pablo	97203	3381	2	1
603	Francisco de Montejo	97203	3381	1	1
604	Las Haciendas III	97203	3381	4	1
605	Ampliación Francisco de Montejo	97203	3381	1	1
606	Nuevo San José	97203	3381	1	1
607	Cordeleros de Chuburna	97203	3381	1	1
608	El Conquistador	97203	3381	1	1
609	Chuburna de Hidalgo III	97203	3381	2	1
610	Privada Chuburna Plus	97203	3381	2	1
611	Privada las Palmas	97203	3381	2	1
612	Arboledas Chuburna	97203	3381	2	1
613	Platino	97203	3381	1	1
614	Residencial Galerias	97204	3381	1	1
615	Revolución	97204	3381	2	1
616	Xcumpich	97204	3381	2	1
617	Residencial Piedrasul	97204	3381	1	1
618	Vía Montejo	97204	3381	1	1
619	San Ángel	97205	3381	1	1
620	Tabachines	97205	3381	1	1
621	Privada las Flores	97205	3381	1	1
622	El Campanario	97205	3381	1	1
623	Privada Cortijo	97205	3381	1	1
624	San Luis Chuburna	97205	3381	2	1
625	Pinzon	97205	3381	2	1
626	Privada Arboledas	97205	3381	2	1
627	El Cortijo II	97205	3381	1	1
628	Villa Carmencita	97205	3381	1	1
629	Chuburna de Hidalgo	97205	3381	2	1
630	El Cortijo I	97205	3381	1	1
631	Paseo de Montejo	97205	3381	2	1
632	Chuburna Inn	97205	3381	1	1
633	Floresta	97205	3381	1	1
634	Bugambilias	97205	3381	1	1
635	Boulevares de Chuburna	97205	3381	1	1
636	Loma Bonita	97205	3381	1	1
637	Juan B Sosa	97205	3381	2	1
638	Privada Pedregal II	97205	3381	1	1
639	Residencial Hacienda Real	97205	3381	1	1
640	Loma Bonita Xcumpich	97205	3381	1	1
641	Privada Campestre Chuburna	97205	3381	2	1
642	Las Hadas	97205	3381	1	1
643	Privada Chuburna de Hidalgo I	97205	3381	2	1
644	Privada Turquesa	97205	3381	1	1
645	San Vicente Chuburna	97206	3381	2	1
646	Villas Chuburna IV	97206	3381	1	1
647	Yaxche	97206	3381	1	1
648	San Jose I	97206	3381	1	1
649	San Jose II	97206	3381	1	1
650	Paraíso	97206	3381	1	1
651	Privada San Jose	97206	3381	1	1
652	Privada San Ángel Chuburna	97206	3381	2	1
653	San Francisco I	97206	3381	1	1
654	Residencial Turquesa	97206	3381	1	1
655	El Rosario	97206	3381	1	1
656	Residencial La Noria	97206	3381	1	1
657	Las Dalias	97206	3381	2	1
658	Privada Cipreses	97206	3381	1	1
659	Mérida (Elefante Grande)	97206	3381	2	1
660	Las Dalias II y III	97206	3381	1	1
661	Lotificacion San Vicente Chuburna	97206	3381	2	1
662	Privada La Hacienda	97206	3381	2	1
663	San Francisco Chuburna	97206	3381	2	1
664	Villas de Chuburna	97207	3381	1	1
665	Callejones de Chuburna	97207	3381	2	1
666	El Cedral	97208	3381	1	1
667	Felipe Carrillo Puerto	97208	3381	2	1
668	Resid. Las Quintas (Chuburna)	97208	3381	2	1
669	Chuburna de Hidalgo	97208	3381	1	1
670	Residencial Atlantis	97208	3381	1	1
671	Malaga	97208	3381	2	1
672	Rinconada de Chuburna	97208	3381	1	1
673	Privada Chuburna de Hidalgo	97208	3381	1	1
674	Malaga	97208	3381	1	1
675	Privada San Jorge (Chuburna)	97209	3381	2	1
676	Jardines de Chuburna	97209	3381	1	1
677	Joaquín Ceballos Mimenza	97210	3381	1	1
678	Tanlum	97210	3381	2	1
679	Pedregales de Tanlum	97210	3381	1	1
680	Colonial Chuburna	97215	3381	1	1
681	Colonial Buenavista	97215	3381	1	1
682	Águilas Chuburna	97215	3381	1	1
683	Residencial Pensiones IV	97217	3381	1	1
684	Residencial Pensiones III (II)	97217	3381	1	1
685	Pensiones Norte	97217	3381	1	1
686	Francisco El Porvenir	97217	3381	2	1
687	Residencial Pensiones III (1)	97217	3381	1	1
688	Residencial Pensiones I y II	97217	3381	1	1
689	Residencial Pensiones V	97217	3381	1	1
690	Fovissste	97217	3381	3	1
691	Residencial Pensiones III	97217	3381	1	1
692	Residencial Pensiones VI	97217	3381	1	1
693	San Isidro	97218	3381	2	1
694	Residencial Roma	97218	3381	1	1
695	Privada San Damián	97218	3381	2	1
696	Roma	97218	3381	2	1
697	San Damián	97218	3381	2	1
698	Lotificacion San Damián	97218	3381	2	1
699	Conjunto los Naranjos	97218	3381	1	1
700	Lázaro Cárdenas	97219	3381	1	1
701	Paseos de Chenku	97219	3381	1	1
702	Lindavista	97219	3381	1	1
703	Jardines de Pensiones	97219	3381	1	1
704	Lotificacion San Damiancito II	97219	3381	1	1
705	Paseos de Pensiones	97219	3381	2	1
706	Francisco Villa	97219	3381	2	1
707	San Damiancito	97219	3381	1	1
708	Lotificacion San Damiancito I	97219	3381	1	1
709	Unidad Habitacional Mérida Issste	97219	3381	1	1
710	Residencial Pensiones VII	97219	3381	2	1
711	Pensiones	97219	3381	1	1
712	Hidráulica	97219	3381	2	1
713	Privada Pensiones	97219	3381	1	1
714	Residencial del Norte	97219	3381	1	1
715	Jardines de Lindavista	97219	3381	1	1
716	Quinta Versalles	97219	3381	1	1
717	Ampliación Pedregales de Lindavista	97219	3381	1	1
718	Pedregal Lindavista	97219	3381	1	1
719	Ampliación Lindavista (Elefante Chico)	97219	3381	1	1
720	Limones	97219	3381	1	1
721	Residencial Del Bosque Chenku	97219	3381	1	1
722	Amapola	97219	3381	2	1
723	Lindavista II	97219	3381	1	1
724	La Vaca Feliz	97220	3381	1	1
725	Zona Dorada	97220	3381	1	1
726	Atlántida	97220	3381	1	1
727	Miguel Hidalgo	97220	3381	2	1
728	Atlante	97220	3381	1	1
729	Nueva Hidalgo	97220	3381	1	1
730	Paseo de las Fuentes	97225	3381	1	1
731	Privada San Pedro	97225	3381	1	1
732	El Porvenir	97226	3381	2	1
733	Jacinto Canek	97227	3381	1	1
734	Las Vigas	97227	3381	1	1
735	Zona Dorada II	97229	3381	1	1
736	Villa Zona Dorada	97229	3381	1	1
737	Luis Echeverría Alvarez	97229	3381	2	1
738	15 de Mayo	97229	3381	1	1
739	Xcom	97229	3381	2	1
740	Hacienda Inn	97229	3381	1	1
741	Hacienda San Antonio	97229	3381	1	1
742	Ampliación Roma (Luis Echeverría)	97229	3381	2	1
743	Bojorquez	97230	3381	2	1
744	Armando Avila Gurrutia	97230	3381	1	1
745	Central de Abasto	97237	3381	6	1
746	Nora Quintana	97238	3381	1	1
747	Brisas del Poniente (Yucalpeten)	97238	3381	1	1
748	Jardines de Yucalpeten	97238	3381	1	1
749	Yucalpeten	97238	3381	1	1
750	Villas de Yacalpeten	97238	3381	1	1
751	Residencial Casa Blanca	97238	3381	4	1
752	Yucalpeten Secc Florida	97239	3381	1	1
753	Francisco I Madero	97240	3381	2	1
754	Xoclan Santos	97245	3381	2	1
755	Xoclan Canto	97245	3381	2	1
756	Lopez Portillo	97245	3381	2	1
757	Mulsay Polígono	97246	3381	1	1
758	Villas de Tixcacal	97246	3381	1	1
759	Xoclan	97246	3381	2	1
760	Juan Pablo II	97246	3381	1	1
761	Xoclan Rejas	97246	3381	2	1
762	Los Ángeles	97246	3381	1	1
763	Jardines de Nueva Mulsay	97246	3381	1	1
764	La Reja	97246	3381	2	1
765	Mulsay de La Magdalena	97246	3381	2	1
766	Xoclan Carmelitas	97246	3381	2	1
767	Xoclan Xbech	97246	3381	2	1
768	Mulsay Solidaridad	97246	3381	1	1
769	Bosques de Yucalpeten	97246	3381	2	1
770	Ampliación Juan Pablo II	97246	3381	1	1
771	Juan Pablo II Secc. Mérida 2000	97246	3381	1	1
772	Mulsay	97246	3381	1	1
773	Granja Fruticola Susula	97246	3381	1	1
774	San Jose Xoclan	97246	3381	2	1
775	Juan Pablo II Cardenales	97246	3381	1	1
776	México Poniente	97246	3381	2	1
777	Hacienda Mulsay	97246	3381	1	1
778	Anexo Juan Pablo II	97246	3381	1	1
779	Bosques Del Poniente	97246	3381	1	1
780	Bosques de Mulsay	97246	3381	1	1
781	Paseos de Opichen	97246	3381	1	1
782	Angeles II	97246	3381	1	1
783	San Cayetano	97247	3381	2	1
784	San Lorenzo	97247	3381	1	1
785	Nueva Mulsay I	97249	3381	2	1
786	Plantel México	97249	3381	2	1
787	Xoclan Susula	97249	3381	2	1
788	Pedregales de Nueva Mulsay Etapa	97249	3381	2	1
789	Xoclan Susula (El Convento)	97249	3381	2	1
790	Hacienda Opichen	97249	3381	2	1
791	Mulsay	97249	3381	2	1
792	Nueva Mulsay	97249	3381	2	1
793	Jardines de Nueva Mulsay II	97249	3381	1	1
794	Cinturón Verde	97249	3381	1	1
795	Ampliación Tixcacal Opichen	97249	3381	7	1
796	Girasoles de Opichen	97249	3381	1	1
797	Residencial Valparaiso	97249	3381	1	1
798	Tixcacal Opichen	97249	3381	1	1
799	Villa Magna	97249	3381	1	1
800	Jardines de Nueva Mulsay III	97249	3381	1	1
801	Villa Magna II	97249	3381	1	1
802	Hacienda Opichen	97249	3381	1	1
803	Núcleo Mulsay	97249	3381	2	1
804	Nueva Reforma Agraria	97249	3381	2	1
805	Tulipanes Opichen	97249	3381	1	1
806	Diamante Paseos de Opichen	97249	3381	1	1
807	Sambula	97250	3381	2	1
808	Nueva Sambula	97250	3381	2	1
809	Bicentenario	97255	3381	1	1
810	Roble Agrícola III	97255	3381	1	1
811	Manuel Crescencio Rejon	97255	3381	2	1
812	Roble II	97255	3381	2	1
813	El Roble	97255	3381	2	1
814	Santa Bárbara	97255	3381	2	1
815	Pino Suárez	97256	3381	2	1
816	Residencial Nicte	97256	3381	1	1
817	Villas Mérida	97256	3381	1	1
818	Industrial Bridec	97256	3381	1	1
819	Libertad II	97256	3381	1	1
820	Graciano Ricalde	97256	3381	1	1
821	Álvaro Torres	97256	3381	1	1
822	Renacimiento I	97256	3381	1	1
823	Libertad III	97256	3381	1	1
824	Lol-Be	97256	3381	1	1
825	Salvador Alvarado	97258	3381	1	1
826	Itzaez	97259	3381	1	1
827	Obrera	97260	3381	2	1
828	Nueva Obrera	97260	3381	1	1
829	Villa de la Obrera II	97260	3381	1	1
830	Villa Moderna	97260	3381	1	1
831	Villas del Mayab	97260	3381	1	1
832	Circuito Colonias	97260	3381	8	1
833	Manzana 115	97267	3381	1	1
834	Delio Moreno Canton	97268	3381	2	1
835	Quinta Valencia	97268	3381	1	1
836	Las Palmeras II	97269	3381	1	1
837	Meliton Salazar	97269	3381	2	1
838	Santa Maria de Guadalupe	97269	3381	1	1
839	Dolores Otero	97270	3381	2	1
840	Mercedes Barrera	97277	3381	2	1
841	Bosques Del Pedregal	97278	3381	1	1
842	Castilla Camara	97278	3381	2	1
843	Quinta Santa Rosa	97279	3381	1	1
844	Santa Rosa	97279	3381	2	1
845	5 Colonias	97280	3381	2	1
846	Santa Rita	97280	3381	1	1
847	Lomas Del Sur	97284	3381	1	1
848	Lindavista	97284	3381	1	1
849	Serapio Rendón III	97285	3381	1	1
850	Villa Magna del Sur	97285	3381	1	1
851	Jardines del Sur	97285	3381	1	1
852	Villas Del Sur	97285	3381	1	1
853	San Carlos del Sur	97285	3381	2	1
854	Álamos del Sur	97285	3381	1	1
855	Palmas del Sur	97285	3381	1	1
856	Lotificacion Serapio Rendón 1	97285	3381	1	1
857	Serapio Rendón II	97285	3381	1	1
858	Plan de Ayala Sur	97285	3381	2	1
859	Villa Bonita	97285	3381	1	1
860	Plan de Ayala Sur III	97285	3381	2	1
861	Las Nubes	97285	3381	1	1
862	Bellavista	97285	3381	1	1
863	Serapio Rendón	97285	3381	1	1
864	San José Tzal	97285	3381	1	1
865	Ampliación Plan de Ayala	97285	3381	2	1
866	Las Brisas Del Sur	97286	3381	1	1
867	Del Sur	97287	3381	1	1
868	Ciudad Industrial	97288	3381	9	1
869	San Nicolás Del Sur	97289	3381	2	1
870	La Hacienda	97289	3381	7	1
871	La Hacienda	97289	3381	1	1
872	Nueva San Jose Tecoh	97290	3381	2	1
873	San Antonio Xluch	97290	3381	2	1
874	La Guadalupana	97290	3381	2	1
875	San Antonio Xluch II	97290	3381	2	1
876	San Luis Sur	97290	3381	1	1
877	Gran Roble	97295	3381	1	1
878	El Roble Agrícola	97295	3381	2	1
879	Mérida (Lic. Manuel Crescencio Rejón)	97295	3381	10	1
880	San Marcos	97295	3381	1	1
881	Santa Cruz	97295	3381	1	1
882	San Marcos Nocoh	97296	3381	2	1
883	San Marcos Nocoh II	97296	3381	2	1
884	El Rosal	97297	3381	1	1
885	Emiliano Zapata Sur	97297	3381	2	1
886	Metropolitana	97297	3381	2	1
887	San Antonio Xluch III	97297	3381	2	1
888	Villas Quetzal	97297	3381	1	1
889	San Luis Sur	97297	3381	2	1
890	Brisas de San José	97298	3381	1	1
891	Zazil - Ha II	97298	3381	1	1
892	Zacilha	97298	3381	1	1
893	San Jose Tecoh Sur	97298	3381	2	1
894	Privada Zuzil - Ha	97298	3381	2	1
895	San Antonio Tecoh	97299	3381	2	1
896	San Jose Tecoh	97299	3381	2	1
897	Ejido de Chuburna	97300	3381	11	1
898	Sierra Papacal	97302	3381	12	1
899	Piedra Antigua	97302	3381	1	1
900	San Antonio Residencial	97302	3381	1	1
901	Norte Mérida	97302	3381	1	1
902	Punta Lago	97302	3381	1	1
903	Las Fincas	97302	3381	1	1
904	Residencial Xcanatún	97302	3381	1	1
905	Royal del Parque	97302	3381	1	1
906	Dzidzilché	97302	3381	13	1
907	San Antonio Hool	97302	3381	2	1
908	Palmequén	97302	3381	1	1
909	Xotik	97302	3381	1	1
910	Residencial La Alborada	97302	3381	1	1
911	Komchén	97302	3381	12	1
912	Las Américas II	97302	3381	1	1
913	Sac-Nicté	97302	3381	12	1
914	Los Tamarindos	97302	3381	2	1
915	Xcanatún	97302	3381	13	1
916	Real de Dzityá	97302	3381	1	1
917	Dzityá	97302	3381	12	1
918	Las Américas	97302	3381	1	1
919	Real Montejo	97302	3381	1	1
920	Residencial del Mayab	97302	3381	1	1
921	Núcleo Sodzil	97302	3381	2	1
922	Chablekal	97302	3381	12	1
923	Temozon Norte	97302	3381	2	1
924	Club de Golf La Ceiba	97302	3381	1	1
925	Kikteil	97303	3381	12	1
926	Cosgaya	97303	3381	13	1
927	Noc Ac	97303	3381	12	1
928	Cheumán	97303	3381	12	1
929	Xcunyá	97304	3381	13	1
930	Tamanché	97304	3381	12	1
931	Granjas Cholul	97305	3381	2	1
932	Cabo Norte	97305	3381	1	1
933	Jalapa	97305	3381	1	1
934	Santa Gertrudis Copo	97305	3381	14	1
935	Algarrobos Desarrollo Residencial	97305	3381	1	1
936	Residencial Campestre Viladiu	97305	3381	1	1
937	San Luis Cholul	97305	3381	2	1
938	Sian Kaan	97305	3381	1	1
939	Residencial Anturio	97305	3381	1	1
940	Cocoyoles	97305	3381	1	1
941	Parque Central	97305	3381	1	1
942	Cholul	97305	3381	1	1
943	Gran San Pedro Cholul	97305	3381	1	1
944	Villas Cholul	97305	3381	1	1
945	Alura	97305	3381	1	1
946	Bogdan	97305	3381	1	1
947	Cholul	97305	3381	12	1
948	Altavista	97305	3381	1	1
949	Paraíso las Margaritas	97305	3381	1	1
950	Las Margaritas de Cholul	97305	3381	1	1
951	Villas de Bosque Cholul	97305	3381	1	1
952	San Gabriel Tulipanes	97305	3381	1	1
953	Dzibilchaltún	97305	3381	12	1
954	Tixcuytún	97305	3381	12	1
955	Sitpach	97306	3381	12	1
956	Residencial Floresta	97306	3381	1	1
957	Los Héroes	97306	3381	1	1
958	Chichi Suárez	97306	3381	2	1
959	Santa María Chí	97306	3381	12	1
960	Jardines de Rejoyada	97307	3381	1	1
961	La Rejoyada	97307	3381	15	1
962	Misnébalam	97308	3381	16	1
963	Santa María Yaxché	97308	3381	16	1
964	Yucatán Country Club	97308	3381	1	1
965	Yaxché Casares	97309	3381	14	1
966	Oncán	97310	3381	13	1
967	Los Faisanes de Tixcacal	97312	3381	1	1
968	Chalmuch	97312	3381	12	1
969	Tixcacal	97312	3381	12	1
970	Villa Jardín	97314	3381	1	1
971	Jardines de Caucel	97314	3381	1	1
972	Centenario Cámara de Comercio Caucel	97314	3381	1	1
973	Sol Caucel III	97314	3381	1	1
974	Ciudad Caucel	97314	3381	1	1
975	Balcones II	97314	3381	1	1
976	La Ceiba	97314	3381	1	1
977	Las Torres I	97314	3381	1	1
978	La Herradura II	97314	3381	1	1
979	La Herradura III	97314	3381	1	1
980	Caucel	97314	3381	12	1
981	Sol Caucel	97314	3381	1	1
982	Los Balcones	97314	3381	1	1
983	La Perla Ciudad Caucel	97314	3381	1	1
984	La Ciudadela	97314	3381	1	1
985	Los Almendros	97314	3381	1	1
986	Arboleda	97314	3381	1	1
987	Las Torres II	97314	3381	1	1
988	Hogares Caucel	97314	3381	1	1
989	Cerradas de la Herradura	97314	3381	1	1
990	Villas de Caucel	97314	3381	1	1
991	Las Torres	97314	3381	1	1
992	Viva Caucel	97314	3381	1	1
993	Susulá	97314	3381	12	1
994	Boulevares	97314	3381	1	1
995	Gran Santa Fe	97314	3381	1	1
996	Hacienda Caucel	97314	3381	1	1
997	Ciudad Caucel II	97314	3381	1	1
998	Gran Herradura	97314	3381	1	1
999	Pedregales de Ciudad Caucel	97314	3381	1	1
1000	Dzununcan	97315	3381	1	1
1001	Molas	97315	3381	12	1
1002	San José Tzal	97315	3381	12	1
1003	Hunxectamán	97315	3381	12	1
1004	San Pedro Chimay	97315	3381	12	1
1005	Texán Cámara	97315	3381	12	1
1006	La Guadalupana	97315	3381	1	1
1007	Dzununcán	97315	3381	12	1
1008	Xmatkuil	97315	3381	2	1
1009	Nuevo San José Tecoh	97315	3381	1	1
1010	Nuevo San José Tecoh III	97315	3381	1	1
1011	San Antonio Tzacalá	97315	3381	13	1
1012	Santa Cruz Palomeque	97315	3381	12	1
1013	Tahdzibichén	97315	3381	13	1
1014	Petac	97315	3381	12	1
1015	Dzoyaxché	97316	3381	12	1
1016	Yaxnic	97316	3381	12	1
1017	San Ignacio Tesip	97316	3381	12	1
1018	Mococha	97454	3787	12	1
1019	Too	97455	3787	13	1
1020	Tekat	97456	3787	12	1
1021	Sambula	97430	3839	2	1
1022	Motul de Carrillo Puerto Centro	97430	3839	2	1
1023	Felipe Carrillo Puerto	97432	3839	2	1
1024	Perla de La Costa	97432	3839	2	1
1025	Infonavit	97432	3839	2	1
1026	Puerta del Sol	97432	3839	1	1
1027	Londres	97432	3839	2	1
1028	Las Huertas	97432	3839	1	1
1029	Vivah	97432	3839	1	1
1030	Mario H Cuevas	97432	3839	2	1
1031	Santa Cruz Pachón	97433	3839	1	1
1032	San Juan	97433	3839	2	1
1033	San Carlos	97433	3839	2	1
1034	Santiago Castillo	97433	3839	2	1
1035	Edesio Carrillo	97434	3839	2	1
1036	La Herradura	97434	3839	1	1
1037	El Roble	97434	3839	1	1
1038	San Roque	97434	3839	2	1
1039	Rogelio Chale	97434	3839	2	1
1040	Sacapuc	97436	3839	13	1
1041	Timul	97436	3839	13	1
1042	Kini	97437	3839	12	1
1043	Komchén Martínez	97440	3839	12	1
1044	San Pedro Chacabal	97440	3839	12	1
1045	Uci	97440	3839	12	1
1046	Santa Teresa	97440	3839	12	1
1047	Kancabchen	97440	3839	12	1
1048	Kancabal	97443	3839	12	1
1049	Tanya	97443	3839	14	1
1050	Kambul	97444	3839	12	1
1051	Dzununcan	97444	3839	12	1
1052	Kopte	97444	3839	14	1
1053	Kancabchén Uci	97444	3839	12	1
1054	Kaxatah	97444	3839	14	1
1055	Mesatunich	97444	3839	14	1
1056	San Pedro Camara	97444	3839	12	1
1057	San Antonio Dzinah	97445	3839	16	1
1058	Sakolá	97446	3839	12	1
1059	San José Hili	97446	3839	12	1
1060	Víctor Cervera Pacheco	97840	4017	2	1
1061	Tepakán	97840	4017	2	1
1062	Muna de Leopoldo Arana Cabrera	97840	4017	12	1
1063	Benito Juárez	97840	4017	2	1
1064	San Mateo	97840	4017	2	1
1065	San Bernardo	97840	4017	2	1
1066	San Sebastián	97840	4017	2	1
1067	Choyob	97843	4017	12	1
1068	Yaxha	97843	4017	12	1
1069	San Jose Tipceh	97844	4017	12	1
1070	U.F. Lázaro Cárdenas	97844	4017	12	1
1071	Muxupip	97457	4059	12	1
1072	San Juan Koop	97458	4059	12	1
1073	San José Grande	97458	4059	12	1
1074	Opichen	97813	4079	12	1
1075	Calcehtoc	97814	4079	12	1
1076	Oxkutzcab	97880	4105	12	1
1077	Tutul Xiú	97880	4105	2	1
1078	San José Kunché	97882	4105	16	1
1079	Yaaxhom	97883	4105	12	1
1080	Lol-Tún	97883	4105	11	1
1081	Emiliano Zapata	97883	4105	12	1
1082	Xohuayan	97883	4105	12	1
1083	Nohcacab	97884	4105	16	1
1084	Sacamucuy	97884	4105	12	1
1085	Xobenhaltun	97884	4105	12	1
1086	Xul	97884	4105	12	1
1087	Sayil	97885	4105	11	1
1088	Kihuic	97886	4105	12	1
1089	Yaxhacchen	97886	4105	12	1
1090	Xlapak	97887	4105	11	1
1091	Labna	97887	4105	11	1
1092	Tabi	97887	4105	12	1
1093	Panaba	97610	4207	12	1
1094	San Juan del Río	97614	4207	16	1
1095	San Francisco	97614	4207	12	1
1096	Loche	97614	4207	12	1
1097	Vista Alegre	97615	4207	12	1
1098	Noczal	97615	4207	12	1
1099	San Antonio	97615	4207	13	1
1100	Cenote Yalsihón Buena Fe	97615	4207	12	1
1101	Francisco Sarabia	97930	4579	2	1
1102	Morelos y Fátima	97930	4579	2	1
1103	3 Cruces	97930	4579	2	1
1104	Felipe Carrillo Puerto	97930	4579	2	1
1105	Ciprés	97930	4579	2	1
1106	Peto Centro	97930	4579	2	1
1107	Benito Juárez	97930	4579	2	1
1108	Trinidad	97930	4579	2	1
1109	Miraflores	97930	4579	2	1
1110	Francisco I Madero	97930	4579	2	1
1111	Jacinto Kanek	97930	4579	2	1
1112	Xoy	97932	4579	12	1
1113	San Pedro	97933	4579	12	1
1114	Tixhualactun	97933	4579	12	1
1115	Progresito	97933	4579	12	1
1116	San Gregorio	97933	4579	12	1
1117	Temozon	97933	4579	12	1
1118	Guadalupe	97934	4579	16	1
1119	San Nicolás Yoactún	97934	4579	12	1
1120	San Bernabe	97934	4579	12	1
1121	San Diego	97934	4579	12	1
1122	Xcabanchen	97934	4579	12	1
1123	Santa Elena	97935	4579	12	1
1124	San Mateo	97935	4579	12	1
1125	Papacal	97935	4579	12	1
1126	Chan Calotmul	97935	4579	12	1
1127	San Francisco	97935	4579	12	1
1128	Santa Cruz	97935	4579	12	1
1129	Dzonotchel	97935	4579	12	1
1130	San Sebastián	97936	4579	12	1
1131	Polinkin	97936	4579	12	1
1132	Abal	97936	4579	12	1
1133	Kambul	97936	4579	12	1
1134	La Esperanza	97936	4579	12	1
1135	Petulillo	97936	4579	12	1
1136	San Dionisio	97936	4579	12	1
1137	Xpechil	97937	4579	12	1
1138	Justicia Social	97937	4579	12	1
1139	Candelaria (San Pedro)	97937	4579	12	1
1140	Macmay	97937	4579	12	1
1141	Yaxcopil	97937	4579	12	1
1142	Tobxila	97937	4579	12	1
1143	Uitzina	97937	4579	12	1
1144	San Salvador	97937	4579	12	1
1145	Santa Ursula	97937	4579	12	1
1146	Santa Rosa	97937	4579	12	1
1147	San Miguel	97937	4579	12	1
1148	Trapiche	97937	4579	12	1
1149	Costa Azul	97320	4765	1	1
1150	23 de Noviembre	97320	4765	3	1
1151	Nueva Yucalpeten	97320	4765	2	1
1152	Las Palmas	97320	4765	1	1
1153	Fovissste Brisas	97320	4765	1	1
1154	Revolución	97320	4765	2	1
1155	Fovissste	97320	4765	1	1
1156	Las Fuentes II	97320	4765	2	1
1157	Feliciano Canul Reyes	97320	4765	2	1
1158	Francisco I. Madero	97320	4765	2	1
1159	La Fuente	97320	4765	1	1
1160	Vicente Guerrero	97320	4765	2	1
1161	Ismael Garcia	97320	4765	2	1
1162	Hector Victoria	97320	4765	1	1
1163	Ciénega 2000	97320	4765	1	1
1164	Juan Montalvo	97320	4765	2	1
1165	Progreso de Castro Centro	97320	4765	2	1
1166	Campestre Flamboyanes	97324	4765	1	1
1167	Chicxulub Puerto	97330	4765	12	1
1168	San Ignacio	97334	4765	12	1
1169	Chelem	97336	4765	12	1
1170	Chuburna Puerto	97336	4765	12	1
1171	Yucalpeten	97336	4765	12	1
1172	Muelle y Puerto de Altura	97337	4765	17	1
1173	Quintana Roo	97655	4818	20	1
1174	Río Lagartos	97720	4828	12	1
1175	Las Coloradas	97723	4828	12	1
1176	Quinientos	97726	4828	16	1
1177	Sacalum	97845	4942	12	1
1178	San Antonio Sodzil	97847	4942	12	1
1179	Yunku	97848	4942	12	1
1180	Kuchel	97810	4968	13	1
1181	Samahil	97810	4968	12	1
1182	San Antonio Tedzidz	97812	4968	12	1
1183	Sanahcat	97587	5026	12	1
1184	San Felipe	97616	5032	12	1
1185	Santa Elena	97890	5210	12	1
1186	San Agustín	97893	5210	12	1
1187	Kabah	97894	5210	11	1
1188	San Simón	97895	5210	12	1
1189	Villas Arqueológicas [Hotel]	97899	5210	18	1
1190	Hotel Hacienda Uxmal	97899	5210	18	1
1191	Seyé	97570	5233	12	1
1192	Vicente Guerrero	97570	5233	2	1
1193	Sac-Catzín	97572	5233	16	1
1194	Holactún	97573	5233	13	1
1195	Xucu	97574	5233	12	1
1196	San Bernardino	97575	5233	12	1
1197	Nohcham	97575	5233	12	1
1198	Sinanché	97420	5307	12	1
1199	Miguel Alemán	97420	5307	2	1
1200	San Crisanto	97424	5307	12	1
1201	Sotuta	97690	5339	12	1
1202	Tibolon	97694	5339	12	1
1203	Tabi	97695	5339	12	1
1204	Zavala	97697	5339	12	1
1205	Sucilá	97630	5438	12	1
1206	Chan Panaba	97634	5438	12	1
1207	A.G. San Martín	97636	5438	11	1
1208	Sudzal	97676	5703	12	1
1209	San Felipe	97677	5703	12	1
1210	Tzalam	97677	5703	12	1
1211	Brasil	97677	5703	12	1
1212	San Antonio Chalante	97677	5703	12	1
1213	San Juan	97677	5703	12	1
1214	San Martín	97677	5703	12	1
1215	Kamcabchen	97678	5703	12	1
1216	Chumbec	97678	5703	12	1
1217	San Nicolás	97527	5741	12	1
1218	Suma	97527	5741	12	1
1219	Tahdziu	97945	5759	12	1
1220	Timul	97947	5759	12	1
1221	Mocté	97948	5759	12	1
1222	San Ignacio	97948	5759	12	1
1223	Tahmek	97490	5802	12	1
1224	Teabo	97910	5843	12	1
1225	Tecoh	97820	5922	20	1
1226	Lepan	97822	5922	13	1
1227	Oxtapacab	97822	5922	12	1
1228	Itzincab	97822	5922	12	1
1229	Sotuta de Peón	97822	5922	12	1
1230	Chinkilá	97823	5922	12	1
1231	Pixyah	97823	5922	12	1
1232	Sabacché	97823	5922	12	1
1233	Mayapan	97824	5922	12	1
1234	Xcanchakan	97824	5922	13	1
1235	Telchaquillo	97824	5922	12	1
1236	Mahzucil	97824	5922	12	1
1237	Tekal de Venegas	97535	5983	12	1
1238	Tohoku	97536	5983	12	1
1239	San Felipe	97536	5983	12	1
1240	El Ancla	97536	5983	11	1
1241	Tekantó	97520	6017	12	1
1242	Tixkocho	97522	6017	12	1
1243	Sanlatah	97522	6017	12	1
1244	San Francisco Dzan	97523	6017	12	1
1245	San Francisco	97970	6050	2	1
1246	Ermita	97970	6050	2	1
1247	Lázaro Cárdenas	97970	6050	2	1
1248	Tekax de Álvaro Obregón	97970	6050	12	1
1249	Chunchucun	97970	6050	2	1
1250	Villas Santa María	97970	6050	1	1
1251	Paraíso Tekax	97970	6050	1	1
1252	Benito Juárez	97970	6050	2	1
1253	Fovissste (Módulo Social)	97970	6050	3	1
1254	San Ignacio	97970	6050	2	1
1255	Los Cedros	97970	6050	1	1
1256	Francisco I Madero	97970	6050	2	1
1257	Padre Eterno	97970	6050	2	1
1258	Chobenche	97970	6050	2	1
1259	Yocchenkax	97970	6050	2	1
1260	Villa Flores	97970	6050	2	1
1261	Tixcuytun	97973	6050	12	1
1262	Xaya	97973	6050	12	1
1263	Kinil	97973	6050	12	1
1264	Penkuyut	97973	6050	12	1
1265	U.A. Cepeda Peraza	97974	6050	11	1
1266	Ticum	97974	6050	12	1
1267	Tekit	97680	6362	12	1
1268	Susula	97684	6362	12	1
1269	Yaxic	97686	6362	12	1
1270	Tekom	97768	6438	12	1
1271	San Antonio	97768	6438	12	1
1272	Dzidzilché	97768	6438	16	1
1273	X-Cocmil	97769	6438	2	1
1274	Xuxcab	97769	6438	12	1
1275	Chindzonot	97769	6438	12	1
1276	Pocbichen	97769	6438	12	1
1277	Chibilub	97769	6438	12	1
1278	Telchac Puerto	97407	6519	12	1
1279	Temax	97510	6545	12	1
1280	San Antonio Camara	97513	6545	12	1
1281	Chucmichén	97515	6545	16	1
1282	Chenche de Las Torres	97515	6545	12	1
1283	Santa Ursula	97516	6545	12	1
1284	Temozón	97740	6633	12	1
1285	Santa Rita	97743	6633	14	1
1286	Ekbalam	97743	6633	12	1
1287	Kante	97743	6633	12	1
1288	Xeb	97743	6633	12	1
1289	Actuncah	97743	6633	12	1
1290	Xuch	97743	6633	12	1
1291	Nahbalam	97744	6633	14	1
1292	Dzalbay	97744	6633	12	1
1293	Hunukú	97744	6633	12	1
1294	Xtut	97744	6633	12	1
1295	Xcanchechen	97744	6633	12	1
1296	Yokdzonot Presentado	97744	6633	12	1
1297	Tepakán	97530	6866	12	1
1298	Kantirix	97532	6866	12	1
1299	Tetiz	97364	6884	12	1
1300	Nohuayun	97365	6884	12	1
1301	Teya	97524	6928	12	1
1302	Ticul Centro	97860	6942	2	1
1303	Mejorada	97862	6942	2	1
1304	Obrera	97862	6942	2	1
1305	De los Electricistas	97862	6942	1	1
1306	Guadalupe	97862	6942	2	1
1307	Deportivo Campestre	97862	6942	1	1
1308	Campestre	97862	6942	1	1
1309	San Juan	97863	6942	2	1
1310	San Benito	97864	6942	2	1
1311	Santiago	97864	6942	2	1
1312	San Román	97864	6942	2	1
1313	San Enrique	97864	6942	2	1
1314	Las Tinajas	97864	6942	1	1
1315	Santa Maria	97864	6942	2	1
1316	San Joaquín	97864	6942	2	1
1317	Pustunich	97870	6942	12	1
1318	Yotholin	97873	6942	12	1
1319	Tekik de Regil	97377	7033	13	1
1320	Timucuy	97377	7033	12	1
1321	Subincancab	97378	7033	13	1
1322	Tinum	97750	7086	12	1
1323	Piste	97751	7086	12	1
1324	Poom	97753	7086	12	1
1325	Balantun	97754	7086	12	1
1326	Tohopku	97755	7086	14	1
1327	San Francisco	97755	7086	14	1
1328	San Francisco Grande	97755	7086	12	1
1329	San Felipe	97756	7086	12	1
1330	X-Calakoop	97756	7086	12	1
1331	Chichen-itza	97757	7086	12	1
1332	Tixcacalcupul	97762	7141	12	1
1333	Xcauich	97763	7141	12	1
1334	Monte Verde	97763	7141	12	1
1335	Xtobil	97763	7141	12	1
1336	San José	97763	7141	12	1
1337	Carolina	97763	7141	12	1
1338	Poop	97763	7141	12	1
1339	Ekpedz	97763	7141	12	1
1340	Mahas	97763	7141	12	1
1341	Tixkokob	97470	7196	12	1
1342	San José	97473	7196	12	1
1343	Kankabchen	97473	7196	12	1
1344	Ruinas de Ake	97474	7196	13	1
1345	Ekmul	97474	7196	12	1
1346	Euan	97474	7196	12	1
1347	Hubila	97475	7196	13	1
1348	San Antonio Millet	97476	7196	13	1
1349	Nolo	97477	7196	12	1
1350	Tixmehuac	97950	7282	12	1
1351	Kimbila	97953	7282	12	1
1352	Sabacche	97953	7282	12	1
1353	Dzutoh	97953	7282	14	1
1354	Chuchub	97953	7282	12	1
1355	U.F. Sisbic	97953	7282	12	1
1356	Chican	97953	7282	12	1
1357	Sacchacan	97954	7282	12	1
1358	Tixpéhual	97386	7314	12	1
1359	Kilinche	97387	7314	12	1
1360	Chocho	97387	7314	13	1
1361	Sahe	97388	7314	13	1
1362	Cuca	97388	7314	12	1
1363	Techoh	97389	7314	12	1
1364	Santa Cruz	97700	7376	2	1
1365	Tizimin Centro	97700	7376	2	1
1366	Benito Juárez	97702	7376	2	1
1367	Aviación	97702	7376	2	1
1368	San Martín	97702	7376	2	1
1369	Residencial Tizimín	97702	7376	1	1
1370	Viva	97702	7376	1	1
1371	Las Palmas	97702	7376	1	1
1372	Jacinto Canek	97702	7376	2	1
1373	8 Calles	97702	7376	2	1
1374	Cruz Roja	97702	7376	2	1
1375	Fovissste	97702	7376	1	1
1376	Los Reyes	97702	7376	1	1
1377	Santa Maria	97702	7376	2	1
1378	Villas Campestre	97702	7376	1	1
1379	Justo Sierra	97702	7376	2	1
1380	Comichén	97702	7376	2	1
1381	Zoológico	97702	7376	2	1
1382	Campestre San Francisco	97702	7376	1	1
1383	Lázaro Cárdenas	97703	7376	2	1
1384	San Carlos	97703	7376	2	1
1385	Huayita	97703	7376	2	1
1386	Adolfo Lopez Mateos	97703	7376	2	1
1387	San Jose Nabalam	97703	7376	2	1
1388	Santo Domingo	97703	7376	2	1
1389	Los Reyes	97703	7376	2	1
1390	Santa Maria de Lima	97704	7376	2	1
1391	Adolfo López Mateos	97704	7376	2	1
1392	Residencial Del Parque	97704	7376	1	1
1393	Kikil	97705	7376	12	1
1394	Yokdzonot Meneses	97705	7376	12	1
1395	Sucopó	97705	7376	12	1
1396	Chan San Antonio	97705	7376	12	1
1397	X-Pambihá	97705	7376	12	1
1398	Dzadz Palma	97706	7376	12	1
1399	Dzonot Box	97706	7376	14	1
1400	X-Panhatoro	97706	7376	12	1
1401	Xkalax de Dzibalkú	97706	7376	12	1
1402	Santa Clara Dzibalkú	97706	7376	12	1
1403	Libre Unión	97706	7376	12	1
1404	X-Lal	97706	7376	12	1
1405	San Román	97706	7376	12	1
1406	Buena Esperanza	97706	7376	12	1
1407	Bondzonot Número Dos	97706	7376	16	1
1408	Dzonot Tigre	97706	7376	12	1
1409	San Antonio	97706	7376	12	1
1410	Chenkekén	97706	7376	12	1
1411	X-Cail	97706	7376	12	1
1412	Chunsubul	97706	7376	12	1
1413	Yohactún de Hidalgo	97707	7376	14	1
1414	Emiliano Zapata	97707	7376	14	1
1415	Benito Juárez	97707	7376	12	1
1416	San Juan	97707	7376	12	1
1417	Dzonot Carretero	97707	7376	12	1
1418	Moctezuma	97707	7376	12	1
1419	Dolores	97707	7376	12	1
1420	El Cuyo	97707	7376	13	1
1421	San Francisco	97707	7376	12	1
1422	San Enrique	97710	7376	12	1
1423	Kabichén	97710	7376	12	1
1424	San Pedro Juárez	97710	7376	14	1
1425	Yaxchekú	97710	7376	12	1
1426	Lázaro Cárdenas	97710	7376	12	1
1427	San Luis Tzuctuk	97710	7376	12	1
1428	San Isidro Chuncopó	97710	7376	12	1
1429	Dzonot Aké	97710	7376	12	1
1430	Orizaba	97710	7376	12	1
1431	Colonia Yucatán	97710	7376	12	1
1432	Teapa	97710	7376	12	1
1433	La Sierra	97710	7376	12	1
1434	Felipe Carrillo Puerto Dos	97710	7376	12	1
1435	El Ramonal	97710	7376	12	1
1436	Santa Rosa Concepción	97712	7376	14	1
1437	Rancho Grande	97713	7376	14	1
1438	Paraíso	97713	7376	12	1
1439	Santa Isabel	97713	7376	12	1
1440	Benito Juárez	97713	7376	12	1
1441	Samaria	97713	7376	12	1
1442	San Miguel	97713	7376	12	1
1443	Santa Pilar	97713	7376	12	1
1444	Santa Rosa y Anexas	97713	7376	12	1
1445	Cenote Azul	97713	7376	12	1
1446	Santa Ana	97713	7376	12	1
1447	La Libertad	97713	7376	12	1
1448	San Pedro Sacboc	97714	7376	12	1
1449	Santa María	97714	7376	14	1
1450	Nuevo Tezoco	97715	7376	12	1
1451	Santa Clara	97715	7376	12	1
1452	San Juan	97715	7376	12	1
1453	San Hipólito	97715	7376	14	1
1454	Manuel Cepeda Peraza	97715	7376	12	1
1455	Luis Rosado Vega	97715	7376	12	1
1456	El Limonar	97715	7376	12	1
1457	San Arturo	97715	7376	12	1
1458	Santa Elena	97715	7376	12	1
1459	San Pedro Bacab	97715	7376	12	1
1460	San Isidro	97715	7376	14	1
1461	Tres Marias	97715	7376	12	1
1462	Francisco Villa	97715	7376	12	1
1463	Nuevo León	97715	7376	12	1
1464	Papoinah	97716	7376	12	1
1465	Santa Rosa	97716	7376	12	1
1466	Chan Tres Reyes	97716	7376	12	1
1467	San Isidro Kilómetro Catorce (San Isidro)	97716	7376	12	1
1468	La Esperanza	97716	7376	12	1
1469	Felipe Carrillo Puerto Número Uno	97716	7376	12	1
1470	San Manuel	97716	7376	14	1
1471	Quintana	97716	7376	12	1
1472	San José Montecristo	97716	7376	12	1
1473	Adolfo López Mateos	97716	7376	12	1
1474	El Edén (Yaxic)	97716	7376	12	1
1475	Chan Cenote	97717	7376	12	1
1476	San Lorenzo	97717	7376	12	1
1477	San Isidro Kancabdzonot	97717	7376	12	1
1478	Tixcancal	97717	7376	12	1
1479	Trascorral	97717	7376	12	1
1480	San Lorenzo Chiquilá	97717	7376	12	1
1481	Dzonot Mezo	97717	7376	12	1
1482	Tunkás	97650	8831	12	1
1483	San José Pibtuch	97653	8831	14	1
1484	Pabihoc	97653	8831	12	1
1485	Chabak	97653	8831	12	1
1486	Chakan Ebula	97654	8831	12	1
1487	San Antonio Chuc	97654	8831	12	1
1488	Kankabchen	97654	8831	12	1
1489	Noc Ac	97654	8831	12	1
1490	San Román	97654	8831	12	1
1491	Mactun	97654	8831	12	1
1492	Onichen	97654	8831	12	1
1493	Yaxha	97654	8831	12	1
1494	Santa Rosa	97654	8831	12	1
1495	Nicte Ha	97654	8831	12	1
1496	Tzucacab Centro	97960	8891	2	1
1497	México Primero	97960	8891	2	1
1498	Ekbalam	97963	8891	14	1
1499	Solidaridad	97963	8891	12	1
1500	Dzi	97963	8891	12	1
1501	Kakalnah	97963	8891	12	1
1502	Polhuaczil	97964	8891	12	1
1503	Sacbecan	97964	8891	12	1
1504	Hobonil	97964	8891	12	1
1505	Noh-bec	97964	8891	12	1
1506	Bichcopo	97964	8891	12	1
1507	Blanca Flor	97965	8891	12	1
1508	Tigre Grande	97965	8891	12	1
1509	Corral	97965	8891	12	1
1510	El Escondido	97965	8891	12	1
1511	San Isidro	97966	8891	12	1
1512	Pisteakal	97966	8891	12	1
1513	Esperanza	97966	8891	12	1
1514	Caxaytuk	97967	8891	12	1
1515	Lázaro Cárdenas	97967	8891	12	1
1516	Emiliano Zapata	97967	8891	12	1
1517	Thul	97967	8891	12	1
1518	Catmís	97969	8891	12	1
1519	Uayma	97796	9066	12	1
1520	Santa María	97798	9066	12	1
1521	San Lorenzo	97799	9066	16	1
1522	Yaxche de Peón	97357	9098	13	1
1523	Ucú	97357	9098	12	1
1524	San Juan	97357	9098	2	1
1525	El Oasis	97390	9118	1	1
1526	Camino Real	97390	9118	1	1
1527	Acim II	97390	9118	1	1
1528	Las Perlas de Umán	97390	9118	1	1
1529	Santa Elena	97390	9118	2	1
1530	Brisas de Umán	97390	9118	1	1
1531	Acim I	97390	9118	1	1
1532	La Candelaria	97390	9118	2	1
1533	Bosques de Umán	97390	9118	1	1
1534	Miguel Hidalgo y Costilla	97390	9118	2	1
1535	Los Arcos I	97390	9118	1	1
1536	Centro Umán	97390	9118	2	1
1537	Los Ceibos	97390	9118	2	1
1538	Lázaro Cárdenas	97390	9118	2	1
1539	Residencial San Lázaro	97390	9118	1	1
1540	Ampliación Ciudad Industrial	97390	9118	2	1
1541	Bosques de San Francisco	97390	9118	2	1
1542	San Lorenzo	97390	9118	1	1
1543	Dzibikal	97390	9118	2	1
1544	La Mejorada	97390	9118	2	1
1545	Cepeda Peraza	97390	9118	2	1
1546	Los Arcos II	97390	9118	1	1
1547	San Carlos	97390	9118	2	1
1548	El Roble Agrícola IV	97392	9118	2	1
1549	Itzincab	97392	9118	1	1
1550	Piedra de Agua	97392	9118	1	1
1551	Dzibikak	97393	9118	12	1
1552	Oxcum	97393	9118	12	1
1553	Ticimul	97394	9118	12	1
1554	Taníl	97394	9118	12	1
1555	Xcucul Sur	97394	9118	12	1
1556	Tebec	97394	9118	12	1
1557	Xtepen	97394	9118	12	1
1558	Petecbiltun	97394	9118	12	1
1559	Hotzuc	97395	9118	12	1
1560	Yaxcopoil	97396	9118	13	1
1561	San Antonio Mulix	97396	9118	12	1
1562	Bolon	97397	9118	12	1
1563	Poxila	97397	9118	12	1
1564	Oxholon	97397	9118	12	1
1565	San Antonio Chun	97397	9118	12	1
1566	Valladolid Centro	97780	9392	2	1
1567	Lol-beh	97782	9392	1	1
1568	Fernando Novelo	97782	9392	2	1
1569	Santa Ana	97782	9392	1	1
1570	Las Palmas	97782	9392	1	1
1571	Orquídeas	97782	9392	1	1
1572	Candelaria	97782	9392	2	1
1573	Jardines Del Oriente	97782	9392	1	1
1574	Militar	97782	9392	2	1
1575	Santa Cruz	97782	9392	1	1
1576	San Isidro	97782	9392	1	1
1577	Los Cipreses	97782	9392	1	1
1578	Flor Campestre	97782	9392	2	1
1579	Residencial Campestre	97782	9392	2	1
1580	Santa Ana	97782	9392	2	1
1581	Santa Lucia	97782	9392	2	1
1582	Militar	97783	9392	3	1
1583	San Vicente	97783	9392	2	1
1584	Leonardo Rodríguez Alcaine	97783	9392	2	1
1585	San Juan	97783	9392	2	1
1586	San Antonio	97783	9392	2	1
1587	Santana	97783	9392	2	1
1588	San Francisco	97783	9392	2	1
1589	Oaxaqueña	97783	9392	2	1
1590	Sacyabil	97783	9392	1	1
1591	Sisal	97784	9392	2	1
1592	Emiliano Zapata	97784	9392	2	1
1593	Puesta Del Sol	97784	9392	1	1
1594	Capules	97784	9392	1	1
1595	Residencial del Bosque	97784	9392	1	1
1596	Bacalar	97784	9392	2	1
1597	Cruz Verde	97784	9392	2	1
1598	Flamboyanes	97784	9392	1	1
1599	Xcorazon	97784	9392	1	1
1600	Colonos	97784	9392	1	1
1601	San Carlos	97784	9392	2	1
1602	Batun	97785	9392	12	1
1603	Kanxoc	97785	9392	14	1
1604	Xocen	97785	9392	12	1
1605	Kampepén	97785	9392	12	1
1606	Sidra Kin	97786	9392	12	1
1607	Timas	97786	9392	12	1
1608	Nohsuytun	97787	9392	12	1
1609	Yaxche	97787	9392	12	1
1610	Xuilib	97787	9392	12	1
1611	Chamul	97787	9392	12	1
1612	Santa Cruz	97787	9392	12	1
1613	La Guadalupana	97790	9392	13	1
1614	Pixoy	97790	9392	14	1
1615	Popola	97790	9392	14	1
1616	Tahmuy	97793	9392	12	1
1617	Yunchen	97793	9392	12	1
1618	Tepakan	97793	9392	12	1
1619	Zodzilchén	97793	9392	16	1
1620	Tesoco	97793	9392	12	1
1621	Ticúch	97793	9392	12	1
1622	Chan Yokdzonot	97793	9392	14	1
1623	Yalcoba	97794	9392	12	1
1624	San Andres Bac	97794	9392	12	1
1625	Chiople	97794	9392	12	1
1626	Dzitnup	97795	9392	12	1
1627	X-Kekén	97795	9392	12	1
1628	Ebtun	97795	9392	12	1
1629	Tixhualactún	97795	9392	12	1
1630	Yalcon	97795	9392	12	1
1631	Xocchel	97566	9824	12	1
1632	Yaxcaba	97920	9843	12	1
1633	Mexil	97922	9843	12	1
1634	Yokdzonot	97922	9843	12	1
1635	Libre Unión	97923	9843	12	1
1636	Cenote Xtohil	97923	9843	12	1
1637	Popola	97924	9843	12	1
1638	San Marcos	97924	9843	12	1
1639	Chimay	97924	9843	12	1
1640	Cenote Aban	97924	9843	12	1
1641	Yaxunah	97924	9843	12	1
1642	Z.A. Yaxuna	97924	9843	12	1
1643	Tiholop	97925	9843	12	1
1644	Huechen Balam	97925	9843	12	1
1645	Yokdzonot-Hú	97925	9843	12	1
1646	Santa Maria	97925	9843	12	1
1647	Sahcaba Nuevo	97925	9843	12	1
1648	Santo Domingo	97925	9843	12	1
1649	Kancabdzonot	97925	9843	12	1
1650	San Pedro	97925	9843	12	1
1651	Cacalchen	97926	9843	12	1
1652	Canakom	97926	9843	12	1
1653	Tixcacaltuyub	97927	9843	12	1
1654	Tahdzibichen	97927	9843	12	1
1655	Cipché	97929	9843	16	1
1656	Tinuncah	97929	9843	14	1
1657	Yaxkukul	97348	10018	12	1
1658	Yobaín	97425	10050	12	1
1659	Chabihau	97426	10050	12	1
1660	Dzan	97854	1706	12	1
1661	San Marcos	97975	6050	12	1
1662	Kantemo	97975	6050	12	1
1663	Kancab	97977	6050	12	1
1664	Canek	97977	6050	12	1
1665	Chacmultun	97977	6050	12	1
1666	Manuel Cepeda Peraza	97979	6050	12	1
1667	Alfonso Caso	97979	6050	12	1
1668	San Agustín (Salvador Alvarado)	97980	6050	12	1
1669	San Martín Hili	97980	6050	12	1
1670	San Pedro Zula	97980	6050	12	1
1671	Benito Juárez	97980	6050	12	1
1672	Mac-Yan (San Isidro Mac-Yan)	97983	6050	12	1
1673	San Salvador	97983	6050	12	1
1674	Huntochac	97983	6050	14	1
1675	Nueva Santa Cruz (Santa Cruz Cutzá)	97983	6050	16	1
1676	Chan Dzinup	97983	6050	14	1
1677	Nuevo Popolá	97983	6050	16	1
1678	San Isidro Yaxche	97983	6050	12	1
1679	Pocoboh	97983	6050	12	1
1680	San Gaspar	97984	6050	12	1
1681	San Diego Buenavista	97984	6050	12	1
1682	Sacpukenhá	97984	6050	12	1
1683	Becanchen	97984	6050	12	1
1684	Nohalal	97985	6050	12	1
1685	Ayim	97986	6050	14	1
1686	San Rufino	97987	6050	12	1
1687	San Felipe Segundo	97987	6050	16	1
1688	San Juan Tekax	97987	6050	12	1
1689	San Pedro Xtokil	97987	6050	12	1
1690	Mesatunich	97987	6050	12	1
1691	Sudzal Chico	97989	6050	14	1
1692	Centro Telchac Pueblo	97400	6475	2	1
\.


--
-- TOC entry 3058 (class 0 OID 21245)
-- Dependencies: 198
-- Data for Name: Comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Comentario" ("iIdComentario", "vComentario", "iEstatus", "iIdPropuesta", "iIdUsuario", "iIdReplicaDe", "dFecha") FROM stdin;
5	No esto es una basuraaaaaa!!!!!!!	0	39	1	0	2018-11-15 18:23:56
6	Estoy de acuerdo con esto :D	2	39	1	0	2018-11-15 18:25:37
7	Maldito vendido 	2	39	1	6	2018-11-15 18:26:44
\.


--
-- TOC entry 3059 (class 0 OID 21250)
-- Dependencies: 199
-- Data for Name: ComentarioLike; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ComentarioLike" ("iIdCometario", "iIdUsuario", "iLike", "dFecha") FROM stdin;
6	1	1	2018-11-15 18:26:31
\.


--
-- TOC entry 3061 (class 0 OID 21255)
-- Dependencies: 201
-- Data for Name: GradoEstudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GradoEstudio" ("iIdGradoEstudio", "vGradoEstudio", "iActivo") FROM stdin;
1	Primaria	1
2	Secundaria	1
3	Bachillerato	1
4	Técnico superior universitario	1
5	Licenciatura	1
6	Maestría	1
7	Doctorado	1
8	Especialidad	1
\.


--
-- TOC entry 3063 (class 0 OID 21260)
-- Dependencies: 203
-- Data for Name: Localidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Localidad" ("iIdLocalidad", "vClaveInegi", "vLocalidad", "nLatDec", "nLongDec", "iIdMunicipio", "iActivo") FROM stdin;
1	0001	Abalá	20.647577999999999	-89.680886000000001	1	1
2	0003	Mucuyché	20.623663000000001	-89.604005999999998	1	1
3	0005	Sihunchén	20.694137999999999	-89.682682	1	1
4	0006	Temozón	20.688542999999999	-89.652399000000003	1	1
5	0007	Uayalceh	20.695558999999999	-89.594125000000005	1	1
6	0008	Peba	20.719429000000002	-89.686908000000003	1	1
7	0009	Cacao	20.692983999999999	-89.747530999999995	1	1
8	0015	Lázaro Cárdenas	20.684286	-89.633307000000002	1	1
9	0017	Onichén	20.619346	-89.537761000000003	1	1
10	0018	Benito Juárez Uno	20.640868000000001	-89.657230999999996	1	1
11	0019	Benito Juárez Cuatro	20.626617	-89.647594999999995	1	1
12	0021	San Isidro	20.661947000000001	-89.720393000000001	1	1
13	0023	San Pedro Ochil	20.648461000000001	-89.717313000000004	1	1
14	0025	San Juan Tehbacal	20.717938	-89.630927	1	1
15	0027	Víctor	20.660435	-89.680001000000004	1	1
16	0030	Benito Juárez Dos	20.635853000000001	-89.661734999999993	1	1
17	0032	Emiliano Zapata	20.635701000000001	-89.691411000000002	1	1
18	0037	Santa Gabriela	20.654170000000001	-89.680203000000006	1	1
19	0042	Miguel Hidalgo Uno	20.666478999999999	-89.598920000000007	1	1
20	0043	Miguel Hidalgo Dos	20.663032000000001	-89.599761999999998	1	1
21	0044	Miguel Hidalgo Tres	20.659483999999999	-89.597104000000002	1	1
22	0045	Miguel Hidalgo Cuatro	20.654751999999998	-89.596332000000004	1	1
23	0046	Rubén Navarrete	20.655180000000001	-89.678526000000005	1	1
24	0047	San Luis	20.641556000000001	-89.672184999999999	1	1
25	0051	Inquietas Cinco	20.678713999999999	-89.677525000000003	1	1
26	0052	Inquietas Seis	20.694697000000001	-89.693195000000003	1	1
27	0054	Xkalachuy	20.669740000000001	-89.712455000000006	1	1
28	0056	Benito Juárez Tres	20.629186000000001	-89.655378999999996	1	1
29	0057	Don Boni	20.668885	-89.678522999999998	1	1
30	0058	Inquietas Cuatro	20.694164000000001	-89.671625000000006	1	1
31	0059	Inquietas Dos	20.687062999999998	-89.620059999999995	1	1
32	0060	Inquietas Tres	20.686737000000001	-89.636149000000003	1	1
33	0061	Inquietas Uno	20.661725000000001	-89.604819000000006	1	1
34	0062	Cabrera Sosa	20.658878999999999	-89.676084000000003	1	1
35	0063	Dos Socios [Rancho]	20.670103000000001	-89.677741999999995	1	1
36	0064	Montecristo	20.659036	-89.678507999999994	1	1
37	0065	Arturo Caamal Carrillo	20.707961000000001	-89.717115000000007	1	1
38	0001	Acanceh	20.812459	-89.453539000000006	2	1
39	0002	Canicab	20.860272999999999	-89.431566000000004	2	1
40	0003	Cibceh	20.820371000000002	-89.487210000000005	2	1
41	0005	Petectunich	20.841557999999999	-89.476134000000002	2	1
42	0006	Sacchich	20.833154	-89.438005000000004	2	1
43	0007	Santa Gertrudis Tzuc	20.802928999999999	-89.431297999999998	2	1
44	0009	Tekik de Salazar Mendoza	20.788587	-89.456511000000006	2	1
45	0010	Tepich Carrillo	20.876639000000001	-89.498231000000004	2	1
46	0011	Ticopó	20.889389999999999	-89.441198999999997	2	1
47	0012	Yabucú	20.810696	-89.413203999999993	2	1
48	0014	Dzitiná	20.784237000000001	-89.400368	2	1
49	0016	San Lorenzo Pelé	20.775607999999998	-89.443365999999997	2	1
50	0019	San José Uno	20.867156999999999	-89.431732999999994	2	1
51	0021	Candi	20.862473000000001	-89.419944999999998	2	1
52	0022	Los Gavilanes	20.856603	-89.423289999999994	2	1
53	0023	El Pedregal	20.859214000000001	-89.490341999999998	2	1
54	0024	El Pípila [Quinta]	20.773942000000002	-89.464710999999994	2	1
55	0025	San Antonio	20.826484000000001	-89.443067999999997	2	1
56	0026	Santa Cruz	20.764982	-89.416143000000005	2	1
57	0027	Santa Cruz	20.868236	-89.479752000000005	2	1
58	0028	San Emilio	20.842077	-89.435927000000007	2	1
59	0029	San Felipe	20.871848	-89.434824000000006	2	1
60	0030	Los Jalapeños	20.806024000000001	-89.464691000000002	2	1
61	0031	San José	20.764675	-89.407736	2	1
62	0032	Guadalupano	20.83989	-89.434173999999999	2	1
63	0033	Acanceh	20.820677	-89.457813999999999	2	1
64	0038	Ninguno	20.851144999999999	-89.486305999999999	2	1
65	0039	San Agustín Tres	20.810790999999998	-89.428635999999997	2	1
66	0040	Los Lirios	20.828499000000001	-89.439025999999998	2	1
67	0041	El Progreso	20.874945	-89.486583999999993	2	1
68	0042	Salvador Alvarado	20.828627000000001	-89.442200999999997	2	1
69	0043	San Antonio	20.845942999999998	-89.482743999999997	2	1
70	0044	San Isidro	20.837389999999999	-89.435061000000005	2	1
71	0045	La Casa de la Cristiandad	20.845272999999999	-89.435310000000001	2	1
72	0046	San José Uitzá	20.856846999999998	-89.453208000000004	2	1
73	0047	Los Arturitos	20.829930000000001	-89.454443999999995	2	1
74	0048	El Buen Pastor	20.907627999999999	-89.468697000000006	2	1
75	0049	La Concepción	20.853504999999998	-89.422246000000001	2	1
76	0050	Los Dos Hermanos	20.865275	-89.492287000000005	2	1
77	0051	Hulbeenkaax	20.850704	-89.417796999999993	2	1
78	0052	Eusebio Estrella	20.907876000000002	-89.467394999999996	2	1
79	0053	Santa Isabel [Paraje]	20.869868	-89.493157999999994	2	1
80	0054	Plantel Siete	20.881948000000001	-89.441378999999998	2	1
81	0055	Plantel Veintitrés (Boxtzalam)	20.877597000000002	-89.450001	2	1
82	0056	San Gerónimo	20.799091000000001	-89.443780000000004	2	1
83	0057	San Isidro	20.858560000000001	-89.415339000000003	2	1
84	0058	Filiberto Noguera	20.861384000000001	-89.417327	2	1
85	0059	Ninguno	20.843254000000002	-89.481785000000002	2	1
86	0060	José Parra	20.830978999999999	-89.470464000000007	2	1
87	0061	Mega Servicios [Gasolinera]	20.863612	-89.492033000000006	2	1
88	0062	La Conchita	20.845963000000001	-89.468063999999998	2	1
89	0063	Kankirisché	20.811219999999999	-89.477230000000006	2	1
90	0064	Ninguno	20.844550999999999	-89.471504999999993	2	1
91	0066	Ninguno	20.861716999999999	-89.491348000000002	2	1
92	0067	Juan Monforte	20.872900000000001	-89.494339999999994	2	1
93	0069	Ninguno [UAIM]	20.878021	-89.492495000000005	2	1
94	0070	Los Cerros [Unidad Agrícola]	20.871368	-89.499742999999995	2	1
95	0071	Chakahil	20.909279000000002	-89.467393000000001	2	1
96	0072	Las Concordias	20.838435	-89.433822000000006	2	1
97	0073	Luis Kau	20.866109999999999	-89.432457999999997	2	1
98	0074	La Natividad	20.850190999999999	-89.430730999999994	2	1
99	0075	Manuel Cervantes	20.844702999999999	-89.433463000000003	2	1
100	0076	Matilde	20.835069000000001	-89.436452000000003	2	1
101	0077	Ninguno	20.830176000000002	-89.439109999999999	2	1
102	0078	Ninguno	20.877424000000001	-89.490485000000007	2	1
103	0079	Las Margaritas	20.855036999999999	-89.424085000000005	2	1
104	0080	San José II	20.866655000000002	-89.431621000000007	2	1
105	0081	Santa María	20.77759	-89.452072999999999	2	1
106	0083	María Luisa Chan	20.834481	-89.436296999999996	2	1
107	0085	San Judas Tadeo Tecoh	20.759995	-89.482868999999994	2	1
108	0086	El Roble [Granja Avícola]	20.827925	-89.443261000000007	2	1
109	0087	Kaki [Granja Avícola]	20.822285000000001	-89.446261000000007	2	1
110	0088	Ninguno [Quinta]	20.829578000000001	-89.441288999999998	2	1
111	0089	San Lorenzo	20.848246	-89.482412999999994	2	1
112	0001	Akil	20.267053000000001	-89.346825999999993	3	1
113	0003	San Diego	20.255979	-89.362509000000003	3	1
114	0004	San Víctor	20.250893000000001	-89.339566000000005	3	1
115	0006	Plan Chac Uno y Dos	20.241553	-89.329128999999995	3	1
116	0008	Morelos	20.275984000000001	-89.360744999999994	3	1
117	0010	San Gabriel	20.276644000000001	-89.342310999999995	3	1
118	0013	Plan Chac Pozo Tres	20.248463000000001	-89.323739000000003	3	1
119	0016	Santa Cruz	20.287519	-89.347024000000005	3	1
120	0019	Buenavista	20.218291000000001	-89.371954000000002	3	1
121	0021	Técnica Treinta y Uno [Escuela]	20.272988999999999	-89.331918999999999	3	1
122	0026	Nabanché	20.211931	-89.368624999999994	3	1
123	0028	Ox-Ac II	20.269494999999999	-89.369084999999998	3	1
124	0030	San Fernando	20.315619999999999	-89.358231000000004	3	1
125	0032	San Nicolás	20.285779000000002	-89.335697999999994	3	1
126	0033	San Román	20.215118	-89.375315999999998	3	1
127	0035	Santa Teresa	20.25854	-89.357750999999993	3	1
128	0038	Santa Rita	20.280549000000001	-89.344773000000004	3	1
129	0039	San Esteban	20.279153999999998	-89.337891999999997	3	1
130	0040	Juguera de Akil [Procesadora de Cítricos]	20.287607999999999	-89.382994999999994	3	1
131	0041	Plan Chac Pozo Cinco	20.258113000000002	-89.314376999999993	3	1
132	0042	Benito Juárez	20.229443	-89.380740000000003	3	1
133	0043	Plan Chac Pozo Cuatro	20.250830000000001	-89.317926999999997	3	1
134	0044	San Bernardo	20.243414000000001	-89.353183999999999	3	1
135	0049	San Ausencio	20.297851000000001	-89.343496000000002	3	1
136	0051	Cinco de Mayo	20.277339999999999	-89.351461999999998	3	1
137	0053	San Anastacio	20.2392	-89.343823999999998	3	1
138	0054	Luis Echeverría Álvarez	20.276796000000001	-89.339107999999996	3	1
139	0055	San Bernardino	20.306564999999999	-89.346853999999993	3	1
140	0057	Ox-Ac IV	20.260777999999998	-89.367599999999996	3	1
141	0058	Ox-Ac III	20.272538000000001	-89.362262999999999	3	1
142	0059	San Pablo Tres	20.270889	-89.320086000000003	3	1
143	0060	La Lupita	20.280045000000001	-89.345862999999994	3	1
144	0061	La Ceiba	20.280242000000001	-89.365125000000006	3	1
145	0001	Baca	21.109514000000001	-89.399405000000002	4	1
146	0004	San Isidro Kuxub	21.126897	-89.392821999999995	4	1
147	0005	San Carlos	21.105830999999998	-89.376733999999999	4	1
148	0007	Santa Cruz Collí	21.121068999999999	-89.382954999999995	4	1
149	0008	Santa María	21.093028	-89.375946999999996	4	1
150	0009	Santo Domingo	21.095282999999998	-89.402465000000007	4	1
151	0010	Tixkuncheil	21.079799999999999	-89.397740999999996	4	1
152	0012	Kankabchén Gamboa	21.084154000000002	-89.380649000000005	4	1
153	0013	San Antonio Kiché	21.108194000000001	-89.379850000000005	4	1
154	0014	X-Cocil	21.148491	-89.380290000000002	4	1
155	0016	Oasis	21.105672999999999	-89.369320999999999	4	1
156	0017	San Pedro	21.085671000000001	-89.406294000000003	4	1
157	0018	San Pedro	21.118071	-89.389128999999997	4	1
158	0019	San Dimas	21.098192999999998	-89.394563000000005	4	1
159	0020	Boxactún	21.105886000000002	-89.354465000000005	4	1
160	0024	Santa Cruz Dziuché	21.169743	-89.425686999999996	4	1
161	0025	Santa Cruz Chinic	21.172094999999999	-89.417400999999998	4	1
162	0028	Baca Uno	21.106759	-89.385434000000004	4	1
163	0031	San Isidro I	21.156113999999999	-89.413398999999998	4	1
164	0032	Baca Dos	21.102156999999998	-89.375506999999999	4	1
165	0034	Kankabchén	21.091999000000001	-89.395011999999994	4	1
166	0035	Kamas	21.180648999999999	-89.414484000000002	4	1
167	0037	San Lorenzo Boxactún	21.112594999999999	-89.386565000000004	4	1
168	0038	San Manuel	21.197877999999999	-89.420777000000001	4	1
169	0040	San Nicolás	21.122886000000001	-89.413697999999997	4	1
170	0041	Nok Ak	21.160595000000001	-89.402589000000006	4	1
171	0042	Pacchén	21.194656999999999	-89.432618000000005	4	1
172	0043	Petkan	21.141594000000001	-89.406861000000006	4	1
173	0044	Santa Rita	21.118634	-89.402479	4	1
174	0045	Baca Tres	21.106617	-89.371109000000004	4	1
175	0046	Santa Cruz Sábila	21.154084000000001	-89.420805000000001	4	1
176	0047	Xoux	21.106826999999999	-89.386286999999996	4	1
177	0048	Put-Ku	21.096450999999998	-89.368888999999996	4	1
178	0049	Concepción Xtuc	21.146508999999998	-89.424862000000005	4	1
179	0050	San Diego	21.079359	-89.379389000000003	4	1
180	0053	Bugambilias	21.102948000000001	-89.358705	4	1
181	0056	Bachoco	21.075503000000001	-89.402128000000005	4	1
182	0057	Bachoco	21.073955000000002	-89.402849000000003	4	1
183	0058	San Antonio	21.067534999999999	-89.379977999999994	4	1
184	0059	Colonia Agrícola	21.102936	-89.350345000000004	4	1
185	0060	San José	21.106649000000001	-89.428663999999998	4	1
186	0061	La Fe	21.109781999999999	-89.419355999999993	4	1
187	0062	Emporio	21.086518999999999	-89.397238000000002	4	1
188	0063	Hocoyuc	21.117823000000001	-89.406340999999998	4	1
189	0064	La Esperanza	21.109027000000001	-89.424000000000007	4	1
190	0065	Las Trincheras	21.105129999999999	-89.432304000000002	4	1
191	0066	La Comunidad	21.104039	-89.357562999999999	4	1
192	0067	La Lupita	21.156359999999999	-89.424882999999994	4	1
193	0068	San Antonio	21.085633999999999	-89.405175999999997	4	1
194	0069	Santa Cruz	21.100290000000001	-89.388721000000004	4	1
195	0070	Siniltún	21.095970999999999	-89.414552999999998	4	1
196	0071	Los Tres Reyes	21.187871999999999	-89.422318000000004	4	1
197	0072	El Potrero	21.103815999999998	-89.356582000000003	4	1
198	0075	Los Potrillos	21.106684000000001	-89.422679000000002	4	1
199	0076	Poco a Poco I y II	21.121497999999999	-89.371436000000003	4	1
200	0077	Sabac Pochote	21.126280999999999	-89.379733000000002	4	1
201	0078	Tres Hermanos	21.120808	-89.373147000000003	4	1
202	0079	Chelito Lindo	21.102653	-89.428079999999994	4	1
203	0080	Esmeralda	21.105927999999999	-89.388355000000004	4	1
204	0081	Ríos [Unidad Hortícola]	21.071086000000001	-89.404759999999996	4	1
205	0082	El Imán	21.078253	-89.390930999999995	4	1
206	0083	Chan Chegor	21.185110000000002	-89.422680999999997	4	1
207	0084	San Antonio Abad	21.152889999999999	-89.365626000000006	4	1
736	0067	Kambul	21.055736	-88.109915000000001	8	1
208	0085	San Pedro	21.208701000000001	-89.413140999999996	4	1
209	0086	Concepción [Quinta]	21.106722000000001	-89.433841000000001	4	1
210	0087	Santa Cruz	21.128195999999999	-89.40164	4	1
211	0088	Baca [Basurero Municipal]	21.107320000000001	-89.423794000000001	4	1
212	0089	Ninguno [Bodega]	21.098889	-89.402777999999998	4	1
213	0090	Candelaria	21.106718999999998	-89.433318999999997	4	1
214	0091	La Toscana [Quinta]	21.099053999999999	-89.423672999999994	4	1
215	0092	Los Conejos [Club de Tiro]	21.076853	-89.376135000000005	4	1
216	0093	Grúas Abimerhi [Depósito Vehicular]	21.096584	-89.430458000000002	4	1
217	0094	Ex-Gasolinera	21.108936	-89.413974999999994	4	1
218	0095	Los Flamboyanes	21.107144999999999	-89.428894	4	1
219	0096	Garza	21.106255999999998	-89.429990000000004	4	1
220	0097	Kilómetro Diecinueve	21.100203	-89.408600000000007	4	1
221	0098	Cindy [Llantera]	21.09787	-89.421903	4	1
222	0099	Abimerhi Premier [Gasera]	21.096250999999999	-89.426782000000003	4	1
223	0100	Ninguno	21.096713999999999	-89.419891000000007	4	1
224	0101	San Antonio Tercero	21.075906	-89.401674	4	1
225	0103	Ninguno	21.109189000000001	-89.414725000000004	4	1
226	0104	Los Laureles	21.175962999999999	-89.419713000000002	4	1
227	0105	La Morena	21.097455	-89.418498	4	1
228	0106	Nidia	21.083625999999999	-89.399235000000004	4	1
229	0107	Las Palomas	21.107469999999999	-89.422957999999994	4	1
230	0108	Santa Cecilia	21.141636999999999	-89.414263000000005	4	1
231	0109	San Roberto	21.101586999999999	-89.377527000000001	4	1
232	0110	Bachoco	21.079231	-89.391848999999993	4	1
233	0111	Santa Cruz Sábila	21.151789000000001	-89.417931999999993	4	1
234	0112	Tumben Há	21.196241000000001	-89.425980999999993	4	1
235	0113	San José [Unidad Agrícola]	21.107286999999999	-89.427746999999997	4	1
236	0114	San Mauro Xtuk	21.160664000000001	-89.423741000000007	4	1
237	0115	La Herradura	21.154733	-89.426766999999998	4	1
238	0116	Severiano Chan Cimé	21.127877000000002	-89.364116999999993	4	1
239	0117	Itaboca	21.093498	-89.377633000000003	4	1
240	0118	Ramón Valdez Balam	21.123798000000001	-89.366587999999993	4	1
241	0119	La Sulianita	21.107195999999998	-89.418999999999997	4	1
242	0120	El Pueblo Guardado [Residencial de Jubilados]	21.087116999999999	-89.400508000000002	4	1
243	0121	Tamara Farming [Invernadero]	21.115064	-89.409097000000003	4	1
244	0122	Ninguno [Granja]	21.089352000000002	-89.397506000000007	4	1
245	0001	Bokobá	21.00694	-89.179524999999998	5	1
246	0002	Mucuyché Campos	20.965416000000001	-89.167254	5	1
247	0003	San Antonio Ayín	21.015774	-89.209843000000006	5	1
248	0004	San Antonio Choil	21.015806000000001	-89.172855999999996	5	1
249	0007	Felipe Carrillo Puerto	20.993326	-89.182366999999999	5	1
250	0008	Santo Domingo	20.983460000000001	-89.180216999999999	5	1
251	0009	Chan Chen	21.021571999999999	-89.191693000000001	5	1
252	0016	La Bendición de Dios	20.993364	-89.181725999999998	5	1
253	0017	Ayín [Granja]	21.013921	-89.209407999999996	5	1
254	0018	San Pedro	21.013643999999999	-89.155756999999994	5	1
255	0019	Xulá	21.007093000000001	-89.152471000000006	5	1
256	0020	Bokobá [Basurero Municipal]	21.008102999999998	-89.159600999999995	5	1
257	0021	Dzemul	21.037604999999999	-89.191613000000004	5	1
258	0022	Cenote	21.015810999999999	-89.165339000000003	5	1
259	0023	Sodzil	21.015138	-89.144606999999993	5	1
260	0001	Buctzotz	21.201896999999999	-88.794461999999996	6	1
261	0002	X-Bec	21.250243000000001	-88.825311999999997	6	1
262	0003	Santo Domingo	21.141878999999999	-88.666158999999993	6	1
263	0004	La Gran Lucha	21.208880000000001	-88.554764000000006	6	1
264	0005	Unidad Juárez	21.190583	-88.520719	6	1
265	0006	Granito de Oro	21.238498	-88.533305999999996	6	1
266	0007	San Dimas	21.322258000000001	-88.619545000000002	6	1
267	0008	Kankirixché	21.157347999999999	-88.773561000000001	6	1
268	0009	Xmut Huá	21.232938999999998	-88.756467999999998	6	1
269	0010	San Pedro Buenavista	21.178431	-88.667451	6	1
270	0012	San Sebastián	21.117455	-88.647750000000002	6	1
271	0014	Nohyaxché	21.298137000000001	-88.605982999999995	6	1
272	0015	Chan Motul	21.311964	-88.634564999999995	6	1
273	0017	Chun-Abal	21.281524999999998	-88.783375000000007	6	1
274	0020	Balischén	21.180035	-88.498898999999994	6	1
275	0022	Boxdzonot	21.123875999999999	-88.739782000000005	6	1
276	0023	Buena Esperanza	21.288177999999998	-88.545451	6	1
277	0024	Cenote Azul	21.153998000000001	-88.680183	6	1
278	0025	Chacdzidzib	21.180724000000001	-88.776470000000003	6	1
279	0027	Chen Canul	21.214010999999999	-88.626428000000004	6	1
280	0028	Chen Chomac Uno y Dos	21.192845999999999	-88.618841000000003	6	1
281	0029	Che'en Pato	21.186191000000001	-88.510885999999999	6	1
282	0030	Chilitux	21.220970999999999	-88.667925999999994	6	1
283	0031	Chunhuayún	21.254228000000001	-88.634403000000006	6	1
284	0032	El Diamante	21.178678999999999	-88.480322000000001	6	1
285	0035	Dzadz Pizot	21.180555999999999	-88.715277999999998	6	1
286	0036	Casco	21.233799000000001	-88.578877000000006	6	1
287	0037	Dzitox	21.216532999999998	-88.779891000000006	6	1
288	0039	Guadalupe	21.202753999999999	-88.739029000000002	6	1
289	0040	Haidzonot	21.141556999999999	-88.720769000000004	6	1
290	0041	Haydzonot	21.1645	-88.600256999999999	6	1
291	0042	San Hol	21.237013999999999	-88.835262999999998	6	1
292	0047	Jujum Pit	21.187624	-88.651886000000005	6	1
293	0048	X'caladzonot	21.286096000000001	-88.711625999999995	6	1
294	0050	Kakal	21.155208999999999	-88.727416000000005	6	1
295	0052	El Lirio	21.181844000000002	-88.493178	6	1
296	0053	Nitkichén	21.261202000000001	-88.621099000000001	6	1
297	0056	San Alejo	21.295566000000001	-88.590632999999997	6	1
298	0057	Nup-Dzonot	21.154140999999999	-88.711904000000004	6	1
299	0058	X-Palma	21.25121	-88.489232999999999	6	1
300	0059	El Pedregal	21.173286000000001	-88.493713999999997	6	1
301	0060	Pixoy	21.198653	-88.779886000000005	6	1
302	0062	Rancho Nuevo	21.236540000000002	-88.622367999999994	6	1
303	0064	El Sacrificio	21.183926	-88.554827000000003	6	1
304	0065	El Cortijo	21.162493000000001	-88.607347000000004	6	1
305	0067	San Ángel	21.190750000000001	-88.753388000000001	6	1
306	0068	San Anselmo	21.270780999999999	-88.622184000000004	6	1
307	0069	San Jorge	21.184989999999999	-88.568653999999995	6	1
308	0072	San Carlos	21.196168	-88.759041999999994	6	1
309	0073	San Cristóbal	21.199100999999999	-88.595331999999999	6	1
310	0075	San Diego	21.234311000000002	-88.634473999999997	6	1
311	0078	San Francisco Dos	21.297566	-88.684567999999999	6	1
312	0079	San Francisco Uno	21.291383	-88.683328000000003	6	1
313	0080	San Francisco	21.244522	-88.482659999999996	6	1
314	0081	San Genaro	21.186706999999998	-88.565074999999993	6	1
315	0082	San Isidro	21.282046999999999	-88.523173999999997	6	1
316	0083	San Jorge	21.280638	-88.572061000000005	6	1
317	0085	San José	21.201212000000002	-88.818423999999993	6	1
318	0086	San José Pedro	21.289337	-88.516701999999995	6	1
319	0087	San Juan	21.164372	-88.625699999999995	6	1
320	0090	San Julián	21.289379	-88.670233999999994	6	1
321	0091	San Luis	21.226714000000001	-88.588047000000003	6	1
322	0092	San Martín	21.165320999999999	-88.698306000000002	6	1
323	0093	San Mateo	21.194703000000001	-88.637579000000002	6	1
324	0094	San Miguel	21.298953999999998	-88.567684	6	1
325	0095	San Pedro	21.284495	-88.621594999999999	6	1
326	0096	San Rafael	21.275853000000001	-88.562567000000001	6	1
327	0101	Santa Cruz Yaxché	21.232551000000001	-88.789906000000002	6	1
328	0102	Santa Elena	21.173425000000002	-88.648938999999999	6	1
329	0103	Santa Isabel	21.229638999999999	-88.829491000000004	6	1
330	0104	Santa Isabel	21.187211000000001	-88.754863	6	1
331	0105	Santa María	21.237580000000001	-88.807720000000003	6	1
332	0106	Santa María	21.307182000000001	-88.540287000000006	6	1
333	0107	La Herradura	21.240119	-88.595828999999995	6	1
334	0110	Santa Rosa	21.19754	-88.586073999999996	6	1
335	0111	Santa Rosa	21.276727999999999	-88.734328000000005	6	1
336	0112	Santa Rosa	21.311736	-88.503449000000003	6	1
337	0114	El Tumbo	21.313554	-88.519959999999998	6	1
338	0116	Santo Domingo	21.299859999999999	-88.521893000000006	6	1
339	0118	Tres Reyes	21.262823000000001	-88.575530000000001	6	1
340	0119	Tobiye	21.222928	-88.815402000000006	6	1
341	0122	X-Kanán	21.181965999999999	-88.637528000000003	6	1
342	0123	Kan Há	21.272703	-88.516762999999997	6	1
343	0124	Chacdzidzib	21.158569	-88.758404999999996	6	1
344	0125	X-Limón	21.293680999999999	-88.583012999999994	6	1
345	0126	X-Limón Chen	21.215957	-88.670447999999993	6	1
346	0127	Xiat	21.185122	-88.772395000000003	6	1
347	0128	San Lorenzo	21.318058000000001	-88.588239999999999	6	1
348	0132	Yokdzonot	21.215344000000002	-88.792705999999995	6	1
349	0134	Santa Cruz	21.199207000000001	-88.538872999999995	6	1
350	0135	San Isidro	21.148917999999998	-88.698971999999998	6	1
351	0136	Mul Há Ho	21.143257999999999	-88.692683000000002	6	1
352	0138	San Carlos	21.138144	-88.705907999999994	6	1
353	0139	Santa María X-Tulín	21.187498999999999	-88.743705000000006	6	1
354	0140	San Miguel Uno	21.200809	-88.762763000000007	6	1
355	0141	Santa Rosalía	21.212104	-88.679618000000005	6	1
356	0142	Buena Vista	21.203931000000001	-88.682340999999994	6	1
357	0145	X-Pájaro	21.158072000000001	-88.693017999999995	6	1
358	0146	Chuntzalam	21.198753	-88.687563999999995	6	1
359	0148	Santa María	21.198063000000001	-88.739281000000005	6	1
360	0151	Sayaluch	21.169104000000001	-88.699082000000004	6	1
361	0152	San Enrique	21.164868999999999	-88.687044999999998	6	1
362	0154	Chun Copó	21.166038	-88.705563999999995	6	1
363	0155	San José de los Reyes	21.145125	-88.719904	6	1
364	0157	Kimen Mis	21.188852000000001	-88.777147999999997	6	1
365	0158	San José	21.197482999999998	-88.733525999999998	6	1
366	0160	San Antonio	21.184904	-88.709736000000007	6	1
367	0164	El Pocito	21.290319	-88.644869999999997	6	1
368	0166	Dzonot Brito	21.279512	-88.546935000000005	6	1
369	0167	San Juan	21.302966000000001	-88.561440000000005	6	1
370	0168	San Bernardo	21.292551	-88.565010999999998	6	1
371	0170	San Paulino	21.298559000000001	-88.576527999999996	6	1
372	0171	Kaladzadz	21.298241000000001	-88.627459000000002	6	1
373	0175	África	21.319489000000001	-88.560373999999996	6	1
374	0176	X-Azul	21.299872000000001	-88.617925999999997	6	1
375	0177	Santa Lucía	21.318209	-88.612943999999999	6	1
376	0180	Santa Ana	21.266249999999999	-88.600548000000003	6	1
377	0181	X-Canhá	21.23376	-88.587823999999998	6	1
378	0182	Santa María de Guadalupe	21.189053000000001	-88.594910999999996	6	1
379	0183	Los Gavilanes	21.190463000000001	-88.554113000000001	6	1
380	0185	Santa Cruz Dos	21.184782999999999	-88.529391000000004	6	1
381	0186	San Miguel	21.140014000000001	-88.636516999999998	6	1
382	0188	Los Potrillos	21.230785999999998	-88.810170999999997	6	1
383	0190	San Luis Gonzaga	21.250836	-88.792817999999997	6	1
384	0191	San José	21.2698	-88.771114999999995	6	1
385	0193	San Antonio	21.22664	-88.784173999999993	6	1
386	0194	Chen Cutz	21.246542999999999	-88.761814000000001	6	1
387	0195	Sis Há	21.266929999999999	-88.753303000000002	6	1
388	0196	Santa Anita	21.261056	-88.767544000000001	6	1
389	0199	San Lorenzo	21.211711000000001	-88.811443999999995	6	1
390	0202	Los Álamos	21.257480000000001	-88.777358000000007	6	1
391	0204	San Román	21.212966000000002	-88.804851999999997	6	1
392	0205	San Andrés	21.21143	-88.807861000000003	6	1
393	0206	Chen Canul	21.180295000000001	-88.760727000000003	6	1
394	0207	San Martín	21.173055999999999	-88.739870999999994	6	1
395	0208	Ninguno	21.161052999999999	-88.756776000000002	6	1
396	0209	Santa Cruz Amapola	21.145150999999998	-88.745028000000005	6	1
397	0210	Santa Trinidad	21.135593	-88.733951000000005	6	1
398	0211	San Francisco	21.116008000000001	-88.728149999999999	6	1
399	0212	San Cenobio	21.125858000000001	-88.735319000000004	6	1
400	0213	Ninguno	21.154568000000001	-88.697018	6	1
401	0214	San Antonio	21.207605000000001	-88.745260000000002	6	1
402	0215	Bermejo	21.209274000000001	-88.750367999999995	6	1
403	0216	Dziben	21.213265	-88.742324999999994	6	1
404	0218	San Martín	21.2013	-88.727250999999995	6	1
405	0219	Tres Marías	21.206040999999999	-88.729014000000006	6	1
406	0221	Santa Rita	21.209824000000001	-88.728363999999999	6	1
407	0222	San Miguel	21.217645000000001	-88.727080999999998	6	1
408	0223	El Olvido	21.218254999999999	-88.731026999999997	6	1
409	0224	Macam	21.220407999999999	-88.727247000000006	6	1
410	0225	Chuncopó	21.203536	-88.722904	6	1
411	0230	Santa Isabel	21.191078999999998	-88.676000000000002	6	1
412	0236	San Juan	21.263909000000002	-88.660578000000001	6	1
413	0237	San Juan	21.27871	-88.668695	6	1
414	0241	Chumbilá	21.273229000000001	-88.705509000000006	6	1
415	0243	Santa Rita	21.294611	-88.637281000000002	6	1
416	0244	Villa de Guadalupe	21.301839000000001	-88.635743000000005	6	1
417	0249	Chan Dzonot	21.158386	-88.719003999999998	6	1
1053	0066	El Sol	21.079656	-89.535319999999999	13	1
418	0250	Piedras Negras	21.192442	-88.704888999999994	6	1
419	0254	Santa Bárbara	21.282022000000001	-88.533704999999998	6	1
420	0256	San Marcial Dos	21.304576999999998	-88.606759999999994	6	1
421	0257	San Marcial Uno	21.308130999999999	-88.607303000000002	6	1
422	0258	Santiaguito	21.307836999999999	-88.606335000000001	6	1
423	0264	San Germán	21.315365	-88.507925	6	1
424	0267	Santa Rosa Dos	21.308530999999999	-88.481583999999998	6	1
425	0269	San Miguel	21.278763999999999	-88.556477999999998	6	1
426	0270	San Francisco	21.260729999999999	-88.546010999999993	6	1
427	0272	Santa María	21.310053	-88.622446999999994	6	1
428	0273	Kakaldzonot	21.30472	-88.621730999999997	6	1
429	0274	El Dorado	21.269891000000001	-88.490076000000002	6	1
430	0275	Chan Luch	21.255787999999999	-88.548202000000003	6	1
431	0277	San Felipe	21.181201000000001	-88.595597999999995	6	1
432	0278	Santa Lucía	21.212119000000001	-88.589174	6	1
433	0280	San Marcos	21.238816	-88.535646999999997	6	1
434	0282	San Carlos	21.251480999999998	-88.540852000000001	6	1
435	0283	San Manuel	21.249334000000001	-88.546951000000007	6	1
436	0288	Actún Dzadz	21.202559999999998	-88.715271000000001	6	1
437	0290	San Diego	21.302761	-88.655264000000003	6	1
438	0291	San Nicolás	21.302638999999999	-88.654494	6	1
439	0299	San Felipe	21.209379999999999	-88.493071999999998	6	1
440	0300	San Román	21.204840000000001	-88.506227999999993	6	1
441	0304	Actún-Chen	21.32854	-88.618819000000002	6	1
442	0305	África	21.271782000000002	-88.687538000000004	6	1
443	0306	Arco Hopchén	21.113771	-88.680728000000002	6	1
444	0307	Rancho Nuevo	21.214863999999999	-88.771942999999993	6	1
445	0308	Buriches	21.247108999999998	-88.681988000000004	6	1
446	0309	Cimé	21.177600000000002	-88.696832000000001	6	1
447	0310	Los Cocos	21.217082000000001	-88.817252999999994	6	1
448	0311	Chabelo	21.248142999999999	-88.693112999999997	6	1
449	0312	Chac	21.181529000000001	-88.726794999999996	6	1
450	0313	Chan Motul	21.332253000000001	-88.638316000000003	6	1
451	0314	Chen Kulú	21.213334	-88.814645999999996	6	1
452	0315	Chun Copó	21.243292	-88.677976000000001	6	1
453	0316	Dzachacá	21.341180000000001	-88.648742999999996	6	1
454	0317	Dzadz-Cun	21.164598000000002	-88.745662999999993	6	1
455	0318	Dzadz Gallo	21.154281999999998	-88.736305000000002	6	1
456	0319	Dzitnup	21.241688	-88.706447999999995	6	1
457	0320	San Mateo	21.178737000000002	-88.688259000000002	6	1
458	0321	Dzonot Lú	21.29496	-88.658399000000003	6	1
459	0322	El Girasol	21.250086	-88.757307999999995	6	1
460	0323	La Gran China	21.316561	-88.602299000000002	6	1
461	0324	Kanhá	21.218222000000001	-88.703828999999999	6	1
462	0325	Kanhá	21.270665999999999	-88.637653	6	1
463	0326	Kanhá	21.235970999999999	-88.706675000000004	6	1
464	0327	Kakanhá	21.292435000000001	-88.695713999999995	6	1
465	0328	Santa Cruz	21.112845	-88.707190999999995	6	1
466	0329	Lol Bé	21.181881000000001	-88.699466000000001	6	1
467	0330	Lolo	21.193563000000001	-88.688677999999996	6	1
468	0331	Mukul	21.239559	-88.671350000000004	6	1
469	0332	Nuc Xebaz	21.151591	-88.739312999999996	6	1
470	0334	El Paraíso	21.232101	-88.553578000000002	6	1
471	0335	Pénjamo	21.239725	-88.657805999999994	6	1
472	0336	Piña	21.260228000000001	-88.652428999999998	6	1
473	0337	Pollito	21.279716000000001	-88.616322999999994	6	1
474	0338	El Potrerito	21.212803999999998	-88.711659999999995	6	1
475	0339	El Regalito	21.228248000000001	-88.763092999999998	6	1
476	0340	Rengo	21.209952999999999	-88.728390000000005	6	1
477	0341	Rebeca Uno [Rancho]	21.180157999999999	-88.538191999999995	6	1
478	0342	Sacrificio	21.248038999999999	-88.741416999999998	6	1
479	0343	Sahcabá	21.150127999999999	-88.634285000000006	6	1
480	0344	San Agustín	21.216659	-88.811013000000003	6	1
481	0345	San Antonio	21.214561	-88.704345000000004	6	1
482	0346	San Antonio	21.200866999999999	-88.673168000000004	6	1
483	0347	San Antonio Baa Há	21.239678000000001	-88.650041999999999	6	1
484	0348	San Arturo	21.197590999999999	-88.675121000000004	6	1
485	0349	San Aurelio	21.230813999999999	-88.691519	6	1
486	0350	San Bernardino California	21.230927000000001	-88.695278000000002	6	1
487	0351	San Carlos	21.146405999999999	-88.752863000000005	6	1
488	0352	San Carlos	21.160328	-88.739868000000001	6	1
489	0353	San Carlos	21.303872999999999	-88.642058000000006	6	1
490	0354	San Carlos	21.234231000000001	-88.683014999999997	6	1
491	0355	San Carlos	21.269732999999999	-88.789817999999997	6	1
492	0356	San Cosme	21.278689	-88.679113999999998	6	1
493	0357	San Chumas	21.180343000000001	-88.573723000000001	6	1
494	0358	San Daniel	21.128620999999999	-88.728908000000004	6	1
495	0359	San Felipe	21.231822000000001	-88.735246000000004	6	1
496	0360	San Felipe	21.129418999999999	-88.651557999999994	6	1
497	0362	San Gabriel	21.249534000000001	-88.706423999999998	6	1
498	0363	San Gaspar	21.221813999999998	-88.552345000000003	6	1
499	0364	San Ignacio	21.215969999999999	-88.674375999999995	6	1
500	0365	San Isidro	21.225901	-88.824798999999999	6	1
501	0366	San Isidro Labrador	21.121635999999999	-88.706686000000005	6	1
502	0367	San Jorge	21.153718000000001	-88.680150999999995	6	1
503	0368	San José	21.265498999999998	-88.647735999999995	6	1
504	0369	San José	21.119147999999999	-88.696893000000003	6	1
505	0370	San José	21.166876999999999	-88.694862999999998	6	1
506	0371	San José	21.299731999999999	-88.531340999999998	6	1
507	0372	San José [Anexa]	21.265038000000001	-88.772262999999995	6	1
508	0373	San Juan	21.23104	-88.785086000000007	6	1
509	0374	San Juan	21.271357999999999	-88.798563000000001	6	1
510	0375	San Juan	21.245466	-88.731538999999998	6	1
511	0376	San Julián	21.264216999999999	-88.740114000000005	6	1
512	0377	San Julián	21.244289999999999	-88.694767999999996	6	1
513	0378	San Lázaro	21.275106999999998	-88.695130000000006	6	1
514	0379	San Lorenzo	21.238714000000002	-88.672904000000003	6	1
515	0380	San Lorenzo	21.211939999999998	-88.745812000000001	6	1
516	0381	Santa Cecilia	21.256568999999999	-88.741746000000006	6	1
517	0382	San Manuel	21.218888	-88.688250999999994	6	1
518	0383	San Marcos	21.342656999999999	-88.631781000000004	6	1
519	0384	San Marcos	21.315901	-88.620348000000007	6	1
520	0385	San Martín	21.239619000000001	-88.815190999999999	6	1
521	0386	San Martín de Porres	21.184515999999999	-88.610280000000003	6	1
522	0387	San Miguel	21.188075999999999	-88.677790000000002	6	1
523	0388	San Pablo	21.247335	-88.819434000000001	6	1
524	0389	San Pablo	21.181387999999998	-88.653215000000003	6	1
525	0390	San José	21.228877000000001	-88.548821000000004	6	1
526	0391	San Pedro	21.243790000000001	-88.725710000000007	6	1
527	0392	San Pedro	21.221367999999998	-88.777520999999993	6	1
528	0393	San Pedro Dzarapix	21.13514	-88.648933	6	1
529	0394	San Rafael	21.243213999999998	-88.712459999999993	6	1
530	0395	San Nicolás	21.242522999999998	-88.606067999999993	6	1
531	0396	Los Ángeles	21.258329	-88.600804999999994	6	1
532	0397	San Crisanto	21.269387999999999	-88.745565999999997	6	1
533	0398	Santa Ana	21.175681000000001	-88.571505999999999	6	1
534	0399	Santa Bárbara	21.286988000000001	-88.652834999999996	6	1
535	0400	Santa Brígida	21.218447999999999	-88.697329999999994	6	1
536	0401	Santa Cruz	21.195466	-88.724981	6	1
537	0402	Santa Cruz	21.115617	-88.702020000000005	6	1
538	0403	Santa Cruz	21.195544000000002	-88.814628999999996	6	1
539	0404	Santa Cruz	21.147400000000001	-88.679867000000002	6	1
540	0405	Santa Cruz	21.223389999999998	-88.755482000000001	6	1
541	0406	Santa Isabel	21.262077999999999	-88.692667999999998	6	1
542	0407	Santa Lucía	21.211991999999999	-88.794721999999993	6	1
543	0408	Santa Marcelina	21.211034000000001	-88.758775999999997	6	1
544	0409	Santa Paula	21.140453000000001	-88.725129999999993	6	1
545	0410	Santa Rita	21.292255000000001	-88.524360999999999	6	1
546	0411	Santa Rosa	21.230179	-88.678763000000004	6	1
547	0412	Santa Rosa	21.244564	-88.835455999999994	6	1
548	0413	Santa Rosa [Anexa]	21.278541000000001	-88.742180000000005	6	1
549	0414	Siete Estrellas	21.311022999999999	-88.502993000000004	6	1
550	0416	Xtrampa	21.269933999999999	-88.739960999999994	6	1
551	0417	Can Dzo	21.232240000000001	-88.724086	6	1
552	0418	Ninguno	21.228559000000001	-88.737808999999999	6	1
553	0419	Ninguno	21.160366	-88.780258000000003	6	1
554	0420	Ninguno	21.185288	-88.722487999999998	6	1
555	0421	Ninguno	21.164244	-88.678602999999995	6	1
556	0422	Ninguno	21.213750999999998	-88.704538999999997	6	1
557	0423	San Andrés	21.192934999999999	-88.685563999999999	6	1
558	0424	San José	21.260149999999999	-88.648380000000003	6	1
559	0425	Ninguno	21.226239	-88.780051999999998	6	1
560	0426	Ninguno	21.229101	-88.768709000000001	6	1
561	0427	Ninguno	21.250011000000001	-88.719711000000004	6	1
562	0428	Santa Isabel	21.293088000000001	-88.618664999999993	6	1
563	0429	San Esteban	21.231216	-88.539524	6	1
564	0430	San Judas Tadeo	21.231363000000002	-88.663158999999993	6	1
565	0431	Tepeyac	21.151178000000002	-88.776782999999995	6	1
566	0432	Ninguno [UAIM]	21.194277	-88.724647000000004	6	1
567	0433	X-Bohmil	21.239788000000001	-88.689824999999999	6	1
568	0434	X-Cacal	21.248296	-88.687047000000007	6	1
569	0436	X-Kambul	21.227992	-88.693808000000004	6	1
570	0437	X-Lacah	21.165863000000002	-88.758904999999999	6	1
571	0438	X-Tup	21.292570999999999	-88.667519999999996	6	1
572	0439	X-Yach	21.169957	-88.717237999999995	6	1
573	0440	Yax-Há	21.259793999999999	-88.708696000000003	6	1
574	0441	Yoopop	21.228162000000001	-88.666910000000001	6	1
575	0442	Chen Burro	21.256595999999998	-88.635701999999995	6	1
576	0443	San Isidro	21.201371000000002	-88.737684000000002	6	1
577	0444	San Juan	21.258707999999999	-88.690123999999997	6	1
578	0446	Almendros	21.215143000000001	-88.805023000000006	6	1
579	0447	Cuba	21.205735000000001	-88.603438999999995	6	1
580	0448	Edilberto Be	21.25206	-88.639587000000006	6	1
581	0449	Jomo Dzadz Dos	21.199677999999999	-88.709546000000003	6	1
582	0450	Jomo Dzadz Uno	21.194903	-88.709265000000002	6	1
583	0451	Kusbá	21.191393999999999	-88.691434000000001	6	1
584	0452	Las Margaritas	21.262160000000002	-88.528732000000005	6	1
585	0453	San Dayan	21.241592000000001	-88.821085999999994	6	1
586	0454	San Diego	21.169298999999999	-88.677638000000002	6	1
587	0455	San Felipe	21.255566999999999	-88.516255000000001	6	1
588	0456	El Potrillo	21.19577	-88.730292000000006	6	1
589	0457	San Isidro	21.263145999999999	-88.728160000000003	6	1
590	0458	San Manuel	21.179677000000002	-88.679226999999997	6	1
591	0459	Santa Rosa	21.254687000000001	-88.646372	6	1
592	0460	Los Tres Hermanos	21.193078	-88.785447000000005	6	1
593	0461	Zapata	21.262587	-88.636915000000002	6	1
594	0462	San Gregorio	21.296271000000001	-88.558383000000006	6	1
595	0463	San Felipe [Anexa]	21.244202000000001	-88.533199999999994	6	1
596	0464	San Pedro Buenavista [Anexa]	21.197119000000001	-88.665132999999997	6	1
597	0465	Casa Rosada	21.249424000000001	-88.549137000000002	6	1
598	0466	Chen Taller	21.237434	-88.545463999999996	6	1
599	0467	Rancho San Juan Dos	21.175753	-88.621486000000004	6	1
600	0468	Tilapia [Granja]	21.188846000000002	-88.658866000000003	6	1
601	0469	San Carlos	21.242868000000001	-88.534204000000003	6	1
602	0470	San Francisco	21.123756	-88.652350999999996	6	1
603	0471	San José	21.240064	-88.543818000000002	6	1
604	0472	San Manuel	21.224542	-88.561256	6	1
605	0473	San Vicente	21.219642	-88.557513	6	1
606	0474	Santa Margarita	21.176953999999999	-88.512964999999994	6	1
607	0475	El Crucero [Taquería]	21.190543000000002	-88.673980999999998	6	1
608	0476	X-Limón Há	21.181235999999998	-88.638116999999994	6	1
609	0477	El Pobre	21.237656999999999	-88.515174000000002	6	1
610	0478	El Palacio	21.232275000000001	-88.504064999999997	6	1
611	0479	La Curva	21.15936	-88.609792999999996	6	1
612	0480	Santa Rosa	21.238458000000001	-88.554231999999999	6	1
613	0481	San Juan	21.236191000000002	-88.516983999999994	6	1
614	0482	Santa Manuela	21.236471000000002	-88.511189999999999	6	1
615	0483	Xluch	21.251671000000002	-88.555577	6	1
616	0484	San Vicente [Anexa]	21.273948000000001	-88.640293	6	1
617	0485	La Ubre	21.190677999999998	-88.700372000000002	6	1
618	0486	San Diego	21.192551999999999	-88.694515999999993	6	1
619	0487	San Carlos	21.190539999999999	-88.695470999999998	6	1
620	0488	San Sebastián	21.22503	-88.765219999999999	6	1
621	0489	San Vicente	21.279216999999999	-88.653780999999995	6	1
622	0490	Santa Fe	21.227098000000002	-88.765637999999996	6	1
623	0491	San Diego	21.194589000000001	-88.730069999999998	6	1
624	0492	Actún	21.251269000000001	-88.593182999999996	6	1
625	0493	Los Almendros	21.193936999999998	-88.701338000000007	6	1
626	0494	Chumpilá	21.269507000000001	-88.707976000000002	6	1
627	0495	Huene	21.195333000000002	-88.698808	6	1
628	0496	El Girasol	21.253540999999998	-88.717893000000004	6	1
629	0497	La Peña	21.268789000000002	-88.616269000000003	6	1
630	0498	Santa María	21.262855999999999	-88.624711000000005	6	1
2321	0086	Jesús	21.091944999999999	-88.403182000000001	32	1
631	0499	No Ho Lum	21.192340999999999	-88.718664000000004	6	1
632	0500	La Loma	21.257117000000001	-88.712783000000002	6	1
633	0501	San Antonio	21.186216000000002	-88.559961000000001	6	1
634	0502	San Eduardo	21.123479	-88.695903999999999	6	1
635	0503	Santa Ana	21.320160000000001	-88.564313999999996	6	1
636	0504	Santa Antonia	21.121099000000001	-88.725481000000002	6	1
637	0505	Sisbik	21.128779000000002	-88.700733999999997	6	1
638	0506	Ixim Ha	21.233661000000001	-88.646901	6	1
639	0507	Tunich Ché	21.186969000000001	-88.776009000000002	6	1
640	0508	El Chino [Vivero]	21.192630000000001	-88.786060000000006	6	1
641	0509	Xkuxu Ha	21.265491000000001	-88.711779000000007	6	1
642	0510	Humberto Medrano	21.252261000000001	-88.606866999999994	6	1
643	0511	Yokdzonot	21.233917000000002	-88.771777999999998	6	1
644	0001	Cacalchén	20.983098999999999	-89.228179999999995	7	1
645	0003	Sahcabá	21.004266999999999	-89.221700999999996	7	1
646	0006	San Pedro Dzulá	20.972843000000001	-89.218036999999995	7	1
647	0009	San José Cholul	21.010048000000001	-89.290532999999996	7	1
648	0010	San José	20.98507	-89.244960000000006	7	1
649	0012	San Antonio Puhá	20.944503000000001	-89.218298000000004	7	1
650	0013	San José	20.986284000000001	-89.248676000000003	7	1
651	0015	Santa Rita	21.013427	-89.235856999999996	7	1
652	0017	Santa Ana	20.989433999999999	-89.210474000000005	7	1
653	0019	San Felipe	20.995453000000001	-89.230390999999997	7	1
654	0023	Chech Mela	21.020001000000001	-89.244799999999998	7	1
655	0029	San José	21.008600999999999	-89.254588999999996	7	1
656	0033	Tixkopoil	21.004303	-89.254492999999997	7	1
657	0035	San Manuel Catzín	20.999282999999998	-89.233395999999999	7	1
658	0041	Sigfrido Ramírez	21.008006999999999	-89.240078999999994	7	1
659	0042	Sabacché	21.010013000000001	-89.243879000000007	7	1
660	0048	Candelaria	20.971391000000001	-89.239256999999995	7	1
661	0050	San Damián	20.986803999999999	-89.268467999999999	7	1
662	0051	San Francisco	20.977022000000002	-89.235797000000005	7	1
663	0054	Kanku	20.964732000000001	-89.244626999999994	7	1
664	0056	Macachí	20.948160000000001	-89.247113999999996	7	1
665	0058	Dzoyolá	20.966638	-89.259578000000005	7	1
666	0059	San Antonio Puhá	20.957042000000001	-89.216195999999997	7	1
667	0060	San Pablo	21.006810999999999	-89.238955000000004	7	1
668	0062	San Miguel	20.988980000000002	-89.261239000000003	7	1
669	0063	Santa Fe	21.006148	-89.237729999999999	7	1
670	0064	Santa Isabel	20.971298000000001	-89.231860999999995	7	1
671	0065	Sigfrido	20.996020999999999	-89.230994999999993	7	1
672	0066	Ninguno	21.012319999999999	-89.242638999999997	7	1
673	0067	Ninguno	20.970758	-89.247094000000004	7	1
674	0070	Eunice Espadas Canché	20.987544	-89.216391000000002	7	1
675	0071	San Román	20.988495	-89.243618999999995	7	1
676	0072	San Francisco [Rancho]	20.967502	-89.235775000000004	7	1
677	0073	Kulinché	20.978674000000002	-89.244808000000006	7	1
678	0074	El Nance	20.979839999999999	-89.215598	7	1
679	0075	Onil	20.984378	-89.242599999999996	7	1
680	0076	El Crucifijo [Rancho]	20.935414000000002	-89.218368999999996	7	1
681	0077	Santa Isabel	20.973510999999998	-89.230644999999996	7	1
682	0079	Sitpach	20.985588	-89.236530999999999	7	1
683	0080	La Candelaria	20.978826000000002	-89.247743	7	1
684	0081	Cacalchén [Caseta de Policía]	20.984618999999999	-89.239361000000002	7	1
685	0082	COBAY [Plantel Cacalchén]	20.996614000000001	-89.230474000000001	7	1
686	0083	Cruz Verde	21.024056999999999	-89.248676000000003	7	1
687	0084	Dzoyolá	21.023748999999999	-89.250770000000003	7	1
688	0085	María Maricela Yam Pool	20.995753000000001	-89.230513000000002	7	1
689	0086	Carlos Santos López	20.996987000000001	-89.231699000000006	7	1
690	0087	Don Mézquita	21.013598999999999	-89.243588000000003	7	1
691	0088	Ángel Santos Vergara	20.984687000000001	-89.239154999999997	7	1
692	0091	Mi Querido Viejo	20.986613999999999	-89.247817999999995	7	1
693	0092	La Unión [Rancho]	20.989076000000001	-89.240915999999999	7	1
694	0093	San Felipe	20.984701999999999	-89.246348999999995	7	1
695	0094	San Miguel	20.984970000000001	-89.241934000000001	7	1
696	0095	Santa Elena	21.025165000000001	-89.249554000000003	7	1
697	0001	Calotmul	21.019289000000001	-88.177046000000004	8	1
698	0003	Ceh Puch	21.006036000000002	-88.178978999999998	8	1
699	0006	Pocoboch	20.973711999999999	-88.116020000000006	8	1
700	0008	San Isidro	21.054392	-88.162222999999997	8	1
701	0010	San Francisco (Santa Cruz)	21.013525999999999	-88.163449	8	1
702	0011	La Ceiba	21.007756000000001	-88.197799000000003	8	1
703	0013	Tahcabo	21.055993999999998	-88.081777000000002	8	1
704	0014	Tres A	21.028416	-88.137898000000007	8	1
705	0015	Tzalam	20.978556000000001	-88.169793999999996	8	1
706	0017	Yokdzonot Meneses	21.012273	-88.052666000000002	8	1
707	0018	Piedras Negras	20.978641	-88.121358999999998	8	1
708	0023	Chuytab	21.080693	-88.171015999999995	8	1
709	0024	Tuzik	20.989258	-88.142594000000003	8	1
710	0027	Komichén	21.034869	-88.152550000000005	8	1
711	0029	Buenavista	21.045656000000001	-88.116744999999995	8	1
712	0030	Yohdzonot Mascabicú	21.013718999999998	-88.228826999999995	8	1
713	0033	La Ponderosa	21.017112000000001	-88.190826000000001	8	1
714	0034	California	20.992417	-88.174695999999997	8	1
715	0036	San José	20.946715999999999	-88.117254000000003	8	1
716	0037	San Miguel	21.042777999999998	-88.066275000000005	8	1
717	0040	San Fernando Tepich	20.977149000000001	-88.197295999999994	8	1
718	0044	Xnoh On	21.026049	-88.053607999999997	8	1
719	0048	Xceh	21.071353999999999	-88.158642	8	1
720	0050	Santa Rosalía	20.998942	-88.160808000000003	8	1
721	0051	San Agustín	20.995253999999999	-88.111806999999999	8	1
722	0052	Yoh-Nicté	20.982468000000001	-88.109393999999995	8	1
723	0053	Santa Michelle	21.079879999999999	-88.160838999999996	8	1
724	0055	San Pedro	20.992151	-88.105315000000004	8	1
725	0056	Calotmul	21.024045000000001	-88.186304000000007	8	1
726	0057	Chechén	20.977287	-88.184956	8	1
727	0058	San Antonio	20.984679	-88.158331000000004	8	1
728	0059	San Jorge	21.063609	-88.176429999999996	8	1
729	0060	San José	20.990971999999999	-88.142730999999998	8	1
730	0061	Tres Reyes	20.965243000000001	-88.188122000000007	8	1
731	0062	Pujilá	20.975911	-88.149655999999993	8	1
732	0063	Chan Santa Cruz	20.998266999999998	-88.224868000000001	8	1
733	0064	Chan Sucilá	21.013874000000001	-88.084946000000002	8	1
734	0065	Galilea	21.044754999999999	-88.005695000000003	8	1
735	0066	La Guadalupana	21.019784999999999	-88.213317000000004	8	1
737	0068	Kan-Chalún	21.049434999999999	-88.120560999999995	8	1
738	0069	Kankabdzonot	21.016582	-88.032869000000005	8	1
739	0070	Nabulá	21.027498000000001	-88.085656999999998	8	1
740	0071	San Antonio	21.01482	-88.040463000000003	8	1
741	0072	El Coral	21.062940999999999	-88.179749000000001	8	1
742	0073	San Antonio Yohdzonot	21.039823999999999	-88.188210999999995	8	1
743	0074	San Felipe	21.066210999999999	-88.184155000000004	8	1
744	0075	Santa Elena	21.002967999999999	-88.197039000000004	8	1
745	0076	Santa Clara	21.019069999999999	-88.115530000000007	8	1
746	0077	San Rafael	21.050836	-88.117220000000003	8	1
747	0078	San Isidro [Anexa]	21.033581000000002	-88.160447000000005	8	1
748	0080	Chaac	21.006133999999999	-88.132092	8	1
749	0081	Tikindzonot	21.047277000000001	-88.014348999999996	8	1
750	0082	Tuhdzonot	21.055555999999999	-88.105556000000007	8	1
751	0083	Xchay	21.034960000000002	-88.044297	8	1
752	0084	Xkoh	21.059443000000002	-88.184392000000003	8	1
753	0086	Uxpib Número Dos	21.042468	-88.008814999999998	8	1
754	0088	San Pablo del Pedregal	21.022286999999999	-88.019416000000007	8	1
755	0089	Yohdzadz	21.070758000000001	-88.111789999999999	8	1
756	0090	Yohdzadz	21.039469	-88.025306	8	1
757	0091	Sak Akal (Laguna Blanca)	21.023978	-88.203996000000004	8	1
758	0092	Calotmul Dos	21.025693	-88.187808000000004	8	1
759	0093	Chen L	21.080463000000002	-88.159952000000004	8	1
760	0095	La Gran Lucha	21.054873000000001	-88.168959000000001	8	1
761	0097	Los Laureles	21.023631999999999	-88.067064000000002	8	1
762	0098	Las Palmas	21.018228000000001	-88.024950000000004	8	1
763	0099	Mavira [Rancho]	20.982787999999999	-88.177667999999997	8	1
764	0100	Smith [Rancho]	21.036591999999999	-88.127988999999999	8	1
765	0101	San Antonio Yohdzonot	21.015086	-88.040830999999997	8	1
766	0102	San Carlos	21.028873999999998	-88.061589999999995	8	1
767	0103	San Isidro	21.065811	-88.165130000000005	8	1
768	0105	San José	21.016825999999998	-88.030548999999993	8	1
769	0106	San Martín	20.994776000000002	-88.224472000000006	8	1
770	0107	San Ángel	21.026667	-88.124722000000006	8	1
771	0108	Santa Rosa	20.987613	-88.105642000000003	8	1
772	0110	Xhuech	21.054174	-88.166809000000001	8	1
773	0111	Yokdzonot Dos	21.015851000000001	-88.032908000000006	8	1
774	0112	Héctor González	21.028417000000001	-88.114417000000003	8	1
775	0113	San Pedro	21.030546999999999	-88.121174999999994	8	1
776	0001	Cansahcab	21.158103000000001	-89.102340999999996	9	1
777	0002	Kancabchén	21.117488000000002	-89.085448	9	1
778	0003	San Antonio Xiat	21.130500999999999	-89.160818000000006	9	1
779	0004	Santa María	21.150414999999999	-89.071934999999996	9	1
780	0005	San Mateo	21.141324000000001	-89.073964000000004	9	1
781	0006	Sahcatzín	21.205314999999999	-89.114784	9	1
782	0007	Chacanmutul	21.177392999999999	-89.085763	9	1
783	0008	Chac Xul	21.169612999999998	-89.055847999999997	9	1
784	0010	Ekuney	21.171431999999999	-89.106042000000002	9	1
785	0013	Kanisté	21.212678	-89.077010999999999	9	1
786	0015	Kinchacam	21.203787999999999	-89.079818000000003	9	1
787	0016	Kindzib	21.196470999999999	-89.083341000000004	9	1
788	0017	Kuichén de las Flores	21.156642000000002	-89.075338000000002	9	1
789	0022	San Francisco	21.182189000000001	-89.133370999999997	9	1
790	0023	San José	21.179621999999998	-89.122011999999998	9	1
791	0027	Santa Rosa	21.145966000000001	-89.124114000000006	9	1
792	0028	Santa Teresa	21.178229999999999	-89.113622000000007	9	1
793	0029	Tepich	21.189779000000001	-89.110566000000006	9	1
794	0030	Texán	21.156188	-89.080333999999993	9	1
795	0032	Tzuc Tzalam	21.185731000000001	-89.00067	9	1
796	0034	San Antonio	21.195453000000001	-89.071608999999995	9	1
797	0037	San Antonio	21.155038999999999	-89.041946999999993	9	1
798	0039	San Juan	21.207317	-89.069771000000003	9	1
799	0040	Ninguno	21.121312	-89.125705999999994	9	1
800	0042	San Antonio	21.167211999999999	-89.113090999999997	9	1
801	0043	San Antonio Chince	21.135748	-89.096303000000006	9	1
802	0045	Venustiano Carranza	21.155971000000001	-89.058064999999999	9	1
803	0058	San Ramón	21.156139	-89.062365	9	1
804	0059	Santa Belina	21.153699	-89.052954999999997	9	1
805	0060	Santa Rita	21.167425000000001	-89.099376000000007	9	1
806	0061	Chalé	21.156424000000001	-89.070678999999998	9	1
807	0062	El Hangar del Halcón	21.159858	-89.092574999999997	9	1
808	0063	San Antonio	21.130555999999999	-89.120396999999997	9	1
809	0064	San Luis	21.175896000000002	-89.094494999999995	9	1
810	0001	Cantamayec	20.470555999999998	-89.080944000000002	10	1
811	0004	Cruz Yah	20.365506	-88.961890999999994	10	1
812	0005	Chacanteil	20.512692000000001	-89.050438	10	1
813	0006	Chacmultún	20.370087000000002	-89.001997000000003	10	1
814	0010	Chichicab	20.410025999999998	-89.077077000000003	10	1
815	0011	Chimay	20.499744	-89.055037999999996	10	1
816	0012	Cholul	20.442622	-89.154460999999998	10	1
817	0013	Dzidzilché	20.490680000000001	-89.060739999999996	10	1
818	0016	Husumal	20.493991999999999	-89.130927999999997	10	1
819	0017	Jesús María	20.461206000000001	-89.098708000000002	10	1
820	0018	Huntochac	20.361654000000001	-89.053202999999996	10	1
821	0019	Kankabchén	20.361719000000001	-88.991866999999999	10	1
822	0020	Kulkaba [Granja]	20.409790000000001	-88.984217999999998	10	1
823	0023	Nenelá	20.349726	-89.020437000000001	10	1
824	0027	San Martín	20.412220000000001	-89.058717999999999	10	1
825	0028	San Pablo Holcá	20.394378	-89.065100999999999	10	1
826	0030	Tixcacal Pérez	20.512751999999999	-89.102654000000001	10	1
827	0033	San Juan Chuc	20.349032000000001	-88.975268999999997	10	1
828	0034	Sambulá	20.464024999999999	-89.051371000000003	10	1
829	0035	Tzutzil	20.458729999999999	-89.033118000000002	10	1
830	0036	Yaxché	20.389790000000001	-89.006196000000003	10	1
831	0038	San Antonio Cal-Ulmi	20.377448999999999	-89.070901000000006	10	1
832	0039	Tab-Ek	20.451618	-89.142921999999999	10	1
833	0041	Santa Cruz	20.408905000000001	-89.130398999999997	10	1
834	0043	Xauchel	20.410651999999999	-89.160223999999999	10	1
835	0049	Kocholá	20.455808000000001	-89.081286000000006	10	1
836	0052	Chan Chuchub	20.357707000000001	-89.075854000000007	10	1
837	0053	Dolores	20.447793000000001	-89.142039999999994	10	1
838	0054	Sahcadzonot	20.517880999999999	-89.057096999999999	10	1
839	0055	Huan-Ká	20.423939000000001	-89.140097999999995	10	1
840	0056	San Francisco Hu-Kal	20.455863999999998	-89.172257999999999	10	1
841	0057	Huntulchac	20.335471999999999	-88.995689999999996	10	1
842	0059	La Luz	20.462015000000001	-89.123168000000007	10	1
843	0060	Polkeil	20.330223	-88.973061999999999	10	1
844	0063	San Isidro	20.462902	-89.120041000000001	10	1
845	0064	San Juan	20.401078999999999	-89.016188999999997	10	1
846	0065	San José Tzab	20.451623000000001	-89.000162000000003	10	1
847	0066	San Martín	20.476071000000001	-89.071758000000003	10	1
848	0067	San Pedro	20.405187000000002	-89.026608999999993	10	1
849	0068	San Pedro Hu-Kal	20.455855	-89.177515	10	1
850	0071	Sinitún	20.386015	-89.070909	10	1
851	0072	Subiná	20.465882000000001	-89.157092000000006	10	1
852	0073	Tixcacal Dzonot	20.482558000000001	-89.023776999999995	10	1
853	0074	Xnicteil	20.492795999999998	-89.089805999999996	10	1
854	0076	San Miguel Yokdzonot	20.376840000000001	-88.993950999999996	10	1
855	0077	Yuyumal	20.525207999999999	-89.052767000000003	10	1
856	0081	Santa Trinidad	20.446639000000001	-89.152799999999999	10	1
857	0082	San Miguel	20.411968999999999	-89.152214000000001	10	1
858	0083	Chac-Dzan	20.427883000000001	-89.022889000000006	10	1
859	0085	Santa Catalina	20.339848	-89.023837	10	1
860	0086	Campi [Granja]	20.431944000000001	-89.166916999999998	10	1
861	0088	San Antonio	20.478234	-89.097780999999998	10	1
862	0089	Santa Elena	20.395361999999999	-89.044753	10	1
863	0090	Samaria	20.403789	-89.047736999999998	10	1
864	0091	Kankabchén	20.507926000000001	-89.062758000000002	10	1
865	0092	San Esteban	20.409162999999999	-89.135694000000001	10	1
866	0095	San Antonio	20.471139999999998	-89.087181000000001	10	1
867	0106	San Ignacio	20.464728999999998	-89.074772999999993	10	1
868	0001	Celestún	20.860092000000002	-90.399463999999995	11	1
869	0002	Chac Canché	21.050961000000001	-90.272104999999996	11	1
870	0003	Punta Palmar	21.050083000000001	-90.273533999999998	11	1
871	0007	Santa Cruz Xixim	20.932842999999998	-90.374868000000006	11	1
872	0008	Poltzimín	20.880960000000002	-90.391374999999996	11	1
873	0009	La Victoria	20.991547000000001	-90.346710999999999	11	1
874	0020	La Asunción	20.788561000000001	-90.200677999999996	11	1
875	0021	El Corcho	20.855426000000001	-90.240942000000004	11	1
876	0022	Indio	20.854351999999999	-90.265726000000001	11	1
877	0023	Chiabal	20.831700000000001	-90.191992999999997	11	1
878	0024	Chichitos	21.049402000000001	-90.275000000000006	11	1
879	0025	Los Hermanos	20.856186000000001	-90.222521	11	1
880	0032	Santa María	20.855989000000001	-90.233913999999999	11	1
881	0033	Sinkehuel	20.765357999999999	-90.206388000000004	11	1
882	0034	San Carlos	21.039594999999998	-90.291016999999997	11	1
883	0043	Poolnuxi	21.047826000000001	-90.277306999999993	11	1
884	0044	Santa Isabel	20.858332999999998	-90.215024	11	1
885	0045	Trian	21.048580999999999	-90.275865999999994	11	1
886	0046	Santa Julia	20.813715999999999	-90.197371000000004	11	1
887	0047	San Antonio	20.854492	-90.249943999999999	11	1
888	0052	La Dueña	20.874907	-90.392650000000003	11	1
889	0053	Xenu Chez Nous	20.880513000000001	-90.391598000000002	11	1
890	0055	Casa del Mexicano	20.876054	-90.393056999999999	11	1
891	0057	Casa de la Luna	20.875710999999999	-90.393172000000007	11	1
892	0059	Flamingos	20.882622999999999	-90.390649999999994	11	1
893	0061	Perlita Tampico	20.87762	-90.392506999999995	11	1
894	0062	El Tigre	20.828841000000001	-90.195577	11	1
895	0064	Au Soleil Couchant	20.896128000000001	-90.387005000000002	11	1
896	0065	Eco Paraíso	20.943839000000001	-90.371071999999998	11	1
897	0066	La Paloma	20.857016999999999	-90.234227000000004	11	1
898	0067	Celestún [Reserva de Camarón]	20.824349000000002	-90.195363	11	1
899	0068	Ninguno [Laboratorio de Camarón]	20.880486999999999	-90.389257000000001	11	1
900	0069	Soledad	20.857877999999999	-90.231346000000002	11	1
901	0070	Playa Maya	20.924132	-90.377914000000004	11	1
902	0071	Santa Rosa	20.856824	-90.255841000000004	11	1
903	0072	Buena Vida	20.878285000000002	-90.392465000000001	11	1
904	0076	Alborada	20.854932000000002	-90.261780999999999	11	1
905	0080	Monte Sol	20.855550000000001	-90.246233000000004	11	1
906	0081	San Ramón	21.016535999999999	-90.325948999999994	11	1
907	0001	Cenotillo	20.965772000000001	-88.604420000000005	12	1
908	0003	Chun-Ox	21.068189	-88.642773000000005	12	1
909	0009	Tixbacab	21.094657000000002	-88.513596000000007	12	1
910	0012	Haydzonot	21.031628999999999	-88.665751999999998	12	1
911	0013	X-Lobos	21.045095	-88.644101000000006	12	1
912	0015	Reforma Agraria	21.077421000000001	-88.537008	12	1
913	0020	Chen Kekén	21.032209000000002	-88.592608999999996	12	1
914	0021	Tuciná	21.041004000000001	-88.568996999999996	12	1
915	0026	Xcunyá	21.042366999999999	-88.711399	12	1
916	0030	Bahdzonot	21.162351000000001	-88.528452000000001	12	1
917	0033	San Silvestre	21.018697	-88.677930000000003	12	1
918	0036	Chen Delgado	21.134671999999998	-88.597830999999999	12	1
919	0041	San Antonio X-Nuc	21.017182999999999	-88.529568999999995	12	1
920	0043	Ebtún	20.958651	-88.644360000000006	12	1
921	0046	La Herradura	21.035176	-88.544752000000003	12	1
922	0052	X-Noc Ac	20.985721000000002	-88.510479000000004	12	1
923	0054	Noczal	21.085418000000001	-88.629238999999998	12	1
924	0055	Las Palomas	21.065930999999999	-88.551186000000001	12	1
925	0066	San Hipólito	21.153652999999998	-88.520630999999995	12	1
926	0067	San Ignacio	21.074812999999999	-88.590486999999996	12	1
927	0069	San Juan	21.067041	-88.577303000000001	12	1
928	0071	San Judas Tadeo	21.002503000000001	-88.486750000000001	12	1
929	0074	San Miguel	21.093111	-88.563300999999996	12	1
930	0077	San Román	21.104420000000001	-88.561345000000003	12	1
931	0078	Santa Cruz	21.102367000000001	-88.606069000000005	12	1
932	0079	Santa Elena	21.167475	-88.532843	12	1
933	0082	Santa María	21.177859000000002	-88.538657000000001	12	1
934	0083	Santa Pilar	21.129192	-88.555442999999997	12	1
935	0085	Santa Rosa	21.062621	-88.505519000000007	12	1
936	0087	Texas	21.016722999999999	-88.582963000000007	12	1
937	0089	Unión	20.974585000000001	-88.629672999999997	12	1
938	0091	X-Huul	21.005243	-88.589393999999999	12	1
939	0095	X-Takay	21.130320000000001	-88.505798999999996	12	1
940	0099	Texas el Grande	21.061195999999999	-88.565438	12	1
941	0100	Yokdzaz	20.980124	-88.617277000000001	12	1
942	0103	San José Yunchén	21.099858000000001	-88.541707000000002	12	1
943	0105	Chacanhú	21.064273	-88.606544	12	1
944	0109	San Marcos	21.084520999999999	-88.602995000000007	12	1
945	0110	Santa Rita	21.127756999999999	-88.518900000000002	12	1
946	0114	Santa Clara	20.984985000000002	-88.650056000000006	12	1
947	0116	Rancho Pobre	21.049579000000001	-88.600416999999993	12	1
948	0120	Santa Fe	21.099459	-88.628883999999999	12	1
949	0122	San Andrés	20.989512999999999	-88.675167000000002	12	1
950	0123	San Pedro Pacbihool	21.003212999999999	-88.703329999999994	12	1
951	0124	Pakchén	21.018789999999999	-88.684679000000003	12	1
952	0127	Yunchen Número Uno	21.115275	-88.537934000000007	12	1
953	0129	Las Yeguas	21.115434	-88.579109000000003	12	1
954	0130	Kax-Ek	21.109978999999999	-88.633016999999995	12	1
955	0131	X-Arcos Chen	21.052834000000001	-88.591663999999994	12	1
956	0133	Yohdzonot Número Dos	21.026572999999999	-88.702038000000002	12	1
957	0135	Cenotillo	21.132702999999999	-88.568787999999998	12	1
958	0136	Chen Delgado Número Dos	21.146844999999999	-88.603601999999995	12	1
959	0137	Arizona	21.008051999999999	-88.584856000000002	12	1
960	0138	X-Ayín Número Uno	20.955555	-88.630917999999994	12	1
961	0140	Candelaria	21.140812	-88.578038000000006	12	1
962	0141	Canoas	21.049424999999999	-88.678077999999999	12	1
963	0142	Kimis	21.019306	-88.607310999999996	12	1
964	0143	La Mariposa	21.013475	-88.621869000000004	12	1
965	0144	Pozo Azul	21.046673999999999	-88.601551999999998	12	1
966	0145	San Alfredo	21.151465999999999	-88.577094000000002	12	1
967	0146	San Antonio	21.155564999999999	-88.526301000000004	12	1
968	0147	San Felipe	21.175414	-88.559175999999994	12	1
969	0148	X-Noc Ac	21.170486	-88.538096999999993	12	1
970	0149	San Isidro	21.117857000000001	-88.555749000000006	12	1
971	0150	San Manuel	21.152508999999998	-88.596210999999997	12	1
972	0151	San Marcos	21.039732000000001	-88.699539000000001	12	1
973	0152	San Marcos	21.143242999999998	-88.561628999999996	12	1
974	0154	Santa Ana	21.036671999999999	-88.685828999999998	12	1
975	0155	El Trébol	21.176162999999999	-88.532771999999994	12	1
976	0156	K'anto [Unidad Agrícola]	20.953063	-88.650908000000001	12	1
977	0157	Villa Flor	21.068313	-88.485319000000004	12	1
978	0158	X-Ayinchén	21.15099	-88.589331000000001	12	1
979	0159	El Cielo	21.182179999999999	-88.544593000000006	12	1
980	0160	Santa Rosa	21.155726999999999	-88.532711000000006	12	1
981	0162	Ninguno	20.957695999999999	-88.600063000000006	12	1
982	0164	San Antonio	21.089745000000001	-88.522384000000002	12	1
983	0165	Santa Elena	21.083677000000002	-88.530660999999995	12	1
984	0166	San Felipe	21.151458999999999	-88.536186999999998	12	1
985	0167	Taan Mul	21.154160999999998	-88.551582999999994	12	1
986	0168	Santa Rosa de Lima	21.067053000000001	-88.547092000000006	12	1
987	0169	Los Almendros	20.982538999999999	-88.600442999999999	12	1
988	0170	La Rejollada	21.004311000000001	-88.587720000000004	12	1
989	0172	Los Ángeles	21.020765999999998	-88.601068999999995	12	1
990	0174	Las Garrapatas	21.088203	-88.519013000000001	12	1
991	0175	Los Laureles	21.039940999999999	-88.590970999999996	12	1
992	0176	Lindero	21.049841000000001	-88.572884999999999	12	1
993	0177	Ninguno	21.129911	-88.587723999999994	12	1
994	0178	X-Chail	21.084942999999999	-88.580034999999995	12	1
995	0179	Actunchén	21.086185	-88.522927999999993	12	1
996	0180	Santa Rita	21.099174000000001	-88.506416999999999	12	1
997	0181	San Alí	21.100109	-88.502492000000004	12	1
998	0182	Kakalhá	21.079816000000001	-88.548241000000004	12	1
999	0183	San Félix Medina	21.051565	-88.562655000000007	12	1
1000	0184	San Francisco	21.062733000000001	-88.623123000000007	12	1
1001	0186	San José	21.091144	-88.528330999999994	12	1
1002	0187	San Luis	20.999226	-88.595093000000006	12	1
1003	0188	Santa Carmen	21.015699999999999	-88.626335999999995	12	1
1004	0189	Santa Clara	20.991389000000002	-88.593333000000001	12	1
1005	0190	Santa Clarita	21.015941000000002	-88.618769	12	1
1006	0191	Santa Fe	21.001481999999999	-88.587721000000002	12	1
1007	0192	El Cerrito	20.991907000000001	-88.596159	12	1
1008	0193	Villahermosa	20.979142	-88.600738000000007	12	1
1009	0194	Xkanhá	21.141673999999998	-88.526358999999999	12	1
1010	0195	Yomac	20.966733000000001	-88.642550999999997	12	1
1011	0196	Bernardino Canul	20.959651000000001	-88.611315000000005	12	1
1012	0001	Conkal	21.073893999999999	-89.521283999999994	13	1
1013	0002	Kantoyna	21.110748000000001	-89.523545999999996	13	1
1014	0003	San Antonio Holactún	21.081199000000002	-89.496504000000002	13	1
1015	0004	San Diego Cutz	21.095541000000001	-89.545147999999998	13	1
1016	0005	Santa María Rosas	21.0778	-89.535505000000001	13	1
1017	0006	X-Cuyum	21.050948999999999	-89.495636000000005	13	1
1018	0009	Xkantún	21.06345	-89.536248000000001	13	1
1019	0010	Santo Domingo Kumán	21.079854999999998	-89.460606999999996	13	1
1020	0012	San Lorenzo	21.092144999999999	-89.507776000000007	13	1
1021	0016	Águilas del Sureste	21.080593	-89.557884999999999	13	1
1022	0017	San Carlos Ramayo	21.080715999999999	-89.545713000000006	13	1
1023	0021	La Guadalupana	21.104061000000002	-89.518818999999993	13	1
1024	0022	Ramayo Dos	21.091308999999999	-89.519919000000002	13	1
1025	0023	Santa Isabel	21.089922999999999	-89.519912000000005	13	1
1026	0025	Country Club	21.081793999999999	-89.542287000000002	13	1
1027	0028	San Diego Cutz Dos	21.087803000000001	-89.556997999999993	13	1
1028	0029	Pastores	21.109196000000001	-89.518790999999993	13	1
1029	0030	Pet-Kanché	21.116741999999999	-89.513266000000002	13	1
1030	0031	San Alberto	21.057966	-89.521349000000001	13	1
1031	0032	Santa Úrsula	21.088032999999999	-89.520106999999996	13	1
1032	0033	Matamoros	21.055765999999998	-89.532233000000005	13	1
1033	0034	Pet-Kanchén	21.112704999999998	-89.517097000000007	13	1
1034	0035	Las Palomas	21.110887999999999	-89.516654000000003	13	1
1035	0038	Santa Cruz de Ébano	21.053611	-89.534443999999993	13	1
1036	0039	Conkal [Vivero]	21.085836	-89.519925000000001	13	1
1037	0041	Conkal [Asociación Ganadera]	21.081506999999998	-89.498123000000007	13	1
1038	0043	Los Compadres	21.054264	-89.525085000000004	13	1
1039	0044	El Huero [Deshuesadero]	21.100911	-89.518933000000004	13	1
1040	0045	Dos Arbolitos	21.056415999999999	-89.526020000000003	13	1
1041	0046	Maximiliano de Jesús Magaña González	21.056075	-89.525300999999999	13	1
1042	0054	Ninguno	21.081285999999999	-89.542465000000007	13	1
1043	0055	Ninguno	21.101889	-89.518441999999993	13	1
1044	0056	Ninguno	21.089176999999999	-89.520230999999995	13	1
1045	0057	Ninguno	21.089521000000001	-89.51934	13	1
1046	0058	Las Jaras	21.060977999999999	-89.506443000000004	13	1
1047	0059	El Ruedo	21.062275	-89.504140000000007	13	1
1048	0060	Instituto Tecnológico de Conkal	21.079014000000001	-89.499674999999996	13	1
1049	0061	Instituto Tecnológico Agropecuario Dos	21.080538000000001	-89.537193000000002	13	1
1050	0062	Los Nopales	21.051501999999999	-89.535589999999999	13	1
1051	0064	Manuel Reyes Zaldívar [Lienzo Charro]	21.053373000000001	-89.527393000000004	13	1
1052	0065	El Eden [Quinta]	21.054967999999999	-89.521281999999999	13	1
1054	0069	El Roble	21.104816	-89.518079	13	1
1055	0070	Romi	21.067094999999998	-89.533709000000002	13	1
1056	0071	Rubí Guadalupe	21.093824999999999	-89.519469000000001	13	1
1057	0072	San Francisco	21.100285	-89.518990000000002	13	1
1058	0073	La Aurora	21.118859	-89.512840999999995	13	1
1059	0075	San Juan	21.088066999999999	-89.516035000000002	13	1
1060	0076	San Pastor	21.109933000000002	-89.519655999999998	13	1
1061	0077	San Rafael	21.056386	-89.531471999999994	13	1
1062	0078	San Rafael	21.058834000000001	-89.512641000000002	13	1
1063	0081	La Triple Z	21.052932999999999	-89.526579999999996	13	1
1064	0082	Unión	21.055855000000001	-89.520178999999999	13	1
1065	0083	Valdez	21.051646999999999	-89.530383999999998	13	1
1066	0084	Viridiana	21.081817000000001	-89.497500000000002	13	1
1067	0085	Tekat [Granja Avícola]	21.091564000000002	-89.470946999999995	13	1
1068	0087	Hermanos Aguilar Góngora	21.054590999999999	-89.528352999999996	13	1
1069	0088	Ixchel	21.061516000000001	-89.508145999999996	13	1
1070	0089	Santa Cecilia	21.090933	-89.464535999999995	13	1
1071	0090	José Torres	21.114408999999998	-89.510554999999997	13	1
1072	0091	El Roble	21.115684999999999	-89.510745999999997	13	1
1073	0092	El Reto	21.090541000000002	-89.466491000000005	13	1
1074	0093	San Agustín	21.050228000000001	-89.520515000000003	13	1
1075	0094	Canul Dos	21.091063999999999	-89.471714000000006	13	1
1076	0095	Canul Uno	21.089393999999999	-89.472111999999996	13	1
1077	0098	Dos Potrillos	21.108865999999999	-89.526205000000004	13	1
1078	0099	El Polvorín	21.092855	-89.476215999999994	13	1
1079	0100	Estefanía	21.076501	-89.466485000000006	13	1
1080	0101	Ebenezer	21.104980000000001	-89.525036	13	1
1081	0102	Dilio	21.091441	-89.484198000000006	13	1
1082	0103	Isaac Dos	21.093817999999999	-89.512483000000003	13	1
1083	0104	Isaac Tres	21.091857000000001	-89.513175000000004	13	1
1084	0105	Isaac Uno	21.095344000000001	-89.511339000000007	13	1
1085	0106	Santa Inés	21.078886000000001	-89.543239	13	1
1086	0107	Cristo Rey	21.074169000000001	-89.553020000000004	13	1
1087	0108	Pecuario Ocho Mil	21.07349	-89.551106000000004	13	1
1088	0109	Los Cabos [Rancho]	21.077269000000001	-89.547757000000004	13	1
1089	0110	Santa Rosa Uno	21.079408999999998	-89.533274000000006	13	1
1090	0111	San Juan Uno	21.103978999999999	-89.523527000000001	13	1
1091	0112	Los Tres Potrillos	21.082512999999999	-89.488487000000006	13	1
1092	0114	Malas Pulgas	21.108013	-89.526128	13	1
1093	0115	Daniel Estrella	21.070556	-89.531943999999996	13	1
1094	0116	San Andrés	21.092379999999999	-89.475576000000004	13	1
1095	0117	San Antonio	21.114407	-89.522794000000005	13	1
1096	0118	Villas Conkal	21.083528999999999	-89.495984000000007	13	1
1097	0120	San Judas Tadeo	21.056069000000001	-89.527989000000005	13	1
1098	0121	San Manuel	21.105523000000002	-89.521170999999995	13	1
1099	0122	San Román	21.082373	-89.501592000000002	13	1
1100	0123	Alabama México	21.078334000000002	-89.532465999999999	13	1
1101	0125	Tres Marías	21.075873000000001	-89.530880999999994	13	1
1102	0127	Yaaxtún	21.075787999999999	-89.539738999999997	13	1
1103	0128	San Ignacio Yuum K'áax	21.114799999999999	-89.511077	13	1
1104	0129	Doble R	21.071045999999999	-89.542035999999996	13	1
1105	0131	Xlapak	21.050084999999999	-89.505180999999993	13	1
1106	0132	Kilómetro Doce	21.084868	-89.481267000000003	13	1
1107	0133	Jarcimex [Fábrica]	21.090710999999999	-89.469967999999994	13	1
1108	0134	Fernando	21.091536000000001	-89.467770999999999	13	1
1109	0135	Ninguno	21.092155000000002	-89.462734999999995	13	1
1110	0136	San Andrés [Rancho]	21.087675000000001	-89.478042000000002	13	1
1111	0137	San Oscar	21.052806	-89.508097000000006	13	1
1112	0139	Loret [Rancho]	21.056858999999999	-89.527546999999998	13	1
1113	0140	La Caprichosa	21.110396999999999	-89.519942	13	1
1114	0141	CECYTEY [Plantel Conkal]	21.079311000000001	-89.502300000000005	13	1
1115	0142	Ninguno [Granja Porcícola]	21.051133	-89.507069999999999	13	1
1116	0143	Ninguno [Granja Porcícola]	21.051407999999999	-89.504811000000004	13	1
1117	0144	La Reserva [Complejo Residencial]	21.112166999999999	-89.546510999999995	13	1
1118	0145	Las Palomas	21.055433000000001	-89.527614	13	1
1119	0146	San Gabriel	21.051306	-89.508416999999994	13	1
1120	0147	Valerio	21.050767	-89.506693999999996	13	1
1121	0148	Paseos del Mayab	21.098127999999999	-89.537666999999999	13	1
1122	0149	Praderas del Mayab	21.097933000000001	-89.532325	13	1
1123	0150	Agregados y Bloques del Sureste [Fábrica]	21.059172	-89.516677999999999	13	1
1124	0151	Proroca [Trituradora]	21.084126000000001	-89.471284999999995	13	1
1125	0152	Megalita [Fábrica]	21.100055999999999	-89.515002999999993	13	1
1126	0001	Cuncunul	20.641162999999999	-88.296631000000005	14	1
1127	0005	Samal	20.681398999999999	-88.322539000000006	14	1
1128	0006	San Antonio	20.634516999999999	-88.312916000000001	14	1
1129	0009	Chan San Francisco Dos	20.572500000000002	-88.368888999999996	14	1
1130	0010	San Francisco	20.651994999999999	-88.344412000000005	14	1
1131	0013	Chebalam	20.549168999999999	-88.415867000000006	14	1
1132	0014	Santa Bárbara	20.634298999999999	-88.348346000000006	14	1
1133	0025	San Diego	20.638558	-88.333984000000001	14	1
1134	0026	San Francisco	20.634219999999999	-88.342207000000002	14	1
1135	0032	Santa Clara de las Hadas	20.661334	-88.335517999999993	14	1
1136	0033	X'mahcaba	20.635850000000001	-88.301580999999999	14	1
1137	0039	San Juan de las Palmas	20.631121	-88.365624999999994	14	1
1138	0040	X-Akabchén	20.511389999999999	-88.521607000000003	14	1
1139	0046	Santa Cruz	20.674287	-88.299145999999993	14	1
1140	0047	Quebradora Don Sabas	20.634834999999999	-88.291837999999998	14	1
1141	0049	San Pablo	20.664736000000001	-88.324359999999999	14	1
1142	0050	Triturados y Materiales Ebtún	20.652208999999999	-88.283469999999994	14	1
1143	0051	San Agustín	20.629878999999999	-88.361233999999996	14	1
1144	0001	Cuzamá	20.741484	-89.316961000000006	15	1
1145	0002	Cuchbalam	20.672799000000001	-89.318453000000005	15	1
1146	0003	Chunkanán	20.711437	-89.326669999999993	15	1
1147	0005	Eknakán	20.758747	-89.370011000000005	15	1
1148	0006	Nohchakán	20.746842000000001	-89.336336000000003	15	1
1149	0008	San Francisco Sisal	20.732748000000001	-89.356172999999998	15	1
1150	0009	Yaxkukul	20.699705999999999	-89.306076000000004	15	1
1151	0016	Santa Cruz	20.730378999999999	-89.316891999999996	15	1
1152	0027	Lunche Uno	20.753343000000001	-89.352500000000006	15	1
1153	0028	Nohchakan Uno	20.747050999999999	-89.340586999999999	15	1
1154	0029	El Dorado [Rancho]	20.761859000000001	-89.369898000000006	15	1
1155	0032	Ninguno	20.721778	-89.318456999999995	15	1
1156	0033	Ninguno	20.716511000000001	-89.323381999999995	15	1
1157	0034	Ninguno	20.716173999999999	-89.323559000000003	15	1
1158	0001	Chacsinkín	20.172601	-89.016408999999996	16	1
1159	0002	Bakché	20.173575	-88.969474000000005	16	1
1160	0004	San Dionisio	20.184733000000001	-88.974750999999998	16	1
1161	0005	Santa María	20.212917000000001	-88.988905000000003	16	1
1162	0006	Suctún	20.172234	-89.033944000000005	16	1
1163	0007	Texan	20.219063999999999	-89.032083999999998	16	1
1164	0008	Tinum	20.240814	-89.005975000000007	16	1
1165	0009	X-Box	20.204547999999999	-89.004818	16	1
1166	0010	Chan Huayab	20.189592000000001	-89.00215	16	1
1167	0011	San Miguel Xkanan	20.152384000000001	-89.040115999999998	16	1
1168	0012	Xno-Huayab	20.189122999999999	-88.990302	16	1
1169	0013	Xhulucán	20.155044	-89.007203000000004	16	1
1170	0024	San Dionisio Número Dos	20.183333000000001	-88.977778000000001	16	1
1171	0030	Ismael Muñoz Cab	20.166041	-89.008505	16	1
1172	0031	Santa Juliana	20.230478999999999	-88.986930999999998	16	1
1173	0032	Santa María	20.286997	-89.003110000000007	16	1
1174	0001	Chankom	20.568583	-88.512345999999994	17	1
1175	0003	Nicte-Há	20.597553000000001	-88.591497000000004	17	1
1176	0006	San Isidro	20.588598999999999	-88.497294999999994	17	1
1177	0011	Ticimul	20.596968	-88.552586000000005	17	1
1178	0012	Tzukmuc	20.590664	-88.456861000000004	17	1
1179	0013	Xanlá	20.517951	-88.494043000000005	17	1
1180	0014	X-Bohom	20.558378999999999	-88.475650999999999	17	1
1181	0015	Xkalakdzonot	20.439463	-88.569648000000001	17	1
1182	0016	X-Cocail	20.572645999999999	-88.564458000000002	17	1
1183	0017	Xkopteil	20.513455	-88.582060999999996	17	1
1184	0018	Xkatún	20.632083000000002	-88.544020000000003	17	1
1185	0019	Xtohil	20.618002000000001	-88.591887	17	1
1186	0024	San Juan	20.504999999999999	-88.580556000000001	17	1
1187	0028	Yokdzonot	20.545967000000001	-88.569372000000001	17	1
1188	0034	Chechmil	20.613413999999999	-88.634951999999998	17	1
1189	0035	San Juan Xkalakdzonot	20.346506999999999	-88.614644999999996	17	1
1190	0043	X-Kopchén	20.601739999999999	-88.506165999999993	17	1
1191	0048	San Antonio	20.518899000000001	-88.576502000000005	17	1
1192	0058	Santa Rosa (Acabchén)	20.607907999999998	-88.525040000000004	17	1
1193	0083	Muchucuxcáh	20.477713000000001	-88.451036999999999	17	1
1194	0089	Najilcab	20.567454999999999	-88.501947000000001	17	1
1195	0090	Hulmal	20.471315000000001	-88.514583000000002	17	1
1196	0001	Chapab	20.458750999999999	-89.456552000000002	18	1
1197	0002	Aguada Polol	20.538336999999999	-89.488562000000002	18	1
1198	0003	Citincabchén	20.518687	-89.535960000000003	18	1
1199	0004	Hunabchén	20.533238999999998	-89.513503	18	1
1200	0007	Chuleb	20.542324000000001	-89.463479000000007	18	1
1201	0008	Puyuytun	20.507263999999999	-89.484913000000006	18	1
1202	0010	San Cristóbal	20.441958	-89.485774000000006	18	1
1203	0013	San Ignacio	20.479476999999999	-89.430757999999997	18	1
1204	0016	Techoh	20.526914000000001	-89.486993999999996	18	1
1205	0017	Xaybé	20.438327000000001	-89.428976000000006	18	1
1206	0019	Yaxché	20.502276999999999	-89.548392000000007	18	1
1207	0025	Rosalía Alvarado Alvarado	20.460367999999999	-89.447350999999998	18	1
1208	0026	Kekén [Granja]	20.453552999999999	-89.464774000000006	18	1
1209	0027	San Isidro	20.469449000000001	-89.424893999999995	18	1
1210	0031	Los Kisines	20.514727000000001	-89.538690000000003	18	1
1211	0001	Chemax	20.655016	-87.937327999999994	19	1
1212	0005	X-Catzín (Catzín)	20.716929	-87.866241000000002	19	1
1213	0006	Cocoyol	20.791889999999999	-87.751390000000001	19	1
1214	0008	Champolín	20.720970999999999	-87.805412000000004	19	1
1215	0013	Chenep (Chioplé)	20.727678000000001	-87.899365000000003	19	1
1216	0014	Chen X-Pil	20.778055999999999	-87.875	19	1
1217	0016	Cholul	20.773389000000002	-87.793852000000001	19	1
1218	0019	Chulután	20.567045	-87.962918999999999	19	1
1219	0026	Kuxeb	20.856898000000001	-87.870416000000006	19	1
1220	0029	Mucel	20.895737	-87.838673	19	1
1221	0031	Papagayo	20.907318	-87.779649000000006	19	1
1222	0035	Ramonal	20.763809999999999	-87.805352999999997	19	1
1223	0036	San Antonio	20.727421	-87.907000999999994	19	1
1224	0038	San José	20.838611	-87.941275000000005	19	1
1225	0041	San Juan Chen	20.926178	-87.733085000000003	19	1
1226	0042	San Pedro Chemax	20.944766999999999	-87.787913000000003	19	1
1227	0043	San Román	20.957125999999999	-87.730241000000007	19	1
1228	0044	San Severo	20.767289000000002	-87.835391000000001	19	1
1229	0045	Santa Clara	20.772570999999999	-87.879202000000006	19	1
1230	0046	Santa Cruz	20.849762999999999	-87.747861	19	1
1231	0047	Santa Elena	20.732232	-87.768884	19	1
1232	0048	Santa Librada	20.768189	-87.874027999999996	19	1
1233	0049	Santa María	20.533337	-87.895523999999995	19	1
1234	0050	Santa Martha	20.655971999999998	-87.960880000000003	19	1
1235	0051	Santa Rosa	20.662137999999999	-87.980165	19	1
1236	0054	Sisbichén	20.822987999999999	-87.924460999999994	19	1
1237	0056	Kantó	20.704798	-87.998245999999995	19	1
1238	0059	Uspibil	20.768823000000001	-88.004193999999998	19	1
1239	0062	Xalaú (X-Alau)	20.677378999999998	-88.006423999999996	19	1
1240	0063	X-Can	20.858001000000002	-87.668874000000002	19	1
1241	0066	Chechmil	20.772652999999998	-87.964359999999999	19	1
1242	0069	X-Huech	20.718360000000001	-87.958568	19	1
1243	0083	Pabalam	20.736958000000001	-87.829317000000003	19	1
1244	0088	Xuneb	20.699183000000001	-88.002112999999994	19	1
1245	0098	Lol-Bé	20.501071	-87.923083000000005	19	1
1246	0103	Tamtza	20.627800000000001	-87.948605999999998	19	1
1247	0111	X-Haas	20.716056999999999	-87.896794999999997	19	1
1248	0112	Mariposa	20.685424999999999	-87.902220999999997	19	1
1249	0113	X-Cocom	20.694838000000001	-87.882801999999998	19	1
1250	0115	Dzonot	20.693804	-87.842298	19	1
1251	0119	X-Poxil	20.598528999999999	-87.907786000000002	19	1
1252	0120	San Francisco	20.587540000000001	-87.903371000000007	19	1
1253	0121	Pisté (Nohoch Pisté)	20.566163	-87.856559000000004	19	1
1254	0134	San Diego	20.781818000000001	-87.771968000000001	19	1
1255	0139	Chumpich	20.830863000000001	-87.840405000000004	19	1
1256	0144	San José	20.604187	-87.954738000000006	19	1
1257	0151	Kulché	20.815966	-87.934785000000005	19	1
1258	0160	San Pedro	20.780978999999999	-87.885692000000006	19	1
1259	0201	Pénjamo	20.658942	-87.968864999999994	19	1
1260	0205	San Isidro	20.806239999999999	-87.754248000000004	19	1
1261	0210	X-Texas	20.874707999999998	-87.764009999999999	19	1
1262	0218	Paraíso	20.835979999999999	-87.744587999999993	19	1
1263	0220	Palomares	20.762611	-87.716969000000006	19	1
1264	0221	Santa Rita	20.762889999999999	-87.694272999999995	19	1
1265	0224	Platanal	20.784209000000001	-87.740817000000007	19	1
1266	0229	San Nicolás	20.749590000000001	-87.804680000000005	19	1
1267	0230	Aroba	20.729773000000002	-87.766104999999996	19	1
1268	0242	Rancho Bonito	20.768118000000001	-87.879785999999996	19	1
1269	0255	Santa Elena	20.910616999999998	-87.761045999999993	19	1
1270	0264	San Pedro	20.717009000000001	-87.889632000000006	19	1
1271	0265	Sodzil	20.697763999999999	-87.868347	19	1
1272	0267	San José (San José Balam)	20.577641	-87.858937999999995	19	1
1273	0275	Santa María Ancla	20.536124000000001	-87.890677999999994	19	1
1274	0276	Buenavista	20.790963000000001	-87.712232	19	1
1275	0278	X-Cauich	20.676034000000001	-87.956029000000001	19	1
1276	0279	Chachadzonot	20.803643000000001	-87.781684999999996	19	1
1277	0281	Chanyokdzonot	20.853601000000001	-87.765101999999999	19	1
1278	0282	Chanyokdzonot	20.638653000000001	-87.965931999999995	19	1
1279	0284	Yokdzadz	20.887639	-87.739768999999995	19	1
1280	0285	Chiquix	20.841162000000001	-87.768996000000001	19	1
1281	0286	Yokdzonot	20.558679999999999	-87.971789999999999	19	1
1282	0288	Cruzché	20.635121999999999	-87.864626000000001	19	1
1283	0289	Dothilá	20.781663999999999	-87.956861000000004	19	1
1284	0292	Dzibichén	20.809056000000002	-87.958060000000003	19	1
1285	0293	Dzidzilché	20.688835000000001	-87.832830000000001	19	1
1286	0294	Dzitnup	20.562052999999999	-87.886213999999995	19	1
1287	0295	Yaaxdzonot	20.809239999999999	-87.915567999999993	19	1
1288	0296	La Esperanza	20.990667999999999	-87.638390000000001	19	1
1289	0297	X-Mab	20.758130999999999	-87.866602999999998	19	1
1290	0299	Grano de Oro	20.833887000000001	-87.936634999999995	19	1
1291	0300	Hoxcab	20.806896999999999	-87.827782999999997	19	1
1292	0302	Kantirixché	20.789560000000002	-87.959684999999993	19	1
1293	0304	Katanzel	20.631643	-87.874127000000001	19	1
1294	0305	Kondzonot	20.874625999999999	-87.782100999999997	19	1
1295	0306	Kumdzonot	20.520854	-87.913847000000004	19	1
1296	0307	Konsahcab	20.599968000000001	-87.936065999999997	19	1
1297	0308	Koopchén	20.703662999999999	-87.894131999999999	19	1
1298	0309	Kulinché	20.787580999999999	-87.898859999999999	19	1
1299	0310	Kuncheil	20.601673000000002	-87.879490000000004	19	1
1300	0315	Nakuché	20.610308	-87.974631000000002	19	1
1301	0318	Poolyuc	20.607755999999998	-87.868930000000006	19	1
1302	0320	Santa María	20.735662999999999	-87.861307999999994	19	1
1303	0321	San Antonio	20.803934000000002	-87.972959000000003	19	1
1304	0322	San Antonio	20.890442	-87.751610999999997	19	1
1305	0323	Blanca Flor	20.782238	-87.888011000000006	19	1
1306	0324	San José Chahuay	20.75526	-87.838381999999996	19	1
1307	0325	San José X-Can	20.914802999999999	-87.680642000000006	19	1
1308	0326	San Juan Chen	20.557987000000001	-87.939584999999994	19	1
1309	0327	San Lorenzo	20.646820000000002	-88.027653999999998	19	1
1310	0328	San Pedro	20.559629000000001	-87.928482000000002	19	1
1311	0330	San Román	20.828534000000001	-87.940365999999997	19	1
1312	0331	Xuxcab	20.654606000000001	-88.020419000000004	19	1
1313	0333	Santa María Panyo (Santa María Panorama)	20.941151999999999	-87.809106	19	1
1314	0334	San Alfonso Chile Seco	20.933536	-87.814603000000005	19	1
1315	0335	Sal Si Puedes	20.939475999999999	-87.822868999999997	19	1
1316	0336	Santa María	20.798217999999999	-87.740093000000002	19	1
1317	0338	Santa María Copoil	20.541903999999999	-87.889835000000005	19	1
1318	0339	Xim-Há	20.930764	-87.680470999999997	19	1
1319	0341	Santa Rosa	20.674059	-87.912693000000004	19	1
1320	0343	X-Poop	20.659075999999999	-87.954316000000006	19	1
1321	0344	Tixcancal	20.705500000000001	-87.903029000000004	19	1
1322	0345	Dzalá (Yohdzonot)	20.736744000000002	-87.938838000000004	19	1
1323	0347	Dzuca	20.678402999999999	-87.889201	19	1
1324	0348	Santa Cruz Uayah-Té	20.929935	-87.790415999999993	19	1
1325	0351	Pixoy	20.767455000000002	-87.845596999999998	19	1
1326	0353	X-Pehaltún	20.640381000000001	-87.975674999999995	19	1
1327	0361	San Felipe	20.748709999999999	-87.793896000000004	19	1
1328	0362	Coxlei (Kochila)	20.614173999999998	-87.861272999999997	19	1
1329	0364	X-Catíl	20.600777999999998	-87.958994000000004	19	1
1330	0379	San Javier	20.912704000000002	-87.781327000000005	19	1
1331	0380	San Isidro	20.885072999999998	-87.763069999999999	19	1
1332	0384	Santa Cruz	20.796192000000001	-87.952986999999993	19	1
1333	0385	Yaxché	20.799607000000002	-87.950778999999997	19	1
1334	0386	X-Polol	20.853994	-87.914202000000003	19	1
1335	0388	X-Cuc	20.789574000000002	-87.941868999999997	19	1
1336	0389	Kom	20.749258999999999	-87.968653000000003	19	1
1337	0392	Kankabal	20.762841999999999	-87.961675	19	1
1338	0394	Kotichén (Koti)	20.725916000000002	-87.939206999999996	19	1
1339	0396	Xockín	20.748449000000001	-87.920786000000007	19	1
1340	0397	Santa Argelia	20.672592999999999	-87.941456000000002	19	1
1341	0398	San Pedro	20.747655000000002	-88.011735999999999	19	1
1342	0399	Colonchán	20.789245000000001	-87.937811999999994	19	1
1343	0400	San José	20.748612999999999	-87.838375999999997	19	1
1344	0401	Acapulco	20.739096	-87.781828000000004	19	1
1345	0402	San Pablo	20.715047999999999	-87.772408999999996	19	1
1346	0403	San Isidro (Yoh-Actún)	20.716664999999999	-87.757086000000001	19	1
1347	0404	San Esteban (Nueva Italia)	20.560714999999998	-87.888025999999996	19	1
1348	0405	X-Yaxdzonot	20.802299000000001	-87.816993999999994	19	1
1349	0407	Canabé	20.616809	-87.879896000000002	19	1
1350	0408	Yaxchén	20.706509	-88.019603000000004	19	1
1351	0411	X-Canabail	20.608656	-87.992114000000001	19	1
1352	0412	San José Konlún	20.654064999999999	-87.925876000000002	19	1
1353	0413	San Javier	20.653528000000001	-88.006017	19	1
1354	0414	San Mateo	20.639478	-88.014998000000006	19	1
1355	0416	San Ramón	20.605073999999998	-87.872532000000007	19	1
1356	0417	Kochilá	20.599191999999999	-87.869518999999997	19	1
1357	0418	San Miguel	20.658272	-87.948505999999995	19	1
1358	0419	San José	20.586103999999999	-87.920261999999994	19	1
1359	0422	X-Thobil	20.514901999999999	-87.930719999999994	19	1
1360	0423	X-Catil	20.677219999999998	-87.950540000000004	19	1
1361	0424	Tzeek	20.708659000000001	-87.946111000000002	19	1
1362	0425	San Miguel	20.724162	-87.977131	19	1
1363	0426	Lirios	20.700068999999999	-87.944612000000006	19	1
1364	0427	San José	20.675899000000001	-87.938683999999995	19	1
1365	0429	San Isidro	20.808857	-87.914634000000007	19	1
1366	0430	Blanca Flor	20.788951999999998	-87.958879999999994	19	1
1367	0431	Akachén	20.758724999999998	-88.008947000000006	19	1
1368	0433	Kixmó	20.619527999999999	-87.924518000000006	19	1
1369	0435	Santa María	20.563483999999999	-87.934576000000007	19	1
1370	0436	Dzibil	20.610685	-87.910084999999995	19	1
1371	0438	San Isidro Pedregal	20.586348000000001	-87.906386999999995	19	1
1372	0440	Santa Isabel	20.750572999999999	-87.798558999999997	19	1
1373	0441	San Marcos	20.78267	-87.961381000000003	19	1
1374	0443	San José Xcuch	20.774115999999999	-87.995118000000005	19	1
1375	0448	Yaxché	20.819075000000002	-87.757785999999996	19	1
1376	0452	San Miguel	20.830245999999999	-87.944344000000001	19	1
1377	0453	San Felipe	20.827508999999999	-87.945753999999994	19	1
1378	0455	Piedra Blanca	20.548698000000002	-87.88776	19	1
1379	0456	Nueva Italia	20.555150000000001	-87.895166000000003	19	1
1380	0457	X-Cocom	20.556097999999999	-87.895467999999994	19	1
1381	0458	San Felipe	20.613205000000001	-87.935052999999996	19	1
1382	0460	Hoteoch	20.694357	-87.816621999999995	19	1
1383	0461	Panabá	20.699417	-87.856239000000002	19	1
1384	0462	Chan Pistemax	20.579302999999999	-87.856143000000003	19	1
1385	0463	San Pedro	20.595516	-87.906002000000001	19	1
1386	0465	Yax Hom	20.694891999999999	-87.950727000000001	19	1
1387	0468	Tulín	20.659808000000002	-88.008498000000003	19	1
1388	0469	X-Jujilchén	20.671163	-88.000333999999995	19	1
1389	0471	Yodzonot	20.766325999999999	-87.895366999999993	19	1
1390	0472	San Antonio Texas	20.872582000000001	-87.763428000000005	19	1
1391	0480	Kilómetro Catorce	20.897780999999998	-87.763733000000002	19	1
1392	0487	Estrella	20.807815999999999	-87.737776999999994	19	1
1393	0489	Miraflores	20.737998000000001	-87.830408000000006	19	1
1394	0490	San Alfonso	20.943439000000001	-87.817909	19	1
1395	0491	San Felipe	20.777009	-87.827358000000004	19	1
1396	0492	San José	20.617424	-87.946907999999993	19	1
1397	0493	Santa Cruz	20.587669000000002	-87.873318999999995	19	1
1398	0494	San Pablo	20.609399	-87.924121	19	1
1399	0496	Akché	20.828825999999999	-87.957652999999993	19	1
1400	0497	Actunxoch	20.82103	-87.946479999999994	19	1
1401	0503	Kunché	20.735429	-87.926788000000002	19	1
1402	0505	San Antonio	20.720351000000001	-87.964364000000003	19	1
1403	0506	San José	20.732486000000002	-87.909726000000006	19	1
1404	0507	San Luis	20.601751	-87.969438999999994	19	1
1405	0510	Santa Librada	20.757459999999998	-87.834224000000006	19	1
1406	0512	Santa Martha	20.705200999999999	-87.903004999999993	19	1
1407	0513	Santa Rosa	20.767603000000001	-87.768197999999998	19	1
1408	0519	Xtabil	20.642223000000001	-87.993039999999993	19	1
1409	0520	Uicab	20.717213000000001	-87.955956999999998	19	1
1410	0523	Chenchén	20.752317999999999	-87.946610000000007	19	1
1411	0524	Yokdzonot	20.808060000000001	-87.919149000000004	19	1
1412	0525	El Polvorín	20.803792999999999	-87.914275000000004	19	1
1413	0526	X-Actún	20.790420000000001	-87.915813999999997	19	1
1414	0527	San José	20.775438000000001	-87.882596000000007	19	1
1415	0528	Buenavista	20.785343000000001	-87.890906000000001	19	1
1416	0529	Blanca Flor	20.632722000000001	-88.010650999999996	19	1
1417	0530	Chan Santa Rosa (Chan Akachén)	20.674918000000002	-87.978183000000001	19	1
1418	0531	Chemax	20.666042000000001	-87.932373999999996	19	1
1419	0534	Echeverría	20.823136999999999	-87.714346000000006	19	1
1420	0536	San Antonio	20.665317000000002	-87.946543000000005	19	1
1421	0537	San Francisco	20.623332000000001	-87.980604	19	1
1422	0538	San Juan	20.703541999999999	-88.014307000000002	19	1
1423	0539	X-Gota	20.643031000000001	-88.013315000000006	19	1
1424	0541	Calvario	20.582280999999998	-87.912412000000003	19	1
1425	0544	San Agustín	20.708234999999998	-87.850305000000006	19	1
1426	0545	San Pedro	20.780132999999999	-87.702565000000007	19	1
1427	0547	San José Timas	20.725006	-87.984701000000001	19	1
1428	0548	San Lorenzo	20.754726000000002	-87.795336000000006	19	1
1429	0549	San Pastor	20.725016	-87.989210999999997	19	1
1430	0550	Santa Teresa	20.849872999999999	-87.764600000000002	19	1
1431	0551	Tusick	20.735814999999999	-87.845515000000006	19	1
1432	0553	Xcauich	20.685645000000001	-87.791601	19	1
1433	0554	X-Mohoch Onil	20.667497000000001	-87.865831999999997	19	1
1434	0555	X-Onil	20.680122999999998	-87.872403000000006	19	1
1435	0556	Yokdzonot	20.732330000000001	-87.965541000000002	19	1
1436	0558	Koochá	20.476120000000002	-87.937949000000003	19	1
1437	0560	Chacán	20.712461000000001	-87.936572999999996	19	1
1438	0561	Chan Kom	20.663307	-87.989455000000007	19	1
1439	0562	Dzidzilché	20.636744	-87.921942999999999	19	1
1440	0563	Dzinic Balam	20.608205999999999	-87.904790000000006	19	1
1441	0564	Santa María [Finca]	20.707331	-87.846518000000003	19	1
1442	0567	Noh-Pich	20.57695	-87.878173000000004	19	1
1443	0568	Pistemax	20.578616	-87.867740999999995	19	1
1444	0569	Pol Chon	20.677887999999999	-87.922436000000005	19	1
1445	0570	Poxil Número Dos	20.602952999999999	-87.909160999999997	19	1
1446	0571	Puzcam	20.604773999999999	-87.924553000000003	19	1
1447	0572	San Rafael	20.732213999999999	-87.860274000000004	19	1
1448	0573	San Antonio	20.650656999999999	-87.882886999999997	19	1
1449	0574	San Isidro Dos	20.587042	-87.846744000000001	19	1
1450	0575	San Isidro Uno	20.595973000000001	-87.841786999999997	19	1
1451	0576	San Miguel	20.605	-87.910556	19	1
1452	0577	Santa Isabel	20.728794000000001	-87.890156000000005	19	1
1453	0578	Santa Rosa Dos	20.666899999999998	-87.921942999999999	19	1
1454	0579	Bethel	20.638124000000001	-87.912527999999995	19	1
1455	0580	San Federico	20.592582	-87.905030999999994	19	1
1456	0581	Emilio Kinil [Kixmoch]	20.629512999999999	-87.926261999999994	19	1
1457	0582	X-Ebtún	20.716719000000001	-87.914669000000004	19	1
1458	0583	Chocholá	20.625603000000002	-87.904933999999997	19	1
1459	0584	Chunjujub	20.795463000000002	-87.859425999999999	19	1
1460	0585	Cutzán	20.827680999999998	-87.815224000000001	19	1
1461	0586	La Esperanza	20.903572	-87.775110999999995	19	1
1462	0587	Kanasín	20.792221999999999	-87.861666999999997	19	1
1463	0588	San Cosme	20.774833000000001	-87.787375999999995	19	1
1464	0589	Santa Ana	20.819572999999998	-87.808819999999997	19	1
1465	0590	Kulché Tres	20.811050000000002	-87.932717999999994	19	1
1466	0591	Santa Cruz	20.880728999999999	-87.858780999999993	19	1
1467	0592	Yaxdzonot	20.861191999999999	-87.790553000000003	19	1
1468	0593	Miraflor	20.942140999999999	-87.787040000000005	19	1
1469	0594	X-Cotmay	20.927281000000001	-87.768799999999999	19	1
1470	0595	Santo Domingo	20.931193	-87.778488999999993	19	1
1471	0596	Chacté	20.792783	-87.857495	19	1
1472	0598	Palo Verde	20.790153	-87.860138000000006	19	1
1473	0599	Cuernavaca (X-Haas)	20.649021000000001	-87.846001000000001	19	1
1474	0600	Dzonkeil	20.638831	-87.847491000000005	19	1
1475	0601	Juan Diego	20.653699	-87.921398999999994	19	1
1476	0602	Jujilchén	20.638566000000001	-87.840143999999995	19	1
1477	0603	Kuncheil	20.580846000000001	-87.919658999999996	19	1
1478	0604	Maíz de Chulután	20.558651999999999	-87.946800999999994	19	1
1479	0606	San Isidro	20.648118	-87.917713000000006	19	1
1480	0607	San Juan Texas (X-Haas)	20.649656	-87.845349999999996	19	1
1481	0608	Santo Domingo	20.770416000000001	-87.850741999999997	19	1
1482	0609	Subinché	20.560120999999999	-87.949738999999994	19	1
1483	0610	Xcanahaltún	20.643543000000001	-87.827661000000006	19	1
1484	0611	Xkanté	20.705632999999999	-87.823132000000001	19	1
1485	0612	Xkilim	20.648917999999998	-87.895979999999994	19	1
1486	0613	Xmabén de Catzín	20.801841	-87.857945000000001	19	1
1487	0614	Pueblo Fantasma	20.790403000000001	-87.860405999999998	19	1
1488	0615	X-Treinta y Cinco	20.965064999999999	-87.663194000000004	19	1
1489	0616	Akabchén	20.880766999999999	-87.758853000000002	19	1
1490	0617	San Vicente	20.876888000000001	-87.748993999999996	19	1
1491	0618	Primitivo Gómez López	20.859587999999999	-87.657606000000001	19	1
1492	0619	Yunchén	20.730474000000001	-87.967714000000001	19	1
1493	0620	Aka Che'en	20.707135999999998	-87.878234000000006	19	1
1494	0621	Melesio Tah Tah	20.638652	-87.927402000000001	19	1
1495	0622	San José (Subtoc)	20.635767999999999	-87.927271000000005	19	1
1496	0623	San Ramón	20.581218	-87.865522999999996	19	1
1497	0624	San Felipe	20.895713000000001	-87.766347999999994	19	1
1498	0625	Texas Dos	20.878323000000002	-87.763232000000002	19	1
1499	0001	Chicxulub Pueblo	21.137288999999999	-89.515075999999993	20	1
1500	0002	Guadalupe Labastida	21.158709000000002	-89.506564999999995	20	1
1501	0003	Lactún	21.156469000000001	-89.533056999999999	20	1
1502	0004	San Antonio Baspul	21.129193999999998	-89.546014	20	1
1503	0005	San José Chakán	21.136018	-89.495857999999998	20	1
1504	0007	Santa María Ontiveros	21.120756	-89.515631999999997	20	1
1505	0011	X-Cotún	21.138885999999999	-89.527679000000006	20	1
1506	0017	El Huayabo	21.167349999999999	-89.519959	20	1
1507	0020	San Jorge	21.142607999999999	-89.523021999999997	20	1
1508	0025	Almendros	21.149933000000001	-89.510985000000005	20	1
1509	0026	Chak Wakax	21.127493000000001	-89.492444000000006	20	1
1510	0027	Santa Clara	21.147264	-89.495236000000006	20	1
1511	0028	San Martín	21.122755000000002	-89.496694000000005	20	1
1512	0029	Xpilayuc	21.124448000000001	-89.500393000000003	20	1
1513	0031	La Guadalupana	21.142861	-89.500528000000003	20	1
1514	0033	Víctor Baquedano	21.135562	-89.490488999999997	20	1
1515	0034	Ninguno	21.144577000000002	-89.494989000000004	20	1
1516	0035	San José [Unidad]	21.144777000000001	-89.521328999999994	20	1
1517	0036	Los Pedregales	21.129919999999998	-89.523621000000006	20	1
1518	0038	San Felipe	21.129588999999999	-89.505526000000003	20	1
1519	0039	San Gabriel	21.145931000000001	-89.495752999999993	20	1
1520	0040	Santa Cruz	21.149000999999998	-89.523269999999997	20	1
1521	0041	Santa Cruz Dos	21.144943999999999	-89.523478999999995	20	1
1522	0042	Santa Úrsula	21.144444	-89.497777999999997	20	1
1523	0043	California [Rancho Porcícola]	21.151437000000001	-89.518991	20	1
1524	0045	Faisán	21.142465000000001	-89.497479999999996	20	1
1525	0046	Crío [Granjas]	21.178077999999999	-89.540882999999994	20	1
1526	0047	Federico Ollinger	21.164944999999999	-89.530895000000001	20	1
1527	0048	Agustina Pech Pech	21.144652000000001	-89.522453999999996	20	1
1528	0049	La Candelaria [Quinta]	21.143673	-89.521518	20	1
1529	0050	Los Zapata	21.142652999999999	-89.520906999999994	20	1
1530	0051	Los Tres Hermanos [Rancho]	21.133880999999999	-89.524276	20	1
1531	0052	San Antonio	21.140830000000001	-89.502077999999997	20	1
1532	0054	Miguel Rubio	21.148451000000001	-89.507537999999997	20	1
1533	0055	Ninguno	21.151997000000001	-89.506782000000001	20	1
1534	0056	Xiú	21.154350999999998	-89.506102999999996	20	1
1535	0057	La Mora	21.150653999999999	-89.508403000000001	20	1
1536	0058	Cha Kan [Unidad Citricola]	21.142983999999998	-89.493914000000004	20	1
1537	0059	Santa María [Invernadero]	21.122330000000002	-89.516266000000002	20	1
1538	0060	Residencial Baspul [Fraccionamiento]	21.133006999999999	-89.526111	20	1
1539	0061	Las Gemelas	21.120988000000001	-89.497957	20	1
1540	0062	El Portón	21.130161000000001	-89.491262000000006	20	1
1541	0063	San Eduardo	21.127759000000001	-89.501416000000006	20	1
1542	0064	COBAY [Plantel Chicxulub Pueblo]	21.140699999999999	-89.509574999999998	20	1
1543	0001	Chichimilá	20.631270000000001	-88.217397000000005	21	1
1544	0004	Celtún	20.459294	-88.210633000000001	21	1
1545	0008	Dzitox	20.383934	-88.086575999999994	21	1
1546	0011	San Benigno	20.427758000000001	-88.175863000000007	21	1
1547	0013	San Fernando	20.326419999999999	-88.183415999999994	21	1
1548	0014	San José	20.384726000000001	-88.193689000000006	21	1
1549	0017	San Pablo	20.300667000000001	-88.188323999999994	21	1
1550	0018	San Pedro	20.352024	-88.215936999999997	21	1
1551	0021	Tixcancal Dzonot	20.366541000000002	-88.191484000000003	21	1
1552	0022	Chan X-Cail	20.356878999999999	-88.138735999999994	21	1
1553	0023	X-Chay	20.447032	-88.197182999999995	21	1
1554	0024	Nuevo X-Habín	20.447289000000001	-88.266553000000002	21	1
1555	0025	X-Luch	20.447779000000001	-88.222117999999995	21	1
1556	0027	Tuzil	20.441051000000002	-88.178323000000006	21	1
1557	0029	Álamo	20.359518999999999	-88.103008000000003	21	1
1558	0030	Akabchén	20.473027999999999	-88.127078999999995	21	1
1559	0033	Chan Pich	20.446840999999999	-88.151139000000001	21	1
1560	0039	X-Mazón	20.381418	-88.130960999999999	21	1
1561	0049	Suykac	20.566185999999998	-88.173387000000005	21	1
1562	0062	Cruz Ché	20.471381999999998	-88.194417000000001	21	1
1563	0064	Chibilub	20.370518000000001	-88.086332999999996	21	1
1564	0070	San José Che	20.465882000000001	-88.140281000000002	21	1
1565	0071	San Lorenzo	20.637191000000001	-88.206001999999998	21	1
1566	0075	Tzutzil	20.363959000000001	-88.238500000000002	21	1
1567	0078	San Francisco	20.388307000000001	-88.141440000000003	21	1
1568	0083	Yuyumal	20.419381999999999	-88.236735999999993	21	1
1569	0091	Ikiché	20.373398000000002	-88.195357999999999	21	1
1570	0093	San Mateo	20.359532999999999	-88.137784999999994	21	1
1571	0095	Tixcancal	20.506250000000001	-88.160621000000006	21	1
1572	0100	Xtanail	20.35727	-88.092519999999993	21	1
1573	0103	Santa Clara	20.606511000000001	-88.175310999999994	21	1
1574	0105	San José	20.606835	-88.187758000000002	21	1
1575	0108	Champich	20.534884000000002	-88.234775999999997	21	1
1576	0109	Dzalbay	20.513918	-88.197868999999997	21	1
1577	0111	Santa Juliana	20.610240999999998	-88.192505999999995	21	1
1578	0112	Santa María	20.518439000000001	-88.214236	21	1
1579	0114	Yohactún	20.500824999999999	-88.159086000000002	21	1
1580	0115	San Vicente	20.634664999999998	-88.223860999999999	21	1
1581	0117	Santa Elena	20.443795999999999	-88.194102999999998	21	1
1582	0120	Xnohkay	20.446930999999999	-88.192570000000003	21	1
1583	0122	San Lorenzo Dos	20.638414999999998	-88.206181000000001	21	1
1584	0123	Santa Gertrudis	20.636043000000001	-88.201981000000004	21	1
1585	0124	San Alejo	20.646000999999998	-88.213904999999997	21	1
1586	0125	San Valerio	20.623891	-88.211473999999995	21	1
1587	0126	San Andrés	20.414285	-88.220809000000003	21	1
1588	0127	Ninguno	20.646288999999999	-88.204969000000006	21	1
1589	0128	COBAY [Plantel Chichimilá]	20.623543999999999	-88.228886000000003	21	1
1590	0001	Chikindzonot	20.333655	-88.486485999999999	22	1
1591	0002	Chan-Chichimilá	20.388984000000001	-88.474924999999999	22	1
1592	0003	Ichmul	20.161348	-88.609926999999999	22	1
1593	0012	Chan Santa María	20.381789000000001	-88.557107000000002	22	1
1594	0023	Chucteil	20.223673999999999	-88.543358999999995	22	1
1595	0029	Santa Rosa	20.296389000000001	-88.574167000000003	22	1
1596	0031	X-Arco	20.216356000000001	-88.523069000000007	22	1
1597	0035	X-Ciumil	20.218796000000001	-88.565743999999995	22	1
1598	0037	X-Poxil	20.267475999999998	-88.571915000000004	22	1
1599	0049	Chan Kankabdzonot	20.355924000000002	-88.573223999999996	22	1
1600	0050	X-Campana	20.295009	-88.552398999999994	22	1
1601	0051	Yokdzonot Carrillo	20.206965	-88.540736999999993	22	1
1602	0055	El Arca de Noé	20.153988999999999	-88.611621	22	1
1603	0056	Chikindzonot [Cementerio]	20.150524999999998	-88.612724999999998	22	1
1604	0057	Tumben Cool	20.149055000000001	-88.613647	22	1
1605	0058	San Vicente	20.141528000000001	-88.614958999999999	22	1
1606	0059	Kankabil	20.296132	-88.539444000000003	22	1
1607	0060	San Pedro (Kaa Tah)	20.366969999999998	-88.557747000000006	22	1
1608	0062	San Isidro	20.33004	-88.480281000000005	22	1
1609	0063	Wilberth Kauil Alcocer	20.335646000000001	-88.481166000000002	22	1
1610	0001	Chocholá	20.750230999999999	-89.830698999999996	23	1
1611	0002	San Antonio Chablé	20.756549	-89.867979000000005	23	1
1612	0003	Chocholá de los Venados	20.721805	-89.843975999999998	23	1
1613	0005	Tch'een-Men	20.771892999999999	-89.820650999999998	23	1
1614	0006	Santa Martha	20.771488000000002	-89.824147999999994	23	1
1615	0007	El Limonar	20.764211	-89.823526999999999	23	1
1616	0015	San Agustín	20.750703999999999	-89.816029999999998	23	1
1617	0023	Avemar	20.768443000000001	-89.824027000000001	23	1
1618	0026	Cholul	20.714675	-89.856976000000003	23	1
1619	0027	El Ramonal	20.771543000000001	-89.822198999999998	23	1
1620	0029	Doroteo Arango	20.789297000000001	-89.915121999999997	23	1
1621	0030	Hobonchacá	20.734978999999999	-89.843986000000001	23	1
1622	0031	Calotku	20.703966999999999	-89.849107000000004	23	1
1623	0032	Kuxeb	20.72654	-89.842358000000004	23	1
1624	0033	Misko	20.762215000000001	-89.824045999999996	23	1
1625	0034	El Gargaleote	20.752307999999999	-89.849745999999996	23	1
1626	0036	San Francisco	20.693356999999999	-89.951273999999998	23	1
1627	0037	El Diamante	20.750879000000001	-89.844649000000004	23	1
1628	0038	San Lorenzo	20.751671999999999	-89.799740999999997	23	1
1629	0040	San Luis Dos	20.753245	-89.850502000000006	23	1
1630	0041	Santa María	20.733619000000001	-89.836195000000004	23	1
1631	0042	San Miguel	20.752894000000001	-89.851786000000004	23	1
1632	0043	Santa Obdulia	20.753309000000002	-89.861390999999998	23	1
1633	0044	San Pablo X'Yaxché	20.745775999999999	-89.819728999999995	23	1
1634	0045	San Pedro	20.763750000000002	-89.821261000000007	23	1
1635	0046	San José	20.749780999999999	-89.822528000000005	23	1
1636	0047	Santa Teresa	20.753475999999999	-89.808532999999997	23	1
1637	0049	Takín Lol	20.752766000000001	-89.852663000000007	23	1
1638	0050	Tres Reyes	20.746143	-89.810135000000002	23	1
1639	0051	Cucuchi	20.718374000000001	-89.861408999999995	23	1
1640	0052	Xamán Ek	20.774452	-89.820093999999997	23	1
1641	0058	San Antonio	20.753603999999999	-89.845304999999996	23	1
1642	0059	San Luis Cuatro	20.753136000000001	-89.858739	23	1
1643	0060	Gary 6	20.755593999999999	-89.847680999999994	23	1
1644	0061	Kuncheil	20.758407999999999	-89.864992999999998	23	1
1645	0062	Cholul	20.710169	-89.859409999999997	23	1
1646	0065	El Crisantemo	20.757363000000002	-89.864244999999997	23	1
1647	0066	Cumpich Moderno	20.814864	-89.864824999999996	23	1
1648	0067	Los Tres Garcías	20.748839	-89.905867999999998	23	1
1649	0068	La Guadalupana	20.752977999999999	-89.801050000000004	23	1
1650	0069	Guadalupe	20.755690000000001	-89.859823000000006	23	1
1651	0070	La Ilusión	20.761616	-89.820491000000004	23	1
1652	0071	Nabulá	20.706771	-89.913771999999994	23	1
1653	0073	Los Ángeles	20.749345999999999	-89.859318000000002	23	1
1654	0074	El Roble	20.773008000000001	-89.819823	23	1
1655	0075	Sacnicté	20.705966	-89.919420000000002	23	1
1656	0078	San José Bella Flor	20.753243999999999	-89.854705999999993	23	1
1657	0079	San Juan	20.739476	-89.825348000000005	23	1
1658	0080	San Juan	20.763210000000001	-89.866066000000004	23	1
1659	0081	San Luis Tres	20.753411	-89.857221999999993	23	1
1660	0082	San Miguel	20.772317999999999	-89.853859999999997	23	1
1661	0083	San Miguel	20.742289	-89.821313000000004	23	1
1662	0084	Crío Módulo Seis [Granja]	20.776081999999999	-89.819391999999993	23	1
1663	0085	Crío Módulo Siete [Granja]	20.774694	-89.817843999999994	23	1
1664	0086	Crío Módulo Ocho [Granja]	20.773921000000001	-89.815876000000003	23	1
1665	0087	Santa Julia	20.733294000000001	-89.814514000000003	23	1
1666	0088	El Girasol	20.754604	-89.814024000000003	23	1
1667	0090	San Antonio Tzil	20.759177000000001	-89.840693999999999	23	1
1668	0091	San Diego	20.753187	-89.818095	23	1
1669	0092	San Eraclio	20.758417999999999	-89.850374000000002	23	1
1670	0093	San Fernando	20.736426000000002	-89.814678000000001	23	1
1671	0095	San Luis	20.771169	-89.849238999999997	23	1
1672	0096	San Mateo	20.765996999999999	-89.854678000000007	23	1
1673	0097	Than Choon	20.778383000000002	-89.851933000000002	23	1
1674	0098	Chich Muk	20.751828	-89.800961000000001	23	1
1675	0099	San Pedro	20.743807	-89.822677999999996	23	1
1676	0100	Los Girasoles	20.742163000000001	-89.851045999999997	23	1
1677	0101	Yax-Ha	20.748540999999999	-89.758832999999996	23	1
1678	0102	Paraíso	20.751778000000002	-89.802886000000001	23	1
1679	0103	San Isidro	20.752765	-89.802325999999994	23	1
1680	0104	San Lorenzo	20.7532	-89.804778999999996	23	1
1681	0105	San Lorenzo Tres	20.752834	-89.798280000000005	23	1
1682	0106	El Viajero	20.696914	-89.869010000000003	23	1
1683	0107	SEMARNAT (El Parque de las Hermanas)	20.751446000000001	-89.846593999999996	23	1
1684	0108	San Nicolás	20.757915000000001	-89.854505000000003	23	1
1685	0109	La Lealtad	20.752452000000002	-89.841386	23	1
1686	0110	Belbesah	20.751294999999999	-89.842718000000005	23	1
1687	0001	Chumayel	20.429535000000001	-89.302519000000004	24	1
1688	0005	Noh-Bec	20.465613999999999	-89.246724999999998	24	1
1689	0007	San Diego	20.424689000000001	-89.311276000000007	24	1
1690	0008	San Antonio	20.460276	-89.316671999999997	24	1
1691	0010	Holoch Chí	20.509430999999999	-89.251531	24	1
1692	0011	Sinkilá	20.474305000000001	-89.298008999999993	24	1
1693	0017	San Miguel	20.443688000000002	-89.270697999999996	24	1
1694	0020	San Pablo	20.458271	-89.311302999999995	24	1
1695	0021	San Pedro	20.469566	-89.290019000000001	24	1
1696	0022	San Pedro Chacsinkín	20.441523	-89.329778000000005	24	1
1697	0026	Santa Elena	20.453714000000002	-89.308891000000003	24	1
1698	0030	Xauchel	20.430078000000002	-89.328856000000002	24	1
1699	0031	Santa Catalina	20.423317999999998	-89.307463999999996	24	1
1700	0033	Santa Ana	20.459436	-89.249790000000004	24	1
1701	0034	Santa Margarita	20.432724	-89.288163999999995	24	1
1702	0035	La Guadalupana	20.432003999999999	-89.307823999999997	24	1
1703	0037	Rancho Seco	20.429687999999999	-89.312145999999998	24	1
1704	0038	Traviesas Uno	20.448112999999999	-89.303478999999996	24	1
1705	0039	Santa Bárbara	20.525805999999999	-89.281904999999995	24	1
1706	0001	Dzan	20.387764000000001	-89.468870999999993	25	1
1707	0003	Jacinto Canek (San Juan)	20.405222999999999	-89.465599999999995	25	1
1708	0011	San Felipe	20.393295999999999	-89.455224999999999	25	1
1709	0013	San Pedro	20.432721000000001	-89.405867999999998	25	1
1710	0015	Santa Clara	20.386873000000001	-89.444619000000003	25	1
1711	0016	Santa Cruz	20.411134000000001	-89.484746999999999	25	1
1712	0020	Plan Chac Pozo Cuatro	20.367813000000002	-89.468254000000002	25	1
1713	0022	Plan Chac Pozo Seis	20.357987000000001	-89.480564999999999	25	1
1714	0023	Plan Chac Pozo Siete	20.352513999999999	-89.472421999999995	25	1
1715	0024	Plan Chac Pozo Nueve	20.348645999999999	-89.463903000000002	25	1
1716	0027	Candelaria	20.38927	-89.448231000000007	25	1
1717	0030	Jesús María Uno	20.397749999999998	-89.467488000000003	25	1
1718	0034	San Antonio	20.424861	-89.459055000000006	25	1
1719	0036	Santo Domingo	20.384554000000001	-89.451532	25	1
1720	0040	San Andrés	20.447801999999999	-89.404696999999999	25	1
1721	0041	Puente de Amor [Casa Hogar]	20.389482000000001	-89.484057000000007	25	1
1722	0042	Eliseo Jiménez	20.393176	-89.478988999999999	25	1
1723	0043	Santa Cruz	20.391635000000001	-89.483943999999994	25	1
1724	0044	Much Meyá	20.375778	-89.473952999999995	25	1
1725	0045	San Felipe	20.379632000000001	-89.46969	25	1
1726	0046	San Juan Norte	20.417276999999999	-89.465918000000002	25	1
1727	0047	San Martín de Porres	20.34224	-89.467222000000007	25	1
1728	0048	San Ignacio [Rancho]	20.388916999999999	-89.451440000000005	25	1
1729	0049	San Juan	20.426096000000001	-89.498975000000002	25	1
1730	0050	Lal-Bak	20.389135	-89.488356999999993	25	1
1731	0001	Dzemul	21.211503	-89.308813999999998	26	1
1732	0003	Komchén de los Pájaros	21.213103	-89.326498999999998	26	1
1733	0004	San Bruno	21.330438000000001	-89.391090000000005	26	1
1734	0005	San Diego	21.237485	-89.305490000000006	26	1
1735	0006	San Eduardo	21.233920999999999	-89.275902000000002	26	1
1736	0012	Las Magnolias	21.190933999999999	-89.322429	26	1
1737	0013	Caleras	21.268968000000001	-89.312663000000001	26	1
1738	0016	Chenbacab	21.255763000000002	-89.351285000000004	26	1
1739	0018	Kancabchén	21.198067999999999	-89.321819000000005	26	1
1740	0019	San Agustín	21.261216000000001	-89.364414999999994	26	1
1741	0021	Paraíso	21.278368	-89.345403000000005	26	1
1742	0027	Santa Cruz	21.198574000000001	-89.313688999999997	26	1
1743	0028	Tres Cruces	21.270063	-89.320563000000007	26	1
1744	0033	San Fernando	21.205444	-89.318408000000005	26	1
1745	0035	San Benito	21.323737999999999	-89.439901000000006	26	1
1746	0037	Tilí	21.197004	-89.307062999999999	26	1
1747	0040	San Antonio de Padua	21.207712999999998	-89.297192999999993	26	1
1748	0041	Yah	21.28096	-89.387791000000007	26	1
1749	0042	Guadalupe	21.260345000000001	-89.357521000000006	26	1
1750	0047	El Braulio	21.194261999999998	-89.310755	26	1
1751	0050	Emiliano Zapata	21.207039999999999	-89.292665	26	1
1752	0051	Fernández [Granja]	21.202082000000001	-89.331029000000001	26	1
1753	0052	San Alfonso	21.218243999999999	-89.310107000000002	26	1
1754	0053	San Antonio Herguera	21.218388000000001	-89.314588999999998	26	1
1755	0054	San Martín	21.262398000000001	-89.349159	26	1
1756	0056	Santa Cruz San Diego	21.227084000000001	-89.307229000000007	26	1
1757	0057	Santa Magdalena	21.249635999999999	-89.354977000000005	26	1
1758	0058	Santo Domingo	21.253810999999999	-89.318134999999998	26	1
1759	0059	San Francisco	21.217468	-89.308802	26	1
1760	0061	Xcambó	21.313592	-89.354052999999993	26	1
1761	0063	Domingo Ortega Graniel	21.214041000000002	-89.315674000000001	26	1
1762	0066	Roberto Centeno Erguera	21.22315	-89.307536999999996	26	1
1763	0067	Sac-Nicté	21.219864999999999	-89.303436000000005	26	1
1764	0068	Santa Cruz Segundo	21.201003	-89.315507999999994	26	1
1765	0069	Xtampú	21.334177	-89.348764000000003	26	1
1766	0070	Candelaria	21.216017999999998	-89.301855000000003	26	1
1767	0071	El Siete	21.233620999999999	-89.316286000000005	26	1
1768	0072	Halcón Dorado	21.230989999999998	-89.330324000000005	26	1
1769	0073	Las Codornices	21.253212999999999	-89.316311999999996	26	1
1770	0074	Juan Manuel Chalé Chí	21.223761	-89.307629000000006	26	1
1771	0075	San Martín de Porres	21.264652000000002	-89.314659000000006	26	1
1772	0076	Yaax-Che'e	21.229921000000001	-89.332651999999996	26	1
1773	0080	Golf	21.331002999999999	-89.367705000000001	26	1
1774	0081	Ninguno	21.328171000000001	-89.398128	26	1
1775	0082	Coco Cottage	21.326532	-89.406752999999995	26	1
1776	0083	El León	21.326657000000001	-89.407933	26	1
1777	0084	Ninguno	21.326467999999998	-89.408737000000002	26	1
1778	0085	San Juan	21.236578000000002	-89.285758999999999	26	1
1779	0086	Mi Ranchito	21.204371999999999	-89.292696000000007	26	1
1780	0087	Las Palmeras	21.196306	-89.319052999999997	26	1
1781	0088	Ninguno	21.325047999999999	-89.417332000000002	26	1
1782	0089	Palma Real	21.332889999999999	-89.367440999999999	26	1
1783	0090	San Miguel	21.206403999999999	-89.290806000000003	26	1
1784	0091	San Susano	21.201263999999998	-89.319147999999998	26	1
1785	0092	Villa Córdova	21.325755999999998	-89.411208000000002	26	1
1786	0093	Yucatán Beach	21.326968999999998	-89.404320999999996	26	1
1787	0094	María Santos [Unidad]	21.271103	-89.267949000000002	26	1
1788	0096	La Guadalupana	21.230367000000001	-89.306748999999996	26	1
1789	0001	Dzidzantún	21.246677999999999	-89.042974999999998	27	1
1790	0002	San Francisco Manzanilla	21.253222000000001	-89.022986000000003	27	1
1791	0004	Santa Clara	21.373819999999998	-89.013754000000006	27	1
1792	0005	Dzonotcay	21.286764000000002	-89.015484000000001	27	1
1793	0006	X-Luuch	21.326295999999999	-89.001619000000005	27	1
1794	0007	Mina de Oro	21.376982000000002	-88.984883999999994	27	1
1795	0008	El Porvenir	21.372105999999999	-89.036270999999999	27	1
1796	0011	Chaltún Pujuy	21.292055000000001	-89.027755999999997	27	1
1797	0012	Loreto	21.363702	-88.963739000000004	27	1
1798	0013	San Felipe Chuylem	21.238426	-89.039114999999995	27	1
1799	0017	Saapech	21.365376999999999	-88.959325000000007	27	1
1800	0018	Xaan	21.346854	-89.007773999999998	27	1
1801	0019	Santa Ana	21.249320999999998	-89.067368000000002	27	1
1802	0020	San Cristóbal	21.268463000000001	-89.069694999999996	27	1
1803	0021	San Enrique	21.299312	-89.007936000000001	27	1
1804	0023	San Genaro	21.331453	-89.067138	27	1
1805	0024	San Jorge	21.341674000000001	-89.021452999999994	27	1
1806	0027	San Juan Aguilar Uno	21.304694000000001	-88.989255999999997	27	1
1807	0029	San Juan Aguilar Tres	21.304627	-88.980266	27	1
1808	0030	San Martín	21.312152000000001	-89.044910000000002	27	1
1809	0033	Santa Cruz	21.228528000000001	-89.077556999999999	27	1
1810	0035	Santa Isabel Chen Chay	21.321114999999999	-89.049840000000003	27	1
1811	0036	Santa Rita	21.309898	-89.030055000000004	27	1
1812	0037	Trinidad	21.278894000000001	-89.038250000000005	27	1
1813	0039	Santa Rosalía	21.306920999999999	-89.038989000000001	27	1
1814	0040	Santo Domingo	21.350349999999999	-89.025471999999993	27	1
1815	0041	San Gregorio X-Luch	21.322008	-88.990030000000004	27	1
1816	0043	San Agustín	21.320176	-89.014633000000003	27	1
1817	0044	San Antonio	21.317668000000001	-89.029974999999993	27	1
1818	0048	Santa Elena	21.350583	-89.018176999999994	27	1
1819	0050	Faller	21.257594999999998	-89.012051999999997	27	1
1820	0055	Dzonotcay	21.284448999999999	-89.008010999999996	27	1
1821	0056	San Juan	21.255486000000001	-89.063198999999997	27	1
1822	0057	San Luis	21.260750999999999	-89.039850000000001	27	1
1823	0058	San Pedro	21.288080000000001	-89.053987000000006	27	1
1824	0059	Santa Rosa	21.269242999999999	-89.038157999999996	27	1
1825	0061	Xculul	21.302889	-88.994558999999995	27	1
1826	0064	Dzithox	21.242042000000001	-89.059141999999994	27	1
1827	0065	José Luis Aguilar	21.244178000000002	-89.055301999999998	27	1
1828	0068	Santa Cruz	21.264506999999998	-89.054036999999994	27	1
1829	0069	El Grillo	21.280593	-89.031186000000005	27	1
1830	0072	San Honorio	21.342229	-89.015489000000002	27	1
1831	0073	Texaan	21.352169	-88.992687000000004	27	1
1832	0074	Texaan	21.342732000000002	-88.993778000000006	27	1
1833	0075	Guadalupe	21.242432999999998	-89.057924	27	1
1834	0076	Lácteos Dos Mil	21.234756999999998	-89.053038000000001	27	1
1835	0077	Lázaro Cárdenas	21.231887	-89.054861000000002	27	1
1836	0078	Dzidzantún [Rastro Municipal]	21.236751000000002	-89.050203999999994	27	1
1837	0081	La Rosita	21.335948999999999	-89.025042999999997	27	1
1838	0082	Santa Elena [Anexa]	21.348590999999999	-89.019289999999998	27	1
1839	0083	San Jorge	21.249590999999999	-89.055678	27	1
1840	0086	Villa de Guadalupe	21.347434	-88.965522000000007	27	1
1841	0087	Dalila	21.237252000000002	-89.046563000000006	27	1
1842	0088	René Estrada Cetina	21.250401	-89.054471000000007	27	1
1843	0089	Cornelio Aguilar Puc	21.254028000000002	-89.047499000000002	27	1
1844	0090	Manuel Gorocica Celis	21.261189000000002	-89.043334000000002	27	1
1845	0091	Alberto Coral Coral	21.260204999999999	-89.046030000000002	27	1
1846	0092	Dzidzantún Vegetal	21.263991000000001	-89.041961999999998	27	1
1847	0093	San Felipe	21.365819999999999	-88.969988000000001	27	1
1848	0094	Santa Elena	21.335129999999999	-89.021185000000003	27	1
1849	0095	San Felipe	21.242328000000001	-89.037968000000006	27	1
1850	0096	San Antonio Uno	21.330095	-89.026971000000003	27	1
1851	0097	San Diego Chumul	21.25535	-89.068530999999993	27	1
1852	0100	San José	21.260657999999999	-89.004973000000007	27	1
1853	0101	Santa Isabel	21.296026999999999	-89.031238000000002	27	1
1854	0102	Santa Margarita	21.302835000000002	-89.003584000000004	27	1
1855	0103	Tunich Luum	21.259457000000001	-89.041118999999995	27	1
1856	0104	Valdez	21.238848000000001	-89.031205	27	1
1857	0105	Valdez Tercero	21.239395999999999	-89.033512000000002	27	1
1858	0106	Veinte de Noviembre	21.303743999999998	-89.030124999999998	27	1
1859	0107	Xbalam	21.290528999999999	-89.005702999999997	27	1
1860	0108	Haltún Há	21.229972	-89.057597999999999	27	1
1861	0109	San Alejandro	21.308896000000001	-89.060427000000004	27	1
1862	0110	CRIDI	21.30979	-89.014223000000001	27	1
1863	0111	El Laurel	21.257657999999999	-89.006682999999995	27	1
1864	0112	Tercera Generación	21.228729000000001	-89.058943999999997	27	1
1865	0113	La Ilusión	21.267913	-89.060502	27	1
1866	0115	San Francisco	21.257328999999999	-89.023748999999995	27	1
1867	0116	San Jorge	21.341994	-89.023313000000002	27	1
1868	0001	Dzilam de Bravo	21.393229000000002	-88.89188	28	1
1869	0004	Buena Esperanza	21.454142000000001	-88.520607999999996	28	1
1870	0005	Cenote Avelino	21.430496000000002	-88.598905999999999	28	1
1871	0008	Chun-Xaan	21.344063999999999	-88.675926000000004	28	1
1872	0010	El Paraíso	21.375809	-88.833702000000002	28	1
1873	0012	San Emilio	21.349826	-88.756764000000004	28	1
1874	0014	San Osorio	21.351706	-88.688587999999996	28	1
1875	0015	Sinkeuel	21.465851000000001	-88.577954000000005	28	1
1876	0016	Socorro	21.423732000000001	-88.612655000000004	28	1
1877	0017	San Miguel	21.429745	-88.516101000000006	28	1
1878	0020	San Esteban	21.465741000000001	-88.579509000000002	28	1
1879	0021	San Fernando	21.450520000000001	-88.534159000000002	28	1
1880	0022	San Juan	21.351868	-88.817691999999994	28	1
1881	0024	San Francisco	21.422747999999999	-88.574157	28	1
1882	0025	San José	21.363689000000001	-88.880285000000001	28	1
1883	0026	San José	21.366430999999999	-88.898111	28	1
1884	0027	San Julián	21.375478000000001	-88.657048000000003	28	1
1885	0028	San Luis	21.437290000000001	-88.540626000000003	28	1
1886	0034	San Pablo	21.439292999999999	-88.575085000000001	28	1
1887	0035	San Pedro Tres	21.349495999999998	-88.784678999999997	28	1
1888	0036	San Salvador Dos	21.456654	-88.559397000000004	28	1
1889	0037	San Salvador Tres	21.450032	-88.541235999999998	28	1
1890	0039	San Vicente	21.353788000000002	-88.911837000000006	28	1
1891	0041	Santa Librada	21.424040999999999	-88.536492999999993	28	1
1892	0042	Arizona	21.42577	-88.532522999999998	28	1
1893	0044	Santa Teresa	21.365831	-88.901201999999998	28	1
1894	0045	Santa Úrsula	21.345638999999998	-88.744316999999995	28	1
1895	0046	Xkan-Há	21.450578	-88.504885999999999	28	1
1896	0047	Xlabon-Subín	21.356904	-88.653880999999998	28	1
1897	0048	Chun-Xaan	21.399666	-88.657651999999999	28	1
1898	0049	X-Toldzonot	21.375025000000001	-88.780371000000002	28	1
1899	0053	San Carlos	21.342976	-88.724677	28	1
1900	0057	Dzonot Pich	21.381937000000001	-88.753957999999997	28	1
1901	0062	Santa Naybi Belén	21.361906000000001	-88.870504999999994	28	1
1902	0063	Los Tres Compadres	21.345541999999998	-88.794111000000001	28	1
1903	0066	San Gregorio	21.371979	-88.813029	28	1
1904	0067	San Francisco	21.373010000000001	-88.829082	28	1
1905	0071	El Ceibito	21.374345999999999	-88.853932999999998	28	1
1906	0073	Chenpay Tres	21.365580999999999	-88.922649000000007	28	1
1907	0075	Maichkil	21.436188999999999	-88.627139	28	1
1908	0077	Montecristo	21.396449	-88.703196000000005	28	1
1909	0080	Pueblo Nuevo	21.382669	-88.890731000000002	28	1
1910	0081	Rancho Grande	21.419747999999998	-88.646181999999996	28	1
1911	0082	Ongay [Rancho]	21.473112	-88.477502000000001	28	1
1912	0085	Santa Elena	21.359069000000002	-88.927048999999997	28	1
1913	0087	San Isidro	21.355177999999999	-88.925943000000004	28	1
1914	0088	San Israel	21.345775	-88.943791000000004	28	1
1915	0089	San Jorge	21.420922999999998	-88.627840000000006	28	1
1916	0090	San Juan	21.398430999999999	-88.690145999999999	28	1
1917	0091	San Juan Bautista	21.353908000000001	-88.858776000000006	28	1
1918	0092	San Manuel	21.440577999999999	-88.507664000000005	28	1
1919	0093	Santa María	21.371122	-88.797843	28	1
1920	0094	San Pedro	21.373950000000001	-88.805498999999998	28	1
1921	0095	Sinaloa	21.416695000000001	-88.663224999999997	28	1
1922	0096	Chimay	21.355211000000001	-88.904094000000001	28	1
1923	0097	San Luis Dos	21.445872999999999	-88.537124000000006	28	1
1924	0098	El Zorgo	21.371708999999999	-88.896848000000006	28	1
1925	0099	Los Tres Reyes	21.37255	-88.820914999999999	28	1
1926	0103	San José	21.386944	-88.906943999999996	28	1
1927	0104	Pérez Flores [Cocal]	21.387273	-88.913798	28	1
1928	0105	Kennedy [Ejido]	21.474965000000001	-88.489903999999996	28	1
1929	0106	Geguajepama	21.375775999999998	-88.885268999999994	28	1
1930	0110	San Jorge	21.375771	-88.753867999999997	28	1
1931	0111	San Rafael	21.379173999999999	-88.782030000000006	28	1
1932	0114	Las Conchitas	21.387782000000001	-88.913679999999999	28	1
1933	0115	Villa Mercedes	21.390135000000001	-88.904268999999999	28	1
1934	0118	Pascual Córdoba	21.366524999999999	-88.870686000000006	28	1
1935	0120	Alemar	21.353739999999998	-88.827534	28	1
1936	0122	San Judas	21.363582000000001	-88.796811000000005	28	1
1937	0123	San José Dos	21.364744000000002	-88.801259000000002	28	1
1938	0126	San Martín	21.373674000000001	-88.839004000000003	28	1
1939	0127	San Andrés	21.352748999999999	-88.818983000000003	28	1
1940	0128	Montana	21.400151000000001	-88.672661000000005	28	1
1941	0129	Don Cáceres	21.36515	-88.816170999999997	28	1
1942	0130	Opezca	21.376434	-88.895341000000002	28	1
1943	0132	El Sauce	21.365634	-88.832970000000003	28	1
1944	0135	Alcocer [Trituradora]	21.354035	-88.900289000000001	28	1
1945	0136	GMG [Empresa]	21.386444999999998	-88.918665000000004	28	1
1946	0137	Cachira	21.377638000000001	-88.896405000000001	28	1
1947	0138	Don Chucho	21.376961999999999	-88.896587999999994	28	1
1948	0139	Dzilam de Bravo [Unidad Habitacional]	21.375413000000002	-88.895968999999994	28	1
1949	0140	La Mano Poderosa	21.485189999999999	-88.496778000000006	28	1
1950	0141	La Providencia	21.480888	-88.503163000000001	28	1
1951	0142	San Esteban [Rancho]	21.477568000000002	-88.488440999999995	28	1
1952	0143	San Judas Tadeo	21.480920999999999	-88.513082999999995	28	1
1953	0144	San Martin	21.488545999999999	-88.490133999999998	28	1
1954	0145	Santa Rosa	21.478774000000001	-88.495419999999996	28	1
1955	0146	Tres Reyes	21.485368000000001	-88.510334	28	1
1956	0147	La Casa de las Flores	21.378990999999999	-88.895700000000005	28	1
1957	0148	Las Iguanitas	21.389545999999999	-88.910078999999996	28	1
1958	0149	Boquinete y Hoo-Chakan [Granja de Tilapia]	21.362278	-88.898612	28	1
1959	0151	Cabaña Villa Flores	21.386495	-88.926299	28	1
1960	0152	Mariano Peraza	21.385833000000002	-88.926389	28	1
1961	0153	Limbo	21.387236999999999	-88.918852999999999	28	1
1962	0154	El Cielo	21.384454000000002	-88.933610999999999	28	1
1963	0155	Las Chayas	21.384278999999999	-88.934741000000002	28	1
1964	0156	Villa San Pedro	21.383690999999999	-88.938034999999999	28	1
1965	0157	Asociación Ganadera	21.360395	-88.898379000000006	28	1
1966	0158	Rancho Don Li	21.355352	-88.854648999999995	28	1
1967	0159	Rancho California	21.368783000000001	-88.852852999999996	28	1
1968	0160	Ninguno	21.348634000000001	-88.772251999999995	28	1
1969	0161	Los Coquitos	21.377041999999999	-88.897540000000006	28	1
1970	0162	Marrufo Godoy	21.377475	-88.897960999999995	28	1
1971	0163	Jorge Peraza	21.377600000000001	-88.900153000000003	28	1
1972	0164	Las Conchitas	21.379138999999999	-88.894936999999999	28	1
1973	0166	FONDEN [Unidad Habitacional]	21.378253000000001	-88.895380000000003	28	1
1974	0167	Rancho San Luis	21.359566000000001	-88.658541	28	1
1975	0168	San Vicente	21.366471000000001	-88.928554000000005	28	1
1976	0169	Bramadero	21.370759	-88.652238999999994	28	1
1977	0001	Dzilam González	21.280200000000001	-88.929756999999995	29	1
1978	0005	Chunyaxnic	21.401047999999999	-88.645066	29	1
1979	0008	Santa Cruz	21.368476000000001	-88.623378000000002	29	1
1980	0011	Santa María	21.361566	-88.648701000000003	29	1
1981	0012	Tres Reyes	21.379066000000002	-88.628129999999999	29	1
1982	0013	Holontún	21.389557	-88.617518000000004	29	1
1983	0015	Santa Úrsula	21.396041	-88.490809999999996	29	1
1984	0017	Guadalupe	21.407164999999999	-88.539568000000003	29	1
1985	0019	Chancalotmul	21.343980999999999	-88.483024999999998	29	1
1986	0020	Chac Lol	21.269044000000001	-88.950209999999998	29	1
1987	0021	Laach	21.352335	-88.822435999999996	29	1
1988	0023	Chen-Cimé	21.339699	-88.585457000000005	29	1
1989	0024	Dzidzilché	21.388283999999999	-88.512662000000006	29	1
1990	0025	Dzonot Celis	21.310423	-88.691761	29	1
1991	0026	Dzonot Tzatz	21.308091999999998	-88.82526	29	1
1992	0027	Dzonot Sábila	21.311530999999999	-88.747966000000005	29	1
1993	0029	La Flor	21.332975000000001	-88.866065000000006	29	1
1994	0030	Xkan-Há	21.339388	-88.710607999999993	29	1
1995	0031	Noc-Zal	21.367218999999999	-88.513887999999994	29	1
1996	0032	San Antonio Nohuayún	21.277017000000001	-88.962131999999997	29	1
1997	0034	Sonora	21.390923999999998	-88.566962000000004	29	1
1998	0036	San Alberto	21.35886	-88.493005999999994	29	1
1999	0037	San Albino	21.338227	-88.738682999999995	29	1
2000	0038	San Alejandro	21.400721999999998	-88.522921999999994	29	1
2001	0041	San Cristóbal	21.362345999999999	-88.581300999999996	29	1
2002	0042	San Eduardo	21.418493999999999	-88.613607999999999	29	1
2003	0045	San Felipe	21.378464000000001	-88.500939000000002	29	1
2004	0047	San Felipe	21.345784999999999	-88.711377999999996	29	1
2005	0048	San Fernando	21.344176999999998	-88.623818	29	1
2006	0049	San Fernando	21.329761000000001	-88.859780000000001	29	1
2007	0052	San Jesús	21.276116999999999	-88.956588999999994	29	1
2008	0053	San José	21.375665999999999	-88.547107999999994	29	1
2009	0054	San Juan	21.359891999999999	-88.502753999999996	29	1
2010	0055	San Juan	21.341805000000001	-88.830534	29	1
2011	0058	San Marcos	21.271795999999998	-88.961402000000007	29	1
2012	0059	San Marcos	21.338757000000001	-88.808594999999997	29	1
2013	0060	San Mateo	21.415911000000001	-88.584096000000002	29	1
2014	0061	San Pablo	21.337026999999999	-88.802644000000001	29	1
2015	0062	San Pascual	21.386876999999998	-88.532376999999997	29	1
2016	0063	San Pedro	21.362537	-88.570953000000003	29	1
2017	0065	San Pedro	21.290109999999999	-88.904454000000001	29	1
2018	0067	San Román	21.299754	-88.924420999999995	29	1
2019	0068	San Roque	21.406554	-88.552221000000003	29	1
2020	0069	San Salvador	21.318995000000001	-88.957913000000005	29	1
2021	0070	Santa Anita	21.414179000000001	-88.567514000000003	29	1
2022	0071	Santa Bárbara	21.272732999999999	-88.914349000000001	29	1
2023	0072	Santa Cruz	21.304483000000001	-88.933964000000003	29	1
2024	0074	Santa Isabel	21.353387000000001	-88.627934999999994	29	1
2025	0075	Santa Margarita	21.376618000000001	-88.635868000000002	29	1
2026	0076	Santa María Dos	21.357219000000001	-88.637798000000004	29	1
2027	0079	Santa Teresa	21.334461000000001	-88.681718000000004	29	1
2028	0080	Villa Guadalupe	21.299430000000001	-88.912760000000006	29	1
2029	0081	X-Canté	21.323494	-88.648347999999999	29	1
2030	0082	X-Canatunich	21.320202999999999	-88.910713999999999	29	1
2031	0083	X-Cail	21.306595000000002	-88.788055999999997	29	1
2032	0084	Xkan-Há	21.360614000000002	-88.537250999999998	29	1
2033	0085	X-Nail	21.344124000000001	-88.643169999999998	29	1
2034	0086	X-Pambihol	21.279944	-88.878602999999998	29	1
2035	0087	Xtab	21.385242999999999	-88.504891999999998	29	1
2036	0090	El Zapote	21.343140999999999	-88.856206999999998	29	1
2037	0095	Santa Cecilia	21.329017	-88.699038000000002	29	1
2038	0096	Camacho [Rancho]	21.322689	-88.706847999999994	29	1
2039	0097	San Juan Campos	21.330521000000001	-88.704001000000005	29	1
2040	0099	Las Cruces	21.357741000000001	-88.695085000000006	29	1
2041	0100	África	21.342167	-88.717365999999998	29	1
2042	0101	Box Dzonot	21.344664000000002	-88.703236000000004	29	1
2043	0102	San José	21.327629999999999	-88.693517	29	1
2044	0103	Santa Beatriz	21.315263999999999	-88.699415000000002	29	1
2045	0104	Canisté	21.298749999999998	-88.701400000000007	29	1
2046	0105	Dzonot Trejo	21.311935999999999	-88.668316000000004	29	1
2047	0106	San Francisco	21.314893999999999	-88.673880999999994	29	1
2048	0107	Santa Rosa	21.264944	-88.897953999999999	29	1
2049	0109	Santa Beatriz	21.262384000000001	-88.894886999999997	29	1
2050	0114	Kanisté	21.270209999999999	-88.879434000000003	29	1
2051	0115	San Cristóbal	21.311630999999998	-88.910903000000005	29	1
2052	0116	Nelly	21.268402999999999	-88.980097999999998	29	1
2053	0117	La Alegría	21.278358000000001	-88.916285999999999	29	1
2054	0119	San Antonio	21.356155999999999	-88.651206999999999	29	1
2055	0124	San Miguel Siete	21.351793000000001	-88.659221000000002	29	1
2056	0127	San Andrés	21.392512	-88.596442999999994	29	1
2057	0128	Santa Rosa	21.389668	-88.582988	29	1
2058	0129	San Álvaro	21.403893	-88.568791000000004	29	1
2059	0130	San Miguel Dos	21.340634000000001	-88.666623000000001	29	1
2060	0131	Santa Elena	21.375184000000001	-88.574494000000001	29	1
2061	0132	Chun-Ox	21.354970999999999	-88.588283000000004	29	1
2062	0133	Guadalupe	21.353691000000001	-88.571433999999996	29	1
2063	0134	San Severino	21.342313999999998	-88.581237000000002	29	1
2064	0135	San Pedro Uno	21.344360000000002	-88.778688000000002	29	1
2065	0136	Santa Clara	21.328281	-88.583735000000004	29	1
2066	0137	San Fernando	21.401868	-88.535928999999996	29	1
2067	0138	Chun-Ox [Anexa]	21.348741	-88.588893999999996	29	1
2068	0139	San Genaro [Anexa]	21.327224000000001	-88.833881000000005	29	1
2069	0140	San Judas	21.411584999999999	-88.493920000000003	29	1
2070	0141	El Agua	21.325838000000001	-88.860183000000006	29	1
2071	0142	La Bendición de Dios	21.383344000000001	-88.695767000000004	29	1
2072	0143	Las Brisas de los Siete Hermanos	21.385117999999999	-88.705444	29	1
2073	0144	Canta Rana	21.328908999999999	-88.964465000000004	29	1
2074	0145	Chamizal	21.318152999999999	-88.505527999999998	29	1
2075	0146	Chan X-Azul	21.324839999999998	-88.517422999999994	29	1
2076	0147	Chen Chomac	21.247118	-88.955208999999996	29	1
2077	0149	Dzonot Carmen	21.389220000000002	-88.575294	29	1
2078	0150	Felipe Carrillo	21.357561	-88.749013000000005	29	1
2079	0151	El Girasol	21.363565999999999	-88.524879999999996	29	1
2080	0152	Kan-Há	21.392406999999999	-88.696574999999996	29	1
2081	0153	El Paisanito	21.372416999999999	-88.626475999999997	29	1
2082	0154	Los Potros	21.379301999999999	-88.695262	29	1
2083	0155	Ninguno [Trituradora]	21.267339	-88.981364999999997	29	1
2084	0156	Rancho Chico	21.298631	-88.845187999999993	29	1
2085	0157	Don Wilo	21.320727999999999	-88.907499999999999	29	1
2086	0158	Sac-Nicté	21.332097000000001	-88.555983999999995	29	1
2087	0159	San Andrés	21.321286000000001	-88.949552999999995	29	1
2088	0160	San Ángel	21.363931999999998	-88.551928000000004	29	1
2089	0161	San Antonio	21.336207999999999	-88.950986	29	1
2090	0162	San Antonio	21.315449000000001	-88.480665999999999	29	1
2091	0163	San Cristóbal	21.336117999999999	-88.513904999999994	29	1
2092	0164	San Diego	21.359134999999998	-88.507338000000004	29	1
2093	0165	San Felipe	21.261613000000001	-88.950215	29	1
2094	0166	San Felipe	21.328780999999999	-88.490696	29	1
2095	0167	San Francisco	21.384039000000001	-88.524883000000003	29	1
2096	0168	San Genaro	21.335716000000001	-88.959034000000003	29	1
2097	0169	San Genaro	21.335021000000001	-88.831377000000003	29	1
2098	0170	San Humberto	21.362323	-88.602534000000006	29	1
2099	0171	San Isidro	21.329643999999998	-88.953283999999996	29	1
2100	0172	San Isidro	21.239874	-88.934663999999998	29	1
2101	0173	San Jorge	21.358985000000001	-88.719639999999998	29	1
2102	0174	San Jorge	21.387895	-88.697860000000006	29	1
2103	0175	San Juan	21.274466	-88.946996999999996	29	1
2104	0176	San Juan	21.365003000000002	-88.520382999999995	29	1
2105	0177	San Juan	21.364878999999998	-88.693708000000001	29	1
2106	0178	San Juan	21.329346000000001	-88.869750999999994	29	1
2107	0179	San Juan	21.336393000000001	-88.696263000000002	29	1
2108	0180	San Lorenzo	21.357493999999999	-88.730491999999998	29	1
2109	0181	San Lorenzo	21.415858	-88.603735999999998	29	1
2110	0182	San Luis	21.355266	-88.694429999999997	29	1
2111	0183	San Martín	21.356860999999999	-88.610912999999996	29	1
2112	0185	San Miguel Uno	21.343833	-88.665008999999998	29	1
2113	0186	San Miguel Tres	21.339772	-88.666126000000006	29	1
2114	0187	San Miguel Cuatro	21.338591999999998	-88.666832999999997	29	1
2115	0188	San Miguel Cinco	21.345009000000001	-88.671829000000002	29	1
2116	0189	San Pablo	21.318414000000001	-88.943422999999996	29	1
2117	0190	San Pedro	21.411930000000002	-88.523867999999993	29	1
2118	0191	San Pedro	21.346582999999999	-88.601201000000003	29	1
2119	0192	San Pedro	21.367982999999999	-88.693534	29	1
2120	0193	San Ramón	21.379898000000001	-88.598102999999995	29	1
2121	0196	Santa Anita	21.246604000000001	-88.947778	29	1
2122	0197	Santa Cruz	21.347787	-88.950914999999995	29	1
2123	0198	Santa Cruz Dos	21.342376999999999	-88.953201000000007	29	1
2124	0199	Santa Elena	21.373809999999999	-88.694147999999998	29	1
2125	0200	Santa Librada	21.318353999999999	-88.488418999999993	29	1
2126	0201	Santa María	21.394055999999999	-88.579289000000003	29	1
2127	0202	Santa María	21.331598	-88.579531000000003	29	1
2128	0203	Santa Martha	21.354619	-88.525013999999999	29	1
2129	0204	Santa Raymunda	21.341176999999998	-88.509011000000001	29	1
2130	0205	Santa Rita	21.254932	-88.934976000000006	29	1
2131	0206	Santa Rosa Uno	21.393409999999999	-88.579328000000004	29	1
2132	0207	Santa Tomasa	21.352761999999998	-88.543744000000004	29	1
2133	0208	Santiago	21.320985	-88.481323000000003	29	1
2134	0209	Ninguno	21.403504999999999	-88.528965999999997	29	1
2135	0210	San Raymundo	21.368424999999998	-88.545742000000004	29	1
2136	0211	San Antonio	21.340537000000001	-88.695949999999996	29	1
2137	0212	Santa Candelaria	21.340135	-88.765006	29	1
2138	0213	San Luis	21.363909	-88.748351999999997	29	1
2139	0214	Ninguno	21.358032999999999	-88.754473000000004	29	1
2140	0215	Santo Tomás	21.357692	-88.716527999999997	29	1
2141	0216	Ninguno	21.334371000000001	-88.930137000000002	29	1
2142	0217	Ninguno	21.325271999999998	-88.939558000000005	29	1
2143	0219	Ninguno	21.333427	-88.901043000000001	29	1
2144	0220	San Mario	21.248031999999998	-88.966772000000006	29	1
2145	0221	San Antonio	21.307701999999999	-88.844165000000004	29	1
2146	0222	Ninguno	21.329882999999999	-88.517037999999999	29	1
2147	0223	Tres Reyes	21.365988000000002	-88.612808000000001	29	1
2148	0224	Tres Reyes	21.351754	-88.514356000000006	29	1
2149	0225	X-Cuclín	21.327273999999999	-88.533968000000002	29	1
2150	0226	X-Azul	21.323118999999998	-88.508613999999994	29	1
2151	0227	X-Tab	21.396519000000001	-88.505401000000006	29	1
2152	0228	Zacatecas	21.408158	-88.613640000000004	29	1
2153	0229	Actún	21.310994999999998	-88.766819999999996	29	1
2154	0230	La Bendición de Dios	21.338016	-88.784306999999998	29	1
2155	0231	Chich Put	21.325983000000001	-88.967141999999996	29	1
2156	0232	Choco Há	21.385604000000001	-88.626378000000003	29	1
2157	0234	Limón	21.330085	-88.821383999999995	29	1
2158	0235	Pénjamo	21.308250000000001	-88.776909000000003	29	1
2159	0236	San Martín	21.232222	-88.954447000000002	29	1
2160	0237	Rancho Quieto	21.319804999999999	-88.682348000000005	29	1
2161	0238	Cheen Zapata	21.314240000000002	-88.915975000000003	29	1
2162	0239	San Antonio Aké	21.266061000000001	-88.887241000000003	29	1
2163	0240	San Martín	21.335514	-88.808985000000007	29	1
2164	0241	San Ramón	21.376719000000001	-88.584397999999993	29	1
2165	0243	Santa Raymunda	21.335041	-88.853525000000005	29	1
2166	0244	Santo Domingo	21.275278	-88.940072999999998	29	1
2167	0245	Sisbic	21.305465000000002	-88.757244999999998	29	1
2168	0251	Santa Rita	21.273401	-88.925269	29	1
2169	0252	Winico	21.267657	-88.92174	29	1
2170	0255	La Paloma	21.384136999999999	-88.594736999999995	29	1
2171	0256	Tres Hermanos	21.26792	-88.967287999999996	29	1
2172	0257	Tres Reyes	21.418842000000001	-88.531806000000003	29	1
2173	0258	Ninguno [UAIM]	21.262696999999999	-88.933997000000005	29	1
2174	0259	La Herradura	21.226254999999998	-88.935953999999995	29	1
2175	0260	San Francisco	21.258797999999999	-88.960053000000002	29	1
2176	0261	Juárez	21.264917000000001	-88.975416999999993	29	1
2177	0262	Edilberto Argáez	21.259896999999999	-88.930451000000005	29	1
2178	0263	San Marcos	21.241952000000001	-88.926861000000002	29	1
2179	0264	San Luis	21.229994000000001	-88.901561000000001	29	1
2180	0265	San Juan Dos	21.243547	-88.933023000000006	29	1
2181	0266	San Andrés [Rancho]	21.279937	-88.947453999999993	29	1
2182	0267	Nelly Dos [Unidad Agrícola]	21.269715999999999	-88.973920000000007	29	1
2183	0268	Santa Rosa Anexa	21.400960999999999	-88.582402000000002	29	1
2184	0269	San Antonio	21.346084999999999	-88.527790999999993	29	1
2185	0270	Santa María	21.386869000000001	-88.490673000000001	29	1
2186	0271	La Sascabera	21.355601	-88.550747999999999	29	1
2187	0272	Angelita	21.309799000000002	-88.888891000000001	29	1
2188	0273	San Quintín	21.266033	-88.990350000000007	29	1
2189	0276	Chumul	21.244119000000001	-88.935950000000005	29	1
2190	0277	Manuelita Uno	21.318777000000001	-88.905966000000006	29	1
2191	0279	Wolna	21.340463	-88.574431000000004	29	1
2192	0280	San Felipe	21.345480999999999	-88.847869000000003	29	1
2193	0281	El Manantial	21.397756000000001	-88.715280000000007	29	1
2194	0282	El Oasis	21.392941	-88.743947000000006	29	1
2195	0001	Dzitás	20.839866000000001	-88.527822	30	1
2196	0008	Xocempich	20.771370000000001	-88.571809000000002	30	1
2197	0016	Cocil	20.759892000000001	-88.663336999999999	30	1
2198	0032	Lanchén	20.860361999999999	-88.432139000000006	30	1
2199	0034	X-Noh Sahcab	20.810496000000001	-88.547690000000003	30	1
2200	0035	X-Cajún	20.828302000000001	-88.544397000000004	30	1
2201	0036	Petka	20.868511000000002	-88.413983999999999	30	1
2202	0043	San Andrés	20.821574999999999	-88.569452999999996	30	1
2203	0056	Santa Bárbara	20.842313000000001	-88.559404000000001	30	1
2204	0063	Santa Rosa	20.8705	-88.461850999999996	30	1
2205	0065	Tahchevilá	20.905723999999999	-88.452828999999994	30	1
2206	0076	Yaxché	20.728954000000002	-88.547578999999999	30	1
2207	0078	San Gregorio	20.890115999999999	-88.433779999999999	30	1
2208	0079	San Pedro	20.844176000000001	-88.559258999999997	30	1
2209	0081	Juan Pedro Sosa Albornoz	20.829521	-88.539447999999993	30	1
2210	0082	Santa Inés	20.830632999999999	-88.539180999999999	30	1
2211	0083	Rancho San Mateo	20.825704999999999	-88.541775000000001	30	1
2212	0084	Belén Uno	20.834990999999999	-88.533068	30	1
2213	0086	Chumul	20.798500000000001	-88.494839999999996	30	1
2214	0087	Doce de Diciembre	20.851702	-88.518497999999994	30	1
2215	0088	Dzitcacao	20.857862000000001	-88.493508000000006	30	1
2216	0089	San Antonio Moo Itzá	20.864191000000002	-88.504278999999997	30	1
2217	0090	Poplá	20.825742000000002	-88.519211999999996	30	1
2218	0091	Akit	20.871212	-88.433063000000004	30	1
2219	0092	Federico Passler	20.767645999999999	-88.572192000000001	30	1
2220	0001	Dzoncauich	21.129163999999999	-88.890930999999995	31	1
2221	0002	Chacmay	21.050991	-88.892509000000004	31	1
2222	0003	Kancabchén	21.081949000000002	-88.801927000000006	31	1
2223	0004	San Francisco	21.126624	-88.874690999999999	31	1
2224	0007	Kanán	21.067643	-88.833360999999996	31	1
2225	0008	Kuk	21.045164	-88.838837999999996	31	1
2226	0010	El Paraíso Dos	21.140498000000001	-88.875288999999995	31	1
2227	0011	San Antonio Castellanos	21.113945999999999	-88.866377	31	1
2228	0012	San Antonio Haas	21.080888000000002	-88.870609999999999	31	1
2229	0014	San Rafael	21.130807999999998	-88.911161000000007	31	1
2230	0015	Santa Ana	21.108601	-88.872866000000002	31	1
2231	0019	San Lorenzo	21.138438000000001	-88.879766000000004	31	1
2232	0021	Tekik	21.082705000000001	-88.852885000000001	31	1
2233	0022	Santa Trinidad	21.130956000000001	-88.880548000000005	31	1
2234	0023	Xchay	21.120992999999999	-88.874983999999998	31	1
2235	0024	Xolom	21.101127000000002	-88.837305000000001	31	1
2236	0026	La Guadalupana	21.116934000000001	-88.888938999999993	31	1
2237	0027	Emiliano Zapata	21.127386000000001	-88.916679000000002	31	1
2238	0032	Santa María	21.116696000000001	-88.890062	31	1
2239	0033	San Miguel	21.139006999999999	-88.878397000000007	31	1
2240	0037	San Julián	21.137022000000002	-88.886105999999998	31	1
2241	0038	Chenkulú	21.159065999999999	-88.862457000000006	31	1
2242	0040	Nah Cuch	21.087962999999998	-88.813822999999999	31	1
2243	0041	Hantún	21.064857	-88.821554000000006	31	1
2244	0042	San José II	21.060383000000002	-88.819744	31	1
2245	0043	San Agustín Uno	21.051397000000001	-88.869459000000006	31	1
2246	0044	San Felipe	21.102530000000002	-88.892583999999999	31	1
2247	0045	San Gabriel	21.11262	-88.889268000000001	31	1
2248	0046	Lourdes	21.120470000000001	-88.879615999999999	31	1
2249	0047	San Pedro	21.140875999999999	-88.890158999999997	31	1
2250	0048	Las Tres Cruces	21.151814000000002	-88.861115999999996	31	1
2251	0049	San Esteban	21.082588000000001	-88.823243000000005	31	1
2252	0050	San Nicolás	21.081029000000001	-88.818072000000001	31	1
2253	0051	Los Compadres	21.046203999999999	-88.844199000000003	31	1
2254	0052	San Albino	21.066841	-88.807404000000005	31	1
2255	0053	Irak	21.063499	-88.830647999999997	31	1
2256	0054	San José	21.086227000000001	-88.806712000000005	31	1
2257	0055	San Juan	21.108243000000002	-88.886458000000005	31	1
2258	0056	Santa Pilar	21.067844999999998	-88.781704000000005	31	1
2259	0057	Santa Teresa	21.108263000000001	-88.884586999999996	31	1
2260	0058	Xtup	21.064917000000001	-88.792175	31	1
2261	0059	Emilia	21.078310999999999	-88.810453999999993	31	1
2262	0061	San Isidro	21.123251	-88.881553999999994	31	1
2263	0062	Los Nopales	21.081156	-88.828684999999993	31	1
2264	0063	Miguel Canché	21.085222999999999	-88.833129	31	1
2265	0064	San Antonio Xtup	21.065169000000001	-88.803690000000003	31	1
2266	0065	San Marcos	21.105668000000001	-88.891890000000004	31	1
2267	0066	San Martín	21.127804999999999	-88.867464999999996	31	1
2268	0067	Los Álamos	21.107182000000002	-88.893291000000005	31	1
2269	0068	Unión Cinco Mil	21.078410999999999	-88.825663000000006	31	1
2270	0001	Espita	21.011053	-88.306822999999994	32	1
2271	0002	Holcá	21.091864000000001	-88.268715999999998	32	1
2272	0003	Kunché	20.909782	-88.304085000000001	32	1
2273	0004	Nacuché	20.923228999999999	-88.296482999999995	32	1
2274	0005	San Pedro Chenchelá	20.874803	-88.314081000000002	32	1
2275	0006	Santa Cruz Regadío	21.092991000000001	-88.296808999999996	32	1
2276	0007	Tuzik	21.113019999999999	-88.472069000000005	32	1
2277	0008	X-Ualtez	21.123367999999999	-88.472327000000007	32	1
2278	0009	Xuilub	20.916802000000001	-88.420574000000002	32	1
2279	0011	Santa María Humuch	21.112300000000001	-88.447281000000004	32	1
2280	0012	Santa Martha Dzitox	21.079536999999998	-88.464206000000004	32	1
2281	0013	X-Noh Há	21.140682000000002	-88.461781999999999	32	1
2282	0015	Santa Cruz	21.093616000000001	-88.292479999999998	32	1
2283	0016	Poom	21.058859000000002	-88.420987999999994	32	1
2284	0019	San José Cab	21.016088	-88.325770000000006	32	1
2285	0020	Yokdzonot Norte	21.046564	-88.376617999999993	32	1
2286	0021	X-Cocay	20.962478000000001	-88.429253000000003	32	1
2287	0022	Yohom	20.964786	-88.244488000000004	32	1
2288	0023	San Vicente	20.978814	-88.308370999999994	32	1
2289	0027	Yowas	21.082028000000001	-88.381767999999994	32	1
2290	0028	San Luis Yohtzatz	21.073125999999998	-88.378585999999999	32	1
2291	0031	Tzab-Nah	20.979561	-88.443286000000001	32	1
2292	0032	Chiople	21.039227	-88.375214999999997	32	1
2293	0033	Chocholá	20.892281000000001	-88.27946	32	1
2294	0034	Tzitzilá	21.030863	-88.245249000000001	32	1
2295	0037	Mahi-Cab	20.972877	-88.385116999999994	32	1
2296	0040	Kalacdzonot	21.098754	-88.325819999999993	32	1
2297	0044	San Miguel	20.926599	-88.306754999999995	32	1
2298	0045	Santa María	21.044279	-88.241380000000007	32	1
2299	0047	Tahchebilá	21.061999	-88.291180999999995	32	1
2300	0048	Los Pericos	20.959817999999999	-88.228575000000006	32	1
2301	0049	Xcuch	20.969275	-88.269508999999999	32	1
2302	0054	Bulak	21.080613	-88.440396000000007	32	1
2303	0056	X-Uech	20.909801000000002	-88.285101999999995	32	1
2304	0058	Yokdzonot	20.924091000000001	-88.429806999999997	32	1
2305	0059	Yokdzonot	21.048611000000001	-88.407965000000004	32	1
2306	0060	Yokdzonot	21.175585000000002	-88.478451000000007	32	1
2307	0063	X-Bacoc	21.067155	-88.443398999999999	32	1
2308	0065	San Pedro Xualtez	21.169279	-88.481801000000004	32	1
2309	0066	Santo Domingo	21.093996000000001	-88.331063999999998	32	1
2310	0068	San Antonio	20.963953	-88.227891	32	1
2311	0072	Santa Genoveva	20.966221999999998	-88.383131000000006	32	1
2312	0073	Kandzonot	20.992698000000001	-88.460549	32	1
2313	0074	Poxil	21.006070999999999	-88.459913999999998	32	1
2314	0075	Guadalupe	20.988049	-88.444706999999994	32	1
2315	0077	San Luis	20.989998	-88.436571999999998	32	1
2316	0078	San Miguel Xopnah	21.000657	-88.432064999999994	32	1
2317	0081	Santa Rosa X-Tohil	21.002405	-88.416846000000007	32	1
2318	0083	Xlimón	21.008091	-88.406037999999995	32	1
2319	0084	San Francisco	21.008832999999999	-88.381563999999997	32	1
2320	0085	X-Uenkal	21.006356	-88.379863999999998	32	1
2322	0088	El Álamo	21.085270000000001	-88.437618000000001	32	1
2323	0091	Chan Chocholá	20.898745000000002	-88.282264999999995	32	1
2324	0093	Yaxché	20.92183	-88.310597999999999	32	1
2325	0094	Yokdzadz	21.069462000000001	-88.223358000000005	32	1
2326	0095	Bel-Há	20.901357999999998	-88.404229999999998	32	1
2327	0096	Guadalupe	20.996276999999999	-88.348403000000005	32	1
2328	0097	Chan Dzonot	21.140072	-88.501676000000003	32	1
2329	0098	Dzadz Pichí	21.116374	-88.328158999999999	32	1
2330	0099	Dzemul	21.154468999999999	-88.503894000000003	32	1
2331	0102	San Agustín	21.010290000000001	-88.259186999999997	32	1
2332	0103	San Antonio	21.170114999999999	-88.461866000000001	32	1
2333	0106	San Juan	21.163070999999999	-88.502910999999997	32	1
2334	0107	San Pedro	21.130904000000001	-88.335384000000005	32	1
2335	0109	Rancho Viejo	20.990551	-88.329144999999997	32	1
2336	0110	Ninguno	20.982247000000001	-88.338403	32	1
2337	0111	San Martín	20.982800999999998	-88.455333999999993	32	1
2338	0112	Dzibi-Ac	21.119440999999998	-88.270133999999999	32	1
2339	0113	Tuzick	21.140453000000001	-88.331506000000005	32	1
2340	0114	Yokdzonot	20.998498999999999	-88.268970999999993	32	1
2341	0115	Bugambilias	21.017592	-88.404898000000003	32	1
2342	0116	Yonicté	21.147825999999998	-88.501080999999999	32	1
2343	0117	San Martín	20.929057	-88.296165999999999	32	1
2344	0118	Dos Jotas	20.911301999999999	-88.409073000000006	32	1
2345	0119	Guadalupe	20.905332000000001	-88.396686000000003	32	1
2346	0120	Santa Julia	20.902749	-88.391705999999999	32	1
2347	0121	Ninguno	20.891342999999999	-88.270508000000007	32	1
2348	0122	Cruz Ché	20.885528999999998	-88.281419	32	1
2349	0123	Benito Juárez [Albergue Escolar]	20.931495999999999	-88.298007999999996	32	1
2350	0124	Chí May	21.135686	-88.478606999999997	32	1
2351	0126	Pithá [Unidad Frutícola]	21.032018999999998	-88.306775000000002	32	1
2352	0127	Escuela Secundaria Técnica Número Doce	21.008578	-88.283252000000005	32	1
2353	0128	Estrella de Oriente	21.154111	-88.466048999999998	32	1
2354	0129	Yodzadz	21.117918	-88.492948999999996	32	1
2355	0130	San Martín Dos	21.160881	-88.465738999999999	32	1
2356	0131	Santa Teresita	21.121299	-88.307952	32	1
2357	0132	El Nopal	21.118811000000001	-88.490223999999998	32	1
2358	0133	Las Dos Marías	21.149045999999998	-88.466521999999998	32	1
2359	0134	Mi Pequeño	21.134374000000001	-88.475331999999995	32	1
2360	0135	La Rejollada	21.007189	-88.291111000000001	32	1
2361	0136	San Isidro	21.141459000000001	-88.466256000000001	32	1
2362	0138	San José	21.164453999999999	-88.467524999999995	32	1
2363	0139	Santa Elena	21.151599000000001	-88.466256000000001	32	1
2364	0140	Santa Rita	21.093771	-88.287919000000002	32	1
2365	0141	Santa Rita	21.109883	-88.306985999999995	32	1
2366	0142	Santo Domingo	21.124013999999999	-88.309179999999998	32	1
2367	0144	San Lorenzo Jomá	20.837751999999998	-88.304438000000005	32	1
2368	0145	Actunkú	20.993895999999999	-88.294597999999993	32	1
2369	0146	El Garañón	21.082217	-88.299915999999996	32	1
2370	0147	Guadalupe	21.004584000000001	-88.347662999999997	32	1
2371	0148	Viviano Poot	20.972415999999999	-88.339759000000001	32	1
2372	0149	San Julián	20.991046000000001	-88.322297000000006	32	1
2373	0150	Mario Alberto Díaz Aguilar	20.997198000000001	-88.303113999999994	32	1
2374	0151	El Pedregal	21.119091000000001	-88.480046999999999	32	1
2375	0152	Guadalupe	20.996524000000001	-88.300229999999999	32	1
2376	0153	San Jorge	21.023966000000001	-88.314132000000001	32	1
2377	0154	San Isidro	21.005203000000002	-88.277461000000002	32	1
2378	0155	Kancabá	21.049315	-88.325614000000002	32	1
2379	0156	Montecristo	21.006164999999999	-88.356544	32	1
2380	0157	Pit Há	21.031647	-88.304327000000001	32	1
2381	0158	Rejoyada	21.025738	-88.452845999999994	32	1
2382	0159	San Francisco	21.011420000000001	-88.316925999999995	32	1
2383	0160	Santa Librada	20.994691	-88.299991000000006	32	1
2384	0161	Kukila	21.034087	-88.305898999999997	32	1
2385	0163	Santa Cruz Número Cuatro	21.018470000000001	-88.340607000000006	32	1
2386	0164	Santa Cruz Regadío Número Dos [Tabacalera]	21.087997999999999	-88.300998000000007	32	1
2387	0165	Santa Fe	21.122042	-88.497798000000003	32	1
2388	0166	Tres Cuartos	21.049322	-88.306494999999998	32	1
2389	0167	Álamos	21.091743999999998	-88.307986	32	1
2390	0168	El Retoño [Unidad Agrícola]	20.991738999999999	-88.320707999999996	32	1
2391	0169	Xtunil	21.14761	-88.471855000000005	32	1
2392	0170	Yax-Há	20.949352000000001	-88.451868000000005	32	1
2393	0171	Chan Kumché	21.002482000000001	-88.263591000000005	32	1
2394	0172	Chan Tahchebilá	21.064464000000001	-88.294859000000002	32	1
2395	0173	Pénjamo	21.012589999999999	-88.292979000000003	32	1
2396	0174	San Eduardo	21.010975999999999	-88.252402000000004	32	1
2397	0175	San Isidro	21.016389	-88.314522999999994	32	1
2398	0176	San Rafael	21.097301999999999	-88.306668000000002	32	1
2399	0177	Yalnom	21.068785999999999	-88.287420999999995	32	1
2400	0178	La Esperanza	21.010929000000001	-88.296648000000005	32	1
2401	0179	Akachen	20.981206	-88.317006000000006	32	1
2402	0180	Los Almendros	20.997903000000001	-88.318202999999997	32	1
2403	0181	X-Babaín	21.055558000000001	-88.363664999999997	32	1
2404	0182	Los Cucuyos	20.991446	-88.318933999999999	32	1
2405	0183	Akachen	20.990853000000001	-88.326278000000002	32	1
2406	0184	San Antonio Dos	21.131422000000001	-88.273493000000002	32	1
2407	0185	San Antonio Uno	21.132062999999999	-88.278536000000003	32	1
2408	0186	Chak Há	21.136917	-88.467421999999999	32	1
2409	0187	Chan Che'en	20.998856	-88.414494000000005	32	1
2410	0188	Flamboyanes Uno	21.112957999999999	-88.483485999999999	32	1
2411	0189	Chan Tuzik	21.119721999999999	-88.470760999999996	32	1
2412	0190	El Nopal Uno	21.115931	-88.486082999999994	32	1
2413	0191	San Felipe de Asís	21.133891999999999	-88.470319000000003	32	1
2414	0192	Xuilubito	20.913031	-88.408574999999999	32	1
2415	0193	Ninguno [Vivero]	20.9895	-88.304693999999998	32	1
2416	0194	San Ramón	20.994928000000002	-88.315340000000006	32	1
2417	0001	Halachó	20.477755999999999	-90.082148000000004	33	1
2418	0002	Cepeda	20.506149000000001	-90.109611999999998	33	1
2419	0003	Cuch Holoch	20.435434000000001	-90.097453000000002	33	1
2420	0004	Kancabchén	20.525926999999999	-90.138143999999997	33	1
2421	0005	San Mateo	20.590814000000002	-90.212992	33	1
2422	0006	Santa María Acú	20.547782000000002	-90.163537000000005	33	1
2423	0007	Sihó	20.486623999999999	-90.163110000000003	33	1
2424	0008	Dzidzibachí	20.570235	-90.126420999999993	33	1
2425	0009	Concepción	20.512830999999998	-90.183488999999994	33	1
2426	0010	Cortez	20.560174	-90.134614999999997	33	1
2427	0012	Chulilá	20.465816	-90.060872000000003	33	1
2428	0014	Nuestra Señora de Guadalupe	20.476634000000001	-90.100122999999996	33	1
2429	0018	Dzidzilché	20.453870999999999	-90.103756000000004	33	1
2430	0020	Felipe Carrillo Puerto	20.487189000000001	-90.060230000000004	33	1
2431	0022	Kuncheil	20.450899	-90.054899000000006	33	1
2432	0024	Luis Echeverría	20.529048	-90.175748999999996	33	1
2433	0025	El Naranjo	20.640808	-90.245833000000005	33	1
2434	0026	Paraíso	20.574154	-90.228123999999994	33	1
2435	0027	Pet-Ak	20.670922999999998	-90.259105000000005	33	1
2436	0028	Petac	20.504013	-90.075407999999996	33	1
2437	0029	San Antonio	20.589634	-90.226461	33	1
2438	0031	Santa Catalina	20.484248000000001	-90.060747000000006	33	1
2439	0032	San Fernando	20.534064999999998	-90.178388999999996	33	1
2440	0033	San Francisco	20.585726999999999	-90.150962000000007	33	1
2441	0036	San Juan	20.487738	-90.063142999999997	33	1
2442	0037	San Juan	20.560941	-90.238444000000001	33	1
2443	0039	San Luis Holcá	20.485204	-90.097716000000005	33	1
2444	0042	San Manuel	20.487939999999998	-90.064752999999996	33	1
2445	0043	San Martín	20.463011000000002	-90.143583000000007	33	1
2446	0044	San Pedro	20.447680999999999	-90.087746999999993	33	1
2447	0047	San Salvador Uno	20.463549	-90.087271000000001	33	1
2448	0048	Santa Sofía	20.549022999999998	-90.200405000000003	33	1
2449	0049	San Valentín	20.619188999999999	-90.219448999999997	33	1
2450	0050	San Vicente	20.502621000000001	-90.070290999999997	33	1
2451	0052	Ninguno	20.534220999999999	-90.149129000000002	33	1
2452	0053	Ninguno	20.515385999999999	-90.175488000000001	33	1
2453	0059	X-Kú Paloma	20.473333	-90.055982	33	1
2454	0060	Cervera Uno [Unidad Agrícola]	20.504815000000001	-90.080054000000004	33	1
2455	0063	Cepeda	20.52525	-90.065279000000004	33	1
2456	0070	Santa Camila	20.457097000000001	-90.088209000000006	33	1
2457	0071	Botánico	20.473687999999999	-90.062679000000003	33	1
2458	0072	Concepción	20.448599000000002	-90.086978999999999	33	1
2459	0073	Coplamar	20.486975999999999	-90.055796000000001	33	1
2460	0074	Chun Kanán	20.480712	-90.054361999999998	33	1
2461	0075	Chunbec	20.476749000000002	-90.045781000000005	33	1
2462	0077	Santa María	20.455974000000001	-90.087877000000006	33	1
2463	0078	San Alberto	20.454084000000002	-90.089337999999998	33	1
2464	0079	San Francisco Uno	20.490742000000001	-90.065841000000006	33	1
2465	0080	San Francisco Dos	20.491171999999999	-90.068651000000003	33	1
2466	0081	Santa Rosa	20.478567999999999	-90.100003000000001	33	1
2467	0082	San Salvador Dos	20.462305000000001	-90.086990999999998	33	1
2468	0083	Valdivia	20.451619000000001	-90.074073999999996	33	1
2469	0085	Eliasal Mut Cantún	20.490627	-90.096372000000002	33	1
2470	0086	Bachoco [Granja]	20.499696	-90.163773000000006	33	1
2471	0087	San Diego	20.437434	-90.107108999999994	33	1
2472	0088	San Joaquín Chumpich	20.484413	-90.103519000000006	33	1
2473	0089	Unidad Cervera	20.509443999999998	-90.072500000000005	33	1
2474	0090	San Francisco	20.627132	-90.215913	33	1
2475	0092	Moyel [Maquiladora]	20.505123999999999	-90.072710000000001	33	1
2476	0094	San Pedro	20.530002	-90.173040999999998	33	1
2477	0095	San Valentín	20.530332000000001	-90.140405999999999	33	1
2478	0097	San Lorenzo [Rancho]	20.503236000000001	-90.07141	33	1
2479	0098	Álvaro Bacab	20.502516	-90.071459000000004	33	1
2480	0101	Ku Polón	20.504456000000001	-90.214958999999993	33	1
2481	0102	Miguel Pacheco	20.506406999999999	-90.070633000000001	33	1
2482	0103	Miguel Kep Tucuch	20.465425	-90.061605	33	1
2483	0104	Ramiro Pat	20.488956000000002	-90.096755999999999	33	1
2484	0105	Doña Paula	20.454999999999998	-90.089167000000003	33	1
2485	0106	Monte de los Olimpos	20.487435999999999	-90.058610000000002	33	1
2486	0107	Monte Oreb	20.513867999999999	-90.116643999999994	33	1
2487	0108	Los Naranjos	20.526859999999999	-90.069944000000007	33	1
2488	0109	Guadalupe [Rancho]	20.534374	-90.134485999999995	33	1
2489	0110	San Armando	20.512919	-90.095331999999999	33	1
2490	0111	San Carlos I	20.519321999999999	-90.083940999999996	33	1
2491	0113	San Isidro	20.516908999999998	-90.115915000000001	33	1
2492	0114	Guadalupe [Unidad Agrícola]	20.461221999999999	-90.056679000000003	33	1
2493	0115	San Jacinto [Unidad Agrícola]	20.522407000000001	-90.076927999999995	33	1
2494	0116	San Sebastián	20.488056	-90.043222	33	1
2495	0001	Hocabá	20.816240000000001	-89.245098999999996	34	1
2496	0002	Buenavista	20.819330000000001	-89.219761000000005	34	1
2497	0003	Sahcabá	20.792164	-89.182381000000007	34	1
2498	0010	San Antonio Huculá	20.790863000000002	-89.256311999999994	34	1
2499	0011	Popox	20.821785999999999	-89.283632999999995	34	1
2500	0012	San Antonio Mendoza	20.782805	-89.259915000000007	34	1
2501	0015	San José	20.823141	-89.255393999999995	34	1
2502	0016	San Juan de Dios	20.829903999999999	-89.249213999999995	34	1
2503	0017	San Lorenzo	20.813168999999998	-89.201402999999999	34	1
2504	0020	San Andrés	20.792573999999998	-89.227624000000006	34	1
2505	0021	San Ramón	20.802927	-89.250254999999996	34	1
2506	0022	San Román	20.798452000000001	-89.234558000000007	34	1
2507	0024	Centro de Investigaciones Agrícolas	20.816704999999999	-89.261818000000005	34	1
2508	0026	Santo Domingo	20.800294000000001	-89.266391999999996	34	1
2509	0027	Chaltún Há	20.765506999999999	-89.163649000000007	34	1
2510	0028	Chentú	20.791796000000001	-89.248326000000006	34	1
2511	0031	Kankabchén	20.766463999999999	-89.272903999999997	34	1
2512	0033	San Antonio	20.783560999999999	-89.167170999999996	34	1
2513	0039	Teresita	20.843184000000001	-89.227107000000004	34	1
2514	0042	Kekén	20.823903000000001	-89.222030000000004	34	1
2515	0043	Ninguno	20.826224	-89.243312000000003	34	1
2516	0044	Nance I	20.821007000000002	-89.231228000000002	34	1
2517	0045	San Pedro	20.794066999999998	-89.186788000000007	34	1
2518	0047	Ninguno	20.808820999999998	-89.238882000000004	34	1
2519	0048	El Divino Niño	20.815836000000001	-89.271597999999997	34	1
2520	0049	Santa María	20.804151999999998	-89.249722000000006	34	1
2521	0050	Jesús [Granja]	20.827605999999999	-89.247116000000005	34	1
2522	0051	San Francisco [Invernadero]	20.818155999999998	-89.231052000000005	34	1
2523	0052	Kekén	20.823602000000001	-89.212357999999995	34	1
2524	0053	Nance II	20.820668000000001	-89.228162999999995	34	1
2525	0054	San Mateo	20.830696	-89.256538000000006	34	1
2526	0055	Santa María	20.829404	-89.266098999999997	34	1
2527	0056	Santa Trinidad	20.810161000000001	-89.271369000000007	34	1
2528	0057	Tikinche	20.808214	-89.256409000000005	34	1
2529	0058	Xkopteil	20.807206000000001	-89.210605999999999	34	1
2530	0001	Hoctún	20.865212	-89.202066000000002	35	1
2531	0002	San Antonio Cholul	20.936426000000001	-89.208008000000007	35	1
2532	0004	Dziuché	20.912451999999998	-89.196358000000004	35	1
2533	0005	Wallis	20.878827000000001	-89.173991000000001	35	1
2534	0006	San Isidro	20.849284000000001	-89.192998000000003	35	1
2535	0007	San José Oriente	20.859352999999999	-89.102932999999993	35	1
2536	0008	San José Poniente	20.86619	-89.229225	35	1
2537	0010	X-Colón	20.879299	-89.220286000000002	35	1
2538	0013	Benito Juárez	20.883244000000001	-89.201014000000001	35	1
2539	0020	San Antonio	20.888161	-89.201639999999998	35	1
2540	0024	San Nicolás	20.850549999999998	-89.232860000000002	35	1
2541	0027	Yaxquil	20.854399000000001	-89.154989	35	1
2542	0034	San Miguel Arcángel	20.885237	-89.201233000000002	35	1
2543	0036	Dziuché [Granja Porcícola]	20.914743999999999	-89.204881	35	1
2544	0037	San José Poniente	20.867944000000001	-89.220395999999994	35	1
2545	0038	La Virgen de Guadalupe	20.882560000000002	-89.20102	35	1
2546	0039	Asunción [Granja]	20.869571000000001	-89.206596000000005	35	1
2547	0047	Minelia Cobá [Unidad Agrícola]	20.861722	-89.186918000000006	35	1
2548	0049	Pilanzohol	20.868248000000001	-89.207787999999994	35	1
2549	0051	Wolpoch [Unidad Agrícola]	20.863790999999999	-89.185996000000003	35	1
2550	0053	Servicio Hoctún [Gasolinera]	20.870397000000001	-89.226410999999999	35	1
2551	0054	Netab	20.877649000000002	-89.202489	35	1
2552	0055	Sarabia [Granja]	20.881838999999999	-89.201453999999998	35	1
2553	0057	Pollo Industrializado de México	20.887785000000001	-89.199562999999998	35	1
2554	0058	Enrique Manzanero Cituk	20.855191000000001	-89.154653999999994	35	1
2555	0059	Manuel Matos	20.871551	-89.191581999999997	35	1
2556	0001	Homún	20.739488000000001	-89.285661000000005	36	1
2557	0004	Chenchich	20.583100999999999	-89.135773999999998	36	1
2558	0005	Chen Santo	20.583856000000001	-89.145825000000002	36	1
2559	0006	Chichí Lagos	20.680153000000001	-89.250456999999997	36	1
2560	0007	Kampepén	20.729683999999999	-89.260960999999995	36	1
2561	0010	Polabán	20.732710000000001	-89.219589999999997	36	1
2562	0011	San Antonio Kolondet	20.62369	-89.184603999999993	36	1
2563	0012	San Isidro Ochil	20.636502	-89.342087000000006	36	1
2564	0014	Tzipchac	20.613462999999999	-89.176491999999996	36	1
2565	0016	Yibá	20.654432	-89.192660000000004	36	1
2566	0025	San Antonio Katbéh	20.718605	-89.239541000000003	36	1
2567	0036	San Antonio	20.727488000000001	-89.274073000000001	36	1
2568	0042	Chikuil	20.625343999999998	-89.208845999999994	36	1
2569	0044	Santa Rosa	20.738246	-89.299358999999995	36	1
2570	0045	Santa Cruz Pinto	20.577503	-89.142298999999994	36	1
2571	0046	Kankabchén	20.581927	-89.140395999999996	36	1
2572	0047	Wilpech	20.733021000000001	-89.264849999999996	36	1
2573	0049	Las Tres Cruces	20.725332999999999	-89.276797000000002	36	1
2574	0050	Homún [Basurero]	20.717600000000001	-89.290397999999996	36	1
2575	0053	El Girasol	20.726953000000002	-89.235339999999994	36	1
2576	0054	Jardín del Edén	20.748640999999999	-89.288702999999998	36	1
2577	0055	Erika Carbajal	20.73002	-89.274144000000007	36	1
2578	0057	Antonia Pisté Oy	20.734819000000002	-89.296746999999996	36	1
2579	0058	María Feliz Chim Dzul	20.733868999999999	-89.296683000000002	36	1
2580	0062	La Noria	20.737646000000002	-89.300604000000007	36	1
2581	0063	El Divino Niño [Rancho]	20.726777999999999	-89.274030999999994	36	1
2582	0064	San José	20.726164000000001	-89.288781	36	1
2583	0066	San Pedro Yaxnic	20.590803999999999	-89.145948000000004	36	1
2584	0067	San Sebastián	20.750050000000002	-89.293047999999999	36	1
2585	0068	Santa Bárbara	20.737736000000002	-89.299834000000004	36	1
2586	0069	Xijón	20.714531000000001	-89.272356000000002	36	1
2587	0070	Yalahau	20.656804999999999	-89.219308999999996	36	1
2588	0071	María Esperanza Balam	20.733968999999998	-89.295727999999997	36	1
2589	0072	Irma Canché Pacheco	20.733553000000001	-89.297651999999999	36	1
2590	0073	Patricia Bacab	20.733115000000002	-89.296960999999996	36	1
2591	0074	Elidé Camargo	20.732011	-89.295394999999999	36	1
2592	0075	San Juan	20.725961000000002	-89.277056999999999	36	1
2593	0076	Bal-Mil	20.742128000000001	-89.249724999999998	36	1
2594	0077	El Charquito	20.729472000000001	-89.274068999999997	36	1
2595	0078	Yaak'almuch	20.721422	-89.273111	36	1
2596	0079	Yaxbacaltún	20.727135000000001	-89.268792000000005	36	1
2597	0001	Huhí	20.724990999999999	-89.162199000000001	37	1
2598	0002	Tixcacal Quintero	20.638473999999999	-89.123932999999994	37	1
2599	0003	Acapulco	20.723314999999999	-89.173592999999997	37	1
2600	0006	Candelaria	20.713018999999999	-89.182670000000002	37	1
2601	0008	Culul	20.645474	-89.177860999999993	37	1
2602	0014	Guadalupe	20.701497	-89.171514000000002	37	1
2603	0022	San Antonio	20.715716	-89.165103000000002	37	1
2604	0035	Santa Rosa	20.709513999999999	-89.151769999999999	37	1
2605	0043	Uxutún	20.709797999999999	-89.193101999999996	37	1
2606	0045	Yaxaan	20.701784	-89.118087000000003	37	1
2607	0056	San Miguel Uno	20.705984000000001	-89.101888000000002	37	1
2608	0057	San Pedro	20.709917999999998	-89.146499000000006	37	1
2609	0058	Kuncheilá	20.704917999999999	-89.096673999999993	37	1
2610	0064	Tixcupul	20.734162999999999	-89.108700999999996	37	1
2611	0065	San Nicolás	20.717936000000002	-89.177239999999998	37	1
2612	0066	Santa Cruz	20.718596000000002	-89.167929000000001	37	1
2613	0067	Guadalupe	20.716434	-89.159273999999996	37	1
2614	0068	Santa Cruz	20.713719999999999	-89.154855999999995	37	1
2615	0070	Usil	20.703951	-89.116517999999999	37	1
2616	0073	San Luis	20.727879000000001	-89.182411000000002	37	1
2617	0075	Ninguno	20.633445999999999	-89.123525999999998	37	1
2618	0076	Xtojil [Unidad Hortícola Anexa]	20.745895999999998	-89.162979000000007	37	1
2619	0077	San Cesáreo Chilitux	20.694496999999998	-89.166886000000005	37	1
2620	0079	Xtojil [Unidad Hortícola]	20.747071999999999	-89.162379000000001	37	1
2621	0080	Xtojil	20.704639	-89.128591999999998	37	1
2622	0081	San Miguel	20.674721999999999	-89.183055999999993	37	1
2623	0001	Hunucmá	21.016154	-89.877052000000006	38	1
2624	0002	Hunkanab	20.964753000000002	-89.857071000000005	38	1
2625	0003	San Antonio Chel	20.996855	-89.813892999999993	38	1
2626	0004	Sisal	21.164898000000001	-90.032539999999997	38	1
2627	0005	Texán de Palomeque	20.932051999999999	-89.829730999999995	38	1
2628	0010	San Miguel Chac	21.038575999999999	-89.813304000000002	38	1
2629	0017	San José	21.041416999999999	-89.894820999999993	38	1
2630	0020	Álvaro Obregón	20.998569	-89.894013000000001	38	1
2631	0021	Arriba y Adelante	21.077314999999999	-89.932751999999994	38	1
2632	0028	X-Kunhac	21.044699999999999	-89.865787999999995	38	1
2633	0029	Chencopó	21.075375000000001	-89.953768999999994	38	1
2634	0030	Final Uno	21.076086	-89.954931000000002	38	1
2635	0035	Chunhuás	21.085756	-89.940360999999996	38	1
2636	0036	Chunhuayún Uno	21.048860000000001	-89.902968999999999	38	1
2637	0038	Ana Cristina	21.029367000000001	-89.829027999999994	38	1
2638	0039	San Manuel	20.996676999999998	-89.898416999999995	38	1
2639	0040	Guadalupe Dos	21.036283999999998	-89.839242999999996	38	1
2640	0047	Chunhuayún Dos	21.045095	-89.902497999999994	38	1
2641	0051	Xkakalhá	21.119615	-89.847082	38	1
2642	0052	Koopxaan	21.135345000000001	-89.832836	38	1
2643	0054	Las Armas	21.116764	-89.999050999999994	38	1
2644	0055	Chunbohón	21.094526999999999	-89.876410000000007	38	1
2645	0056	Benhacab	20.989674000000001	-89.858160999999996	38	1
2646	0059	Sinab	21.066261000000001	-89.873199	38	1
2647	0062	Paraíso	21.026724000000002	-89.850921999999997	38	1
2648	0067	San Antonio	20.926915000000001	-89.833560000000006	38	1
2649	0068	San Bartolomé	20.953361000000001	-89.840580000000003	38	1
2650	0069	Chan Rancho	21.040405	-89.934430000000006	38	1
2651	0070	San Miguel Yaxché	21.031997	-89.854916000000003	38	1
2652	0071	San Francisco	21.029098999999999	-89.834490000000002	38	1
2653	0072	San Jerónimo	21.060288	-89.856792999999996	38	1
2654	0073	San Joaquín	21.046894000000002	-89.929835999999995	38	1
2655	0075	San Luis	20.933731000000002	-89.844244000000003	38	1
2656	0076	San Mateo	21.056977	-89.872440999999995	38	1
2657	0078	San Patricio	21.033726000000001	-89.807906000000003	38	1
2658	0079	San Pedro Huché	21.062697	-89.930814999999996	38	1
2659	0080	San Pedro	21.033000000000001	-89.843076999999994	38	1
2660	0081	San Román Tres	21.071532000000001	-89.909153000000003	38	1
2661	0082	San Román Cuatro	21.071801000000001	-89.914801999999995	38	1
2662	0083	San Román Dos	21.059688000000001	-89.908651000000006	38	1
2663	0084	San Román Seis	21.059452	-89.895737999999994	38	1
2664	0085	San Román Cinco	21.071096000000001	-89.901837999999998	38	1
2665	0086	San Román Uno	21.059417	-89.901607999999996	38	1
2666	0090	Santa Cruz	21.032720000000001	-89.849986000000001	38	1
2667	0092	Tacubaya	21.083335999999999	-89.876158000000004	38	1
2668	0095	Komulhó	21.056598999999999	-89.916233000000005	38	1
2669	0096	Xcucul	21.041169	-89.851699999999994	38	1
2670	0099	Felipe Carrillo Puerto	20.987234999999998	-89.858615999999998	38	1
2671	0114	Hunucmá [Basurero Municipal]	21.040941	-89.911818999999994	38	1
2672	0115	La Central	21.035938000000002	-89.818100999999999	38	1
2673	0117	Chuncopó	21.010061	-89.92201	38	1
2674	0118	Cruz Jabín	21.010543999999999	-89.905452999999994	38	1
2675	0119	Chunlok	21.014804000000002	-89.937298999999996	38	1
2676	0121	Guadalupe Uno	21.029890000000002	-89.843851000000001	38	1
2677	0122	La Asunción	21.027291000000002	-89.849688	38	1
2678	0124	Los Tres Reyes	20.999233	-89.861545000000007	38	1
2679	0125	Kakacob	21.016207999999999	-89.927513000000005	38	1
2680	0126	Mahzul Uno	20.925225999999999	-89.830900999999997	38	1
2681	0128	Sahcabá Uno	20.918434000000001	-89.828143999999995	38	1
2682	0129	Sahcabá Dos	20.920929000000001	-89.824665999999993	38	1
2683	0130	San Carlos	21.040935999999999	-89.837519999999998	38	1
2684	0131	San Felipe	20.984310000000001	-89.850622999999999	38	1
2685	0132	Santa Isabel	20.996645999999998	-89.841707999999997	38	1
2686	0133	San Juan	20.989808	-89.841847999999999	38	1
2687	0134	San Juan	20.986564999999999	-89.871474000000006	38	1
2688	0135	San Vicente Seis	20.998282	-89.871567999999996	38	1
2689	0136	Tres Reyes	21.014101	-89.900441999999998	38	1
2690	0137	Aurelio Cocom	21.004279	-89.898993000000004	38	1
2691	0138	Pecis	21.182756000000001	-89.979530999999994	38	1
2692	0139	Lourdes	20.998987	-89.848798000000002	38	1
2693	0140	Sabilera del Mayab [Agroindustria]	21.030270000000002	-89.836224000000001	38	1
2694	0141	Adrián	21.030180999999999	-89.834457999999998	38	1
2695	0142	La Capilla	21.089639999999999	-89.968227999999996	38	1
2696	0144	Colegio de Bachilleres de Yucatán	21.027222999999999	-89.848787000000002	38	1
2697	0145	Concepción Guadalupe	21.043725999999999	-89.872891999999993	38	1
2698	0147	Emilio	21.029722	-89.831389000000001	38	1
2699	0148	Hunucmá	21.026274000000001	-89.894683999999998	38	1
2700	0151	Hunucmá	21.007991000000001	-89.89949	38	1
2701	0152	Hunucmá	21.004992999999999	-89.895567999999997	38	1
2702	0156	Julian Mex	21.033871000000001	-89.900236000000007	38	1
2703	0157	Pedro Pablo Cetina Cauich	21.037329	-89.866964999999993	38	1
2704	0158	Luis Cepeda [Parcela Colectiva]	21.029468999999999	-89.845220999999995	38	1
2705	0159	Mezquita	21.032705	-89.832402999999999	38	1
2706	0160	Hunucmá [Unidad Deportiva]	21.027823000000001	-89.847617999999997	38	1
2707	0161	Rafael Pat	20.998563999999998	-89.861401999999998	38	1
2708	0162	Felipe Canul	21.000419000000001	-89.893317999999994	38	1
2709	0163	Nabanché	21.009844999999999	-89.913889999999995	38	1
2710	0164	San Fernando	20.979232	-89.856013000000004	38	1
2711	0165	San José	21.118223	-89.997152999999997	38	1
2712	0166	San Lorenzo	20.999700000000001	-89.824203999999995	38	1
2713	0167	San Miguel	21.038527999999999	-89.806065000000004	38	1
2714	0168	Don David	21.059404000000001	-89.934719999999999	38	1
2715	0169	Xoe	21.012309999999999	-89.900604000000001	38	1
2716	0170	El Dazam (San Luis)	21.041401	-89.910176000000007	38	1
2717	0171	Don David [Granja Porcícola]	21.056712000000001	-89.930593000000002	38	1
2718	0173	El Portón Negro	20.998495999999999	-89.899471000000005	38	1
2719	0174	Encalada	20.989657000000001	-89.907675999999995	38	1
2720	0175	Los Canadienses	21.177398	-89.991910000000004	38	1
2721	0176	La Marca	21.198384000000001	-89.952869000000007	38	1
2722	0177	Santa Cruz [Unidad]	21.046227999999999	-89.917428999999998	38	1
2723	0178	Ligia María [Quinta]	20.999782	-89.850882999999996	38	1
2724	0179	Ninguno	20.999525999999999	-89.839349999999996	38	1
2725	0180	Popolá	20.991513000000001	-89.839490999999995	38	1
2726	0181	Heritage Home Group	21.028002999999998	-89.842557999999997	38	1
2727	0001	Ixil	21.152999999999999	-89.481211000000002	39	1
2728	0002	Concepción	21.198208000000001	-89.476341000000005	39	1
2729	0004	San José Ceballos	21.208615000000002	-89.452375000000004	39	1
2730	0005	San Juan de las Cruces	21.164437	-89.490832999999995	39	1
2731	0014	La Noria	21.183019999999999	-89.483583999999993	39	1
2732	0015	Trinidad	21.200119000000001	-89.461174	39	1
2733	0017	San Agustín	21.150200000000002	-89.490919000000005	39	1
2734	0020	El Salvador	21.314119000000002	-89.495463999999998	39	1
2735	0021	San Bartolomé Xtún	21.142966000000001	-89.467701000000005	39	1
2736	0022	San Isidro Dos	21.147580000000001	-89.488805999999997	39	1
2737	0023	El Faro	21.319251000000001	-89.471037999999993	39	1
2738	0026	Laboratorio Regional de Reproducción Masiva de Tamarixia Radiata del Sureste	21.140343999999999	-89.488247999999999	39	1
2739	0028	San Rafael	21.178466	-89.485602999999998	39	1
2740	0029	Zapata	21.14518	-89.464844999999997	39	1
2741	0030	Xtum	21.146498999999999	-89.467585	39	1
2742	0031	Santa Gertrudis	21.14724	-89.472742999999994	39	1
2743	0032	Escondido [Rancho]	21.138306	-89.487617999999998	39	1
2744	0034	Guillermo Julián Yam Ek	21.144345000000001	-89.484966	39	1
2745	0035	Santa Cruz	21.140612000000001	-89.481909000000002	39	1
2746	0036	San Diego	21.186767	-89.502217000000002	39	1
2747	0037	Bequedano [Muebleria]	21.142412	-89.485564999999994	39	1
2748	0038	Fina Pech Sulub	21.142392999999998	-89.466172	39	1
2749	0039	Transito Pech Tec	21.143571000000001	-89.466026999999997	39	1
2750	0040	Eulogia Cen Chan	21.145858	-89.466251	39	1
2751	0041	Chen Pakal	21.215910999999998	-89.488586999999995	39	1
2752	0042	Ninguno [Invernadero]	21.208411999999999	-89.483649	39	1
2753	0043	Sah-Cab-Chen	21.260151	-89.473416	39	1
2754	0044	Sac Luúm	21.266691000000002	-89.461206000000004	39	1
2755	0045	San José Chen'en Say	21.267122000000001	-89.470400999999995	39	1
2756	0046	Komchén	21.251235999999999	-89.447546000000003	39	1
2757	0047	La Joya	21.145388000000001	-89.461648999999994	39	1
2758	0001	Izamal	20.932998000000001	-89.019715000000005	40	1
2759	0003	Citilcum	20.951775999999999	-89.118539999999996	40	1
2760	0004	Cuauhtémoc	20.887582999999999	-89.000788	40	1
2761	0005	Chacón	20.959320000000002	-89.023152999999994	40	1
2762	0008	Chuiché	20.904817999999999	-89.003264000000001	40	1
2763	0009	Chichí-Hú	20.917628000000001	-89.025020999999995	40	1
2764	0010	Kanchunup	20.905557000000002	-88.951572999999996	40	1
2765	0013	Kancabchén	20.943131000000001	-88.934706000000006	40	1
2766	0017	Sacalá	20.979291	-89.050940999999995	40	1
2767	0020	San José Tzabcán	20.911836000000001	-89.117424	40	1
2768	0022	San Pedro	20.886775	-89.030795999999995	40	1
2769	0023	Kalanteni	20.846934000000001	-89.035342	40	1
2770	0024	Sitilpech	20.940719000000001	-88.957458000000003	40	1
2771	0026	Tulinché	20.984535000000001	-88.878803000000005	40	1
2772	0027	Tzip	20.951851000000001	-89.063119	40	1
2773	0028	Xanabá	20.836272999999998	-89.014114000000006	40	1
2774	0030	Yokdzonot	20.950742999999999	-88.918638000000001	40	1
2775	0031	San José Chiceh	20.909238999999999	-88.976292000000001	40	1
2776	0033	Chen Canul	20.908964999999998	-88.9285	40	1
2777	0037	Ebulá	20.893497	-89.012592999999995	40	1
2778	0038	San Antonio	20.915735999999999	-88.890142999999995	40	1
2779	0041	Kimbilá	20.934633999999999	-89.125231999999997	40	1
2780	0045	Cax-Ek	20.908919000000001	-88.875366	40	1
2781	0046	San Luis Chico	20.963757000000001	-88.851421000000002	40	1
2782	0048	Sodzil	20.896695000000001	-88.839329000000006	40	1
2783	0049	Chenkín	20.920598999999999	-88.874573999999996	40	1
2784	0050	Chovenché	20.934784000000001	-88.985140999999999	40	1
2785	0051	Chuil	20.935991000000001	-89.067639	40	1
2786	0052	Chumul	20.934187999999999	-89.096553	40	1
2787	0056	Kanab	20.908570999999998	-88.870509999999996	40	1
2788	0057	Kanán	20.981286999999998	-88.969841000000002	40	1
2789	0063	Noh-Copó	20.890799999999999	-88.903655000000001	40	1
2790	0066	Popolá	20.851037000000002	-88.996043999999998	40	1
2791	0067	Sac-Nicté	20.970680999999999	-88.982095999999999	40	1
2792	0068	San Antonio Chich	20.910408	-89.099216999999996	40	1
2793	0069	San Dimas	20.832249999999998	-89.036973000000003	40	1
2794	0070	San Fernando	20.948350999999999	-89.092185999999998	40	1
2795	0073	San Lorenzo	20.828230999999999	-89.006291000000004	40	1
2796	0074	San Lorenzo Uno	20.927931000000001	-88.925695000000005	40	1
2797	0077	San Pedro	20.853437	-89.011683000000005	40	1
2798	0078	San Luis	20.961703	-89.121628000000001	40	1
2799	0080	Santa Carolina	20.915533	-88.893839	40	1
2800	0083	Sihomal	20.959357000000001	-88.886668999999998	40	1
2801	0087	San José Tecoh	20.888021999999999	-89.066873000000001	40	1
2802	0089	Tulinché	20.932531000000001	-89.046667999999997	40	1
2803	0090	Tzahkú	20.873725	-88.875356999999994	40	1
2804	0093	Kol-Ac	20.909690000000001	-88.866418999999993	40	1
2805	0096	Yaxcucul	20.85764	-88.869269000000003	40	1
2806	0103	Manuel Cecilio Villamor	20.964832999999999	-89.112927999999997	40	1
2807	0106	San Lucas	20.921144000000002	-89.142780000000002	40	1
2808	0115	Santa María	20.929107999999999	-88.950743000000003	40	1
2809	0117	Balantún	20.922167999999999	-88.911046999999996	40	1
2810	0119	Cheul	20.989322000000001	-89.018826000000004	40	1
2811	0120	Francisco Villa	20.819358999999999	-89.020891000000006	40	1
2812	0121	Juan Manuel	20.958117999999999	-88.993352999999999	40	1
2813	0122	Miguel Allende	20.988716	-88.967304999999996	40	1
2814	0124	San Francisco	20.975245000000001	-89.019253000000006	40	1
2815	0125	San José	20.848744	-88.995755000000003	40	1
2816	0126	San José Kanán	20.986789000000002	-88.964823999999993	40	1
2817	0129	San Luis	20.961109	-88.992428000000004	40	1
2818	0131	San Miguel	20.933011	-88.951858999999999	40	1
2819	0132	San Pedro Uno	20.915251999999999	-88.885630000000006	40	1
2820	0134	Santa Catalina	20.991713000000001	-88.923930999999996	40	1
2821	0135	Ninguno	20.842319	-89.010902999999999	40	1
2822	0136	Timul	20.999835000000001	-88.889690999999999	40	1
2823	0137	Las Tres Cruces	20.957032000000002	-88.993791000000002	40	1
2824	0140	Yohmac	20.894363999999999	-88.888276000000005	40	1
2825	0141	Ninguno	20.894337	-88.871005999999994	40	1
2826	0142	Francisco Villa Uno	20.957737999999999	-88.889251999999999	40	1
2827	0143	Santo Domingo	20.942433999999999	-88.847821999999994	40	1
2828	0144	Gas de Yucatán	20.938552000000001	-89.046417000000005	40	1
2829	0145	Santos Pat Uitz [Granja]	20.927980000000002	-89.117112000000006	40	1
2830	0146	Tomás Aguilar	20.934806999999999	-88.992469	40	1
2831	0148	Santa Fe	20.952960000000001	-89.020182000000005	40	1
2832	0149	Treinta y Tres [Unidad Citrícola]	20.941676999999999	-89.042928000000003	40	1
2833	0150	Yaxché	20.931172	-89.104900000000001	40	1
2834	0151	Pérez [Banco de Material]	20.943389	-88.926274000000006	40	1
2835	0153	Noh Kaax	20.940442999999998	-88.966774999999998	40	1
2836	0154	San Antonio	20.947998999999999	-88.952444	40	1
2837	0155	La Piedra	20.899766	-88.837598	40	1
2838	0162	Cocopesa [Banco de Material]	20.939513000000002	-88.971918000000002	40	1
2839	0163	Dina I	20.937173999999999	-88.982691000000003	40	1
2840	0164	La Frontera	20.939399000000002	-88.974586000000002	40	1
2841	0165	Emiliano Zapata [Unidad de Riego]	20.950510000000001	-89.107107999999997	40	1
2842	0166	Orlando Navarrete	20.949904	-89.100746999999998	40	1
2843	0167	El Pájaro	20.936893999999999	-88.984182000000004	40	1
2844	0168	Gustavo Burgos Candil	20.936216000000002	-88.990093000000002	40	1
2845	0169	El Negrito	20.935608999999999	-88.993981000000005	40	1
2846	0170	San Abraham	20.930091000000001	-89.114193999999998	40	1
2847	0171	San Manuel	20.918116999999999	-89.023599000000004	40	1
2848	0172	Santa Guadalupe	20.929825999999998	-88.956453999999994	40	1
2849	0173	Las Margaritas	20.949565	-89.012488000000005	40	1
2850	0174	Santa María de los Ángeles	20.939779999999999	-89.046299000000005	40	1
2851	0175	San Yazké	20.950315	-89.109668999999997	40	1
2852	0176	Horeb	20.836138999999999	-89.037537999999998	40	1
2853	0177	Chuil Uno	20.942250000000001	-89.063688999999997	40	1
2854	0178	Eligio Can	20.950990999999998	-89.094380000000001	40	1
2855	0179	San Miguel Arcángel	20.967461	-88.984568999999993	40	1
2856	0180	Francisco Villa	20.909648000000001	-88.867486999999997	40	1
2857	0181	Santa Anita [Rancho]	20.955511000000001	-89.132142999999999	40	1
2858	0182	Kimbilá [Granja]	20.939731999999999	-89.127154000000004	40	1
2859	0192	Ninguno	20.989094000000001	-88.966766000000007	40	1
2860	0194	Luis Uitzil	20.962353	-88.989142999999999	40	1
2861	0195	Marcelino Lugo	20.958829000000001	-88.992384999999999	40	1
2862	0196	Mina de Oro	20.929076999999999	-88.917400000000001	40	1
2863	0197	Patricia Blanco	20.976561	-88.978464000000002	40	1
2864	0199	San Fernando	20.965816	-88.984932000000001	40	1
2865	0200	San Pedro	20.990486000000001	-88.963408000000001	40	1
2866	0201	Santa Pilar	20.948315999999998	-89.004925	40	1
2867	0202	Tres Potrillos	20.926324000000001	-88.916595999999998	40	1
2868	0203	Yohactún	20.969414	-88.899651000000006	40	1
2869	0001	Kanasín	20.934640000000002	-89.558059	41	1
2870	0003	San Antonio Tehuitz	20.900421999999999	-89.520709999999994	41	1
2871	0006	Teya	20.936378000000001	-89.522751999999997	41	1
2872	0008	El Campanario	20.889233000000001	-89.508561	41	1
2873	0009	La Pilarcita [Sociedad de Producción Rural]	20.888483000000001	-89.507727000000003	41	1
2874	0010	El Álamo	20.932917	-89.509772999999996	41	1
2875	0014	Veintiocho [Granja]	20.950797999999999	-89.525118000000006	41	1
2876	0015	Bachoco Teya 4	20.942291999999998	-89.532351000000006	41	1
2877	0016	Bachoco Teya 3 [Granja]	20.941603000000001	-89.529797000000002	41	1
2878	0017	Bachoco Teya 1 [Granja]	20.941952000000001	-89.523677000000006	41	1
2879	0018	Diecisiete [Granja]	20.941582	-89.527126999999993	41	1
2880	0019	Veintiséis [Granja]	20.950980000000001	-89.526950999999997	41	1
2881	0020	La Guadalupana	20.920210000000001	-89.493351000000004	41	1
2882	0021	Villa Cristina	20.922858999999999	-89.499138000000002	41	1
2883	0027	El Juguete	20.887366	-89.506101999999998	41	1
2884	0028	San Antonio	20.896100000000001	-89.516002999999998	41	1
2885	0034	El Fénix	20.885660999999999	-89.504273999999995	41	1
2886	0035	La Pilarcita II (Sociedad de Producción Rural)	20.887948000000002	-89.508368000000004	41	1
2887	0038	Encarnación	20.934649	-89.530717999999993	41	1
2888	0039	Sagrario [Quinta]	20.893901	-89.512884999999997	41	1
2889	0040	El Pedregal	20.918353	-89.490334000000004	41	1
2890	0041	Eduardo Tres	20.894487999999999	-89.515180999999998	41	1
2891	0048	Santa Rita	20.913726	-89.538976000000005	41	1
2892	0050	El Naranjo	20.895094	-89.513188999999997	41	1
2893	0051	Los Toriles	20.945962999999999	-89.528987999999998	41	1
2894	0053	Paraíso Ampliación	20.895851	-89.511793999999995	41	1
2895	0054	Santa Teresa	20.895443	-89.513813999999996	41	1
2896	0056	González Palomo	20.936063000000001	-89.534904999999995	41	1
2897	0062	Las Gladiolas	20.887795000000001	-89.507097000000002	41	1
2898	0063	Doña Bella	20.888756999999998	-89.508071000000001	41	1
2899	0065	Tablaje Diez Mil Setecientos Diecisiete	20.896450999999999	-89.516091000000003	41	1
2900	0066	Tablaje Diez Mil Setecientos Catorce	20.895606000000001	-89.515265999999997	41	1
2901	0067	Don Mario	20.894203000000001	-89.515350999999995	41	1
2902	0073	Los Dos Robles	20.933893999999999	-89.529114000000007	41	1
2903	0106	Monarca [Quinta]	20.934097999999999	-89.530429999999996	41	1
2904	0108	San José	20.968875000000001	-89.541118999999995	41	1
2905	0115	Ponderosa	20.967756000000001	-89.541050999999996	41	1
2906	0129	San Pedro y San Pablo	20.922070000000001	-89.494242	41	1
2907	0130	Lol-Há [Hacienda]	20.896957	-89.517201999999997	41	1
2908	0131	San Antonio	20.897452999999999	-89.515694999999994	41	1
2909	0135	Dzoyolá	20.903091	-89.585154000000003	41	1
2910	0136	San Nicolás	20.878520000000002	-89.529348999999996	41	1
2911	0138	El Naranjo	20.937059999999999	-89.532476000000003	41	1
2912	0141	Las Garzas	20.928471999999999	-89.534280999999993	41	1
2913	0142	Torre Fuerte	20.937846	-89.534405000000007	41	1
2914	0144	San José	20.922193	-89.507532999999995	41	1
2915	0145	Xmauil	20.92475	-89.501123000000007	41	1
2916	0149	San Miguel	20.939972000000001	-89.539996000000002	41	1
2917	0150	San Armando	20.978529000000002	-89.542970999999994	41	1
2918	0151	Tabichén	20.881461999999999	-89.523916999999997	41	1
2919	0153	Teya	20.933599000000001	-89.521460000000005	41	1
2920	0154	Los Tulipanes	20.911507	-89.533339999999995	41	1
2921	0155	Fernando Ávila [Rancho]	20.927098000000001	-89.534267999999997	41	1
2922	0159	Kanasín [Ex-Basurero Municipal]	20.914307999999998	-89.536440999999996	41	1
2923	0160	San Pedro [Deshuesadero]	20.939167000000001	-89.538031000000004	41	1
2924	0162	San José Dos	20.906072999999999	-89.528043999999994	41	1
2925	0163	Ninguno [Incubadora]	20.895959000000001	-89.514799999999994	41	1
2926	0165	Pollos Industrializados de México	20.903593999999998	-89.527078000000003	41	1
2927	0168	San José [Rancho]	20.916374000000001	-89.540345000000002	41	1
2928	0171	Ninguno	20.933617000000002	-89.523528999999996	41	1
2929	0176	Los Canes [Rancho]	20.882448	-89.527591000000001	41	1
2930	0180	Materiales Canul	20.938103999999999	-89.538360999999995	41	1
2931	0181	San Marcos	20.90401	-89.552638999999999	41	1
2932	0182	Grúas del Sureste	20.936564000000001	-89.533342000000005	41	1
2933	0184	Hermanos Chan	20.937788000000001	-89.545970999999994	41	1
2934	0185	Juan Leonardo Ek	20.936866999999999	-89.537351000000001	41	1
2935	0186	Santa Cecilia	20.896214000000001	-89.542011000000002	41	1
2936	0187	Prado Verde	20.906969	-89.555875999999998	41	1
2937	0188	Severiano Baas	20.912785	-89.564456000000007	41	1
2938	0193	Las Palomas	20.970241000000001	-89.541335000000004	41	1
2939	0196	Felipe Baas	20.876483	-89.529062999999994	41	1
2940	0202	Sepromsa [Semillas]	20.938293999999999	-89.536231999999998	41	1
2941	0203	Leonardo Chim Tziú	20.936388000000001	-89.535814000000002	41	1
2942	0204	Jorge Gómez [Bodega]	20.933073	-89.526342999999997	41	1
2943	0205	San Arturo	20.927489000000001	-89.525743000000006	41	1
2944	0206	Marisol [Quinta]	20.936969000000001	-89.536494000000005	41	1
2945	0207	Janet Pérez Rojas	20.938800000000001	-89.536777999999998	41	1
2946	0208	Rosandrema	20.873343999999999	-89.530009000000007	41	1
2947	0210	Montecarlo	20.930754	-89.524163999999999	41	1
2948	0211	San Gabriel	20.929078000000001	-89.509563999999997	41	1
2949	0218	Florentino Chán	20.911691999999999	-89.564421999999993	41	1
2950	0219	Los Tres Gavilanes	20.911714	-89.566164999999998	41	1
2951	0222	San Lorenzo	20.895733	-89.562259999999995	41	1
2952	0224	Santa Cruz	20.891219	-89.563069999999996	41	1
2953	0226	Eneldino Euán	20.906545000000001	-89.527435999999994	41	1
2954	0227	La Esperanza [Rancho]	20.895557	-89.509586999999996	41	1
2955	0228	Triple G	20.95702	-89.508968999999993	41	1
2956	0229	Kilómetro Siete	20.907429	-89.528996000000006	41	1
2957	0230	Valle de Kanan	20.965145	-89.507694999999998	41	1
2958	0231	Balché	20.960290000000001	-89.509912	41	1
2959	0232	Gustavo Adolfo	20.906974000000002	-89.527440999999996	41	1
2960	0240	Andy Santos Poot	20.903918000000001	-89.525418000000002	41	1
2961	0242	Pedro Leonardo Matú Canché	20.907211	-89.528880999999998	41	1
2962	0243	Jardines de Tahdzibichén	20.901522	-89.595449000000002	41	1
2963	0244	Granja Coral	20.906106000000001	-89.529006999999993	41	1
2964	0245	Don David	20.907568999999999	-89.529138000000003	41	1
2965	0246	Carlos Figueroa	20.938844	-89.540610999999998	41	1
2966	0247	Los Naranjos	20.898754	-89.518090999999998	41	1
2967	0248	Pajita	20.897656000000001	-89.516122999999993	41	1
2968	0249	Bodegas y Naves Industriales	20.93732	-89.531186000000005	41	1
2969	0252	La Estancia	20.947489999999998	-89.540906000000007	41	1
2970	0254	Jaime Baas	20.940829000000001	-89.533958999999996	41	1
2971	0255	El Jesús de Maranemi	20.960052999999998	-89.513199	41	1
2972	0256	Analia Irigoyen Roca	20.939609000000001	-89.529916999999998	41	1
2973	0260	Ninguno	20.975852	-89.541118999999995	41	1
2974	0261	Ninguno	20.944216999999998	-89.535207999999997	41	1
2975	0262	Ninguno	20.941175000000001	-89.535978	41	1
2976	0263	Ninguno	20.942177000000001	-89.533405999999999	41	1
2977	0264	Jaime Baas	20.941738999999998	-89.532639000000003	41	1
2978	0265	Reyneros del Sureste	20.928135999999999	-89.507379	41	1
2979	0266	Yolanda Beatriz Kuk Baas	20.926518999999999	-89.503905000000003	41	1
2980	0267	Ninguno	20.941756000000002	-89.534019999999998	41	1
2981	0268	Francisco Uicab Solís	20.938426	-89.539894000000004	41	1
2982	0269	Los Vaqueritos [Quinta]	20.938361	-89.539038000000005	41	1
2983	0270	Ninguno	20.904969999999999	-89.554614999999998	41	1
2984	0271	Macedonio Baas	20.90259	-89.556127000000004	41	1
2985	0272	Don Will	20.901467	-89.555930000000004	41	1
2986	0277	Ninguno	20.905328000000001	-89.585997000000006	41	1
2987	0280	José Canul Alcocer	20.938168999999998	-89.538218999999998	41	1
2988	0282	Balúm Kanán	20.962433000000001	-89.510698000000005	41	1
2989	0283	Antonio Cahuich	20.961476999999999	-89.513313999999994	41	1
2990	0284	Ninguno	20.947942000000001	-89.538556	41	1
2991	0286	El Paraíso	20.963827999999999	-89.516907000000003	41	1
2992	0287	Pedro Chan Tun	20.904337999999999	-89.524114999999995	41	1
2993	0288	Caba [Quinta]	20.954453000000001	-89.533430999999993	41	1
2994	0289	Doña Elvira [Quinta]	20.959257000000001	-89.507056000000006	41	1
2995	0290	Modesto Huicab Canché [Quinta]	20.922162	-89.550644000000005	41	1
2996	0291	Las Marianas [Rancho]	20.908982000000002	-89.530831000000006	41	1
2997	0292	Samkam Church	20.928623999999999	-89.529591999999994	41	1
2998	0293	San José II	20.901403999999999	-89.522931999999997	41	1
2999	0294	San Nicolás	20.958262999999999	-89.528931999999998	41	1
3000	0298	Zac-Nicté	20.902069000000001	-89.559854999999999	41	1
3001	0299	Bayusa [Banco de Materiales]	20.922059000000001	-89.509450999999999	41	1
3002	0300	Kekén [Grupo Porcícola]	20.880873999999999	-89.527401999999995	41	1
3003	0301	La Dueña [Balneario]	20.910883999999999	-89.532687999999993	41	1
3004	0303	Las Palomas	20.906081	-89.594423000000006	41	1
3005	0304	Cabaña del Tío Sam	20.899059000000001	-89.594323000000003	41	1
3006	0305	Terracota	20.905868000000002	-89.592777999999996	41	1
3007	0306	Santa Rosa Dzoyolá	20.904667	-89.592163999999997	41	1
3008	0307	San José	20.897783	-89.585679999999996	41	1
3009	0308	Las Palmas	20.899985000000001	-89.589219999999997	41	1
3010	0309	Renán Rosas	20.904333000000001	-89.588273000000001	41	1
3011	0310	Santa Ana	20.873664999999999	-89.557798000000005	41	1
3012	0311	Apícola Maya [Mielera]	20.906222	-89.587725000000006	41	1
3013	0001	Kantunil	20.79644	-89.036518999999998	42	1
3014	0002	Holcá	20.756661000000001	-88.929409000000007	42	1
3015	0007	Dos Ángeles	20.762218000000001	-88.925161000000003	42	1
3016	0017	Kulinché	20.809384999999999	-89.032594000000003	42	1
3017	0018	Puhá	20.761341999999999	-89.003292999999999	42	1
3018	0020	San Adrián	20.782005999999999	-88.995491000000001	42	1
3019	0021	San Arturo	20.765059999999998	-88.922706000000005	42	1
3020	0022	San Román	20.815812000000001	-89.051370000000006	42	1
3021	0034	San Ramón	20.734938	-88.962545000000006	42	1
3022	0036	San Francisco de Asís	20.821096000000001	-89.039578000000006	42	1
3023	0038	Suyén	20.713380999999998	-88.964048000000005	42	1
3024	0041	Multunbac	20.790037000000002	-88.988579000000001	42	1
3025	0042	Granja Agrícola San Felipe	20.791802000000001	-89.018839	42	1
3026	0043	Santa Lucía	20.747762999999999	-88.910362000000006	42	1
3027	0044	San Lázaro	20.779889000000001	-88.982077000000004	42	1
3028	0045	San Miguel	20.816589	-89.044821999999996	42	1
3029	0046	San Ramón	20.800118999999999	-89.059296000000003	42	1
3030	0052	San Gabriel	20.788905	-88.922610000000006	42	1
3031	0054	Freddy Sarabia	20.798355999999998	-89.047244000000006	42	1
3032	0055	María Andrea Gómez Fuentes	20.791504	-89.043834000000004	42	1
3033	0056	COBAY [Plantel Kantunil]	20.791793999999999	-89.022108000000003	42	1
3034	0057	Santa Cruz	20.791971	-89.020177000000004	42	1
3035	0058	Ninguno	20.791445	-89.020431000000002	42	1
3036	0059	Ninguno	20.791882000000001	-89.022516999999993	42	1
3037	0060	San Luis	20.762042999999998	-88.962805000000003	42	1
3038	0001	Kaua	20.620086000000001	-88.414617000000007	43	1
3039	0003	Dzibiac	20.574289	-88.441215	43	1
3040	0006	Dzeal	20.566317999999999	-88.431728000000007	43	1
3041	0010	Xuxcab	20.640367999999999	-88.417527000000007	43	1
3042	0012	Yaxlé	20.597572	-88.443019000000007	43	1
3043	0018	San Lorenzo	20.627661	-88.401905999999997	43	1
3044	0022	San Enrique	20.623940999999999	-88.430147000000005	43	1
3045	0023	San Esteban	20.658853000000001	-88.410887000000002	43	1
3046	0028	San Pedro	20.650410000000001	-88.399058999999994	43	1
3047	0029	Santa Rita	20.624179000000002	-88.405911000000003	43	1
3048	0035	La Candelaria	20.646266000000001	-88.415387999999993	43	1
3049	0037	Xtóhil	20.641625000000001	-88.416245000000004	43	1
3050	0038	Ninguno	20.617455	-88.420000000000002	43	1
3051	0039	San Isidro	20.623054	-88.430577	43	1
3052	0040	Veintiuno de Marzo	20.632393	-88.458574999999996	43	1
3053	0043	Aldea Maya	20.624462000000001	-88.394869	43	1
3054	0044	Pambá	20.529254000000002	-88.530963	43	1
3055	0045	Kaua [Aeropuerto]	20.638797	-88.449124999999995	43	1
3056	0046	Agroeléctrica de Yucatán [Compañía]	20.622889000000001	-88.393617000000006	43	1
3057	0001	Kinchil	20.916461999999999	-89.947582999999995	44	1
3058	0002	Tamchén	20.875440999999999	-89.931639000000004	44	1
3059	0007	Amaris Dos	20.869064999999999	-90.107578000000004	44	1
3060	0008	Felipe Carrillo Puerto	20.891185	-90.007271000000003	44	1
3061	0010	Bobadilla	20.888432999999999	-89.993043999999998	44	1
3062	0012	Cachamontura	20.876850999999998	-90.205404999999999	44	1
3063	0013	Cehchan	20.887195999999999	-89.971401999999998	44	1
3064	0023	Chicché	20.832919	-90.075327999999999	44	1
3065	0025	Chumpich	20.882180000000002	-90.017967999999996	44	1
3066	0029	Echeverría	20.872489999999999	-89.981831999999997	44	1
3067	0030	Bella Esperanza Dos	20.871386999999999	-90.095187999999993	44	1
3068	0031	Guadalupe	20.886113999999999	-90.000652000000002	44	1
3069	0038	Kooch Ka'ach	20.855278999999999	-90.046313999999995	44	1
3070	0058	San Francisco Kaná	20.851904000000001	-90.139067999999995	44	1
3071	0059	San José Pachul	20.930935999999999	-89.931303	44	1
3072	0060	Kinchil	20.912368000000001	-89.961727999999994	44	1
3073	0063	San Manuel Uno	20.897600000000001	-89.983678999999995	44	1
3074	0064	San Manuel Tres	20.892385999999998	-90.001307999999995	44	1
3075	0065	San Juan Actún	20.874973000000001	-89.918873000000005	44	1
3076	0066	Amaris Uno	20.870777	-90.083132000000006	44	1
3077	0068	Santa María	20.910011000000001	-89.971536	44	1
3078	0071	Tinajero	20.881592999999999	-90.003124	44	1
3079	0076	Duarte	20.878301	-90.032483999999997	44	1
3080	0079	Chicché	20.793586000000001	-90.004936000000001	44	1
3081	0080	Sartenejas	20.867189	-90.099839000000003	44	1
3082	0082	Nuevo Amanecer	20.887141	-89.982866999999999	44	1
3083	0083	Santa Lucía	20.888190999999999	-89.978397000000001	44	1
3084	0085	Neemaya	20.898789000000001	-89.917575999999997	44	1
3085	0086	Jabín	20.895206000000002	-89.911113999999998	44	1
3086	0088	Santa María 1 [Granja]	20.903479000000001	-89.984278000000003	44	1
3087	0089	Postura 2 [Granja]	20.903925999999998	-89.979444999999998	44	1
3088	0090	Kon-Há	20.820874	-90.062101999999996	44	1
3089	0093	San Manuel Dos	20.896398999999999	-89.981553000000005	44	1
3090	0094	Asunción Zapata Cua	20.898326000000001	-89.960628999999997	44	1
3091	0095	Santa María 2 [Granja]	20.900490999999999	-89.989969000000002	44	1
3092	0096	Kinchil Tres	20.907098000000001	-89.977125000000001	44	1
3093	0097	Los Cocos	20.874806	-90.026022999999995	44	1
3094	0098	Colegio de Bachilleres [COBAY]	20.930828000000002	-89.942977999999997	44	1
3095	0099	El Henequenal	20.863150000000001	-90.165036999999998	44	1
3096	0100	Santa María I	20.937996999999999	-89.938790999999995	44	1
3097	0101	Túumben Ch'uhuk	20.932393999999999	-89.941804000000005	44	1
3098	0102	Variquino	20.870902000000001	-90.137421000000003	44	1
3099	0103	Roma [Hotel]	20.865226	-90.106881999999999	44	1
3100	0104	Noh-Halal	20.876936000000001	-90.075299999999999	44	1
3101	0105	San Antonio Pixoy	20.855356	-89.917232999999996	44	1
3102	0106	Tabacón [Quinta]	20.91019	-89.936779000000001	44	1
3103	0107	Kinchil [Posada]	20.910143999999999	-89.934788999999995	44	1
3104	0108	Ninguno [Bodega]	20.9099	-89.933752999999996	44	1
3105	0001	Kopomá	20.648969999999998	-89.899525999999994	45	1
3106	0002	San Bernardo	20.636279999999999	-89.952197999999996	45	1
3107	0004	Tzaitzá	20.626090000000001	-89.958831000000004	45	1
3108	0012	San Francisco	20.635876	-89.897848999999994	45	1
3109	0015	San Diego	20.655868999999999	-89.874398999999997	45	1
3110	0016	San Pedro	20.659445999999999	-89.890856999999997	45	1
3111	0018	Chen Há	20.689513999999999	-89.875857999999994	45	1
3112	0026	Kaax Ek	20.640664000000001	-89.896538000000007	45	1
3113	0027	Tah	20.626242000000001	-89.957554999999999	45	1
3114	0028	San Felipe	20.641546000000002	-89.900077999999993	45	1
3115	0029	Concepción	20.631204	-89.945384000000004	45	1
3116	0031	San Pedro Kopomá	20.658746000000001	-89.889842999999999	45	1
3117	0032	San Vicente	20.641814	-89.897300000000001	45	1
3118	0033	Emiliano Zapata	20.620115999999999	-89.891715000000005	45	1
3119	0034	El Zapote	20.654056000000001	-89.907103000000006	45	1
3120	0035	Bugambilias	20.640281000000002	-89.891261	45	1
3121	0036	La Guadalupana	20.635694999999998	-89.893917000000002	45	1
3122	0037	San Miguel	20.643502999999999	-89.898928999999995	45	1
3123	0038	Zazilhá	20.637646	-89.920186000000001	45	1
3124	0039	Paulino Chalé	20.621257	-89.892585999999994	45	1
3125	0040	José Chalé	20.621171	-89.892157999999995	45	1
3126	0041	San Juan Actún	20.637487	-89.988597999999996	45	1
3127	0001	Mama	20.477398000000001	-89.365578999999997	46	1
3128	0006	San Antonio Ticimul	20.461846000000001	-89.367287000000005	46	1
3129	0007	San Antonio Xpek	20.542660999999999	-89.439211999999998	46	1
3130	0008	San Gabriel	20.479828000000001	-89.378984000000003	46	1
3131	0013	Santa Rosa	20.545006000000001	-89.401052000000007	46	1
3132	0016	Kankabchén	20.553101999999999	-89.441039000000004	46	1
3133	0018	Kulmanchac	20.477167000000001	-89.374183000000002	46	1
3134	0021	Chumucbé	20.505887999999999	-89.350510999999997	46	1
3135	0031	San Fernando	20.471540999999998	-89.374673999999999	46	1
3136	0038	Paco Avilés	20.481621000000001	-89.376523000000006	46	1
3137	0039	San Antonio	20.466339999999999	-89.351387000000003	46	1
3138	0040	San Pablo	20.482011	-89.386872999999994	46	1
3139	0044	Nijoloch	20.488038	-89.356926000000001	46	1
3140	0057	Felipe Carrillo Puerto	20.469059000000001	-89.375118999999998	46	1
3141	0060	San Genaro	20.479161999999999	-89.374444999999994	46	1
3142	0061	Chaltún Balam	20.479050000000001	-89.383323000000004	46	1
3143	0062	Esmeralda	20.476237999999999	-89.392056999999994	46	1
3144	0065	Nuevo San Juan	20.525860000000002	-89.338429000000005	46	1
3145	0066	Santa María	20.493276000000002	-89.356825000000001	46	1
3146	0067	Unidad Xaybé	20.520054999999999	-89.346406999999999	46	1
3147	0068	San Salvador	20.486038000000001	-89.322255999999996	46	1
3148	0001	Maní	20.387761999999999	-89.392889999999994	47	1
3149	0004	San Esteban	20.391749000000001	-89.335391999999999	47	1
3150	0006	San José	20.376967	-89.400869	47	1
3151	0007	San Juan	20.382383999999998	-89.331492999999995	47	1
3152	0008	Santa Ana	20.377632999999999	-89.325040999999999	47	1
3153	0009	Tipikal	20.406751	-89.344686999999993	47	1
3154	0010	Miramar	20.369240000000001	-89.410432999999998	47	1
3155	0011	Francisco Indalecio Madero Pozo Tres	20.357624000000001	-89.425414000000004	47	1
3156	0012	Plan Chac Pozo Diez	20.330576000000001	-89.395116999999999	47	1
3157	0015	San Fernando	20.426449000000002	-89.339104000000006	47	1
3158	0016	San Filemón	20.337534000000002	-89.392404999999997	47	1
3159	0018	San José	20.419985	-89.328595000000007	47	1
3160	0020	San Pedro	20.353313	-89.351877000000002	47	1
3161	0021	San Simón	20.394898000000001	-89.411207000000005	47	1
3162	0022	San Román	20.376456000000001	-89.384011999999998	47	1
3163	0025	Santa María	20.404375000000002	-89.323196999999993	47	1
3164	0026	Santa Rita	20.355015999999999	-89.404106999999996	47	1
3165	0027	Santa Rosa	20.351295	-89.362181000000007	47	1
3166	0028	Santa Teresa	20.375883999999999	-89.363423999999995	47	1
3167	0029	Santo Domingo	20.411175	-89.366338999999996	47	1
3168	0030	San Pedro	20.394642999999999	-89.345282999999995	47	1
3169	0033	Ticin Tzec	20.439515	-89.353638000000004	47	1
3170	0034	Ninguno	20.339677999999999	-89.409829999999999	47	1
3171	0035	La Carmita [Rancho]	20.335436999999999	-89.394712999999996	47	1
3172	0039	Plan Chac Pozo Ocho	20.326491000000001	-89.391910999999993	47	1
3173	0040	San Miguel	20.388183000000001	-89.407680999999997	47	1
3174	0042	Pozo Dos	20.366599000000001	-89.405878000000001	47	1
3175	0043	Uyits Ka'an	20.388446999999999	-89.419372999999993	47	1
3176	0044	Unicornio	20.371041000000002	-89.398139	47	1
3177	0045	San Dimas	20.328102000000001	-89.356652999999994	47	1
3178	0046	San Efrén	20.331365000000002	-89.343115999999995	47	1
3179	0047	Santa Rosa de Lima	20.367227	-89.389516	47	1
3180	0048	Santa Cruz	20.364353999999999	-89.352937999999995	47	1
3181	0049	Poc-Chuc	20.381461999999999	-89.375423999999995	47	1
3182	0050	Santa María	20.390340999999999	-89.416691	47	1
3183	0051	López Polanco	20.386925999999999	-89.400452999999999	47	1
3184	0054	Cha'ac Chivilá	20.328098000000001	-89.327941999999993	47	1
3185	0055	Chan Cha'ac Chivilá	20.328676000000002	-89.327990999999997	47	1
3186	0056	Chu'un Cruz (Ramón Bautista)	20.370121000000001	-89.397120999999999	47	1
3187	0057	Porfirio Chan	20.397573000000001	-89.368082999999999	47	1
3188	0058	Pozo Nueve	20.321263999999999	-89.400459999999995	47	1
3189	0059	San Esteban	20.334823	-89.344159000000005	47	1
3190	0060	San Federico	20.429763999999999	-89.350862000000006	47	1
3191	0061	San Francisco	20.367076000000001	-89.404145999999997	47	1
3192	0062	Teodora Chan	20.326260999999999	-89.397413999999998	47	1
3193	0063	San Fernando Chan Jaltún	20.386282000000001	-89.403747999999993	47	1
3194	0064	Santa Cruz	20.330876	-89.328669000000005	47	1
3195	0065	Los Girasoles	20.404073	-89.313975999999997	47	1
3196	0001	Maxcanú	20.585059000000001	-90.000640000000004	48	1
3197	0002	Coahuila (Santa Teresa Coahuila)	20.665444999999998	-90.169865000000001	48	1
3198	0003	Chactún (San José Chactún)	20.523865000000001	-90.008748999999995	48	1
3199	0004	Chan Chocholá (Santa Eduviges Chan Chocholá)	20.523579000000002	-90.038300000000007	48	1
3200	0005	Chencoh	20.682967000000001	-90.031704000000005	48	1
3201	0006	Chunchucmil	20.643635	-90.212733	48	1
3202	0007	Granada (Chican Granada)	20.578733	-90.047450999999995	48	1
3203	0010	Kanachén	20.605432	-89.887906000000001	48	1
3204	0011	Kochol	20.620135999999999	-90.159261999999998	48	1
3205	0012	Paraíso	20.6754	-90.117705000000001	48	1
3206	0014	San Fernando	20.650375	-90.067627999999999	48	1
3207	0017	San Rafael	20.705137000000001	-90.157791000000003	48	1
3208	0018	Santa Cruz	20.585421	-89.958332999999996	48	1
3209	0020	Santa Rosa (Santa Rosa de Lima)	20.606176000000001	-90.088373000000004	48	1
3210	0021	Santo Domingo	20.600155999999998	-90.115032999999997	48	1
3211	0023	Zodzil	20.697230999999999	-90.056684000000004	48	1
3212	0024	Boxol	20.731774999999999	-90.097115000000002	48	1
3213	0025	X-Corralcot	20.757118999999999	-90.119668000000004	48	1
3214	0027	Chen-Chic	20.796382999999999	-90.120330999999993	48	1
3215	0028	Emiliano Zapata Uno	20.627026000000001	-90.079385000000002	48	1
3216	0029	Emiliano Zapata Dos	20.621389000000001	-90.071064000000007	48	1
3217	0031	California (Gunché)	20.608637000000002	-90.031998000000002	48	1
3218	0032	Lázaro Cárdenas Dos	20.591771999999999	-90.115924000000007	48	1
3219	0033	Lázaro Cárdenas	20.643616999999999	-90.164991999999998	48	1
3220	0034	Noh Sabacché	20.726274	-90.034452999999999	48	1
3221	0036	Santa Ana	20.637643000000001	-90.012206000000006	48	1
3222	0037	San Diego	20.615666999999998	-90.041548000000006	48	1
3223	0038	Santo Domingo	20.645047000000002	-90.107523	48	1
3224	0039	Cacalchén (X-Cacal)	20.609598999999999	-90.023555999999999	48	1
3225	0040	San Isidro	20.610872000000001	-90.046539999999993	48	1
3226	0041	San José	20.713595000000002	-90.066490999999999	48	1
3227	0044	Arsenio Noh Kú	20.624393999999999	-90.085809999999995	48	1
3228	0047	San Miguel (Ik-Mil)	20.656717	-90.232618000000002	48	1
3229	0048	San Pedro	20.779312000000001	-90.093767	48	1
3230	0050	San Antonio Tamay	20.564564000000001	-90.072844000000003	48	1
3231	0051	Seis C [Unidad Ganadera]	20.714265000000001	-90.158151000000004	48	1
3232	0052	Paraíso Número Diez [Unidad Ganadera]	20.691517999999999	-90.133672000000004	48	1
3233	0053	Vicente Guerrero	20.504246999999999	-89.966570000000004	48	1
3234	0054	X-Bakenkú	20.773377	-90.158477000000005	48	1
3235	0056	X-Cacal	20.632486	-90.177249000000003	48	1
3236	0057	Yaxcacab	20.649663	-90.086564999999993	48	1
3237	0059	Buena Esperanza	20.573143999999999	-89.999602999999993	48	1
3238	0060	Loret	20.696628	-90.211879999999994	48	1
3239	0061	San José	20.593368999999999	-90.014759999999995	48	1
3240	0063	Compartir	20.591128000000001	-90.018150000000006	48	1
3241	0064	Concepción	20.605343999999999	-89.977582999999996	48	1
3242	0065	Estación Maxcanú	20.601047999999999	-89.978266000000005	48	1
3243	0066	Emilia Uno	20.622944	-90.168762000000001	48	1
3244	0067	Emilia Dos	20.620253000000002	-90.172235999999998	48	1
3245	0068	Uhanalil	20.580324000000001	-89.983752999999993	48	1
3246	0069	Emiliano Zapata Tres	20.578433	-89.980907999999999	48	1
3247	0071	El Flamboyán	20.598792	-90.003820000000005	48	1
3248	0073	Gudula	20.596989000000001	-89.976416999999998	48	1
3249	0074	Halachó Uno	20.525825000000001	-90.060252000000006	48	1
3250	0075	Halachó Dos	20.525490999999999	-90.056689000000006	48	1
3251	0076	Halachó Tres	20.524826000000001	-90.052300000000002	48	1
3252	0077	Kanachén	20.631567	-89.988500000000002	48	1
3253	0078	Lázaro Cárdenas Uno	20.623754999999999	-89.989885000000001	48	1
3254	0079	Lázaro Cárdenas Dos	20.623011999999999	-89.985444000000001	48	1
3255	0080	Lázaro Cárdenas	20.590634000000001	-90.016146000000006	48	1
3256	0083	Morelos Uno	20.607002999999999	-90.139816999999994	48	1
3257	0084	Morelos Dos	20.603638	-90.133341999999999	48	1
3258	0085	Nicolás Uno	20.610465000000001	-90.178494000000001	48	1
3259	0086	Nicolás Dos	20.611584000000001	-90.182958999999997	48	1
3260	0088	Cerca del Norte	20.600297000000001	-90.004515999999995	48	1
3261	0089	Papacal	20.611882000000001	-90.044077000000001	48	1
3262	0090	Cielito Lindo Uno	20.594308999999999	-89.986939000000007	48	1
3263	0091	Popi	20.522801000000001	-89.968350000000001	48	1
3264	0092	Maxcanú [Planta de Bombeo]	20.577998999999998	-90.031842999999995	48	1
3265	0093	Maxcanú [Planta Potabilizadora]	20.579684	-90.026088999999999	48	1
3266	0094	Plantel Uno	20.624417999999999	-90.013358999999994	48	1
3267	0096	Plantel Diez	20.623563000000001	-90.005008000000004	48	1
3268	0097	Plantel Diez A	20.631315000000001	-90.004857999999999	48	1
3269	0098	Plantel Diez B	20.625829	-90.006991999999997	48	1
3270	0099	Plantel Diez C	20.626166999999999	-90.009079	48	1
3271	0100	Plantel Doce	20.602997999999999	-90.123169000000004	48	1
3272	0101	Plantel Veintiuno	20.593698	-90.109151999999995	48	1
3273	0102	El Ramonal	20.735028	-90.072271000000001	48	1
3274	0103	El Renacimiento	20.625184999999998	-90.010233999999997	48	1
3275	0105	Lol Pedz Kim Kí	20.602898	-90.000287999999998	48	1
3276	0107	San Antonio Chunhuás	20.604355999999999	-90.004783000000003	48	1
3277	0108	San Andrés	20.592220999999999	-90.059718000000004	48	1
3278	0109	San Andrés	20.595623	-89.989407999999997	48	1
3279	0110	San Ángel	20.579163000000001	-90.035231999999993	48	1
3280	0112	San Jacinto	20.698437999999999	-90.164024999999995	48	1
3281	0114	San José	20.582682999999999	-90.020754999999994	48	1
3282	0115	San José Uno	20.60558	-90.003476000000006	48	1
3283	0116	San Juan	20.580304999999999	-89.976085999999995	48	1
3284	0117	San Juanito	20.632097999999999	-89.998830999999996	48	1
3285	0118	San Lorenzo	20.603743999999999	-90.002968999999993	48	1
3286	0119	San Manuel	20.594505000000002	-90.124943999999999	48	1
3287	0120	San Manuel Uno	20.658297999999998	-90.186887999999996	48	1
3288	0121	San Manuel Dos	20.655438	-90.182633999999993	48	1
3289	0122	San Matías	20.709831000000001	-90.012325000000004	48	1
3290	0124	San Simón Sinkehuel	20.688644	-90.285850999999994	48	1
3291	0125	Flor de Flamboyán	20.571393	-89.987121999999999	48	1
3292	0126	San Alfonso	20.626101999999999	-89.976230000000001	48	1
3293	0127	San Félix	20.626669	-89.979909000000006	48	1
3294	0128	Maxcanú Uno A	20.633341999999999	-89.991114999999994	48	1
3295	0129	Ninguno	20.633837	-89.994893000000005	48	1
3296	0130	San Pedro	20.637637000000002	-90.024934000000002	48	1
3297	0131	Sara [Unidad Agrícola]	20.633475000000001	-90.031558000000004	48	1
3298	0132	La Unión	20.57967	-89.981919000000005	48	1
3299	0133	Unidad Once	20.627220999999999	-90.017769999999999	48	1
3300	0134	Plantel Once A	20.631847	-90.022276000000005	48	1
3301	0135	Unidad Once B	20.626947999999999	-90.021265	48	1
3302	0136	Victoria Uno	20.619181000000001	-90.182488000000006	48	1
3303	0137	Victoria Dos	20.616139	-90.183649000000003	48	1
3304	0138	X-Calothá	20.711863000000001	-89.958213000000001	48	1
3305	0139	X-Luchil	20.665889	-89.947147000000001	48	1
3306	0140	Santa Cruz Cool Cab	20.596617999999999	-89.987587000000005	48	1
3307	0141	Pedro Bacab	20.582681999999998	-89.984211999999999	48	1
3308	0143	Arzápalo [Unidad Agrícola]	20.666910999999999	-90.212980999999999	48	1
3309	0144	Cielito Lindo Dos	20.595490999999999	-89.985404000000003	48	1
3310	0145	La Quinta	20.594830999999999	-89.984944999999996	48	1
3311	0147	Kantirix	20.702193999999999	-89.981916999999996	48	1
3312	0148	Tzalá	20.659552999999999	-89.966353999999995	48	1
3313	0149	San Sebastián	20.569216000000001	-89.995338000000004	48	1
3314	0150	San Víctor	20.596613000000001	-89.986461000000006	48	1
3315	0151	Acancún	20.735825999999999	-90.079528999999994	48	1
3316	0152	Blanca Flor Uno	20.597887	-90.021370000000005	48	1
3317	0153	Kitinché	20.623614	-90.027551000000003	48	1
3318	0154	Las Brisas	20.596679999999999	-90.006204999999994	48	1
3319	0155	Luum Ha	20.609169999999999	-90.111604999999997	48	1
3320	0156	Paraíso	20.748570999999998	-90.099641000000005	48	1
3321	0158	San Pedro	20.606984000000001	-89.998925	48	1
3322	0159	Santa Cruz	20.610071999999999	-90.010035000000002	48	1
3323	0160	Santa Lucía	20.707781000000001	-90.155381000000006	48	1
3324	0161	Santa Úrsula	20.672104000000001	-90.110392000000004	48	1
3325	0162	Esperanza [UAIM]	20.660136999999999	-90.168378000000004	48	1
3326	0163	San Ramón [UAIM]	20.625071999999999	-90.174225000000007	48	1
3327	0164	Xputil	20.598078000000001	-90.013662999999994	48	1
3328	0165	Miguel Cocom	20.600337	-90.002481000000003	48	1
3329	0167	San Antonio Número Tres	20.569371	-89.995932999999994	48	1
3330	0168	Chan Santa Cruz	20.603099	-89.979629000000003	48	1
3331	0169	Chacsi	20.554938	-89.983846	48	1
3332	0170	Tres Marías	20.601586999999999	-89.981087000000002	48	1
3333	0172	Chen Pollo 1	20.686350999999998	-90.005858000000003	48	1
3334	0173	Choomil	20.587305000000001	-89.982429999999994	48	1
3335	0174	San Miguel	20.584415	-89.981558000000007	48	1
3336	0175	José Froylán Koh Argaez	20.603261	-90.004383000000004	48	1
3337	0176	Antonio Keb	20.617267999999999	-90.005848	48	1
3338	0177	Norma Rodríguez	20.598610999999998	-90.005555999999999	48	1
3339	0178	Villahermosa [Rancho]	20.616892	-90.033693999999997	48	1
3340	0179	San Salvador	20.600892999999999	-90.004176000000001	48	1
3341	0180	Tikinché	20.601261000000001	-90.007153000000002	48	1
3342	0181	Los Tres Reyes	20.614742	-90.010419999999996	48	1
3343	0182	Yalhuas	20.739877	-90.070779999999999	48	1
3344	0183	Pereyra [Bloquera]	20.572094	-89.992622999999995	48	1
3345	0184	Santa Isabel	20.637073000000001	-90.035289000000006	48	1
3346	0185	Xunam Bom Bum	20.600090999999999	-90.021485999999996	48	1
3347	0186	Felipe Puc Kumul	20.594024999999998	-89.98751	48	1
3348	0187	Camilo May	20.580715999999999	-89.978468000000007	48	1
3349	0001	Mayapán	20.468744000000001	-89.215170999999998	49	1
3350	0007	San Antonio Sulché	20.547473	-89.164394999999999	49	1
3351	0008	San Antonio Techoh	20.476779000000001	-89.220697999999999	49	1
3352	0022	San Antonio Kukmax	20.475252999999999	-89.173382000000004	49	1
3353	0023	Chacchibilá	20.486156000000001	-89.186008000000001	49	1
3354	0025	Chaczinicché	20.548511000000001	-89.176608999999999	49	1
3355	0026	Holochí	20.502282999999998	-89.225167999999996	49	1
3356	0028	Nenelá	20.495953	-89.181419000000005	49	1
3357	0029	Onichén	20.496735000000001	-89.203987999999995	49	1
3358	0031	Salvador Alvarado	20.443311000000001	-89.222013000000004	49	1
3359	0034	Mi Patria [Vivero]	20.456717000000001	-89.214455999999998	49	1
3360	0035	San Pedro	20.493299	-89.193199000000007	49	1
3361	0038	Santa Lucía	20.482614000000002	-89.168042	49	1
3362	0039	Santa María Dos	20.474585999999999	-89.155257000000006	49	1
3363	0041	Tibolón	20.490317999999998	-89.186009999999996	49	1
3364	0042	Santa María Uno	20.474153000000001	-89.156729999999996	49	1
3365	0045	Santa Ana	20.498681000000001	-89.198830999999998	49	1
3366	0046	San Simón	20.501090000000001	-89.198560999999998	49	1
3367	0047	Kancabchén	20.502737	-89.182563999999999	49	1
3368	0053	Actún-Cheen	20.440778000000002	-89.225123999999994	49	1
3369	0054	Cuzamá	20.478261	-89.216419999999999	49	1
3370	0055	Emiliano Zapata	20.447241999999999	-89.221676000000002	49	1
3371	0057	Mayapán	20.476823	-89.213712999999998	49	1
3372	0058	Oxolá	20.478805000000001	-89.196639000000005	49	1
3373	0059	Santa Isabel	20.528752000000001	-89.168816000000007	49	1
3374	0060	Xcotzá	20.483036999999999	-89.177695	49	1
3375	0061	Chun Muul	20.527334	-89.162982999999997	49	1
3376	0063	Santa María Manzanero	20.553951000000001	-89.169162999999998	49	1
3377	0064	Santa María Uc	20.550319999999999	-89.172910000000002	49	1
3378	0165	Pedro Chán	20.472045999999999	-89.206846999999996	49	1
3379	0166	Guadalupe	20.556073999999999	-89.166625999999994	49	1
3380	0167	San Francisco	20.500367000000001	-89.214561000000003	49	1
3381	0001	Mérida	20.967184	-89.624364999999997	50	1
3382	0075	Caucel	21.015664000000001	-89.706033000000005	50	1
3383	0076	Cosgaya	21.097905000000001	-89.704761000000005	50	1
3384	0077	Chablekal	21.096041	-89.576666000000003	50	1
3385	0079	Chalmuch	20.972695000000002	-89.728970000000004	50	1
3386	0081	Cheumán	21.067079	-89.706532999999993	50	1
3387	0084	Cholul	21.042942	-89.556995999999998	50	1
3388	0086	Dzibilchaltún	21.098455999999999	-89.598535999999996	50	1
3389	0087	Dzidzilché	21.152365	-89.689656999999997	50	1
3390	0088	Dzityá	21.050218000000001	-89.679136	50	1
3391	0089	Dzoyaxché	20.789369000000001	-89.590389000000002	50	1
3392	0090	Dzununcán	20.865708999999999	-89.653478000000007	50	1
3393	0092	Kikteil	21.129691000000001	-89.693568999999997	50	1
3394	0093	Komchén	21.103517	-89.661738	50	1
3395	0094	Misnébalam	21.150807	-89.595113999999995	50	1
3396	0095	Molas	20.816407000000002	-89.632107000000005	50	1
3397	0097	Noc Ac	21.078889	-89.717284000000006	50	1
3398	0100	Petac	20.769943999999999	-89.657867999999993	50	1
3399	0102	Sac-Nicté	21.141459000000001	-89.584616999999994	50	1
3400	0103	San Antonio Hool	21.065397999999998	-89.674582000000001	50	1
3401	0108	San Ignacio Tesip	20.842355000000001	-89.611836999999994	50	1
3402	0111	San José Tzal	20.825106999999999	-89.661292000000003	50	1
3403	0116	San Pedro Chimay	20.865538000000001	-89.579680999999994	50	1
3404	0117	Santa Cruz Palomeque	20.879297000000001	-89.653758999999994	50	1
3405	0119	Santa María Chí	21.033857000000001	-89.482191	50	1
3406	0120	Sierra Papacal	21.122595	-89.728588999999999	50	1
3407	0121	Sitpach	21.026751000000001	-89.521154999999993	50	1
3408	0123	Susulá	20.972905000000001	-89.697076999999993	50	1
3409	0124	Suytunchén	21.101140999999998	-89.731233000000003	50	1
3410	0125	Tahdzibichén	20.885014999999999	-89.598043000000004	50	1
3411	0128	Temozón Norte	21.064547000000001	-89.596886999999995	50	1
3412	0129	Texán Cámara	20.789449999999999	-89.665750000000003	50	1
3413	0130	Opichén	20.950172999999999	-89.679302000000007	50	1
3414	0131	Tixcacal	20.944156	-89.715726000000004	50	1
3415	0132	Tixcuytún	21.066320000000001	-89.570234999999997	50	1
3416	0133	San Antonio Tzacalá	20.750233000000001	-89.654195000000001	50	1
3417	0135	Xcanatún	21.074884000000001	-89.628883000000002	50	1
3418	0138	Xmatkuil	20.861588999999999	-89.625032000000004	50	1
3419	0140	Yaxché Casares	21.034585	-89.498921999999993	50	1
3420	0141	Yaxnic	20.790744	-89.619248999999996	50	1
3421	0144	Xcunyá	21.132643999999999	-89.613314000000003	50	1
3422	0145	Santa María Yaxché	21.118328000000002	-89.635371000000006	50	1
3423	0158	La Ceiba	21.094262000000001	-89.621977000000001	50	1
3424	0159	La Ceiba Dos	21.100883	-89.600046000000006	50	1
3425	0160	Chantún (San Miguel)	20.845174	-89.642021	50	1
3426	0161	San Antonio Chuntuac	20.816754	-89.641547000000003	50	1
3427	0163	Colomax	21.033483	-89.707550999999995	50	1
3428	0164	San Manuel	21.099031	-89.694834	50	1
3429	0167	Dzibilchaltún [Ruinas Arqueológicas]	21.092383000000002	-89.597416999999993	50	1
3430	0180	Hobonyá	21.099620999999999	-89.758370999999997	50	1
3431	0183	Quinta los Carrillo	21.053122999999999	-89.568180999999996	50	1
3432	0190	Caney [Establo Lechero]	20.862271	-89.597483999999994	50	1
3433	0192	San Antonio Xluch Dos	20.893937999999999	-89.634765999999999	50	1
3434	0200	Mérida Uno [Planta Potabilizadora]	20.847206	-89.596807999999996	50	1
3435	0210	San Antonio	21.156124999999999	-89.636872999999994	50	1
3436	0219	Rancho Alegre	20.858929	-89.607162000000002	50	1
3437	0220	Rio Salvaje	21.143894	-89.647453999999996	50	1
3438	0222	Santa Rosa [Unidad Ovina]	20.861132999999999	-89.636410999999995	50	1
3439	0223	X-Cash	20.845462999999999	-89.634601000000004	50	1
3440	0224	California [Rancho]	20.859628000000001	-89.603564000000006	50	1
3441	0225	San Diego Texán	21.156618000000002	-89.626365000000007	50	1
3442	0228	San José Kuché	21.100736000000001	-89.560278999999994	50	1
3443	0232	Tropical [Criadero]	21.105483	-89.741578000000004	50	1
3444	0233	San Salvador	20.833915000000001	-89.631615999999994	50	1
3445	0234	Santa Isabel	20.862283000000001	-89.608772000000002	50	1
3446	0238	Tamanché	21.138915000000001	-89.641407999999998	50	1
3447	0240	Ninguno	20.920323	-89.605131999999998	50	1
3448	0246	Mayab [Universidad]	21.111115999999999	-89.611189999999993	50	1
3449	0249	Xcauaka	20.863367	-89.607477000000003	50	1
3450	0254	Francisco Villa	21.101109000000001	-89.683367000000004	50	1
3451	0266	San Juan Dzonot	21.020040000000002	-89.502999000000003	50	1
3452	0268	Oncán	20.964976	-89.483489000000006	50	1
3453	0271	Calfín [Materiales]	21.065483	-89.697227999999996	50	1
3454	0272	San Gerardo	21.065987	-89.692667999999998	50	1
3455	0285	Las Cabañas	20.861360999999999	-89.609825000000001	50	1
3456	0296	Explosivos Peninsulares [Distribuidora]	20.844242999999999	-89.582168999999993	50	1
3457	0304	Santa Rosa	20.853660999999999	-89.597705000000005	50	1
3458	0305	Valle Verde	20.856199	-89.597072999999995	50	1
3459	0306	Los Tres Reyes	20.860150000000001	-89.597661000000002	50	1
5022	0076	Uxmal	20.893930000000001	-89.905991999999998	63	1
3460	0308	San José [Modulo Siete]	20.859185	-89.601399999999998	50	1
3461	0309	San Lorenzo	20.862197999999999	-89.599913999999998	50	1
3462	0310	San Gerardo [Módulo Cuatro]	20.860171000000001	-89.609012000000007	50	1
3463	0315	San Isidro Molas	20.773114	-89.629209000000003	50	1
3464	0318	Dzunul	20.740694000000001	-89.622726999999998	50	1
3465	0319	Santa María	20.740302	-89.634574000000001	50	1
3466	0320	Tzé-Hal	20.765688999999998	-89.606307000000001	50	1
3467	0321	Xmatkuil [Feria]	20.857023000000002	-89.616435999999993	50	1
3468	0323	Kampepén	20.834479000000002	-89.651516000000001	50	1
3469	0332	Chen Tzalam	21.100739000000001	-89.681314999999998	50	1
3470	0334	El Cortijo	21.112327000000001	-89.747641000000002	50	1
3471	0336	Hunxectamán	20.883175999999999	-89.558628999999996	50	1
3472	0339	Pochote	21.100525999999999	-89.610393999999999	50	1
3473	0345	Gelsy Guadalupe	21.064302999999999	-89.590290999999993	50	1
3474	0346	Itzamatul	21.055185000000002	-89.571128000000002	50	1
3475	0379	Santa Martha	20.891923999999999	-89.600137000000004	50	1
3476	0403	El Ovni	21.03884	-89.549176000000003	50	1
3477	0408	Leona Vicario	20.909685	-89.601196999999999	50	1
3478	0414	Los Castellanos	21.090606000000001	-89.632234999999994	50	1
3479	0420	Trisar	20.971147999999999	-89.490358000000001	50	1
3480	0425	Delta Gas	21.015863	-89.562737999999996	50	1
3481	0429	La Esperanza	21.103659	-89.718667999999994	50	1
3482	0435	Flamboyán	20.859988000000001	-89.635026999999994	50	1
3483	0438	La Guadalupana	20.900331999999999	-89.604857999999993	50	1
3484	0442	Bech	20.871231999999999	-89.586314999999999	50	1
3485	0445	Santa Elena	20.860289000000002	-89.633258999999995	50	1
3486	0446	Cuxtal [Reserva Ecológica]	20.861184999999999	-89.590041999999997	50	1
3487	0447	Los Ceibos	20.874957999999999	-89.594367000000005	50	1
3488	0454	El Pozo	21.085170000000002	-89.633814000000001	50	1
3489	0458	Villa Aldarita	21.054144000000001	-89.569997000000001	50	1
3490	0465	Kilómetro Once	21.069313999999999	-89.633082999999999	50	1
3491	0468	El Negro On	21.058302999999999	-89.570893999999996	50	1
3492	0485	Portón Verde	21.072288	-89.612144999999998	50	1
3493	0491	Madermar	21.090831000000001	-89.636538000000002	50	1
3494	0492	Las Margaritas	21.103795999999999	-89.716836000000001	50	1
3495	0495	Mitza	21.070663	-89.683088999999995	50	1
3496	0496	Monte Alto	20.872888	-89.588434000000007	50	1
3497	0499	Palestino Necaxa	20.919597	-89.608154999999996	50	1
3498	0503	Pequeña Australia	21.065688000000002	-89.590438000000006	50	1
3499	0505	Pezuc	20.862974999999999	-89.571950000000001	50	1
3500	0507	Mérida [Relleno Sanitario]	20.969778000000002	-89.705315999999996	50	1
3501	0509	AB Plastic	21.136092000000001	-89.647378000000003	50	1
3502	0513	El Ramonal	20.904612	-89.604643999999993	50	1
3503	0515	San Gerardo [Granja]	20.775939000000001	-89.660133999999999	50	1
3504	0516	San Gerardo [Granja]	20.785805	-89.655334999999994	50	1
3505	0518	San Haroldo	20.920238000000001	-89.602418999999998	50	1
3506	0519	San Gabriel	21.058548999999999	-89.570049999999995	50	1
3507	0523	Santa Gertrudis Dos	21.046420000000001	-89.590387000000007	50	1
3508	0528	Jardines de Tahdzibichén	20.898667	-89.599620999999999	50	1
3509	0529	El Tentemozo	20.956372999999999	-89.696584999999999	50	1
3510	0537	Wayak'il	21.051621999999998	-89.571391000000006	50	1
3511	0538	Campamento Bautista Peninsular [Iglesia]	20.873203	-89.590063999999998	50	1
3512	0550	Komchén Uno	21.096523999999999	-89.663696000000002	50	1
3513	0552	La Primavera (San Miguel)	20.871502	-89.585640999999995	50	1
3514	0555	X-Pulyaah	20.869448999999999	-89.586023999999995	50	1
3515	0557	San José	20.869679999999999	-89.588365999999994	50	1
3516	0559	La Monitora	20.852775000000001	-89.595348999999999	50	1
3517	0561	Villa Paraíso	20.870297000000001	-89.594289000000003	50	1
3518	0567	Los Ángeles	20.875662999999999	-89.654455999999996	50	1
3519	0570	Arte en Cantera	21.064298999999998	-89.690827999999996	50	1
3520	0576	Maya Internacional [Cantera]	21.062805000000001	-89.689761000000004	50	1
3521	0582	Cocamoras	21.100999000000002	-89.611851999999999	50	1
3522	0595	Adelaida [Finca]	21.057153	-89.690980999999994	50	1
3523	0598	El Gringo	21.044252	-89.589753999999999	50	1
3524	0603	Julidán	20.901402000000001	-89.605125999999998	50	1
3525	0604	Los Juanes	20.860033999999999	-89.641480999999999	50	1
3526	0605	Kú	21.057144999999998	-89.671839000000006	50	1
3527	0613	Carlos Barrera	21.046461000000001	-89.709496999999999	50	1
3528	0626	Mina de Oro	20.892742999999999	-89.601831000000004	50	1
3529	0631	El Palmar de los Loros	21.049284	-89.590406000000002	50	1
3530	0633	Zapote [Plantel]	21.057932999999998	-89.708055000000002	50	1
3531	0643	Rower de México	21.062479	-89.688891999999996	50	1
3532	0644	Predeco	21.184381999999999	-89.646013999999994	50	1
3533	0645	Predeco	21.175022999999999	-89.639604000000006	50	1
3534	0646	Predeco	21.061603000000002	-89.675388999999996	50	1
3535	0651	Rosario	21.046648999999999	-89.588209000000006	50	1
3536	0655	Facunda Tun	20.816081000000001	-89.652828	50	1
3537	0658	San Hugo	21.098362000000002	-89.588562999999994	50	1
3538	0666	Villas Cholul	21.044307	-89.539807999999994	50	1
3539	0669	Santa Isabel	20.859390999999999	-89.637891999999994	50	1
3540	0670	El Jacalito	21.056204999999999	-89.570424000000003	50	1
3541	0675	Calakmul [Silos Metálicos y Transportes]	20.961901000000001	-89.695372000000006	50	1
3542	0688	José Luis Puc	20.844698000000001	-89.613326999999998	50	1
3543	0689	Módulo Tres	20.861751000000002	-89.603234	50	1
3544	0690	El Huero	20.874357	-89.587637999999998	50	1
3545	0693	Galdino (San Felipe)	20.875177000000001	-89.595279000000005	50	1
3546	0695	Don Juan	20.837277	-89.6571	50	1
3547	0696	Santa Barbara	20.832674999999998	-89.614469	50	1
3548	0698	Antonio Canto	21.059443999999999	-89.570790000000002	50	1
3549	0714	Monte Rosy	21.054925000000001	-89.569506000000004	50	1
3550	0719	Vivero	21.05509	-89.568410999999998	50	1
3551	0720	Xlapach San Manuel	20.874673000000001	-89.596334999999996	50	1
3552	0721	San Antonio II	21.060936000000002	-89.590647000000004	50	1
3553	0723	Tato	21.136903	-89.627746000000002	50	1
3554	0732	Evelio Tuyín Santos	21.101693999999998	-89.680914999999999	50	1
3555	0733	Santos Galo Chalé Cauich	21.134487	-89.625118999999998	50	1
3556	0734	Pancho Chalé	21.137763	-89.626282000000003	50	1
3557	0735	Claudia Lach	21.103427	-89.606847000000002	50	1
3558	0736	Luz María Torres Mendoza	21.029444000000002	-89.556667000000004	50	1
3559	0740	Lol-Bé	21.101486000000001	-89.72954	50	1
3560	0741	Luis Fernando	21.058841000000001	-89.570086000000003	50	1
3561	0742	Las Nubes	20.873132999999999	-89.595124999999996	50	1
3562	0745	Pastor [Rancho]	21.103743000000001	-89.729361999999995	50	1
3563	0746	La Revancha	20.872638999999999	-89.662751	50	1
3564	0748	Tierra Sagrada [Rancho]	20.870436999999999	-89.584490000000002	50	1
3565	0749	San Pedro	21.062738	-89.610972000000004	50	1
3566	0751	Templo Mormón	20.918956999999999	-89.603026999999997	50	1
3567	0753	Villas Xcanatún	21.115617	-89.637755999999996	50	1
3568	0754	Los Abuelos	21.122125	-89.719815999999994	50	1
3569	0755	La Bendición de Dios	21.112452999999999	-89.647181000000003	50	1
3570	0756	Tío Gato [Cabaña]	20.868525999999999	-89.595149000000006	50	1
3571	0757	Campo Bravo	21.106020999999998	-89.718934000000004	50	1
3572	0758	Cango	21.151926	-89.601996	50	1
3573	0759	Cano Montenegro	21.151682000000001	-89.599073000000004	50	1
3574	0761	Chencho	20.872816	-89.658889000000002	50	1
3575	0763	Concepción	20.894390999999999	-89.599997000000002	50	1
3576	0764	Cultura Mulsay	20.791619000000001	-89.602789000000001	50	1
3577	0765	Don Gabriel	20.802163	-89.627352999999999	50	1
3578	0767	Fabiola	21.058105999999999	-89.688151000000005	50	1
3579	0768	Los Farahones	20.853677999999999	-89.568189000000004	50	1
3580	0771	El Pedregal [Finca]	21.061522	-89.687754999999996	50	1
3581	0772	Flamboyanes	21.020524000000002	-89.509855000000002	50	1
3582	0775	Guadalupe	20.898904000000002	-89.605624000000006	50	1
3583	0776	Hello Vera	21.109325999999999	-89.561565999999999	50	1
3584	0777	Hotoch Chichán Dzul	20.834921999999999	-89.615183000000002	50	1
3585	0779	Predecon	21.05977	-89.685028000000003	50	1
3586	0780	Kemix	21.125456	-89.644439000000006	50	1
3587	0781	Kinbalam	20.791488999999999	-89.593746999999993	50	1
3588	0784	Pisté	21.112013999999999	-89.660675999999995	50	1
3589	0785	Mateo Poot Moo	21.114139000000002	-89.672100999999998	50	1
3590	0786	Liborio Córdova	21.127500000000001	-89.673056000000003	50	1
3591	0787	Ninguno	21.122135	-89.715783999999999	50	1
3592	0788	Irán	21.122544999999999	-89.719463000000005	50	1
3593	0789	Ramón Ayala	21.132750000000001	-89.640501	50	1
3594	0790	Edgardo Zavala	21.13025	-89.639988000000002	50	1
3595	0791	Valjosh	21.092084	-89.715710000000001	50	1
3596	0792	Don Mario	21.016316	-89.513784000000001	50	1
3597	0793	Sade	21.019577999999999	-89.513399000000007	50	1
3598	0794	Don Andrés	21.014025	-89.510266000000001	50	1
3599	0803	Luciano Canché	21.038163000000001	-89.567950999999994	50	1
3600	0804	Rubí Cocom	21.039054	-89.567847999999998	50	1
3601	0805	María Cen Pech	21.041319000000001	-89.569627999999994	50	1
3602	0806	Elisa May	21.041353999999998	-89.570093999999997	50	1
3603	0808	Maex	21.061561999999999	-89.565402000000006	50	1
3604	0809	Yaxché de Peón	21.058288000000001	-89.561120000000003	50	1
3605	0811	Don Asunción	21.097878000000001	-89.589822999999996	50	1
3606	0812	Doña Reyna	21.106338000000001	-89.580800999999994	50	1
3607	0813	Maximiliano Pool Chalé	21.101291	-89.568343999999996	50	1
3608	0814	Manuel Pavía	21.101952000000001	-89.555220000000006	50	1
3609	0815	Don Saúl	21.100338000000001	-89.556281999999996	50	1
3610	0816	Miguel Ángel Martínez	21.099625	-89.557959999999994	50	1
3611	0817	Don Iván	21.097894	-89.562779000000006	50	1
3612	0818	Don Víctor	21.097307000000001	-89.565907999999993	50	1
3613	0820	Ninguno	21.098378	-89.567746	50	1
3614	0821	Yocha	21.095310000000001	-89.560012999999998	50	1
3615	0822	Doña Delia	21.093395000000001	-89.557193999999996	50	1
3616	0823	Etzit González	21.093401	-89.558888999999994	50	1
3617	0825	Manuel Carabeo	21.092842999999998	-89.561235999999994	50	1
3618	0826	Las Mariposas	21.090771	-89.559124999999995	50	1
3619	0830	Álvaro Flores	21.103804	-89.561565000000002	50	1
3620	0831	El Ranchito	21.109362999999998	-89.562641999999997	50	1
3621	0832	Fausto Bello	21.110738000000001	-89.564232000000004	50	1
3622	0833	Casita Blanca	21.110617000000001	-89.556719000000001	50	1
3623	0834	Iliana Méndez Cámara	21.135853000000001	-89.626731000000007	50	1
3624	0835	Quinta Teresita	21.152493	-89.601376999999999	50	1
3625	0836	Narciso Pool	21.108253000000001	-89.580027999999999	50	1
3626	0837	Gamboa Gonzalo	21.154385999999999	-89.605034000000003	50	1
3627	0841	Las Palmas	21.153281	-89.598461999999998	50	1
3628	0851	Ninguno	21.066123999999999	-89.688104999999993	50	1
3629	0852	Adrian Canul Sierra	21.032312000000001	-89.709450000000004	50	1
3630	0853	Cava [Concretos]	21.063480999999999	-89.689014999999998	50	1
3631	0854	Hacienda Roja	21.061567	-89.690393	50	1
3632	0855	Francisco Javier González Acosta	21.060713	-89.687495999999996	50	1
3633	0856	Leticia Sierra Burgos	21.057162999999999	-89.693447000000006	50	1
3634	0857	Portón Verde	21.057963999999998	-89.683126999999999	50	1
3635	0858	La Tabasqueña	21.052655000000001	-89.688884999999999	50	1
3636	0859	San Juan	21.027222999999999	-89.677828000000005	50	1
3637	0860	La Furia [Rancho]	20.949321999999999	-89.714697999999999	50	1
3638	0861	Marcelino Pech	20.952786	-89.717040999999995	50	1
3639	0862	Las Ranas	20.951357000000002	-89.717382000000001	50	1
3640	0863	Bugambilias	20.951806999999999	-89.723298999999997	50	1
3641	0864	Jahara	20.852070000000001	-89.652403000000007	50	1
3642	0865	José Abades	20.848776999999998	-89.633730999999997	50	1
3643	0867	Luis Alberto Dzul	20.872337999999999	-89.653034000000005	50	1
3644	0868	Roberto	20.868832999999999	-89.590703000000005	50	1
3645	0869	Base	20.870443000000002	-89.590281000000004	50	1
3646	0870	Av-Breu [Constructora]	20.852753	-89.568333999999993	50	1
3647	0871	Alex Chel	20.860230999999999	-89.571769000000003	50	1
3648	0872	Javier Pérez	20.892717999999999	-89.562427999999997	50	1
3649	0873	Carlos Medina	20.869274000000001	-89.568104000000005	50	1
3650	0875	Santiago Kuri	20.905804	-89.604816	50	1
3651	0876	Reina Rivas	20.906452000000002	-89.606268	50	1
3652	0877	El Camionero	20.89594	-89.600639000000001	50	1
3653	0878	Sergio Lira Perales	20.895212999999998	-89.602125999999998	50	1
3654	0879	Doctor	20.894397000000001	-89.602965999999995	50	1
3655	0880	Ismael Cruz Cabrera	20.893732	-89.602723999999995	50	1
3656	0881	Don Coco	20.893108999999999	-89.602643999999998	50	1
3657	0882	El Flamboyán	20.894824	-89.604069999999993	50	1
3658	0883	Los Cocos	20.893754000000001	-89.604821999999999	50	1
3659	0884	El Almendro	20.892278999999998	-89.605146000000005	50	1
3660	0885	González Canto	20.894703	-89.606926999999999	50	1
3661	0886	Tomás Mata	20.893626000000001	-89.608998	50	1
3662	0887	Mario Enrrique Coello	20.894110999999999	-89.609615000000005	50	1
3663	0888	Santiago Kuri	20.901384	-89.606408999999999	50	1
3664	0889	Tomás Bonilla	20.901046999999998	-89.602663000000007	50	1
3665	0890	San José	20.859707	-89.634390999999994	50	1
3666	0892	Emilio Torres	20.870622999999998	-89.672813000000005	50	1
3667	0893	Francisco	20.867090000000001	-89.587119999999999	50	1
3668	0894	Don Augusto	20.868362999999999	-89.588397000000001	50	1
3669	0896	Marco Antonio	20.805015999999998	-89.608444000000006	50	1
3670	0897	José Vela	20.840240000000001	-89.658280000000005	50	1
3671	0898	Hernández	20.825119999999998	-89.619624000000002	50	1
3672	0899	María Luisa Aguilar Sosa	20.895063	-89.604873999999995	50	1
3673	0900	El Manantial	21.107752999999999	-89.674165000000002	50	1
3674	0901	Martha	20.872340000000001	-89.590400000000002	50	1
3675	0902	Maya Flor	21.097670999999998	-89.564006000000006	50	1
3676	0905	Las Morenitas	20.952721	-89.719476999999998	50	1
3677	0908	El Caribeño [Paradero]	20.840795	-89.658208999999999	50	1
3678	0909	Paraíso	21.152721	-89.598438999999999	50	1
3679	0910	Parque Áak	21.132925	-89.621530000000007	50	1
3680	0911	La Piedad (Crematorio)	21.051781999999999	-89.671108000000004	50	1
3681	0912	El Polvorín	20.871855	-89.595838999999998	50	1
3682	0913	Vigas Mi-Jack	21.061053999999999	-89.685574000000003	50	1
3683	0914	Prisciliano	20.899097999999999	-89.610911000000002	50	1
3684	0915	Puertas del Mayab	21.105841000000002	-89.592421000000002	50	1
3685	0917	Tokito [Quinta]	21.057625999999999	-89.564031	50	1
3686	0919	Rancho Xluch	20.952241999999998	-89.712028000000004	50	1
3687	0920	El Potrillo	21.098666000000001	-89.699740000000006	50	1
3688	0921	Renacimiento	20.870611	-89.58802	50	1
3689	0923	San Felipe	20.903271	-89.633300000000006	50	1
3690	0924	San José	21.011748000000001	-89.518037000000007	50	1
3691	0925	San José	20.799883000000001	-89.627223000000001	50	1
3692	0927	San Lorenzo	21.102682999999999	-89.692216000000002	50	1
3693	0928	San Lorenzo	21.096411	-89.715170999999998	50	1
3694	0929	San Lorenzo	21.102513999999999	-89.565971000000005	50	1
3695	0930	San Manuel II	21.096851999999998	-89.555239	50	1
3696	0931	San Martin	20.868410999999998	-89.594089999999994	50	1
3697	0932	San Rafael	21.097950999999998	-89.555435000000003	50	1
3698	0933	Margarita María	20.848548000000001	-89.598067	50	1
3699	0935	Los Siete Hermanos	21.122087000000001	-89.717611000000005	50	1
3700	0936	Villas Tatys	21.094933000000001	-89.565741000000003	50	1
3701	0937	Xkanán (Granjas Viridiana)	21.025677000000002	-89.529424000000006	50	1
3702	0938	Yaax Tuunich	21.054286999999999	-89.571687999999995	50	1
3703	0939	Yucapet	20.969467000000002	-89.701010999999994	50	1
3704	0940	El Borreo Alux	20.864867	-89.633275999999995	50	1
3705	0941	AES Mérida III	20.949183999999999	-89.734476999999998	50	1
3706	0942	Eloísa	21.036453000000002	-89.570065999999997	50	1
3707	0943	Procatex	21.184054	-89.645150999999998	50	1
3708	0944	La Rejoyada	21.119959999999999	-89.680477999999994	50	1
3709	0945	Yucatán Country Club	21.120726000000001	-89.599282000000002	50	1
3710	0946	Los Cardenales	21.100721	-89.727422000000004	50	1
3711	0948	Ninguno	21.093382999999999	-89.561985000000007	50	1
3712	0951	El Roble	21.102122999999999	-89.602641000000006	50	1
3713	0952	Virgen de Guadalupe [Granja]	21.124652999999999	-89.735237999999995	50	1
3714	0953	Yucatán Polo Club	21.124092000000001	-89.681134	50	1
3715	0955	La Ceiba [Villas]	21.091383	-89.631844000000001	50	1
3716	0956	Jorge Aarón Ordoñez	21.091099	-89.632783000000003	50	1
3717	0957	Virgen de Guadalupe	21.124980000000001	-89.735196000000002	50	1
3718	0958	Juan Pablo II	21.12257	-89.723149000000006	50	1
3719	0959	Alfonso Mena	21.118718999999999	-89.721417000000002	50	1
3720	0960	El Triunfo	21.111333999999999	-89.713525000000004	50	1
3721	0962	Diego Ix Lopez	21.102546	-89.556107999999995	50	1
3722	0963	Nelly Lucía Mendoza Alcocer	21.099459	-89.604628000000005	50	1
3723	0965	Tirzo Fernando Suárez Nuñez	21.099630000000001	-89.604804999999999	50	1
3724	0966	Margarita Osorio	21.093771	-89.561768000000001	50	1
3725	0967	Stuart Córdoba	21.094542000000001	-89.558471999999995	50	1
3726	0968	Humberto González Morales	20.864053999999999	-89.572620000000001	50	1
3727	0969	José Yamá	20.833081	-89.614433000000005	50	1
3728	0970	El Encuentro [Rancho]	20.861981	-89.572208000000003	50	1
3729	0971	Familia Góngora Mendoza	20.859238999999999	-89.570423000000005	50	1
3730	0972	Elizabeth Góngora Mendoza	20.858318000000001	-89.569536999999997	50	1
3731	0973	Gema [Rancho]	20.858554000000002	-89.570618999999994	50	1
3732	0974	El Forrajero [Rancho]	20.857848000000001	-89.570965000000001	50	1
3733	0975	Herbé González Morales	20.863961	-89.571943000000005	50	1
3734	0976	Bruno González Morales	20.864367000000001	-89.572480999999996	50	1
3735	0977	Ranfis	20.858957	-89.570752999999996	50	1
3736	0978	La Gaviota [Rancho]	20.852056999999999	-89.568590999999998	50	1
3737	0979	El Crucero	20.875568000000001	-89.595327999999995	50	1
3738	0980	Armando Ángeles Zaragoza	20.894065999999999	-89.604920000000007	50	1
3739	0981	Los Sali [Quinta]	20.895741000000001	-89.600403999999997	50	1
3740	0983	Ana Lilia Tamayo Navarro	20.836682	-89.655415000000005	50	1
3741	0984	Puño de Piedra	20.803991	-89.607414000000006	50	1
3742	0985	Dzoyaxché	20.791864	-89.585260000000005	50	1
3743	0986	Javier Medina	20.797916000000001	-89.603108000000006	50	1
3744	0987	Juan Manzanero	20.835436999999999	-89.655544000000006	50	1
3745	0988	Juan Pablo II	20.839269000000002	-89.658366000000001	50	1
3746	0989	María Juanita Navarro Aguilar	20.835450000000002	-89.655224000000004	50	1
3747	0990	El Mirador	20.809740999999999	-89.618792999999997	50	1
3748	0991	Ninguno [Quinta Agrícola]	20.844190000000001	-89.658647999999999	50	1
3749	0992	Ninguno [Quinta Agrícola]	20.843902	-89.658218000000005	50	1
3750	0993	Ninguno [Quinta Agrícola]	20.838804	-89.654414000000003	50	1
3751	0994	Ninguno [Quinta Agrícola]	20.808140000000002	-89.653186000000005	50	1
3752	0995	Ninguno [Quinta Agrícola]	20.770741999999998	-89.662156999999993	50	1
3753	0996	Ninguno [Quinta Agrícola]	20.804296000000001	-89.654381999999998	50	1
3754	0997	Ninguno [Quinta Agrícola]	20.805910999999998	-89.625985999999997	50	1
3755	0998	Ninguno [Quinta Agrícola]	20.824245999999999	-89.620518000000004	50	1
3756	0999	Ninguno [Quinta Agrícola]	20.824241000000001	-89.617915999999994	50	1
3757	1000	Ninguno [Quinta Agrícola]	20.788954	-89.584130999999999	50	1
3758	1001	Ninguno [Quinta Agrícola]	20.789539999999999	-89.584188999999995	50	1
3759	1002	Ninguno [Quinta Agrícola]	20.798881000000002	-89.604637999999994	50	1
3760	1003	Ninguno [Quinta Agrícola]	20.806963	-89.606605999999999	50	1
3761	1004	Ninguno [Quinta Agrícola]	20.808533000000001	-89.611378999999999	50	1
3762	1005	Ninguno [Quinta Agrícola]	20.809221000000001	-89.614530000000002	50	1
3763	1006	Ninguno [Quinta Agrícola]	20.806348	-89.621312000000003	50	1
3764	1007	Ninguno [Quinta Agrícola]	20.807863999999999	-89.623428000000004	50	1
3765	1008	Ninguno [Quinta Agrícola]	20.814357000000001	-89.618942000000004	50	1
3766	1009	El Paraíso	20.787606	-89.661114999999995	50	1
3767	1010	Paraíso	20.809238000000001	-89.626653000000005	50	1
3768	1011	San Antonio	20.790554	-89.597413000000003	50	1
3769	1012	San Antonio	20.749044000000001	-89.631814000000006	50	1
3770	1013	San Fernando	20.843388000000001	-89.659981999999999	50	1
3771	1014	El Tabasqueño	20.841355	-89.658401999999995	50	1
3772	1015	Terreno Apá	20.889150000000001	-89.610967000000002	50	1
3773	1016	El Xux	20.842811000000001	-89.661687999999998	50	1
3774	1017	Yóok'sojol	20.783711	-89.585137000000003	50	1
3775	1018	El Arco	20.890457999999999	-89.598211000000006	50	1
3776	1019	Chaactún	21.112742999999998	-89.622076000000007	50	1
3777	1022	La Casita del Sabor	21.050411	-89.538016999999996	50	1
3778	1023	Altosano	21.128494	-89.637264000000002	50	1
3779	1024	Blue Cedar [Privada Residencial]	21.131171999999999	-89.662186000000005	50	1
3780	1025	Club Norte Mérida [Residencial]	21.108483	-89.652983000000006	50	1
3781	1027	Parque Científico Tecnológico de Yucatán	21.130876000000001	-89.780867999999998	50	1
3782	1028	Campeón de México	21.119067000000001	-89.641317000000001	50	1
3783	1029	Harinera de Yucatán [Fábrica]	21.091667000000001	-89.640000000000001	50	1
3784	1030	Coliseo Yucatán	21.088494000000001	-89.638813999999996	50	1
3785	1031	Mitza	21.121383000000002	-89.644099999999995	50	1
3786	1032	Tl del Sur	21.157336000000001	-89.652033000000003	50	1
3787	0001	Mocochá	21.105684	-89.452055999999999	51	1
3788	0005	Chacnicté	21.102865000000001	-89.444473000000002	51	1
3789	0006	Tekat	21.097242000000001	-89.474124000000003	51	1
3790	0007	Toó	21.143889000000001	-89.452049000000002	51	1
3791	0010	Los Reyes [Rancho]	21.120180000000001	-89.451306000000002	51	1
3792	0012	Peniche	21.109189000000001	-89.436019999999999	51	1
3793	0013	San Antonio Yaxché	21.121146	-89.473226999999994	51	1
3794	0015	Santa Margarita	21.110144999999999	-89.432377000000002	51	1
3795	0016	Los Hermanos Cituk	21.096751999999999	-89.459182999999996	51	1
3796	0017	San Francisco	21.113851	-89.443252999999999	51	1
3797	0018	Álvaro de Regil	21.122389999999999	-89.454297999999994	51	1
3798	0019	San José [Granja]	21.098549999999999	-89.467106999999999	51	1
3799	0020	Santa Lucía	21.107382999999999	-89.441231999999999	51	1
3800	0021	Santa Miseria	21.111984	-89.439678999999998	51	1
3801	0024	Ninguno [Radio Difusora]	21.146619000000001	-89.440903000000006	51	1
3802	0025	Doblete	21.093836	-89.450925999999995	51	1
3803	0026	Crío [Granja]	21.111547999999999	-89.473496999999995	51	1
3804	0027	San Pedro [Granja]	21.13702	-89.451983999999996	51	1
3805	0028	San Roque [Granja]	21.128520999999999	-89.453506000000004	51	1
3806	0029	INIFAP [Centro de Investigación]	21.105991	-89.438143999999994	51	1
3807	0030	Ninguno	21.129379	-89.452574999999996	51	1
3808	0032	San José Tekax	21.091495999999999	-89.457150999999996	51	1
3809	0033	Ponylandia	21.093302999999999	-89.454001000000005	51	1
3810	0034	San Judas Tadeo [Quinta]	21.09507	-89.443297999999999	51	1
3811	0035	Ninguno	21.132809999999999	-89.452218999999999	51	1
3812	0036	Los Dos Hermanos	21.137653	-89.452931000000007	51	1
3813	0038	Paraíso [Rancho]	21.102720000000001	-89.459793000000005	51	1
3814	0039	Ninguno	21.100444	-89.461552999999995	51	1
3815	0040	La Huerta Cob	21.098503999999998	-89.465756999999996	51	1
3816	0041	San José [Vivero]	21.095745999999998	-89.467888000000002	51	1
3817	0042	Mocochá [Cementerio General]	21.101666999999999	-89.461667000000006	51	1
3818	0043	San José Temax	21.097999000000002	-89.468853999999993	51	1
3819	0044	Guadalupe	21.094415999999999	-89.464709999999997	51	1
3820	0045	Roger Pachón	21.093629	-89.467476000000005	51	1
3821	0046	Ninguno	21.093782999999998	-89.476068999999995	51	1
3822	0047	Vicente Estrella Cituk	21.093097	-89.476669000000001	51	1
3823	0048	Humberto Chan	21.110315	-89.443329000000006	51	1
3824	0049	Ninguno	21.118863999999999	-89.466035000000005	51	1
3825	0050	Xochimilco [Vivero]	21.131253999999998	-89.453237000000001	51	1
3826	0051	Plácido Vázquez Chan	21.114488999999999	-89.444580000000002	51	1
3827	0052	Palmeras	21.139241999999999	-89.452623000000003	51	1
3828	0053	Rancho Piña	21.124589	-89.452534	51	1
3829	0054	San Antonio	21.14462	-89.448321000000007	51	1
3830	0055	San Enrique	21.119064000000002	-89.471005000000005	51	1
3831	0056	San Judas Tadeo	21.094878000000001	-89.44426	51	1
3832	0057	San Luis	21.092884000000002	-89.441146000000003	51	1
3833	0058	Triturados	21.094308999999999	-89.437573	51	1
3834	0059	Fátima	21.096957	-89.461837000000003	51	1
3835	0060	Tierra Linda	21.129300000000001	-89.454209000000006	51	1
3836	0061	Chan Xunan	21.121316	-89.456086999999997	51	1
3837	0062	Palmeral	21.093881	-89.470249999999993	51	1
3838	0063	La Santísima	21.136690000000002	-89.419533000000001	51	1
3839	0001	Motul de Carrillo Puerto	21.095551	-89.283924999999996	52	1
3840	0002	Ucí	21.125475999999999	-89.270062999999993	52	1
3841	0003	Timul	21.193152999999999	-89.393248999999997	52	1
3842	0005	Sacapuc	21.166558999999999	-89.358953	52	1
3843	0007	Sabacnáh	21.077575	-89.262587999999994	52	1
3844	0008	Kopté	21.053896000000002	-89.229301000000007	52	1
3845	0009	San Antonio Dzinah	21.047378999999999	-89.288584	52	1
3846	0010	Uitzil	21.052887999999999	-89.243401000000006	52	1
3847	0011	Kancabchén	21.063317999999999	-89.235940999999997	52	1
3848	0012	Santa Cruz Pachón	21.077385	-89.281734	52	1
3849	0013	Kambul	21.094722000000001	-89.201567999999995	52	1
3850	0014	Mesatunich	21.076857	-89.201458000000002	52	1
3851	0015	Kaxatah	21.092623	-89.253833	52	1
3852	0016	San Pedro Cámara	21.057247	-89.215993999999995	52	1
3853	0017	San Pedro Chacabal	21.135583	-89.193292	52	1
3854	0018	Tanyá	21.110835999999999	-89.251813999999996	52	1
3855	0019	Santa Teresa	21.146128999999998	-89.223724000000004	52	1
3856	0020	Kancabchén Ucí	21.171308	-89.240685999999997	52	1
3857	0021	Komchén Martínez	21.152850000000001	-89.264095999999995	52	1
3858	0022	Miguel Hidalgo y Costilla	21.069509	-89.280927000000005	52	1
3859	0023	Kiní	21.135293000000001	-89.315928	52	1
3860	0024	San José Hili	21.132100000000001	-89.356880000000004	52	1
3861	0026	Telal	21.111369	-89.309548000000007	52	1
3862	0029	Kancabal	21.110823	-89.260093999999995	52	1
3863	0030	Dzununcán	21.101254000000001	-89.256431000000006	52	1
3864	0031	Ticopó Gutiérrez	21.134837000000001	-89.299227000000002	52	1
3865	0032	Canutillo	21.161978000000001	-89.275889000000006	52	1
3866	0033	Sakolá	21.099232000000001	-89.326284000000001	52	1
3867	0036	Los Cocos	21.120761000000002	-89.287733000000003	52	1
3868	0037	Dzitox	21.172563	-89.185184000000007	52	1
3869	0038	San Marcos	21.144514999999998	-89.277786000000006	52	1
3870	0039	San Sebastián de Aparicio	21.260210000000001	-89.410839999999993	52	1
3871	0040	Anicabil de la Guadalupana	21.148050999999999	-89.321279000000004	52	1
3872	0041	Anikabil	21.152712999999999	-89.331723999999994	52	1
3873	0042	Chumuc Xix	21.170068000000001	-89.289985000000001	52	1
3874	0044	Santa Rita de la Cruz	21.266071	-89.408912999999998	52	1
3875	0045	San Ratón	21.116358999999999	-89.295503999999994	52	1
3876	0046	Rocío Uno	21.17313	-89.276106999999996	52	1
3877	0047	El Establo	21.172412000000001	-89.280452999999994	52	1
3878	0048	San Antonio	21.188571	-89.196312000000006	52	1
3879	0049	San Antonio Chemal	21.062276000000001	-89.271153999999996	52	1
3880	0050	San Francisco	21.077873	-89.209109999999995	52	1
3881	0051	San Ignacio Petzbalam	21.229873999999999	-89.408535000000001	52	1
3882	0052	San Miguel	21.066291	-89.278941000000003	52	1
3883	0054	San Simón	21.252974999999999	-89.402463999999995	52	1
3884	0056	La Asunción	21.148261999999999	-89.338566	52	1
3885	0058	Santa María	21.188661	-89.344988000000001	52	1
3886	0059	Santa María Halal	21.269919000000002	-89.414991000000001	52	1
3887	0061	Texán Espejo	21.117111999999999	-89.313852999999995	52	1
3888	0062	San Francisco	21.231549000000001	-89.156948	52	1
3889	0063	Yaxché	21.155169999999998	-89.283683999999994	52	1
3890	0065	Quinta Adrián	21.103785999999999	-89.304721999999998	52	1
3891	0072	Kilómetro Uno	21.118068000000001	-89.280400999999998	52	1
3892	0075	Paparux [Quinta]	21.144452000000001	-89.278722000000002	52	1
3893	0076	Sacapuc	21.159185999999998	-89.348472999999998	52	1
3894	0081	San Carlos	21.064587	-89.182382000000004	52	1
3895	0082	Dehenesur	21.092037000000001	-89.184845999999993	52	1
3896	0083	Tebón	21.075939999999999	-89.249453000000003	52	1
3897	0084	Ninguno [Granja]	21.181974	-89.391564000000002	52	1
3898	0085	La Cueva	21.067295999999999	-89.285396000000006	52	1
3899	0086	La Esperanza	21.1279	-89.255807000000004	52	1
3900	0088	Kopté	21.057645999999998	-89.241265999999996	52	1
3901	0089	San Agustín	21.069997999999998	-89.291310999999993	52	1
3902	0090	San Carlos	21.081952000000001	-89.297331999999997	52	1
3903	0091	Sac-Nicté	21.160475999999999	-89.279962999999995	52	1
3904	0092	San José Chico	21.067812	-89.276443	52	1
3905	0093	San Juan Bautista	21.077703	-89.302779999999998	52	1
3906	0094	San Miguel	21.105395999999999	-89.302537999999998	52	1
3907	0095	Sansorito	21.144795999999999	-89.276667000000003	52	1
3908	0096	Santa Elena	21.092214999999999	-89.182208000000003	52	1
3909	0097	Santa Rosa	21.063095000000001	-89.188767999999996	52	1
3910	0098	San Blas	21.142600000000002	-89.285382999999996	52	1
3911	0099	Ninguno	21.159184	-89.275987999999998	52	1
3912	0100	San Mateo	21.063731000000001	-89.281565000000001	52	1
3913	0101	San Juan	21.064920000000001	-89.275861000000006	52	1
3914	0102	San Fernando	21.061796000000001	-89.277013999999994	52	1
3915	0103	Texas	21.077221999999999	-89.307372999999998	52	1
3916	0105	Xinté	21.189183	-89.160978	52	1
3917	0106	San Julián	21.177658000000001	-89.370677999999998	52	1
3918	0109	Chen Tul	21.140892999999998	-89.272113000000004	52	1
3919	0110	Chunhuayum	21.135929000000001	-89.237088	52	1
3920	0111	Las Dos Hermanas	21.058191000000001	-89.274399000000003	52	1
3921	0112	La Esperanza	21.111564000000001	-89.291013000000007	52	1
3922	0113	La Cruz de Piedra	21.122843	-89.350803999999997	52	1
3923	0114	San Pedro Huano	21.075008	-89.275707999999995	52	1
3924	0115	La Guadalupana	21.17033	-89.276298999999995	52	1
3925	0116	Ninguno	21.160492999999999	-89.290310000000005	52	1
3926	0117	Papayux [Quinta]	21.142094	-89.283261999999993	52	1
3927	0118	Ninguno	21.063175999999999	-89.287389000000005	52	1
3928	0120	Ninguno	21.060601999999999	-89.283714000000003	52	1
3929	0121	San Juan	21.065249000000001	-89.285955000000001	52	1
3930	0122	La Lupita	21.060756000000001	-89.275756000000001	52	1
3931	0123	Motul [Rastro Municipal]	21.08023	-89.298709000000002	52	1
3932	0124	San Antonio	21.078482000000001	-89.289714000000004	52	1
3933	0125	San Francisco	21.171095999999999	-89.276025000000004	52	1
3934	0126	San Francisco	21.133731999999998	-89.223339999999993	52	1
3935	0127	San José	21.149661999999999	-89.332739000000004	52	1
3936	0128	San José	21.075047999999999	-89.290364999999994	52	1
3937	0129	San José Chunhuayum	21.133572000000001	-89.243093000000002	52	1
3938	0130	San Juan	21.084061999999999	-89.262906000000001	52	1
3939	0131	San Juan	21.071435000000001	-89.290101000000007	52	1
3940	0132	San Lázaro	21.118779	-89.285261000000006	52	1
3941	0133	Sanatorio	21.098869000000001	-89.309753999999998	52	1
3942	0134	Tierra de Osos	21.132131999999999	-89.274887000000007	52	1
3943	0135	Salvador Díaz Mirón [Telesecundaria]	21.088048000000001	-89.204533999999995	52	1
3944	0136	Zapote	21.133709	-89.235910000000004	52	1
3945	0137	La Bendición de Jesucristo	21.19406	-89.401707000000002	52	1
3946	0138	El Cerro	21.198166000000001	-89.387015000000005	52	1
3947	0139	El Divino Niño	21.152228999999998	-89.357066000000003	52	1
3948	0140	San Isidro Labrador	21.171786999999998	-89.371729000000002	52	1
3949	0141	Sipchac	21.192273	-89.399440999999996	52	1
3950	0142	La Unión	21.193223	-89.399458999999993	52	1
3951	0143	Hubichén	21.035084999999999	-89.255195999999998	52	1
3952	0146	Los Pilastrones	21.074539000000001	-89.302723999999998	52	1
3953	0147	Muas	21.135811	-89.206314000000006	52	1
3954	0148	Medina	21.144417000000001	-89.313725000000005	52	1
3955	0149	San Bernardo	21.164597000000001	-89.323291999999995	52	1
3956	0150	San Miguel	21.079311000000001	-89.32056	52	1
3957	0151	San Miguel	21.031207999999999	-89.251046000000002	52	1
3958	0152	Santa Cruz	21.158055000000001	-89.313590000000005	52	1
3959	0153	Santa María	21.149861999999999	-89.315977000000004	52	1
3960	0154	Tunben Che'en	21.057670000000002	-89.219325999999995	52	1
3961	0155	El Sitio	21.078861	-89.263727000000003	52	1
3962	0156	San Martín 2	21.151475999999999	-89.337795	52	1
3963	0158	Pedro Pech	21.100541	-89.229727999999994	52	1
3964	0159	San Isidro [Rancho]	21.099104000000001	-89.216775999999996	52	1
3965	0160	La Esperanza	21.097480000000001	-89.222633000000002	52	1
3966	0161	San Carlos Dos [Rancho]	21.096041	-89.213938999999996	52	1
3967	0162	Luis Uitz	21.103107999999999	-89.243837999999997	52	1
3968	0165	Ninguno	21.100566000000001	-89.303876000000002	52	1
3969	0166	Isaías	21.140281000000002	-89.285956999999996	52	1
3970	0167	Chen López	21.156016000000001	-89.316333	52	1
3971	0168	Tzeoc	21.162928000000001	-89.332818000000003	52	1
3972	0169	Las Moras	21.164332999999999	-89.318017999999995	52	1
3973	0170	Pap Ic	21.102428	-89.238224000000002	52	1
3974	0171	Los Ceibos [Paraje]	21.111156000000001	-89.296539999999993	52	1
3975	0172	San Agustín	21.093944	-89.210620000000006	52	1
3976	0173	San Antonio	21.162357	-89.333544000000003	52	1
3977	0174	San Benigno	21.142230000000001	-89.311734999999999	52	1
3978	0175	San Bernardo	21.173656000000001	-89.364932999999994	52	1
3979	0176	San Manuel	21.085775999999999	-89.203463999999997	52	1
3980	0177	San Francisco	21.158712999999999	-89.322984000000005	52	1
3981	0178	San Gabriel I y II	21.083794000000001	-89.208449000000002	52	1
3982	0179	San Martín	21.151554000000001	-89.345505000000003	52	1
3983	0180	Santa Cruz de los Chaltunes	21.120685999999999	-89.304463999999996	52	1
3984	0181	Santa Genoveva	21.176756999999998	-89.364913999999999	52	1
3985	0183	Los Aluxes	21.155069999999998	-89.267204000000007	52	1
3986	0184	Casa Macías Pino	21.119104	-89.280255999999994	52	1
3987	0185	Casa Rosa	21.117763	-89.281735999999995	52	1
3988	0186	San Miguel Arcángel	21.128428	-89.354004000000003	52	1
3989	0187	Cocos	21.118451	-89.280614	52	1
3990	0188	La Esperanza	21.078133000000001	-89.292685000000006	52	1
3991	0189	Ex-Cordemex	21.16159	-89.353757000000002	52	1
3992	0190	Margarita Rosado	21.153416	-89.279112999999995	52	1
3993	0191	El Juguete	21.045400999999998	-89.261947000000006	52	1
3994	0192	Los Tulipanes	21.171721999999999	-89.256178000000006	52	1
3995	0193	Ninguno	21.170802999999999	-89.257723999999996	52	1
3996	0194	Graciela Ku	21.127504999999999	-89.354613999999998	52	1
3997	0195	Ramonal	21.117605000000001	-89.346339	52	1
3998	0196	Ninguno	21.117868000000001	-89.280606000000006	52	1
3999	0197	Irving Zuriel Uicab Pech	21.118561	-89.281094999999993	52	1
4000	0198	Priscila Pech Ek	21.118860999999999	-89.281226000000004	52	1
4001	0199	Salazar	21.128886000000001	-89.280529000000001	52	1
4002	0200	Quitan	21.166215999999999	-89.276606000000001	52	1
4003	0201	Alejandro Chacón	21.115793	-89.273567	52	1
4004	0202	Ninguno	21.117528	-89.277186999999998	52	1
4005	0203	Ninguno	21.103206	-89.300799999999995	52	1
4006	0204	María Roberta Balam Canul	21.050727999999999	-89.271006	52	1
4007	0205	Parcela Ciento Cuarenta y Tres	21.166326000000002	-89.349968000000004	52	1
4008	0206	San Camilo	21.115728000000001	-89.300377999999995	52	1
4009	0207	San Félix (La Palapa)	21.118704000000001	-89.272328999999999	52	1
4010	0208	San José	21.146456000000001	-89.218738000000002	52	1
4011	0209	San José Cercado	21.057617	-89.289699999999996	52	1
4012	0210	Santa Cruz Pich	21.089032	-89.249377999999993	52	1
4013	0211	Siniiga [UGRY]	21.104682	-89.299757	52	1
4014	0212	U'Chuun Che Yuum Cruz	21.125671000000001	-89.308509999999998	52	1
4015	0213	El Rosario	21.154532	-89.283237999999997	52	1
4016	0214	Rosa Marina (Sac Luk)	21.066400999999999	-89.245191000000005	52	1
4017	0001	Muna	20.483953	-89.713378000000006	53	1
4018	0002	Choyob	20.532381999999998	-89.701723000000001	53	1
4019	0003	San José Tipceh	20.462074000000001	-89.670086999999995	53	1
4020	0004	Yaxhá	20.534524999999999	-89.666630999999995	53	1
4021	0005	Uxmal [Campo Experimental]	20.409669000000001	-89.756324000000006	53	1
4022	0006	Xocchel	20.406403000000001	-89.780683999999994	53	1
4023	0008	Chacsinicché	20.551994000000001	-89.670021000000006	53	1
4024	0009	Santa Rosa	20.534061999999999	-89.740896000000006	53	1
4025	0010	Los Ángeles	20.475147	-89.697879999999998	53	1
4026	0012	San Miguel Garrido	20.554827	-89.714279000000005	53	1
4027	0014	Kankirixché	20.581759999999999	-89.741653999999997	53	1
4028	0015	Lázaro Cárdenas	20.405128000000001	-89.762373999999994	53	1
4029	0016	Mi Rancho	20.558675000000001	-89.708399	53	1
4030	0018	Sahcabá	20.504075	-89.751462000000004	53	1
4031	0020	San Erasmo	20.491754	-89.736185000000006	53	1
4032	0023	San Miguel	20.476358000000001	-89.715823999999998	53	1
4033	0024	San Miguel Inlum	20.387236000000001	-89.777986999999996	53	1
4034	0026	Tejas	20.400248999999999	-89.772017000000005	53	1
4035	0031	Uxmal [Rancho]	20.399369	-89.767598000000007	53	1
4036	0035	Maxal	20.549744	-89.745310000000003	53	1
4037	0037	Yaxcopil	20.512892000000001	-89.656644999999997	53	1
4038	0038	Ahuandara	20.469139999999999	-89.714890999999994	53	1
4039	0043	San Martín de Porres	20.491046000000001	-89.738737999999998	53	1
4040	0052	Victoria	20.511710999999998	-89.711636999999996	53	1
4041	0060	San Rosendo Martín	20.403991000000001	-89.747101000000001	53	1
4042	0061	Agroyucatán	20.578257000000001	-89.728140999999994	53	1
4043	0062	Cana-Nah	20.398401	-89.768473	53	1
4044	0063	Cerro de la Cruz	20.469124000000001	-89.714264	53	1
4045	0068	Monte Sol	20.472211999999999	-89.692761000000004	53	1
4046	0069	Plan-Chac	20.402162000000001	-89.743519000000006	53	1
4047	0070	Santa Rosa	20.518647000000001	-89.707378000000006	53	1
4048	0071	Serafina	20.527228000000001	-89.708287999999996	53	1
4049	0074	Hol Puuc	20.508423000000001	-89.710070000000002	53	1
4050	0075	Huayín	20.471193	-89.692984999999993	53	1
4051	0076	Barbosa [Invernadero]	20.488724000000001	-89.727466000000007	53	1
4052	0077	Haltún	20.376106	-89.771377999999999	53	1
4053	0079	Rubén Góngora Ku	20.514095000000001	-89.708271999999994	53	1
4054	0080	El Desvío	20.510916000000002	-89.708788999999996	53	1
4055	0081	Mun-Há	20.491288000000001	-89.735489999999999	53	1
4056	0083	Hermanos Castro	20.479938000000001	-89.723279000000005	53	1
4057	0086	San Pedro La'a Ché	20.465468999999999	-89.673599999999993	53	1
4058	0087	Misión [Hotel]	20.376633000000002	-89.771336000000005	53	1
4059	0001	Muxupip	21.042822999999999	-89.329891000000003	54	1
4060	0005	San José Grande	21.027625	-89.308265000000006	54	1
4061	0006	San Juan Koop	21.030664000000002	-89.344421999999994	54	1
4062	0008	Katzmil	21.058157999999999	-89.331165999999996	54	1
4063	0011	San Antonio Pork	21.054020999999999	-89.328355000000002	54	1
4064	0012	San Miguel	21.030154	-89.313032000000007	54	1
4065	0013	Ninguno	21.063365999999998	-89.319349000000003	54	1
4066	0015	El Sacrificio	21.047440000000002	-89.340143999999995	54	1
4067	0021	Víctor Cervera [Unidad Ganadera]	20.998099	-89.345703	54	1
4068	0023	Felipe Carrillo Puerto	21.065701000000001	-89.318567000000002	54	1
4069	0024	Final	21.048943000000001	-89.339213000000001	54	1
4070	0025	Lácteos Dos Mil	21.068297999999999	-89.315943000000004	54	1
4071	0026	San Antonio Pork	21.056957000000001	-89.321492000000006	54	1
4072	0027	Santa Cruz	21.058354000000001	-89.324043000000003	54	1
4073	0028	Ninguno	21.047349000000001	-89.340969000000001	54	1
4074	0029	San José Grande	21.028383999999999	-89.295192999999998	54	1
4075	0030	Kancabchén [UAIM]	21.035608	-89.316301999999993	54	1
4076	0031	El Cedral	21.052215	-89.324916999999999	54	1
4077	0033	San Antonio Pork Tres	21.060531000000001	-89.333003000000005	54	1
4078	0034	Triple A [Rancho]	21.028499	-89.336726999999996	54	1
4079	0001	Opichén	20.550650999999998	-89.856244000000004	55	1
4080	0002	Calcehtok	20.567204	-89.912198000000004	55	1
4081	0004	San Claudio	20.546786000000001	-89.865905999999995	55	1
4082	0005	San Cristóbal Penxixín	20.532719	-89.814868000000004	55	1
4083	0008	San Pablo	20.538032000000001	-89.846101000000004	55	1
4084	0009	Chaca	20.574379	-89.931526000000005	55	1
4085	0010	Juguetonas 2	20.536389	-89.830663000000001	55	1
4086	0013	Chuyuchén	20.583563000000002	-89.916428999999994	55	1
4087	0015	Kochacá	20.572458000000001	-89.775358999999995	55	1
4088	0024	San Manuel	20.571577999999999	-89.909411000000006	55	1
4089	0026	San Pedro	20.548984000000001	-89.868290000000002	55	1
4090	0027	Santa Rita	20.540963999999999	-89.843199999999996	55	1
4091	0028	Tikintzec	20.529413000000002	-89.798627999999994	55	1
4092	0039	Santa Cruz	20.581558000000001	-89.957037	55	1
4093	0040	Nucancab	20.576577	-89.939413000000002	55	1
4094	0042	Santa Elena	20.542355000000001	-89.855880999999997	55	1
4095	0047	Nucancab [Anexo]	20.577466999999999	-89.945899999999995	55	1
4096	0048	Felipe Carrillo Puerto	20.565871000000001	-89.857223000000005	55	1
4097	0050	Flor de Margarita	20.561146000000001	-89.856110000000001	55	1
4098	0051	Fernando Mena Casanova	20.559978999999998	-89.856261000000003	55	1
4099	0052	José Gerardo Serrano Burgos	20.571569	-89.910929999999993	55	1
4100	0053	Isaac Navarro Flores	20.572288	-89.911106000000004	55	1
4101	0054	José Rolando Chin	20.544920000000001	-89.858951000000005	55	1
4102	0055	Macedonia Maya Mármol	20.560299000000001	-89.910953000000006	55	1
4103	0056	Pedro Estrella Ordoñez	20.552492999999998	-89.865475000000004	55	1
4104	0057	Unidad Córdoba	20.544784	-89.857703000000001	55	1
4105	0001	Oxkutzcab	20.301932999999998	-89.418751999999998	56	1
4106	0004	Emiliano Zapata	20.227395999999999	-89.467094000000003	56	1
4107	0007	X-Kobenhaltún	20.080303000000001	-89.523117999999997	56	1
4108	0010	Sahcahmucuy	20.176155999999999	-89.492321000000004	56	1
4109	0011	San Antonio Techoh	20.283373999999998	-89.399503999999993	56	1
4110	0013	Xohuayán	20.187189	-89.383301000000003	56	1
4111	0014	Xul	20.102101000000001	-89.462731000000005	56	1
4112	0016	Yaxhachén	20.051041000000001	-89.566136	56	1
4113	0017	San Anselmo	20.269331000000001	-89.384716999999995	56	1
4114	0018	San José Kunché	20.247689999999999	-89.387812999999994	56	1
4115	0020	Plan Chac Pozo Cuatro	20.301670999999999	-89.390191999999999	56	1
4116	0022	Bombahaltún	20.059032999999999	-89.422594000000004	56	1
4117	0023	Centro Bachillerato Tecnológico Agropecuario	20.247059	-89.520043000000001	56	1
4118	0025	CONAGUA [Oxkutzcab]	20.290899	-89.393720999999999	56	1
4119	0028	San Antonio Ekmabén	20.355467000000001	-89.416832999999997	56	1
4120	0029	El Vergel	20.197019000000001	-89.478222000000002	56	1
4121	0030	Kiuic	20.089950999999999	-89.550932000000003	56	1
4122	0031	Labná	20.172988	-89.578434999999999	56	1
4123	0033	Nohcacab	20.037838000000001	-89.385371000000006	56	1
4124	0034	Noh Chakán	20.278448000000001	-89.403908999999999	56	1
4125	0035	Plan Chac Pozo Cinco	20.311444000000002	-89.390359000000004	56	1
4126	0036	Pozo Siete	20.319609	-89.378045999999998	56	1
4127	0037	Potoit	20.235271000000001	-89.488440999999995	56	1
4128	0039	Sabacché	20.203281	-89.569753000000006	56	1
4129	0042	San Francisco	20.226618999999999	-89.524932000000007	56	1
4130	0043	San Francisco	20.333514000000001	-89.412349000000006	56	1
4131	0044	San Isidro	20.195135000000001	-89.377765999999994	56	1
4132	0045	San Joaquín	20.220811999999999	-89.514414000000002	56	1
4133	0048	San Pablo	20.167180999999999	-89.449464000000006	56	1
4134	0050	San Víctor	20.319894999999999	-89.374256000000003	56	1
4135	0054	Santa Octaviana	20.340479999999999	-89.418023000000005	56	1
4136	0055	Santo Domingo	20.179268	-89.527670999999998	56	1
4137	0057	X-Canajelé	20.156224000000002	-89.501546000000005	56	1
4138	0058	X-Kom	20.175785999999999	-89.556757000000005	56	1
4139	0059	Xlapak	20.175853	-89.606189000000001	56	1
4140	0060	X-Nibacal	20.182098	-89.450997000000001	56	1
4141	0061	Ucmil	20.209268999999999	-89.491939000000002	56	1
4142	0064	San Antonio Yaaxhom	20.248092	-89.476562000000001	56	1
4143	0065	Lol-Tún	20.253653	-89.455811999999995	56	1
4144	0067	Víctor Cervera Pacheco	20.282862000000002	-89.433465999999996	56	1
4145	0070	Muli Kum	20.220499	-89.431188000000006	56	1
4146	0074	Xcalthaltún	20.149509999999999	-89.447537999999994	56	1
4147	0075	Kunché-Haltún	20.141013000000001	-89.434174999999996	56	1
4148	0076	Nohsal [Centro Habitacional]	20.275805999999999	-89.425264999999996	56	1
4149	0077	Plan Tabí Pozo Uno	20.248515999999999	-89.543799000000007	56	1
4150	0078	San Felipe	20.200883999999999	-89.474450000000004	56	1
4151	0079	San Bartolo	20.289189	-89.412959000000001	56	1
4152	0080	Unión de Ejidos Citricultores	20.285617999999999	-89.384182999999993	56	1
4153	0081	San Juan	20.260162000000001	-89.542732000000001	56	1
4154	0082	San Juan	20.169360999999999	-89.437447000000006	56	1
4155	0084	Venustiano Carranza	20.289071	-89.424119000000005	56	1
4156	0086	Santa María	20.043586000000001	-89.422635999999997	56	1
4157	0087	Tabí Pozo Tres	20.243027000000001	-89.507611999999995	56	1
4158	0088	San Francisco	20.334543	-89.418056000000007	56	1
4159	0089	Mario Chaón Medina	20.285629	-89.423632999999995	56	1
4160	0090	Román Santa María	20.310836999999999	-89.436113000000006	56	1
4161	0091	Luis Donaldo Colosio	20.252566999999999	-89.455742000000001	56	1
4162	0093	Plan Chac Pozo Nueve	20.325046	-89.384680000000003	56	1
4163	0094	Los Tres Hermanos	20.156334999999999	-89.462052999999997	56	1
4164	0095	Xcauich	20.322948	-89.432023000000001	56	1
4165	0096	Dos Piedras	20.210477999999998	-89.464985999999996	56	1
4166	0097	X-Kakal	20.187930999999999	-89.402720000000002	56	1
4167	0098	Instituto Tecnológico Superior del Sur	20.28905	-89.390304999999998	56	1
4168	0099	Crucero Tabí	20.246486999999998	-89.492149999999995	56	1
4169	0100	Aldanas	20.279221	-89.406073000000006	56	1
4170	0101	Oxkutzcab [Basurero Municipal]	20.267014	-89.445964000000004	56	1
4171	0103	El Crucero [Paradero]	20.277754999999999	-89.430396999999999	56	1
4172	0104	Guadalupe	20.311574	-89.442511999999994	56	1
4173	0105	Haltún Kutzutzui	20.201066999999998	-89.443955000000003	56	1
4174	0106	Esmeralda	20.244374000000001	-89.458179000000001	56	1
4175	0107	Yaxhom Antiguo	20.237978999999999	-89.481061999999994	56	1
4176	0108	Chunhuaymil	20.111357000000002	-89.651488000000001	56	1
4177	0109	Las Águilas	20.094215999999999	-89.509264000000002	56	1
4178	0110	Las Bugambilias	20.294657999999998	-89.392217000000002	56	1
4179	0111	Chum Chucum	20.275148000000002	-89.431895999999995	56	1
4180	0112	El Cubano	20.295463999999999	-89.391171999999997	56	1
4181	0113	Gabriel May	20.313431999999999	-89.394812000000002	56	1
4182	0114	Linduras de mi Tierra	20.296203999999999	-89.391801000000001	56	1
4183	0115	El Sacrificio	20.324784000000001	-89.417620999999997	56	1
4184	0116	Santa Ana	20.264683999999999	-89.377048000000002	56	1
4185	0117	Martha Imelda Calderón	20.292269999999998	-89.393994000000006	56	1
4186	0118	El Pionero	20.294243000000002	-89.393164999999996	56	1
4187	0119	Plan Chac Pozo Uno	20.306182	-89.368628000000001	56	1
4188	0120	Plantío Ticul	20.178515999999998	-89.594128999999995	56	1
4189	0121	Jaime	20.288041	-89.384990999999999	56	1
4190	0122	Pozo Dos	20.292289	-89.376678999999996	56	1
4191	0123	Pozo Seis	20.315090999999999	-89.387535	56	1
4192	0124	Pozo Unidad Ceres	20.320988	-89.425606999999999	56	1
4193	0126	San Francisco Yaaxhom	20.248653999999998	-89.470349999999996	56	1
4194	0127	San Marcos	20.320629	-89.438674000000006	56	1
4195	0128	Flamboyanes	20.293275999999999	-89.388028000000006	56	1
4196	0129	Río Verde	20.289867999999998	-89.389325999999997	56	1
4197	0130	Los Alacranes	20.279554999999998	-89.400999999999996	56	1
4198	0131	María Fany Chab Chablé	20.248332999999999	-89.490662999999998	56	1
4199	0132	Potoit Dos (Las Hermanas)	20.237386000000001	-89.494917999999998	56	1
4200	0133	Pozo 644	20.301379000000001	-89.391080000000002	56	1
4201	0134	Pozo Tres	20.296778	-89.386221000000006	56	1
4202	0135	San Miguel	20.204989000000001	-89.444160999999994	56	1
4203	0136	Unidad 645	20.294784	-89.390439999999998	56	1
4204	0137	Plan Chaac Pozo 4 [Anexo]	20.309087999999999	-89.386578999999998	56	1
4205	0138	Santa Rita	20.105664000000001	-89.585414	56	1
4206	0139	Sayil	20.179020999999999	-89.653026999999994	56	1
4207	0001	Panabá	21.296861	-88.271182999999994	57	1
4208	0002	Loché	21.388764999999999	-88.146281000000002	57	1
4209	0004	San José Díaz	21.274362	-88.320293000000007	57	1
4210	0005	San Juan del Río	21.446608000000001	-88.156788000000006	57	1
4211	0006	Cenote Yalsihón Buena Fe	21.40775	-88.504171999999997	57	1
4212	0008	Santa Martha	21.358429999999998	-88.134563999999997	57	1
4213	0009	San Lorenzo	21.265650000000001	-88.262197999999998	57	1
4214	0011	Nohsubul	21.422263999999998	-88.159154000000001	57	1
4215	0012	Santa Rita	21.408771000000002	-88.181894999999997	57	1
4216	0013	San Agustín	21.249331999999999	-88.255380000000002	57	1
4217	0015	El Álamo	21.407364000000001	-88.474097999999998	57	1
4218	0018	San Pablo	21.436491	-88.484685999999996	57	1
4219	0019	Chuncopó	21.430543	-88.493909000000002	57	1
4220	0020	San Cristóbal	21.425719999999998	-88.464457999999993	57	1
4221	0021	San Isidro	21.405360999999999	-88.465199999999996	57	1
4222	0022	Yaxcabá	21.385072000000001	-88.436160999999998	57	1
4223	0023	Santa Rosa	21.364021000000001	-88.161243999999996	57	1
4224	0025	San Pedro	21.431003	-88.446819000000005	57	1
4225	0026	San Ramón	21.404803000000001	-88.405207000000004	57	1
4226	0027	San Benito	21.379612999999999	-88.488879999999995	57	1
4227	0028	Santiaguito	21.376152000000001	-88.443798999999999	57	1
4228	0031	Chan Dzonot	21.343183	-88.470189000000005	57	1
4229	0032	Santa Cruz	21.296150000000001	-88.293758999999994	57	1
4230	0039	Santa Rita	21.320440999999999	-88.458022999999997	57	1
4231	0041	San Miguel Uno	21.315124999999998	-88.397136000000003	57	1
4232	0042	San José Paz	21.284801999999999	-88.466868000000005	57	1
4233	0045	San Lorenzo	21.226171000000001	-88.293205999999998	57	1
4234	0047	Yohactún	21.355778000000001	-88.263908000000001	57	1
4235	0051	Montecristo	21.299676999999999	-88.383708999999996	57	1
4236	0052	San Miguel Dos	21.319026999999998	-88.378707000000006	57	1
4237	0054	Janitzio	21.333763999999999	-88.413145999999998	57	1
4238	0055	Santa María Ha-Kil	21.375606000000001	-88.251659000000004	57	1
4239	0056	Kanhá	21.349944000000001	-88.389987000000005	57	1
4240	0057	Chen Kin	21.350089000000001	-88.380035000000007	57	1
4241	0058	San Carlos	21.34864	-88.415481	57	1
4242	0062	San José	21.358236000000002	-88.426073000000002	57	1
4243	0063	Huapango	21.356673000000001	-88.385593999999998	57	1
4244	0065	El Pedregal	21.384876999999999	-88.401179999999997	57	1
4245	0066	Santa Úrsula	21.395783000000002	-88.399902999999995	57	1
4246	0067	Texas	21.403371	-88.388141000000005	57	1
4247	0068	Xbella	21.417323	-88.429384999999996	57	1
4248	0070	San Mateo	21.310722999999999	-88.352427000000006	57	1
4249	0073	Porvenir	21.302233999999999	-88.326586000000006	57	1
4250	0074	Dzadz Pichí	21.315329999999999	-88.317268999999996	57	1
4251	0077	Dzidziyá	21.31362	-88.339107999999996	57	1
4252	0083	Yokdzonot	21.342292	-88.319795999999997	57	1
4253	0086	X-Cristal	21.352681	-88.321477000000002	57	1
4254	0088	Josefita	21.368248000000001	-88.326059000000001	57	1
4255	0089	San Pedro Sac Be	21.399256000000001	-88.272153000000003	57	1
4256	0094	Los Cuatro Hermanos	21.320128	-88.327533000000003	57	1
4257	0096	X-Arobá	21.321078	-88.328145000000006	57	1
4258	0098	La Central	21.297619999999998	-88.312780000000004	57	1
4259	0100	Buena Esperanza	21.302367	-88.339787999999999	57	1
4260	0101	San Isidro	21.271367999999999	-88.264574999999994	57	1
4261	0102	Santa Cruz	21.370484999999999	-88.406977999999995	57	1
4262	0103	Paso del Toro	21.313227000000001	-88.290768999999997	57	1
4263	0105	Dos Reyes	21.247174000000001	-88.270470000000003	57	1
4264	0107	Pitz-Ceh	21.303521	-88.305458999999999	57	1
4265	0109	Hopelchén	21.268733000000001	-88.306718000000004	57	1
4266	0110	El Dólar	21.343917999999999	-88.271856999999997	57	1
4267	0116	San Miguel	21.334472000000002	-88.231882999999996	57	1
4268	0128	Santa Anita	21.316098	-88.276797000000002	57	1
4269	0130	Mocché	21.326364000000002	-88.289248999999998	57	1
4270	0139	La Bendición de Dios	21.3628	-88.325384	57	1
4271	0141	Noh Yaxtún	21.342538000000001	-88.353453999999999	57	1
4272	0145	Santa Rita	21.375959000000002	-88.360494000000003	57	1
4273	0147	San José	21.418879	-88.192684	57	1
4274	0149	San Ramón	21.406772	-88.282534999999996	57	1
4275	0152	San Benito	21.335089	-88.230609000000001	57	1
4276	0156	San Agustín	21.370536000000001	-88.324848000000003	57	1
4277	0158	San Francisco	21.391497999999999	-88.329826999999995	57	1
4278	0161	Santa Isabel	21.379958999999999	-88.318837000000002	57	1
4279	0163	Santa Margarita	21.422837000000001	-88.364832000000007	57	1
4280	0164	Dzonot Caamal	21.314978	-88.200204999999997	57	1
4281	0165	Santa Rosalía	21.344093000000001	-88.207460999999995	57	1
4282	0169	San Manuel	21.343336999999998	-88.296995999999993	57	1
4283	0170	X-Ceh Canul	21.314741000000001	-88.187447000000006	57	1
4284	0174	Santa Elena	21.333428999999999	-88.177335999999997	57	1
4285	0179	La Costa y el Río	21.295095	-88.250333999999995	57	1
4286	0180	Xbolín	21.296752000000001	-88.241736000000003	57	1
4287	0184	Chiquibchulul	21.345797999999998	-88.174029000000004	57	1
4288	0186	San Fernando	21.316578	-88.174092999999999	57	1
4289	0189	Santa María Tzitz	21.268367000000001	-88.247988000000007	57	1
4290	0190	San Dimas	21.312729000000001	-88.245299000000003	57	1
4291	0194	Santa María	21.255949999999999	-88.233048999999994	57	1
4292	0195	San Isidro	21.303992000000001	-88.314555999999996	57	1
4293	0198	San Juan	21.413627000000002	-88.109971999999999	57	1
4294	0200	San Manuel	21.325316000000001	-88.237620000000007	57	1
4295	0203	El Último Suspiro	21.314015000000001	-88.271398000000005	57	1
4296	0204	Sotzitún	21.327276999999999	-88.267321999999993	57	1
4297	0206	Montecristo	21.345253	-88.227625000000003	57	1
4298	0211	Santa Teresa	21.358138	-88.270624999999995	57	1
4299	0214	San José	21.416848000000002	-88.312627000000006	57	1
4300	0223	Santo Domingo	21.295176000000001	-88.462399000000005	57	1
4301	0225	San Juan	21.4175	-88.347198000000006	57	1
4302	0228	San Mateo	21.356729000000001	-88.267404999999997	57	1
4303	0234	San José	21.380832000000002	-88.330562999999998	57	1
4304	0235	San Gabriel	21.356705999999999	-88.256703999999999	57	1
4305	0243	Nuevo León	21.364557000000001	-88.232643999999993	57	1
4306	0246	Lirio Azul	21.381972999999999	-88.223821999999998	57	1
4307	0247	San Isidro	21.315740999999999	-88.463425999999998	57	1
4308	0249	San Lorenzo	21.396936	-88.308586000000005	57	1
4309	0253	Muldzonot	21.365760999999999	-88.263189999999994	57	1
4310	0262	San Andrés	21.424866999999999	-88.328810000000004	57	1
4311	0267	Santa Clara	21.3874	-88.275392999999994	57	1
4312	0268	El Cocoyol	21.390172	-88.270416999999995	57	1
4313	0274	La Cabaña	21.405833999999999	-88.286765000000003	57	1
4314	0275	Tehas	21.406044000000001	-88.268383	57	1
4315	0276	Centenario	21.398319999999998	-88.266932999999995	57	1
4316	0277	Chucunché	21.381077999999999	-88.254655999999997	57	1
4317	0281	Ninguno	21.392693000000001	-88.261842000000001	57	1
4318	0282	San Francisco	21.411268	-88.302092000000002	57	1
4319	0284	Santa Inés Dzonot	21.278569999999998	-88.267883999999995	57	1
4320	0289	San Juan	21.25787	-88.254965999999996	57	1
4321	0291	San Jorge	21.347283000000001	-88.444856000000001	57	1
4322	0293	Acancún	21.243856000000001	-88.283933000000005	57	1
4323	0294	Akan Soots	21.409942999999998	-88.305014	57	1
4324	0296	Buenos Aires	21.370184999999999	-88.207604000000003	57	1
4325	0297	La Candelaria	21.425663	-88.389872999999994	57	1
4326	0300	Tres Potrillos	21.365221999999999	-88.262238999999994	57	1
4327	0301	Chansayab	21.416440000000001	-88.311858000000001	57	1
4328	0302	Chan Chen	21.321203000000001	-88.374004999999997	57	1
4329	0303	Chetumal	21.396094000000002	-88.200417999999999	57	1
4330	0305	Emiliano Zapata	21.241828999999999	-88.260521999999995	57	1
4331	0306	San Diego	21.300059000000001	-88.330707000000004	57	1
4332	0307	Los Ángeles	21.329991	-88.473799	57	1
4333	0308	Almendros	21.333116	-88.143286000000003	57	1
4334	0310	Kulemis	21.431460000000001	-88.110168000000002	57	1
4335	0311	Kulemis Dos	21.462149	-88.132444000000007	57	1
4336	0313	La Doble R	21.347971999999999	-88.27328	57	1
4337	0316	San Andrés	21.383495	-88.271007999999995	57	1
4338	0317	San Buenaventura	21.351842999999999	-88.267548000000005	57	1
4339	0318	Libre Unión	21.388898999999999	-88.249370999999996	57	1
4340	0319	Santa Clara	21.370443000000002	-88.27073	57	1
4341	0320	San Francisco	21.307013999999999	-88.261875000000003	57	1
4342	0321	San Luis	21.443663999999998	-88.474245999999994	57	1
4343	0322	Ninguno	21.300042000000001	-88.283913999999996	57	1
4344	0323	California	21.455393999999998	-88.479799	57	1
4345	0324	San Ricardo	21.296427000000001	-88.225538	57	1
4346	0328	Santa Magdalena	21.351039	-88.461971000000005	57	1
4347	0333	San Antonio Xcampech	21.370512999999999	-88.187762000000006	57	1
4348	0335	Xiat	21.222069999999999	-88.280399000000003	57	1
4349	0336	Xkaladzadz	21.330839000000001	-88.371072999999996	57	1
4350	0338	X-Lucay	21.233561999999999	-88.281571	57	1
4351	0340	San Felipe	21.311063999999998	-88.165503999999999	57	1
4352	0341	Xceh Canul Dos	21.313230000000001	-88.183328000000003	57	1
4353	0342	Santa Lucía	21.326620999999999	-88.196792000000002	57	1
4354	0343	San Martín	21.321553000000002	-88.183649000000003	57	1
4355	0345	Kanacruz	21.250188000000001	-88.231836999999999	57	1
4356	0346	San Pedro	21.255835999999999	-88.257586000000003	57	1
4357	0347	San Felipe	21.304987000000001	-88.291341000000003	57	1
4358	0351	Tres de Mayo	21.309911	-88.238123999999999	57	1
4359	0352	El Artista	21.302575999999998	-88.260326000000006	57	1
4360	0354	Santo Tomás	21.345897000000001	-88.236718999999994	57	1
4361	0355	Santa Clara	21.355346000000001	-88.232388	57	1
4362	0356	San Isidro	21.349101999999998	-88.238451999999995	57	1
4363	0357	Xthaku San Román	21.351420999999998	-88.184555000000003	57	1
4364	0358	Chun Corral	21.327354	-88.311386999999996	57	1
4365	0362	Viernes Santo	21.274114999999998	-88.297021000000001	57	1
4366	0363	San Martín	21.271917999999999	-88.301032000000006	57	1
4367	0365	Otsil	21.324147	-88.337744000000001	57	1
4368	0370	San Ramón	21.229087	-88.285345000000007	57	1
4369	0371	San Carlos	21.208631	-88.285670999999994	57	1
4370	0372	San Lorenzo	21.414822000000001	-88.136291	57	1
4371	0373	El Regalo	21.399546000000001	-88.178718000000003	57	1
4372	0374	San Francisco	21.410844000000001	-88.146771000000001	57	1
4373	0375	Mi Refugio	21.399343999999999	-88.140144000000006	57	1
4374	0376	San Francisco	21.371381	-88.174789000000004	57	1
4375	0380	La Providencia	21.318266999999999	-88.163313000000002	57	1
4376	0381	Vista Alegre	21.377949999999998	-88.371972999999997	57	1
4377	0383	San Pedro	21.333535999999999	-88.368888999999996	57	1
4378	0384	San Fernando	21.320074999999999	-88.364658000000006	57	1
4379	0385	San Carlos	21.32497	-88.382891000000001	57	1
4380	0386	Chan Yaxtún	21.328764	-88.355098999999996	57	1
4381	0391	Santa Cruz	21.415044000000002	-88.290829000000002	57	1
4382	0392	Llovizna	21.345241000000001	-88.376169000000004	57	1
4383	0395	Santo Domingo	21.378026999999999	-88.463482999999997	57	1
4384	0396	San Simón	21.377167	-88.418034000000006	57	1
4385	0397	Las Margaritas	21.362075999999998	-88.452151999999998	57	1
4386	0398	San Víctor	21.335367000000002	-88.443173000000002	57	1
4387	0399	Villa de Guadalupe	21.463512000000001	-88.478105999999997	57	1
4388	0401	Rancho Alegre	21.443200000000001	-88.474300999999997	57	1
4389	0404	Santo Domingo Yohdzonot	21.302726	-88.454690999999997	57	1
4390	0405	Los Pirules	21.292763000000001	-88.443813000000006	57	1
4391	0406	Frontera	21.300785999999999	-88.435008999999994	57	1
4392	0408	San Lorenzo	21.357503999999999	-88.148229000000001	57	1
4393	0413	San Isidro	21.293223999999999	-88.310385999999994	57	1
4394	0415	San Román	21.424506999999998	-88.383045999999993	57	1
4395	0417	Corderito	21.393191000000002	-88.343566999999993	57	1
4396	0418	San Juan Bautista	21.29083	-88.320341999999997	57	1
4397	0419	Santa Elena	21.269110999999999	-88.217247	57	1
4398	0420	Chen-Chac	21.290298	-88.225278000000003	57	1
4399	0421	El Esfuerzo	21.215942999999999	-88.284612999999993	57	1
4400	0424	Aculá	21.245576	-88.217782	57	1
4401	0425	Los Ceibos	21.381139000000001	-88.409744000000003	57	1
4402	0426	San Carlos	21.332007000000001	-88.354877999999999	57	1
4403	0427	La Bendición de Dios	21.255749000000002	-88.264858000000004	57	1
4404	0428	Candelaria	21.28689	-88.208322999999993	57	1
4405	0429	Candelaria Dos	21.408123	-88.392292999999995	57	1
4406	0430	Chaclol	21.330100000000002	-88.162226000000004	57	1
4407	0431	Chan San Isidro	21.359511999999999	-88.356432999999996	57	1
4408	0432	Chetumal	21.314309999999999	-88.471995000000007	57	1
4409	0433	Chinchonal	21.360385999999998	-88.406745999999998	57	1
4410	0435	Dzitox	21.360707999999999	-88.366377999999997	57	1
4411	0436	La Fe	21.337281000000001	-88.237790000000004	57	1
4412	0437	Filadelfia	21.352232000000001	-88.291799999999995	57	1
4413	0438	Girasol	21.366095999999999	-88.429345999999995	57	1
4414	0439	El Girasol	21.350277999999999	-88.368611000000001	57	1
4415	0440	El Girasol	21.392219000000001	-88.308609000000004	57	1
4416	0442	La Herradura	21.408227	-88.162718999999996	57	1
4417	0443	Nocsal Gutiérrez	21.312622999999999	-88.421667999999997	57	1
4418	0444	Oxcal	21.277422000000001	-88.216577999999998	57	1
4419	0445	Punta Flor	21.24043	-88.290986000000004	57	1
4420	0446	Rancho Viejo	21.367781000000001	-88.400245999999996	57	1
4421	0447	San Agustín	21.335069000000001	-88.329137000000003	57	1
4422	0448	Dzonot Tigre	21.412403000000001	-88.200472000000005	57	1
4423	0449	San Antonio	21.34252	-88.326224999999994	57	1
4424	0450	San Antonio	21.283798999999998	-88.297171000000006	57	1
4425	0451	Villa Magaly	21.375582999999999	-88.275129000000007	57	1
4426	0452	San Felipe	21.375964	-88.351634000000004	57	1
4427	0453	San Felipe	21.323499000000002	-88.316496000000001	57	1
4428	0454	San Gabriel	21.423048000000001	-88.307299	57	1
4429	0455	San Gregorio	21.359801000000001	-88.286854000000005	57	1
4430	0457	San Isidro	21.306566	-88.372169999999997	57	1
4431	0458	San Isidro	21.256793999999999	-88.271483000000003	57	1
4432	0459	San Jorge	21.402322999999999	-88.373238999999998	57	1
4433	0460	San José	21.404363	-88.379558000000003	57	1
4434	0461	San José	21.386749999999999	-88.415338000000006	57	1
4435	0462	San José de la Cruz	21.368722999999999	-88.433285999999995	57	1
4436	0463	San Lorenzo	21.414314000000001	-88.170322999999996	57	1
4437	0464	San José Yaxtún	21.325392999999998	-88.356328000000005	57	1
4438	0465	San Manuel	21.386002999999999	-88.288240000000002	57	1
4439	0466	La Comarca de Villuercas	21.363667	-88.389961	57	1
4440	0467	San Manuel	21.335463000000001	-88.336288999999994	57	1
4441	0468	San Rafael	21.375356	-88.270700000000005	57	1
4442	0469	San Manuel	21.358438	-88.284834000000004	57	1
4443	0470	San Manuel	21.239204000000001	-88.298505000000006	57	1
4444	0471	Santiaguito	21.228871000000002	-88.291880000000006	57	1
4445	0472	San Martín	21.292895000000001	-88.163408000000004	57	1
4446	0473	San Pablo	21.432904000000001	-88.393461000000002	57	1
4447	0474	San Pastor	21.431501000000001	-88.168541000000005	57	1
4448	0475	San Pedro	21.402849	-88.432895000000002	57	1
4449	0476	San Pedro	21.444707000000001	-88.144396999999998	57	1
4450	0477	San Pedro Kampocolché	21.244281999999998	-88.301778999999996	57	1
4451	0478	San Rafael	21.401088000000001	-88.416725999999997	57	1
4452	0479	San Ramón	21.313679	-88.163236999999995	57	1
4453	0480	San Román	21.297191000000002	-88.200339999999997	57	1
4454	0481	San Salvador	21.407816	-88.132095000000007	57	1
4455	0482	Santa Bárbara	21.349741000000002	-88.225711000000004	57	1
4456	0483	Santa Cruz	21.351763999999999	-88.428093000000004	57	1
4457	0484	Santa Cruz	21.400289999999998	-88.359612999999996	57	1
4458	0485	Santa Cruz	21.408823000000002	-88.140849000000003	57	1
4459	0486	Santa Cruz	21.311395999999998	-88.259741000000005	57	1
4460	0487	Santa Elena	21.303013	-88.321323000000007	57	1
4461	0488	Santa Fe	21.331956000000002	-88.321569999999994	57	1
4462	0489	Santa Liria	21.250095000000002	-88.285283000000007	57	1
4463	0490	Santa María	21.263368	-88.274597	57	1
4464	0491	Santa Martha	21.426102	-88.281397999999996	57	1
4465	0492	Santa Pilar	21.380931	-88.333782999999997	57	1
4466	0493	Nueva Rosita	21.346101000000001	-88.419695000000004	57	1
4467	0494	Santiaguito	21.363918999999999	-88.319288	57	1
4468	0495	Santo Domingo	21.353406	-88.283068999999998	57	1
4469	0496	Santo Tomás	21.368580999999999	-88.287914000000001	57	1
4470	0497	San Francisco	21.390588000000001	-88.424653000000006	57	1
4471	0498	Ninguno	21.315643000000001	-88.327572000000004	57	1
4472	0499	Ninguno	21.325780999999999	-88.335464000000002	57	1
4473	0500	Ninguno	21.389825999999999	-88.317749000000006	57	1
4474	0501	Santa Teresa	21.376473000000001	-88.145984999999996	57	1
4475	0502	San Rafael	21.384287	-88.161417999999998	57	1
4476	0503	Ninguno	21.304098	-88.166341000000003	57	1
4477	0504	Ninguno	21.354856000000002	-88.229619	57	1
4478	0505	Chan Chucho	21.338350999999999	-88.245354000000006	57	1
4479	0506	Uizil	21.333738	-88.236012000000002	57	1
4480	0508	La Miseria	21.349478000000001	-88.318301000000005	57	1
4481	0509	Ninguno	21.337195000000001	-88.316809000000006	57	1
4482	0510	Ninguno	21.335079	-88.308706000000001	57	1
4483	0511	Ninguno	21.327717	-88.321124999999995	57	1
4484	0512	X-Arreola [Rancho]	21.324187999999999	-88.322466000000006	57	1
4485	0513	Ninguno	21.324570000000001	-88.316559999999996	57	1
4486	0514	Dos Reyes	21.249618000000002	-88.263092999999998	57	1
4487	0515	Santa Lucía	21.258882	-88.294737999999995	57	1
4488	0516	Mocán	21.259965000000001	-88.280173000000005	57	1
4489	0517	San Pedro	21.360133999999999	-88.228815999999995	57	1
4490	0518	Texas	21.342369999999999	-88.277201000000005	57	1
4491	0519	Toreo	21.364619999999999	-88.388058000000001	57	1
4492	0520	Tumben Cuxtal	21.338066000000001	-88.273730999999998	57	1
4493	0521	Yohdzonot Potón	21.398133999999999	-88.470684000000006	57	1
4494	0522	Esperanza	21.387308999999998	-88.309404999999998	57	1
4495	0523	San Miguel	21.389958	-88.388242000000005	57	1
4496	0524	Santo Domingo	21.370553000000001	-88.314001000000005	57	1
4497	0525	San Juan	21.376840999999999	-88.315369000000004	57	1
4498	0526	Yohdzonot	21.377199000000001	-88.222009999999997	57	1
4499	0527	San Jacinto	21.373258	-88.327826000000002	57	1
4500	0528	Dos Hermanos	21.341190000000001	-88.341432999999995	57	1
4501	0530	Dzonot Caamal Anexa San Manuel	21.318118999999999	-88.210447000000002	57	1
4502	0531	Dzonot Caamal Toloc	21.318439999999999	-88.216614000000007	57	1
4503	0532	Dzonot Isla	21.37088	-88.244354000000001	57	1
4504	0533	Andy Sandoval Meneses	21.338619999999999	-88.231438999999995	57	1
4505	0534	Ninguno	21.411982999999999	-88.334238999999997	57	1
4506	0535	María José	21.307983	-88.215421000000006	57	1
4507	0536	La Virtud	21.363330000000001	-88.239413999999996	57	1
4508	0537	Puerto de Edén	21.308584	-88.224524000000002	57	1
4509	0538	San Judas	21.402189	-88.343759000000006	57	1
4510	0539	San Andrés	21.395537999999998	-88.443976000000006	57	1
4511	0540	San Carlos	21.374649000000002	-88.139452000000006	57	1
4512	0541	El Rey	21.449649999999998	-88.137636000000001	57	1
4513	0542	San Fernando	21.376173000000001	-88.225325999999995	57	1
4514	0543	Santa Paola	21.383120999999999	-88.253795999999994	57	1
4515	0544	San Isidro	21.419756	-88.309308000000001	57	1
4516	0545	San José	21.280294999999999	-88.237319999999997	57	1
4517	0547	San Manuel	21.374428000000002	-88.26737	57	1
4518	0548	San Manuel	21.357313999999999	-88.250923	57	1
4519	0549	Samaria	21.366330999999999	-88.415717000000001	57	1
4520	0550	San Martín	21.347939	-88.322856999999999	57	1
4521	0551	Santa Rafael	21.385354	-88.233838000000006	57	1
4522	0552	Santa Etelvira	21.384145	-88.228474000000006	57	1
4523	0553	Santa Isabel	21.338602999999999	-88.462115999999995	57	1
4524	0555	Santo Domingo	21.299717000000001	-88.209700999999995	57	1
4525	0556	Tzekel-Box	21.359957999999999	-88.262609999999995	57	1
4526	0557	El Girasol	21.223676999999999	-88.256491999999994	57	1
4527	0558	San Felipe (Rancho Nuevo)	21.228117999999998	-88.254168000000007	57	1
4528	0559	El Chaparral	21.443528000000001	-88.480221	57	1
4529	0560	Santa Cruz	21.351987999999999	-88.473454000000004	57	1
4530	0561	Piedras Grandes	21.380846999999999	-88.171031999999997	57	1
4531	0563	San José	21.379816999999999	-88.176372000000001	57	1
4532	0564	San José	21.375855000000001	-88.178745000000006	57	1
4533	0565	San José Dos	21.340413000000002	-88.272840000000002	57	1
4534	0566	San Pedro	21.391891999999999	-88.159927999999994	57	1
4535	0567	San José	21.339793	-88.178362000000007	57	1
4536	0568	El Desafío	21.243017999999999	-88.294488999999999	57	1
4537	0569	Actún Há	21.335455	-88.240588000000002	57	1
4538	0570	La Bendición de Dios	21.368825999999999	-88.316456000000002	57	1
4539	0571	Candelaria	21.345507999999999	-88.227542	57	1
4540	0572	Chaclol Dos	21.335135000000001	-88.161449000000005	57	1
4541	0573	La Dueña	21.404584	-88.139289000000005	57	1
4542	0574	Engracia	21.386386000000002	-88.248650999999995	57	1
4543	0575	San Felipe	21.334101	-88.273979999999995	57	1
4544	0576	Grano de Oro	21.310784999999999	-88.213999000000001	57	1
4545	0577	La Joya del Faisán	21.248712000000001	-88.257232999999999	57	1
4546	0578	Ninguno	21.398343000000001	-88.330765999999997	57	1
4547	0579	Ninguno	21.303193	-88.215828999999999	57	1
4548	0580	San Francisco	21.369910000000001	-88.307918999999998	57	1
4549	0581	La Mano de Dios	21.373764000000001	-88.302334000000002	57	1
4550	0582	Las Margaritas	21.393636000000001	-88.334923000000003	57	1
4551	0583	San Miguel Dos	21.371357	-88.240116	57	1
4552	0584	Rancho Alegre	21.264182000000002	-88.304796999999994	57	1
4553	0585	Sonora	21.325198	-88.164193999999995	57	1
4554	0586	San Agustín	21.338939	-88.239830999999995	57	1
4555	0587	San Diego	21.366403999999999	-88.308706000000001	57	1
4556	0588	San Gabriel	21.380323000000001	-88.133133000000001	57	1
4557	0589	San José	21.413702000000001	-88.318318000000005	57	1
4558	0590	San Juan	21.290942999999999	-88.226757000000006	57	1
4559	0591	San Juan Bautista	21.343648999999999	-88.461682999999994	57	1
4560	0592	San Judas Tadeo	21.293616	-88.311842999999996	57	1
4561	0593	San Manuel Uno	21.398288000000001	-88.282689000000005	57	1
4562	0594	San Pastor	21.367217	-88.225803999999997	57	1
4563	0595	Santa Ana	21.249402	-88.293942999999999	57	1
4564	0596	Paso de Ovejas	21.386382999999999	-88.242592999999999	57	1
4565	0597	Santa María	21.344217	-88.247963999999996	57	1
4566	0598	Santa María	21.379885000000002	-88.223988000000006	57	1
4567	0599	Santo Domingo	21.257400000000001	-88.278778000000003	57	1
4568	0600	Santo Domingo	21.357106999999999	-88.235804000000002	57	1
4569	0601	Tres Reyes	21.298051000000001	-88.234551999999994	57	1
4570	0602	Yokdzonot Dos	21.340919	-88.318033999999997	57	1
4571	0603	X-Colmá	21.291571999999999	-88.279490999999993	57	1
4572	0604	El Roble [Lienzo]	21.344231000000001	-88.155167000000006	57	1
4573	0605	San Judas Tadeo Dos	21.302826	-88.310834999999997	57	1
4574	0606	El Coyote	21.295356000000002	-88.165468000000004	57	1
4575	0607	La Esperanza	21.274875999999999	-88.278919000000002	57	1
4576	0608	Las Bugambilias	21.384687	-88.164484000000002	57	1
4577	0609	Santa Cruz	21.382095	-88.147964000000002	57	1
4578	0610	La Herradura	21.437546000000001	-88.114688000000001	57	1
4579	0001	Peto	20.125917999999999	-88.923985000000002	58	1
4580	0002	Balché	20.229002000000001	-88.715186000000003	58	1
4581	0003	Chan Calotmul	20.122119000000001	-88.698243000000005	58	1
4582	0005	Candelaria (San Pedro)	19.985534000000001	-88.858367999999999	58	1
4583	0007	Dzonotchel	20.109703	-88.761566999999999	58	1
4584	0009	Culché	20.241637999999998	-88.738656000000006	58	1
4585	0010	San Hermeregildo Haltún Tzubil	20.132966	-88.886257999999998	58	1
4586	0013	Mac-May	19.996842000000001	-88.955483000000001	58	1
4587	0014	Papacal	20.153929000000002	-88.816317999999995	58	1
4588	0015	Petulchakán	20.097728	-88.806327999999993	58	1
4589	0016	Petulillo	20.050515000000001	-88.702588000000006	58	1
4590	0017	Poom	20.177513000000001	-88.789946999999998	58	1
4591	0018	Progresito	20.091583	-88.849551000000005	58	1
4592	0022	San Diego	20.241658999999999	-88.754400000000004	58	1
4593	0023	San Dionisio	20.049969999999998	-88.771867999999998	58	1
4594	0027	San Isidro	20.193567999999999	-88.782835000000006	58	1
4595	0029	San Mateo	20.114687	-88.717009000000004	58	1
4596	0031	San Sebastián	19.990019	-88.901041000000006	58	1
4597	0032	Santa Cruz	20.207571999999999	-88.813648000000001	58	1
4598	0035	Santa Rosa	19.951858999999999	-88.882479000000004	58	1
4599	0036	Santa Úrsula	20.018943	-88.923281000000003	58	1
4600	0037	Temozón	20.069997999999998	-88.928295000000006	58	1
4601	0039	Tixcacal	20.126300000000001	-88.826684	58	1
4602	0040	Tixhualatún	20.178816999999999	-88.885909999999996	58	1
4603	0041	Tobxilá	19.855124	-88.917348000000004	58	1
4604	0042	Uitziná	19.867394000000001	-88.981390000000005	58	1
4605	0043	Ah Boli	20.107533	-88.687297999999998	58	1
4606	0044	Xcabanché	20.231888000000001	-88.729494000000003	58	1
4607	0045	X-Canteil	20.088052000000001	-88.878003000000007	58	1
4608	0047	Kambul	19.985191	-88.88655	58	1
4609	0048	Xoy	20.123515999999999	-88.971530999999999	58	1
4610	0049	X-Pechil	20.026927000000001	-88.879908	58	1
4611	0051	Yaxcopil	20.066938	-88.908355	58	1
4612	0055	La Esperanza	20.017320000000002	-88.789552999999998	58	1
4613	0057	San Manuel	20.190804	-88.727411000000004	58	1
4614	0059	Abal	20.005032	-88.810158000000001	58	1
4615	0060	Justicia Social	19.931103	-88.859442000000001	58	1
4616	0061	X-Abulé	20.175056000000001	-88.761870999999999	58	1
4617	0062	San Bartolo	20.102758999999999	-88.841701999999998	58	1
4618	0063	Tzubil	20.140416999999999	-88.907173999999998	58	1
4619	0066	San José	20.226899	-88.818931000000006	58	1
4620	0068	San Bernabé	20.183489000000002	-88.769285999999994	58	1
4621	0071	San Juan	20.227926	-88.797780000000003	58	1
4622	0072	Pocol	20.004249999999999	-88.857157000000001	58	1
4623	0073	Candelaria Número Dos	20.175621	-88.670914999999994	58	1
4624	0074	Chan Chen	20.163305999999999	-88.846444000000005	58	1
4625	0076	San Luis	20.238869000000001	-88.699036000000007	58	1
4626	0078	Kanlol	20.145909	-88.693680999999998	58	1
4627	0079	Santa Elena	20.188796	-88.686599000000001	58	1
4628	0080	San Francisco de Asís	20.141618000000001	-88.658518999999998	58	1
4629	0081	Chumpich	20.179929999999999	-88.678179999999998	58	1
4630	0084	San Juan Nohkanka	20.143605000000001	-88.920428999999999	58	1
4631	0086	Sisbic	20.031172999999999	-88.887242999999998	58	1
4632	0088	San Antonio	20.155519999999999	-88.751425999999995	58	1
4633	0098	San Agustín Yam	20.103515999999999	-88.804968000000002	58	1
4634	0100	Buh Número Dos	20.108032999999999	-88.980110999999994	58	1
4635	0101	Cancauas	20.123978999999999	-88.898319999999998	58	1
4636	0102	Kanisté	20.140984	-88.953092999999996	58	1
4637	0103	Liberato Campos	20.188842999999999	-88.785798999999997	58	1
4638	0106	La Conchita	20.016494000000002	-88.879453999999996	58	1
4639	0108	Caseta Fitozoosanitaria	19.920576000000001	-88.841195999999997	58	1
4640	0110	Los Girasoles	20.246423	-88.792587999999995	58	1
4641	0111	Guadalupe	20.030235000000001	-88.976181999999994	58	1
4642	0114	Hermanos López	20.014499000000001	-88.833894000000001	58	1
4643	0117	Kancabchén	20.1235	-88.862164000000007	58	1
4644	0122	Moo	20.118203999999999	-88.887675999999999	58	1
4645	0124	El Naranjal	20.120581000000001	-88.872125999999994	58	1
4646	0126	Obompich	20.015438	-88.934175999999994	58	1
4647	0137	San Fernando	20.156523	-88.895071000000002	58	1
4648	0138	San Francisco	20.054790000000001	-88.898680999999996	58	1
4649	0140	San Gregorio	20.113624000000002	-88.880944999999997	58	1
4650	0142	San José Hermeregildo	20.135693	-88.880628999999999	58	1
4651	0143	San José Número Dos	20.212150999999999	-88.695278000000002	58	1
4652	0144	San Juan	20.088276	-88.905688999999995	58	1
4653	0146	San Juan Número Cuatro	20.195976999999999	-88.765690000000006	58	1
4654	0147	San Juan Número Cinco	20.147635000000001	-88.667581999999996	58	1
4655	0148	San Judas	20.117054	-88.874424000000005	58	1
4656	0151	San Luis	20.208874000000002	-88.768044000000003	58	1
4657	0152	San Manuel	19.824248000000001	-88.949089999999998	58	1
4658	0153	San Martín de Porres	20.139126000000001	-88.841673999999998	58	1
4659	0157	San Miguel	20.169867	-88.890782000000002	58	1
4660	0158	San Nicolás Yoactún	20.203423000000001	-88.713583999999997	58	1
4661	0160	San Pedro Número Uno	20.19922	-88.786823999999996	58	1
4662	0161	San Pedro Dos	20.212254000000001	-88.757664000000005	58	1
4663	0162	San Pedro Xnocatzín	20.008293999999999	-88.773431000000002	58	1
4664	0164	San Salvador Pich	20.150033000000001	-88.824635000000001	58	1
4665	0165	San Valerio	20.231963	-88.769622999999996	58	1
4666	0167	Santa Ana	20.122298000000001	-88.842718000000005	58	1
4667	0169	Santa Clara	20.126729999999998	-88.780764000000005	58	1
4668	0171	Santa Cruz	20.070836	-88.701049999999995	58	1
4669	0172	Santa María	19.836577999999999	-88.965847999999994	58	1
4670	0173	Santa María	20.156303000000001	-88.765806999999995	58	1
4671	0175	Santa Rita	20.037310000000002	-88.868883999999994	58	1
4672	0176	Santa Teresa	20.156623	-88.857781000000003	58	1
4673	0184	X-Bobil	20.208010999999999	-88.905303000000004	58	1
4674	0185	X-Eleboc	20.181141	-88.672993000000005	58	1
4675	0187	Kansep	20.131381999999999	-88.778513000000004	58	1
4676	0189	Yaax-Op	20.152327	-88.918411000000006	58	1
4677	0191	X-Pootil	20.071712999999999	-88.858164000000002	58	1
4678	0195	La Colina (Xcobiakal)	19.842504999999999	-88.980475999999996	58	1
4679	0196	Polinkín	19.958283000000002	-88.816937999999993	58	1
4680	0200	Los Laureles	19.905404999999998	-88.823499999999996	58	1
4681	0202	Kutzá	19.948768999999999	-88.832554000000002	58	1
4682	0205	La Mejorada	20.157935999999999	-88.934516000000002	58	1
4683	0206	San Eduardo	20.148993000000001	-88.926601000000005	58	1
4684	0207	San Pedro	20.114871000000001	-88.890124	58	1
4685	0208	Santa María	20.080939000000001	-88.866797000000005	58	1
4686	0212	San Ignacio	20.15776	-88.659437999999994	58	1
4687	0213	Coba	20.032332	-88.812646000000001	58	1
4688	0214	Tirso	20.036757999999999	-88.810922000000005	58	1
4689	0215	Las Palmas (San Miguel)	19.987203999999998	-88.896963999999997	58	1
4690	0216	Pueblo Nuevo	19.938727	-88.853132000000002	58	1
4691	0218	San Sebastián Yaxché	19.967894000000001	-88.919531000000006	58	1
4692	0219	San José	20.193187999999999	-88.628057999999996	58	1
4693	0221	Tzuc Put	19.935867999999999	-88.886609000000007	58	1
4694	0222	Tepich	20.111044	-88.908595000000005	58	1
4695	0223	San Marcos	20.195646	-88.785065000000003	58	1
4696	0224	Tulipanes	20.242992000000001	-88.785263	58	1
4697	0225	Sisteil	20.240000999999999	-88.776005999999995	58	1
4698	0226	San Felipe	20.039753000000001	-88.749264999999994	58	1
4699	0228	San Rafael	20.019029	-88.731258999999994	58	1
4700	0230	San Cosme	19.906790000000001	-88.820376999999993	58	1
4701	0231	Hermanos Herrera	20.05771	-88.906338000000005	58	1
4702	0232	Balché	20.134269	-88.859854999999996	58	1
4703	0233	La Fortaleza	20.050291999999999	-88.894999999999996	58	1
4704	0236	Guadalupe	20.262689999999999	-88.777433000000002	58	1
4705	0237	Reforma Agraria	20.269983	-88.758718000000002	58	1
4706	0239	San Carlos	20.280671999999999	-88.738652000000002	58	1
4707	0240	San Isidro	19.938206999999998	-88.900812000000002	58	1
4708	0241	Santo Domingo	19.908013	-88.822233999999995	58	1
4709	0244	Sociedad Grupo Dos	19.929841	-88.847100999999995	58	1
4710	0245	Sociedad Grupo Tres	19.904031	-88.866187999999994	58	1
4711	0246	Trapiche	19.88748	-88.843873000000002	58	1
4712	0251	San Pedro	20.066488	-88.874827999999994	58	1
4713	0252	San Andrés	20.036321999999998	-88.860072000000002	58	1
4714	0253	Chooki	20.121015	-88.958040999999994	58	1
4715	0254	Hol Luum	20.133852999999998	-88.937397000000004	58	1
4716	0261	Pul Há	20.131488000000001	-88.936536000000004	58	1
4717	0262	San Antonio Segundo	20.132994	-88.945682000000005	58	1
4718	0266	Víctor Noh	20.088611	-88.912475999999998	58	1
4719	0267	San Miguel	20.093160000000001	-88.912629999999993	58	1
4720	0270	Fidelio Catzín	20.159338999999999	-88.927025999999998	58	1
4721	0273	Nueva Vida	20.136151999999999	-88.934776999999997	58	1
4722	0274	Chaquiras [Quinta]	20.086126	-88.918644	58	1
4723	0275	Santa Lucía	20.137408000000001	-88.936780999999996	58	1
4724	0276	El Paraíso	19.956778	-88.893023999999997	58	1
4725	0278	San Martín	19.886071000000001	-88.881747000000004	58	1
4726	0279	Lote Diecinueve	19.912393999999999	-88.839045999999996	58	1
4727	0280	San Antonio	19.980900999999999	-88.862753999999995	58	1
4728	0281	Santa Rosita	19.878862999999999	-88.885992000000002	58	1
4729	0282	San Felipe	20.281285	-88.748666999999998	58	1
4730	0283	San José	19.867711	-88.986694	58	1
4731	0284	San Juan	19.869610000000002	-88.913690000000003	58	1
4732	0285	San Pedro	19.982462000000002	-88.854346000000007	58	1
4733	0286	Aurora	19.811050000000002	-88.922486000000006	58	1
4734	0287	Bronco	19.833205	-88.923913999999996	58	1
4735	0289	La Lupita	19.944811000000001	-88.875951000000001	58	1
4736	0290	La Madrugada	19.907268999999999	-88.842969999999994	58	1
4737	0291	Miguel de la Madrid	19.966114000000001	-88.815054000000003	58	1
4738	0292	Pozo Trece	19.8978	-88.868877999999995	58	1
4739	0293	Rancho Cary	19.840813000000001	-88.914850999999999	58	1
4740	0294	San Ignacio	19.868463999999999	-88.897720000000007	58	1
4741	0295	San José	19.951346000000001	-88.843359000000007	58	1
4742	0296	San Pedro	19.949985000000002	-88.916853000000003	58	1
4743	0297	San Pedro	19.834085999999999	-88.911976999999993	58	1
4744	0298	Santa Margarita	19.972384000000002	-88.825575999999998	58	1
4745	0299	El Roble	19.829284000000001	-88.931471000000002	58	1
4746	0300	Pedro López	19.932763999999999	-88.828226999999998	58	1
4747	0301	Unidad Uno	19.826809000000001	-88.913978999999998	58	1
4748	0303	Granja Túumben Kuxtal	20.089337	-88.803330000000003	58	1
4749	0304	Guadalupe	20.126809999999999	-88.897962000000007	58	1
4750	0305	Hacienda Márquez	19.948115999999999	-88.846202000000005	58	1
4751	0307	Los Cedros	20.177085000000002	-88.789520999999993	58	1
4752	0310	Juan Pastor	20.130993	-88.934223000000003	58	1
4753	0313	Juan Castillo	20.10127	-88.876437999999993	58	1
4754	0314	Erpidio Esquivel	20.091169000000001	-88.845012999999994	58	1
4755	0317	Virgilio	20.148140000000001	-88.926077000000006	58	1
4756	0318	Perera [Quinta]	20.125005999999999	-88.905278999999993	58	1
4757	0319	Alberto Fonseca Ramírez	20.092803	-88.759395999999995	58	1
4758	0320	Víctor Borges	19.943760000000001	-88.847986000000006	58	1
4759	0321	La Gloria	20.125121	-88.935021000000006	58	1
4760	0322	La Piedra	19.848161999999999	-88.950389000000001	58	1
4761	0323	San Judas Tadeo	19.902118000000002	-88.847590999999994	58	1
4762	0324	El Rincón	19.899979999999999	-88.872129000000001	58	1
4763	0325	San Manuel	20.019055999999999	-88.905647000000002	58	1
4764	0326	Lluvia de Oro	20.225096000000001	-88.735776999999999	58	1
4765	0001	Progreso	21.282578000000001	-89.663573999999997	59	1
4766	0003	Chelem	21.268736000000001	-89.742951000000005	59	1
4767	0004	Chicxulub (Chicxulub Puerto)	21.294429000000001	-89.607168999999999	59	1
4768	0005	Chuburná	21.251853000000001	-89.816213000000005	59	1
4769	0009	San Ignacio	21.160263	-89.654228000000003	59	1
4770	0011	La Candelaria	21.174327000000002	-89.645709999999994	59	1
4771	0014	Los Laureles	21.237719999999999	-89.565274000000002	59	1
4772	0018	Chen Huayún	21.226862000000001	-89.533963999999997	59	1
4773	0022	Los Tamarindos	21.171133999999999	-89.650143999999997	59	1
4774	0023	Ebenezer (San Rafael)	21.175158	-89.650593999999998	59	1
4775	0024	Estopas Peninsulares	21.181802999999999	-89.651296000000002	59	1
4776	0026	Campestre Flamboyanes	21.21001	-89.661533000000006	59	1
4777	0028	Los Flamencos	21.238956999999999	-89.569582999999994	59	1
4778	0034	El Pedregal	21.240183999999999	-89.568180999999996	59	1
4779	0037	Las Sartenejas (Las Sartinejas)	21.260175	-89.593762999999996	59	1
4780	0038	La Perseverancia	21.179046	-89.651014000000004	59	1
4781	0043	Arca	21.169678000000001	-89.649612000000005	59	1
4782	0046	Trituradora	21.223580999999999	-89.550854000000001	59	1
4783	0064	Isla Pérez	22.382812999999999	-89.682856999999998	59	1
4784	0066	El Divino Redentor	21.175554000000002	-89.650249000000002	59	1
4785	0070	Medardo Dzul	21.210750999999998	-89.650093999999996	59	1
4786	0076	Montesino	21.184660999999998	-89.651409000000001	59	1
4787	0078	El Paraíso	21.194326	-89.651646999999997	59	1
4788	0081	Emmanuel	21.211411999999999	-89.649934999999999	59	1
4789	0085	San Juan	21.182203000000001	-89.651148000000006	59	1
4790	0089	Yucmich	21.179794000000001	-89.650925999999998	59	1
4791	0092	La Gracia de Dios	21.238652999999999	-89.565128999999999	59	1
4792	0100	Ha Uay	21.316461	-89.489689999999996	59	1
4793	0101	Jesús Nazareno	21.184735	-89.641684999999995	59	1
4794	0102	San Lorenzo	21.269943999999999	-89.586414000000005	59	1
4795	0103	San Luis	21.208919000000002	-89.650008	59	1
4796	0107	José Canul	21.233046999999999	-89.567148000000003	59	1
4797	0108	Rancho Misericordia	21.200195999999998	-89.547375000000002	59	1
4798	0109	Antonio Cetina	21.194058999999999	-89.546261000000001	59	1
4799	0110	Nuevo Mundo	21.184621	-89.638492999999997	59	1
4800	0111	San Antonio	21.240818000000001	-89.531512000000006	59	1
4801	0112	Santa Cruz	21.198899000000001	-89.655033000000003	59	1
4802	0114	Transportes del Sureste	21.174185999999999	-89.650467000000006	59	1
4803	0115	Sharper [Rancho]	21.267067000000001	-89.579172999999997	59	1
4804	0116	Los Tres Arbolitos	21.188576000000001	-89.544787999999997	59	1
4805	0117	San Pedro [Rancho]	21.197517999999999	-89.655354000000003	59	1
4806	0118	San Felipe Pet Balam	21.201736	-89.633829000000006	59	1
4807	0119	San Román	21.313761	-89.501867000000004	59	1
4808	0121	Cherris	21.269919999999999	-89.591856000000007	59	1
4809	0122	Pedro Osorno	21.186813000000001	-89.637547999999995	59	1
4810	0123	El Manantial	21.186792000000001	-89.630467999999993	59	1
4811	0124	Predeco	21.184619000000001	-89.647542000000001	59	1
4812	0125	Yudija [Rancho]	21.183433999999998	-89.537591000000006	59	1
4813	0126	La Lupita	21.181918	-89.540199000000001	59	1
4814	0127	La Cruz	21.184152000000001	-89.536873999999997	59	1
4815	0128	Yudija [Rancho]	21.181777	-89.540767000000002	59	1
4816	0129	Recamex [Canteras]	21.219636000000001	-89.655161000000007	59	1
4817	0130	Infraestructura Marítima y Portuaria	21.201342	-89.646203	59	1
4818	0001	Quintana Roo	20.867187999999999	-88.631750999999994	60	1
4819	0006	Dzulutok	20.776738999999999	-88.674588999999997	60	1
4820	0010	San Juan	20.864712999999998	-88.665379999999999	60	1
4821	0011	Hunukú	20.854414999999999	-88.637403000000006	60	1
4822	0012	Ninguno	20.855112999999999	-88.642011999999994	60	1
4823	0013	Yaxleulá	20.798190000000002	-88.654165000000006	60	1
4824	0014	San Ángel	20.861563	-88.675933000000001	60	1
4825	0015	San Francisco	20.874220000000001	-88.644363999999996	60	1
4826	0016	Santa Catarina	20.812939	-88.623453999999995	60	1
4827	0017	San Isidro	20.890298999999999	-88.655383	60	1
4828	0001	Río Lagartos	21.597750999999999	-88.157978	61	1
4829	0002	Las Coloradas	21.608725	-87.990606999999997	61	1
4830	0003	Buenavista	21.573585000000001	-88.130296000000001	61	1
4831	0004	San Manuel Tres	21.502243	-88.146462	61	1
4832	0006	El Edén	21.544851999999999	-88.151311000000007	61	1
4833	0007	Soledad Dos	21.575855000000001	-88.119085999999996	61	1
4834	0008	Haydzonot	21.475833999999999	-88.169331999999997	61	1
4835	0009	La Nueva Esperanza	21.573703999999999	-88.138552000000004	61	1
4836	0010	San Antonio	21.570888	-88.102003999999994	61	1
4837	0011	Paraíso	21.56671	-88.128028	61	1
4838	0012	Progreso	21.550982999999999	-88.179007999999996	61	1
4839	0013	San Juan	21.484019	-88.171402	61	1
4840	0014	Santa Rosa	21.559926999999998	-88.085513000000006	61	1
4841	0015	San Román	21.545227000000001	-88.126769999999993	61	1
4842	0016	Sal Si Puedes	21.551442000000002	-88.123273999999995	61	1
4843	0017	San Joaquín	21.557434000000001	-88.155974000000001	61	1
4844	0020	Santa Rita	21.545216	-88.167034000000001	61	1
4845	0021	Santa Cruz	21.549545999999999	-88.081704000000002	61	1
4846	0022	Taciste San Luis	21.561237999999999	-88.078469999999996	61	1
4847	0023	Soledad Uno	21.571664999999999	-88.119600000000005	61	1
4848	0024	San José Dos	21.558776000000002	-88.148090999999994	61	1
4849	0026	San Isidro	21.530559	-88.116974999999996	61	1
4850	0027	Chen Roque Uno	21.545332999999999	-88.146354000000002	61	1
4851	0028	San Pedro	21.514240999999998	-88.135307999999995	61	1
4852	0029	Santa Elena	21.509857	-88.127610000000004	61	1
4853	0030	San Martín	21.545584999999999	-88.136202999999995	61	1
4854	0031	San Ramón	21.550248	-88.139542000000006	61	1
4855	0033	Tocxamán	21.552264000000001	-88.102847999999994	61	1
4856	0034	Yohdzadz	21.493082000000001	-88.159718999999996	61	1
4857	0035	El Bonete	21.432252999999999	-88.104291000000003	61	1
4858	0037	Santa María	21.431888000000001	-88.139390000000006	61	1
4859	0040	Santa María	21.520626	-88.161882000000006	61	1
4860	0041	San Pedro	21.484795999999999	-88.128874999999994	61	1
4861	0043	Akachén	21.504966	-88.117277999999999	61	1
4862	0044	Chakan Becerro	21.485218	-88.097363999999999	61	1
4863	0045	Villa Guadalupe	21.453903	-88.105312999999995	61	1
4864	0046	Santa Pilar	21.484314999999999	-88.139184	61	1
4865	0049	Rancho Grande	21.478514000000001	-88.103128999999996	61	1
4866	0050	El Rosario de María	21.457205999999999	-88.120131000000001	61	1
4867	0051	San Vicente	21.498887	-88.108025999999995	61	1
4868	0053	X-Menkín	21.471662999999999	-88.111857000000001	61	1
4869	0055	Santa Rosalía	21.461646999999999	-88.121690999999998	61	1
4870	0056	Chakán Ek	21.518125000000001	-88.101876000000004	61	1
4871	0057	Rancho Chico	21.529734999999999	-88.127858000000003	61	1
4872	0061	San Francisco	21.565839	-88.172404999999998	61	1
4873	0066	San Rosendo	21.550723999999999	-88.149170999999996	61	1
4874	0068	Santa Cecilia	21.436295000000001	-88.136481000000003	61	1
4875	0069	Dzadz Halal	21.546042	-88.094683000000003	61	1
4876	0070	San José	21.497350999999998	-88.173070999999993	61	1
4877	0071	San José de la Montaña	21.442640999999998	-88.087123000000005	61	1
4878	0073	Chen Roque Dos	21.535291000000001	-88.145358000000002	61	1
4879	0075	San Pedro	21.485243000000001	-88.161376000000004	61	1
4880	0077	San Antonio	21.491403999999999	-88.105907000000002	61	1
4881	0081	San Ángel	21.428494000000001	-88.104692999999997	61	1
4882	0082	San Manuel	21.448262	-88.130953000000005	61	1
4883	0083	San Pedro	21.569236	-88.153391999999997	61	1
4884	0085	San Martín	21.439957	-88.132542000000001	61	1
4885	0086	San Martín	21.479308	-88.181493000000003	61	1
4886	0088	San José Dos	21.497005000000001	-88.131675000000001	61	1
4887	0089	San José Uno	21.494923	-88.127616000000003	61	1
4888	0090	La Curva	21.532948000000001	-88.033109999999994	61	1
4889	0092	El Rosario	21.554532999999999	-88.014994000000002	61	1
4890	0093	El Escondido	21.565636999999999	-88.184755999999993	61	1
4891	0094	Estación de Campo Rio Lagartos de la Reserva de la Biosfera Ria Lagartos	21.571356999999999	-88.160689000000005	61	1
4892	0095	Los Gavilanes	21.542619999999999	-88.008919000000006	61	1
4893	0096	Las Mercedes	21.458684000000002	-88.208337999999998	61	1
4894	0097	Miraflor	21.47486	-88.118531000000004	61	1
4895	0098	Montecristo	21.424526	-88.089232999999993	61	1
4896	0099	Nellys	21.471976999999999	-88.177887999999996	61	1
4897	0100	Quinientos	21.462714999999999	-88.197129000000004	61	1
4898	0101	Chan Holchit	21.543679000000001	-88.034588999999997	61	1
4899	0102	San Manuel de Atocha	21.453903	-88.170610999999994	61	1
4900	0103	San Carlos	21.477381000000001	-88.202838999999997	61	1
4901	0104	San Ángel	21.557893	-88.026233000000005	61	1
4902	0105	San Francisco	21.479105000000001	-88.193168	61	1
4903	0106	San Isidro	21.471202999999999	-88.193466000000001	61	1
4904	0107	San Jorge	21.464628999999999	-88.175954000000004	61	1
4905	0108	Los Lirios	21.461780999999998	-88.085845000000006	61	1
4906	0109	San José Dos	21.463198999999999	-88.085121999999998	61	1
4907	0110	San Juan	21.414014000000002	-88.090253000000004	61	1
4908	0111	San Judas	21.535170999999998	-88.021333999999996	61	1
4909	0113	San Mateo	21.451991	-88.123189999999994	61	1
4910	0114	San Pastor	21.428811	-88.139927	61	1
4911	0115	San Ramón	21.476493999999999	-88.084981999999997	61	1
4912	0116	San Salvador	21.541554000000001	-88.057062999999999	61	1
4913	0117	San Víctor	21.415296999999999	-88.085047000000003	61	1
4914	0118	Santa Ana	21.548000999999999	-88.024901	61	1
4915	0119	Santa Isabel Uno	21.412361000000001	-88.097701000000001	61	1
4916	0120	Santa Isabel Dos	21.415544000000001	-88.089309999999998	61	1
4917	0121	Santa Lucía Dos	21.435130000000001	-88.132778999999999	61	1
4918	0122	Santa Teresita	21.466491000000001	-88.086625999999995	61	1
4919	0123	Santa Teresa	21.467123000000001	-88.207868000000005	61	1
4920	0124	Santa Teresita	21.464008	-88.178191999999996	61	1
4921	0125	Santiago Apóstol	21.455424000000001	-88.180936000000003	61	1
4922	0126	Santo Niño de Atocha	21.462354999999999	-88.168295999999998	61	1
4923	0127	San Beder Uno (Anexa)	21.413046000000001	-88.076635999999993	61	1
4924	0128	Beder	21.418841	-88.074431000000004	61	1
4925	0129	San Carlos	21.557534	-88.006362999999993	61	1
4926	0130	El Xux de Payín	21.556125999999999	-88.044370999999998	61	1
4927	0131	San Joaquín	21.429126	-88.135099999999994	61	1
4928	0132	San Luis	21.541588999999998	-88.110966000000005	61	1
4929	0134	Alquímedes Gil	21.598993	-88.139004999999997	61	1
4930	0136	San José	21.466771999999999	-88.189988999999997	61	1
4931	0137	Santiago	21.474028000000001	-88.206514999999996	61	1
4932	0138	Ceibo	21.441907	-88.087593999999996	61	1
4933	0139	El Edén Dos	21.546326000000001	-88.149951999999999	61	1
4934	0140	San Luis	21.571525999999999	-88.159934000000007	61	1
4935	0141	San Gabriel	21.566576000000001	-88.092393000000001	61	1
4936	0142	San Gabriel	21.484632999999999	-88.149409000000006	61	1
4937	0143	San Jorge	21.475973	-88.169658999999996	61	1
4938	0144	Santa Rosa	21.485285000000001	-88.161777999999998	61	1
4939	0145	San Luis	21.529745999999999	-88.105520999999996	61	1
4940	0146	Dos Hermanos	21.437432999999999	-88.141373999999999	61	1
4941	0147	Salinera de Yucatán [Industria]	21.605481000000001	-88.006956000000002	61	1
4942	0001	Sacalum	20.495829000000001	-89.591165000000004	62	1
4943	0002	San Antonio Sodzil	20.539712000000002	-89.606517999999994	62	1
4944	0003	Teac	20.519380999999999	-89.623391999999996	62	1
4945	0004	Yal-Kuk	20.56344	-89.577203999999995	62	1
4946	0006	Yunkú	20.578287	-89.603275999999994	62	1
4947	0007	Plan Chac	20.452425999999999	-89.624616000000003	62	1
4948	0011	San Francisco	20.507197999999999	-89.619302000000005	62	1
4949	0012	Lakimbeh	20.575814000000001	-89.703620999999998	62	1
4950	0014	Santa Gertrudis Tebom	20.485479000000002	-89.566586000000001	62	1
4951	0015	Xoccheilá	20.550174999999999	-89.555391999999998	62	1
4952	0016	Honco	20.573098999999999	-89.597635999999994	62	1
4953	0017	San Marcos	20.466856	-89.609774000000002	62	1
4954	0020	San Pablo I	20.492913999999999	-89.597012000000007	62	1
4955	0022	Plan Sexenal	20.565863	-89.559442000000004	62	1
4956	0023	Yalchac	20.595179000000002	-89.712500000000006	62	1
4957	0024	Ojeda [Granja]	20.578330000000001	-89.711043000000004	62	1
4958	0025	María de Jesús Tek Cime	20.500031	-89.596593999999996	62	1
4959	0026	Sacalum Uno	20.481743999999999	-89.599717999999996	62	1
4960	0027	Sacalum Dos	20.480048	-89.605997000000002	62	1
4961	0028	Sacalum Cuatro	20.475324000000001	-89.599746999999994	62	1
4962	0029	Sacalum Tres	20.47392	-89.608309000000006	62	1
4963	0030	San Luis	20.496143	-89.598562999999999	62	1
4964	0031	Landi María Couoh Ku	20.486826000000001	-89.584902	62	1
4965	0032	Pedro Ojeda Cervantes	20.500361999999999	-89.596508999999998	62	1
4966	0033	María Cristina Álamo Ceballos	20.493988999999999	-89.584710000000001	62	1
4967	0034	CFE [Oficinas]	20.405836999999998	-89.570807000000002	62	1
4968	0001	Samahil	20.883482999999998	-89.888806000000002	63	1
4969	0002	Cuzumal	20.798062000000002	-89.956851999999998	63	1
4970	0003	Kuchel	20.848863000000001	-89.898247999999995	63	1
4971	0004	San Antonio Tedzidz	20.833825999999998	-89.976063999999994	63	1
4972	0005	Balché	20.886033999999999	-89.867975999999999	63	1
4973	0006	San Antonio Balché	20.896813999999999	-89.866172000000006	63	1
4974	0008	Emiliano Zapata	20.841733000000001	-89.944394000000003	63	1
4975	0010	San Felipe de Jesús	20.898554000000001	-89.910442000000003	63	1
4976	0011	Imersa	20.903867000000002	-89.894642000000005	63	1
4977	0013	Zaragoza Dos	20.857478	-89.988731999999999	63	1
4978	0016	San José Pich	20.786918	-89.979108999999994	63	1
4979	0017	San Lorenzo	20.869416000000001	-89.894222999999997	63	1
4980	0018	San Miguel	20.909348000000001	-89.896223000000006	63	1
4981	0019	Gas Tomza [Gasera]	20.888414000000001	-89.899306999999993	63	1
4982	0020	Tixmas	20.776862999999999	-89.945983999999996	63	1
4983	0023	Yaxché	20.866399999999999	-89.889120000000005	63	1
4984	0025	Benito Juárez	20.885636000000002	-89.871303999999995	63	1
4985	0026	Buenaventura	20.885522000000002	-89.860366999999997	63	1
4986	0029	Kakalum	20.854085000000001	-89.891131999999999	63	1
4987	0030	Luis Echeverría Álvarez Uno	20.883728999999999	-89.875592999999995	63	1
4988	0031	Luis Echeverría Álvarez Dos	20.883346	-89.869183000000007	63	1
4989	0032	El Galope	20.879013	-89.896692000000002	63	1
4990	0034	Samahil Uno	20.868134999999999	-89.876247000000006	63	1
4991	0036	San José	20.883799	-89.900863999999999	63	1
4992	0037	San José	20.845389000000001	-89.891278999999997	63	1
4993	0038	San Rafael	20.839008	-89.896996000000001	63	1
4994	0039	San Vicente Uno	20.832875999999999	-89.906716000000003	63	1
4995	0040	San Carlos	20.859400000000001	-89.987444999999994	63	1
4996	0041	Samahil [UAIM]	20.885352999999999	-89.879096000000004	63	1
4997	0043	José Isaías	20.889482999999998	-89.867289999999997	63	1
4998	0044	Zaragoza Uno	20.855238	-89.981972999999996	63	1
4999	0045	San Bernardino Tixnuc	20.883445999999999	-89.893984000000003	63	1
5000	0047	Bachoco	20.899432000000001	-89.892673000000002	63	1
5001	0048	Bachoco	20.919778000000001	-89.898484999999994	63	1
5002	0049	Bokamché	20.883986	-89.869052999999994	63	1
5003	0050	Francisco Indalecio Madero	20.836853000000001	-89.911084000000002	63	1
5004	0051	Materiales y Fulminantes Peninsulares	20.866679000000001	-89.877184	63	1
5005	0052	Pomolché	20.817996000000001	-89.927816000000007	63	1
5006	0054	San Antonio Dos	20.845203000000001	-89.975910999999996	63	1
5007	0055	San Luis	20.836908999999999	-89.904874000000007	63	1
5008	0056	San Raúl	20.853992999999999	-89.975380000000001	63	1
5009	0057	San Vicente Dos	20.836563999999999	-89.901598000000007	63	1
5010	0058	Tedzidz Dos	20.867733999999999	-89.991287999999997	63	1
5011	0061	Mayapán	20.891805000000002	-89.902583000000007	63	1
5012	0062	Grety	20.866706000000001	-89.893542999999994	63	1
5013	0064	San Antonio	20.881135	-89.893732999999997	63	1
5014	0065	Seis Hermanos	20.881256	-89.898670999999993	63	1
5015	0066	José López Portillo	20.851873000000001	-89.978423000000006	63	1
5016	0067	Chichén Itzá	20.895911000000002	-89.909357	63	1
5017	0069	Juanita	20.850954999999999	-89.978689000000003	63	1
5018	0070	Guadalupe	20.873586	-89.890255999999994	63	1
5019	0071	San Isidro	20.871734	-89.890428999999997	63	1
5020	0074	San Bernardo Tixnuc	20.826605000000001	-89.930779999999999	63	1
5021	0075	Sayil	20.892786999999998	-89.904227000000006	63	1
5023	0079	La Mujer de Yucatán	20.846767	-89.974367000000001	63	1
5024	0080	Santa Bárbara	20.875571000000001	-89.882520999999997	63	1
5025	0081	Rancho Alegre [Granja]	20.87707	-89.890217000000007	63	1
5026	0001	Sanahcat	20.771262	-89.214760999999996	64	1
5027	0003	San José Esperanza	20.781711000000001	-89.220771999999997	64	1
5028	0004	Tixcacal Ancona	20.767285000000001	-89.183678999999998	64	1
5029	0007	Xamán Uno y Dos	20.780149999999999	-89.212179000000006	64	1
5030	0012	Santa María Jenluimar	20.783473999999998	-89.223597999999996	64	1
5031	0014	Granjas Crío	20.778184	-89.230028000000004	64	1
5032	0001	San Felipe	21.567599000000001	-88.232062999999997	65	1
5033	0002	Acapulco	21.435834	-88.329339000000004	65	1
5034	0003	El Cerrito	21.420052999999999	-88.253969999999995	65	1
5035	0009	Lourdes	21.454494	-88.231531000000004	65	1
5036	0011	El Porvenir	21.451619000000001	-88.211061999999998	65	1
5037	0013	San Antonio	21.450088000000001	-88.230129000000005	65	1
5038	0014	San Benito	21.454567000000001	-88.219555999999997	65	1
5039	0016	San Esteban	21.439637000000001	-88.223161000000005	65	1
5040	0017	San Francisco	21.448511	-88.227603000000002	65	1
5041	0018	San Francisco de Asís	21.434633999999999	-88.24494	65	1
5042	0019	San Isidro	21.416664999999998	-88.244563999999997	65	1
5043	0021	Chen Cimén	21.549965	-88.193466000000001	65	1
5044	0023	San Martín	21.407314	-88.238444000000001	65	1
5045	0024	San Miguel	21.409226	-88.262591999999998	65	1
5046	0027	Paraíso	21.427077000000001	-88.240368000000004	65	1
5047	0028	Santa Cruz	21.417308999999999	-88.259018999999995	65	1
5048	0029	Santa Elena	21.443956	-88.239069000000001	65	1
5049	0030	Santa María	21.411840000000002	-88.247013999999993	65	1
5050	0032	Santiaguito	21.435065999999999	-88.261367000000007	65	1
5051	0033	Santo Domingo	21.532108000000001	-88.245593	65	1
5052	0035	Soledad	21.400790000000001	-88.253641000000002	65	1
5053	0036	Xkokol	21.455874999999999	-88.344581000000005	65	1
5054	0037	Xpanha-Toro	21.506080999999998	-88.356162999999995	65	1
5055	0038	Yokdzonot	21.495048000000001	-88.193206000000004	65	1
5056	0039	Actún Há	21.444915000000002	-88.172138000000004	65	1
5057	0044	Chun On	21.399989999999999	-88.244777999999997	65	1
5058	0046	Ebtún	21.392181000000001	-88.247305999999995	65	1
5059	0050	La Costa	21.549527999999999	-88.212751999999995	65	1
5060	0056	Santa Cruz Miraflor	21.537279000000002	-88.242279999999994	65	1
5061	0057	Monserrat	21.436418	-88.349220000000003	65	1
5062	0060	Chaparral	21.415814999999998	-88.247551999999999	65	1
5063	0061	Orizaba	21.446536999999999	-88.197084000000004	65	1
5064	0063	Santa Clara	21.435227000000001	-88.250412999999995	65	1
5065	0064	San Lucas	21.393408999999998	-88.251295999999996	65	1
5066	0068	San Antonio	21.426935	-88.248966999999993	65	1
5067	0070	Las Cruces	21.472059000000002	-88.254054999999994	65	1
5068	0071	San Dimas	21.390689999999999	-88.227131999999997	65	1
5069	0075	San Gregorio	21.440534	-88.246352999999999	65	1
5070	0076	San Isidro	21.430589000000001	-88.198802000000001	65	1
5071	0079	San Juan	21.491104	-88.252200999999999	65	1
5072	0080	San Juan Número Tres	21.554983	-88.199394999999996	65	1
5073	0081	San Juan	21.429207000000002	-88.278144999999995	65	1
5074	0082	Ix Nohtok	21.477398999999998	-88.306389999999993	65	1
5075	0083	San Luis	21.391242999999999	-88.213887999999997	65	1
5076	0084	San Luis Mena	21.474330999999999	-88.290518000000006	65	1
5077	0087	San Román Uno	21.525639999999999	-88.250951000000001	65	1
5078	0091	San Pablo	21.459582999999999	-88.269192000000004	65	1
5079	0095	Santa Cruz	21.441133000000001	-88.213277000000005	65	1
5080	0101	Santa Rosa	21.468495999999998	-88.250917000000001	65	1
5081	0102	Santa Teresa	21.503357000000001	-88.244983000000005	65	1
5082	0106	San Genaro	21.460955999999999	-88.315441000000007	65	1
5083	0108	Santa Pilar	21.461190999999999	-88.253673000000006	65	1
5084	0111	Santa Cruz	21.412298	-88.243847000000002	65	1
5085	0112	Cuatro Hermanos	21.406229	-88.247598999999994	65	1
5086	0113	Cuchbatab	21.503162	-88.281880999999998	65	1
5087	0114	Chacancún	21.495139000000002	-88.352065999999994	65	1
5088	0115	Chan Pozuelo	21.442815	-88.460032999999996	65	1
5089	0117	San Nicolás	21.531495	-88.226097999999993	65	1
5090	0119	Ingenio	21.444621999999999	-88.318760999999995	65	1
5091	0120	Kaladzadz	21.465206999999999	-88.306375000000003	65	1
5092	0125	San Gabriel	21.459883999999999	-88.268448000000006	65	1
5093	0127	San Miguel	21.418610000000001	-88.269659000000004	65	1
5094	0129	Santa Anita	21.437743000000001	-88.313443000000007	65	1
5095	0131	Santa Lucía	21.508327999999999	-88.251585000000006	65	1
5096	0132	Xkalayaxché	21.463612000000001	-88.279972999999998	65	1
5097	0133	San Carlos	21.432732000000001	-88.238286000000002	65	1
5098	0134	Santa Clara	21.461765	-88.434663999999998	65	1
5099	0136	Saya Osorno	21.450945999999998	-88.331598	65	1
5100	0137	San Isidro	21.451647999999999	-88.279353	65	1
5101	0138	Santa Rosa	21.456976999999998	-88.383931000000004	65	1
5102	0139	Santa Martha	21.457673	-88.374126000000004	65	1
5103	0142	Edén	21.443090000000002	-88.367057000000003	65	1
5104	0143	San Sebastián	21.436250000000001	-88.306755999999993	65	1
5105	0149	Santo Domingo	21.386935000000001	-88.222588000000002	65	1
5106	0150	Santiaguito	21.403766000000001	-88.254115999999996	65	1
5107	0151	El Sagrario	21.461421000000001	-88.252404999999996	65	1
5108	0152	Santa Teresa	21.538954	-88.233551000000006	65	1
5109	0154	Xcaltún	21.517617999999999	-88.188181	65	1
5110	0155	X-Panhatoro	21.514690000000002	-88.291459000000003	65	1
5111	0156	Guadalupe	21.490895999999999	-88.248928000000006	65	1
5112	0158	San José	21.461255999999999	-88.413358000000002	65	1
5113	0159	San Martín	21.473203000000002	-88.360861	65	1
5114	0160	San Rafael	21.462688	-88.359340000000003	65	1
5115	0161	San Pascual	21.449382	-88.308498	65	1
5116	0162	Solteca	21.449660999999999	-88.295351999999994	65	1
5117	0163	Almendro	21.466507	-88.373812999999998	65	1
5118	0165	El Bajío	21.47184	-88.210706999999999	65	1
5119	0166	La Bendición de Dios	21.390264999999999	-88.255882	65	1
5120	0167	Chen Cortador	21.489339000000001	-88.340069	65	1
5121	0168	Chinalco	21.525299	-88.279982000000004	65	1
5122	0169	Concepción	21.521560999999998	-88.265799000000001	65	1
5123	0170	Dzonot Lú	21.479430000000001	-88.371870000000001	65	1
5124	0171	Dzonot Pinto Uno	21.482723	-88.409957000000006	65	1
5125	0173	Maracaibo	21.452293999999998	-88.443098000000006	65	1
5126	0174	El Milagro de Dios	21.410246999999998	-88.227018000000001	65	1
5127	0175	Miraflor	21.475898999999998	-88.208842000000004	65	1
5128	0176	Montecristo	21.411778999999999	-88.235253	65	1
5129	0177	Montecristo	21.425666	-88.205420000000004	65	1
5130	0179	El Paraíso	21.507391999999999	-88.343279999999993	65	1
5131	0180	El Pedregal	21.422732	-88.247521000000006	65	1
5132	0181	Chac-Dzadz Primero	21.418648000000001	-88.242348000000007	65	1
5133	0182	La Providencia	21.465320999999999	-88.210676000000007	65	1
5134	0183	El Ramonal	21.392147000000001	-88.240832999999995	65	1
5135	0184	San Agustín	21.405449000000001	-88.226611000000005	65	1
5136	0185	San Agustín	21.437089	-88.275999999999996	65	1
5137	0186	San Antonio	21.530034000000001	-88.213272000000003	65	1
5138	0187	San Diego	21.410509000000001	-88.205534999999998	65	1
5139	0188	San Felipe	21.444737	-88.266700999999998	65	1
5140	0191	San Genaro	21.466432999999999	-88.445367000000005	65	1
5141	0192	San Gilberto	21.424139	-88.203862000000001	65	1
5142	0193	San Isidro	21.475525000000001	-88.351207000000002	65	1
5143	0194	San José	21.426521000000001	-88.226297000000002	65	1
5144	0195	San José	21.416402999999999	-88.233526999999995	65	1
5145	0196	San Luis	21.397213000000001	-88.233847999999995	65	1
5146	0197	San Luis	21.435092999999998	-88.262269000000003	65	1
5147	0198	San Luis	21.459969999999998	-88.220688999999993	65	1
5148	0199	San Luis Díaz	21.447806	-88.287215000000003	65	1
5149	0200	San Manuel	21.479289000000001	-88.412706	65	1
5150	0201	San Manuel de Atocha	21.541094000000001	-88.208363000000006	65	1
5151	0202	San Martín	21.431654000000002	-88.216459999999998	65	1
5152	0203	San Martín	21.402871999999999	-88.218453999999994	65	1
5153	0205	San Martín	21.531451000000001	-88.209596000000005	65	1
5154	0206	San Martín de la Costa	21.463614	-88.221380999999994	65	1
5155	0207	San Néstor	21.469429999999999	-88.210189	65	1
5156	0208	San Pastor	21.43207	-88.225183999999999	65	1
5157	0209	San Pastor	21.484940999999999	-88.349547999999999	65	1
5158	0210	San Pedro	21.477772000000002	-88.333628000000004	65	1
5159	0211	San Ramón	21.414811	-88.206603999999999	65	1
5160	0212	San Román Dos	21.526401	-88.259364000000005	65	1
5161	0213	San Salvador	21.498768999999999	-88.325601000000006	65	1
5162	0214	Santa Clara	21.507232999999999	-88.312431000000004	65	1
5163	0215	Santa Cruz	21.536124000000001	-88.208864000000005	65	1
5164	0216	Santa Librada	21.451398999999999	-88.377751000000004	65	1
5165	0218	Santa Lucía	21.433669999999999	-88.282893000000001	65	1
5166	0219	Santa María	21.424866999999999	-88.217457999999993	65	1
5167	0220	Santa María	21.470119	-88.339449999999999	65	1
5168	0221	Santa María	21.472583	-88.214979	65	1
5169	0222	Santa Rita	21.540520000000001	-88.251609000000002	65	1
5170	0223	Santa Rosa	21.459970999999999	-88.209672999999995	65	1
5171	0224	Santiaguito	21.398223999999999	-88.225837999999996	65	1
5172	0225	Sayá Copó	21.512815	-88.372692000000001	65	1
5173	0226	Temisto	21.407070000000001	-88.209817000000001	65	1
5174	0227	Tres Marías	21.409168999999999	-88.220011	65	1
5175	0228	Tres Reyes	21.429856000000001	-88.245261999999997	65	1
5176	0229	Xkokol Dos	21.461818000000001	-88.341616000000002	65	1
5177	0230	Zacnicté	21.524725	-88.214792000000003	65	1
5178	0231	Zak Put	21.432559999999999	-88.233771000000004	65	1
5179	0232	Nueva Esperanza	21.425349000000001	-88.265653	65	1
5180	0233	Tres Hermanos	21.43113	-88.291818000000006	65	1
5181	0234	San Lorenzo	21.417815999999998	-88.276246999999998	65	1
5182	0235	Santiaguito	21.420589	-88.265327999999997	65	1
5183	0236	La Posta	21.418771	-88.245672999999996	65	1
5184	0237	San Martín	21.442274000000001	-88.292709000000002	65	1
5185	0238	El Chamizal	21.393930000000001	-88.242697000000007	65	1
5186	0239	Dzonot Pinto	21.486843	-88.392242999999993	65	1
5187	0240	Los Girasoles	21.406027999999999	-88.251658000000006	65	1
5188	0241	Las Margaritas	21.490383000000001	-88.391711000000001	65	1
5189	0242	El Porvenir Dos	21.535008000000001	-88.240730999999997	65	1
5190	0243	Rancho Viejo	21.431618	-88.407646999999997	65	1
5191	0244	San Joaquín	21.524370000000001	-88.231078999999994	65	1
5192	0245	San Luis	21.393910999999999	-88.229535999999996	65	1
5193	0246	Zapata	21.491643	-88.234869000000003	65	1
5194	0247	Tony Mena	21.455801000000001	-88.250877000000003	65	1
5195	0248	Aktanchuleh	21.511519	-88.215919999999997	65	1
5196	0249	La Almendra	21.493787000000001	-88.248857000000001	65	1
5197	0250	Santa Rosa [Anexa]	21.476092999999999	-88.253147999999996	65	1
5198	0251	Francisco Ceme	21.488956000000002	-88.222406000000007	65	1
5199	0253	El Milagro de Dios	21.540075000000002	-88.199935999999994	65	1
5200	0254	San Agustín	21.534115	-88.201491000000004	65	1
5201	0255	El Ramonal	21.511026000000001	-88.227487999999994	65	1
5202	0256	San Diego	21.483581999999998	-88.254375999999993	65	1
5203	0257	San Felipe	21.537980000000001	-88.192218999999994	65	1
5204	0258	San Germán	21.535115000000001	-88.234919000000005	65	1
5205	0259	San José Tizimín	21.53295	-88.241597999999996	65	1
5206	0260	San Judas Tadeo	21.515335	-88.225847000000002	65	1
5207	0261	San Pedro	21.518431	-88.242645999999993	65	1
5208	0262	Santa Martha	21.518018000000001	-88.215153999999998	65	1
5209	0263	San Carlos	21.432711000000001	-88.430109000000002	65	1
5210	0001	Santa Elena	20.328897999999999	-89.643259	66	1
5211	0002	Kabah	20.249046	-89.647673999999995	66	1
5212	0003	Uxmal [Ruinas]	20.360538999999999	-89.76764	66	1
5213	0005	San Simón	20.217137000000001	-89.809558999999993	66	1
5214	0014	San Agustín	20.341027	-89.643009000000006	66	1
5215	0015	San Isidro Yibah	20.328431999999999	-89.784498999999997	66	1
5216	0016	Kitinché	20.314060000000001	-89.809068999999994	66	1
5217	0017	Hacienda Uxmal [Hotel]	20.364512999999999	-89.769471999999993	66	1
5218	0019	Villas Arqueológicas [Hotel]	20.361678999999999	-89.767778000000007	66	1
5219	0024	Santa Ana	20.255993	-89.606292999999994	66	1
5220	0031	Santa Ana [Granja]	20.229758	-89.599535000000003	66	1
5221	0032	San Lorenzo	20.303160999999999	-89.808289000000002	66	1
5222	0033	Abraham Sansores	20.323025999999999	-89.636215000000007	66	1
5223	0034	Perseverancia	20.328716	-89.769234999999995	66	1
5224	0037	Aurora Dzib González	20.324081	-89.634975999999995	66	1
5225	0038	Pedro Lozano	20.332395999999999	-89.651402000000004	66	1
5226	0039	San Miguel	20.334320000000002	-89.837025999999994	66	1
5227	0040	Concho Tec	20.319693999999998	-89.635019999999997	66	1
5228	0041	Víctor Chi	20.333580999999999	-89.649090000000001	66	1
5229	0042	Santa Cruz (Chalín)	20.326986000000002	-89.800867999999994	66	1
5230	0043	Xpanbiuitz (Los Cocos)	20.29016	-89.792057999999997	66	1
5231	0044	Porfirio Nic Moo	20.335751999999999	-89.648465000000002	66	1
5232	0045	María Mata Huchin	20.328900999999998	-89.654695000000004	66	1
5233	0001	Seyé	20.836987000000001	-89.372253000000001	67	1
5234	0003	San Bernardino	20.894361	-89.399237999999997	67	1
5235	0005	San Salvador	20.852067999999999	-89.321364000000003	67	1
5236	0007	Xukú	20.803093000000001	-89.311385000000001	67	1
5237	0009	Bacalar	20.827867000000001	-89.350935000000007	67	1
5238	0011	Santa María	20.857144999999999	-89.393184000000005	67	1
5239	0015	Bacoc	20.803003	-89.348003000000006	67	1
5240	0017	Dzacamucuy	20.771228000000001	-89.364103	67	1
5241	0020	San Miguel Arcángel	20.847493	-89.388846000000001	67	1
5242	0021	Sac-Catzín	20.821909999999999	-89.425792999999999	67	1
5243	0025	Santa Ana	20.821083999999999	-89.366900999999999	67	1
5244	0026	Bolonixán	20.896833000000001	-89.410769000000002	67	1
5245	0027	San Juan	20.903905999999999	-89.438704999999999	67	1
5246	0028	San Bernardino	20.891656999999999	-89.392944999999997	67	1
5247	0031	San Manuel	20.853846000000001	-89.375674000000004	67	1
5248	0032	San Miguel	20.828008000000001	-89.399182999999994	67	1
5249	0033	San Pedro Chuc	20.850304999999999	-89.357639000000006	67	1
5250	0035	San Serapio	20.823121	-89.375208000000001	67	1
5251	0038	Santa Cruz	20.892471	-89.371003000000002	67	1
5252	0039	Nohcham	20.927496999999999	-89.373035000000002	67	1
5253	0042	San Francisco	20.837617000000002	-89.388762999999997	67	1
5254	0044	La Candelaria Número Uno	20.831043999999999	-89.357774000000006	67	1
5255	0045	Seyé	20.840055	-89.388328000000001	67	1
5256	0046	Holactún	20.876383000000001	-89.329139999999995	67	1
5257	0047	Kankabchén	20.850031000000001	-89.329149000000001	67	1
5258	0048	Multun-Kú	20.844912000000001	-89.392358000000002	67	1
5259	0049	San Julián	20.840475000000001	-89.396180999999999	67	1
5260	0050	San Salvador	20.872914999999999	-89.308460999999994	67	1
5261	0051	San Carlos	20.848866000000001	-89.401218	67	1
5262	0052	La Perseverancia	20.856279000000001	-89.417738999999997	67	1
5263	0054	Unidad Nance	20.860208	-89.374691999999996	67	1
5264	0055	Sagrado Corazón de Jesús Uno	20.897417999999998	-89.362474000000006	67	1
5265	0056	Sagrado Corazón de Jesús Dos	20.892551000000001	-89.356506999999993	67	1
5266	0057	San Ignacio	20.849951999999998	-89.408489000000003	67	1
5267	0058	San Mauricio	20.820713999999999	-89.368173999999996	67	1
5268	0059	San Miguel	20.856528999999998	-89.394639999999995	67	1
5269	0063	Pope	20.853995999999999	-89.355068000000003	67	1
5270	0065	Kaxán Kuxtal	20.827059999999999	-89.401566000000003	67	1
5271	0066	Sagrado Corazón de Jesús Tres	20.891347	-89.351979	67	1
5272	0067	San Antonio	20.854405	-89.335507000000007	67	1
5273	0068	San Eligio Uno	20.822658000000001	-89.351397000000006	67	1
5274	0069	San Pedro	20.854727	-89.374888999999996	67	1
5275	0070	San Vicente	20.821719999999999	-89.386629999999997	67	1
5276	0071	Thalau Tikihaltún	20.826566	-89.398867999999993	67	1
5277	0072	Ninguno [Acopio Ganadero]	20.858253000000001	-89.375157999999999	67	1
5278	0073	Ninguno [Acopio Ganadero]	20.855385999999999	-89.374874000000005	67	1
5279	0074	Ex-Rastro	20.856712000000002	-89.375023999999996	67	1
5280	0075	Ninguno	20.843214	-89.383412000000007	67	1
5281	0079	San Juan	20.822510000000001	-89.371700000000004	67	1
5282	0080	San Jorge	20.844944999999999	-89.352491999999998	67	1
5283	0081	San Martín	20.838726000000001	-89.390793000000002	67	1
5284	0083	Ninguno	20.825655000000001	-89.355993999999995	67	1
5285	0084	San Felipe	20.845478	-89.349254000000002	67	1
5286	0085	Tres Potrillos	20.811674	-89.377548000000004	67	1
5287	0087	Carlos Cahuich Santos	20.890936	-89.379571999999996	67	1
5288	0088	Deseret [Granja]	20.915147999999999	-89.374887000000001	67	1
5289	0089	Los Tres Reyes [Granja]	20.925882999999999	-89.375293999999997	67	1
5290	0090	Granja San Antonio Abad	20.852143999999999	-89.404871	67	1
5291	0091	Javier Herrera	20.843903999999998	-89.390007999999995	67	1
5292	0092	Chéen Tunich	20.844819999999999	-89.391243000000003	67	1
5293	0093	Emmanuel [Rancho]	20.846198999999999	-89.394236000000006	67	1
5294	0094	San Carlos [Rancho]	20.849539	-89.401025000000004	67	1
5295	0095	Ninguno	20.885663000000001	-89.378539000000004	67	1
5296	0097	Ninguno	20.822414999999999	-89.373925999999997	67	1
5297	0098	Boxita [Rancho]	20.894494000000002	-89.378103999999993	67	1
5298	0099	San Marcos	20.822717999999998	-89.373510999999993	67	1
5299	0100	San Mauricio II	20.822132	-89.369804999999999	67	1
5300	0101	Santa Rosa	20.831847	-89.385953000000001	67	1
5301	0102	Tumbenchen (San Graciano)	20.893523999999999	-89.368654000000006	67	1
5302	0103	Tumbenchen Uno	20.889755000000001	-89.378093000000007	67	1
5303	0104	El Cerro	20.856756000000001	-89.338469000000003	67	1
5304	0105	La Natividad [Rancho]	20.880258000000001	-89.378433000000001	67	1
5305	0106	Lucio Gamboa	20.878233999999999	-89.375422999999998	67	1
5306	0107	San Rafael [Quinta]	20.851742000000002	-89.407900999999995	67	1
5307	0001	Sinanché	21.225594999999998	-89.185783000000001	68	1
5308	0002	Nabanchén	21.235717999999999	-89.207402999999999	68	1
5309	0003	San Crisanto	21.353280999999999	-89.171808999999996	68	1
5310	0004	Santa Cruz	21.241268000000002	-89.175702999999999	68	1
5311	0005	San Carlos	21.217065000000002	-89.213284000000002	68	1
5312	0006	San Luis	21.216297999999998	-89.216137000000003	68	1
5313	0008	Chunhabín	21.303303	-89.163585999999995	68	1
5314	0010	Xitib Canul	21.28078	-89.181310999999994	68	1
5315	0011	Chun Copó	21.309038999999999	-89.189081000000002	68	1
5316	0012	Xculiá	21.326093	-89.212563000000003	68	1
5317	0015	San Pablo	21.271129999999999	-89.207324999999997	68	1
5318	0016	Santa Catalina	21.294281999999999	-89.178066000000001	68	1
5319	0018	San Miguel Arcángel	21.220345999999999	-89.201193000000004	68	1
5320	0022	Lol Bé	21.219874000000001	-89.211573999999999	68	1
5321	0024	Kansacopó	21.198564999999999	-89.220973999999998	68	1
5322	0028	Oxpe-Bé	21.205952	-89.229714000000001	68	1
5323	0029	San Juan	21.317843	-89.224188999999996	68	1
5324	0033	Tzotzó	21.327418999999999	-89.217336000000003	68	1
5325	0035	San Eustaquio	21.323343000000001	-89.222205000000002	68	1
5326	0036	El Buen Samaritano	21.314049000000001	-89.210808999999998	68	1
5327	0038	San Miguel	21.313549999999999	-89.214230000000001	68	1
5328	0039	Santa Elena de la Cruz	21.289014999999999	-89.236942999999997	68	1
5329	0040	Santa María	21.217881999999999	-89.205905000000001	68	1
5330	0042	Sinanché Vegetales	21.226853999999999	-89.170646000000005	68	1
5331	0043	Casa de la Juventud	21.22871	-89.192515999999998	68	1
5332	0044	San Nicolás	21.253356	-89.196859000000003	68	1
5333	0045	Sak Há [Balneario]	21.350000999999999	-89.202703999999997	68	1
5334	0046	Casa Tortuga	21.347891000000001	-89.220889999999997	68	1
5335	0047	Casa Verde	21.349540000000001	-89.194952000000001	68	1
5336	0048	Cabacnah Cabañas [Hostal]	21.351191	-89.193939999999998	68	1
5762	0009	Mocté	20.213560999999999	-88.876456000000005	73	1
5337	0049	Playa del Coco [Hotel]	21.348116000000001	-89.216283000000004	68	1
5338	0050	Dee Paul	21.354479000000001	-89.162513000000004	68	1
5339	0001	Sotuta	20.595018	-89.006705999999994	69	1
5340	0003	Tabí	20.598610999999998	-88.899167000000006	69	1
5341	0004	Tibolón	20.666505000000001	-88.939690999999996	69	1
5342	0005	Zavala	20.608896999999999	-89.113681999999997	69	1
5343	0007	Bacocol	20.649334	-89.013266999999999	69	1
5344	0009	Cancabchén	20.566951	-89.056617000000003	69	1
5345	0012	Chen Box	20.529301	-88.991033999999999	69	1
5346	0014	Chikehil	20.675732	-89.016480000000001	69	1
5347	0015	Chin Canul	20.626916000000001	-89.053640000000001	69	1
5348	0016	Chululteil	20.562750999999999	-88.962648999999999	69	1
5349	0017	Dzemukut	20.636647	-88.913443000000001	69	1
5350	0018	Dziuché	20.700744	-88.898173	69	1
5351	0020	Guadalupe	20.599540000000001	-89.080569999999994	69	1
5352	0021	Honilá	20.569904000000001	-89.036072000000004	69	1
5353	0022	Xkakab	20.643049000000001	-88.936362000000003	69	1
5354	0023	Kalil	20.539335000000001	-88.988933000000003	69	1
5355	0025	Kancabal	20.605459	-89.122394	69	1
5356	0026	Kantunbalam	20.635995999999999	-88.996463000000006	69	1
5357	0027	Kimich	20.549849999999999	-89.014688000000007	69	1
5358	0028	San Jorge	20.604009999999999	-89.045015000000006	69	1
5359	0029	Koxol	20.579962999999999	-89.013351999999998	69	1
5360	0031	Nohdzonot	20.740216	-88.922488000000001	69	1
5361	0033	Pipa	20.651831999999999	-88.869954000000007	69	1
5362	0034	Xmucuy	20.558797999999999	-88.996392999999998	69	1
5363	0035	Sahcamucuy	20.540745000000001	-89.017523999999995	69	1
5364	0036	Sambulá	20.552772000000001	-89.024473999999998	69	1
5365	0037	San Antonio	20.584802	-88.980560999999994	69	1
5366	0038	San Antonio	20.587444000000001	-88.900053999999997	69	1
5367	0039	San Eustaquio	20.617777	-88.905573000000004	69	1
5368	0040	San Francisco	20.551794000000001	-88.997178000000005	69	1
5369	0042	San Isidro	20.616116999999999	-88.983901000000003	69	1
5370	0044	San Isidro Chich	20.643608	-88.853983999999997	69	1
5371	0046	San Gerónimo	20.533645	-89.038908000000006	69	1
5372	0047	San Lorenzo	20.634872999999999	-88.955877000000001	69	1
5373	0048	San Pedro	20.555267000000001	-88.983442999999994	69	1
5374	0049	San Pedro	20.607824000000001	-88.958839999999995	69	1
5375	0051	San Pedro Kanchaltún	20.646087000000001	-88.962857999999997	69	1
5376	0053	San Rafael Actunhuay	20.525138999999999	-89.111943999999994	69	1
5377	0055	Saylah Kin	20.599875000000001	-89.032030000000006	69	1
5378	0056	Santa Bárbara	20.571655	-89.074984999999998	69	1
5379	0058	Santa Teresa	20.625837000000001	-88.963965999999999	69	1
5380	0059	Sibul	20.637736	-89.045147999999998	69	1
5381	0060	Tahdzibichén	20.682299	-89.054302000000007	69	1
5382	0061	Temozón	20.588963	-88.943552999999994	69	1
5383	0063	Timul	20.693159999999999	-89.045109999999994	69	1
5384	0065	Ucí Cah	20.611063000000001	-88.939790000000002	69	1
5385	0067	Xbonchén	20.536611000000001	-89.066755999999998	69	1
5386	0070	Xiat	20.579329000000001	-89.000737999999998	69	1
5387	0071	Xixil	20.651364000000001	-88.996798999999996	69	1
5388	0074	Xluchil	20.547048	-89.091633999999999	69	1
5389	0075	Xmactún	20.649235999999998	-88.981795000000005	69	1
5390	0076	Xmulchén	20.521732	-89.082314999999994	69	1
5391	0077	Xpacabí	20.659223000000001	-89.001902999999999	69	1
5392	0078	Xpaclán	20.595002000000001	-89.127596999999994	69	1
5393	0080	Xtabay	20.578813	-89.090547999999998	69	1
5394	0083	X-Uah	20.710978000000001	-88.996111999999997	69	1
5395	0084	Yaxhal	20.516750999999999	-88.991782000000001	69	1
5396	0086	San Bernardino	20.601137999999999	-89.088266000000004	69	1
5397	0088	Sinitún	20.597155999999998	-88.972087000000002	69	1
5398	0090	Chim Uno	20.560244999999998	-89.015204999999995	69	1
5399	0093	Ibachil	20.548268	-89.110940999999997	69	1
5400	0094	San Juan	20.572564	-89.115505999999996	69	1
5401	0096	Kucheil	20.658270000000002	-89.042559999999995	69	1
5402	0097	Santa María	20.606275	-89.014330000000001	69	1
5403	0100	Pancheil	20.634903000000001	-89.023402000000004	69	1
5404	0101	San Román	20.554452999999999	-89.011272000000005	69	1
5405	0105	Xjomail	20.602581000000001	-89.095055000000002	69	1
5406	0107	Xkom	20.524495000000002	-88.967903000000007	69	1
5407	0108	Yaxunhá	20.527134	-88.964371999999997	69	1
5408	0110	Guadalupe	20.599903000000001	-88.874601999999996	69	1
5409	0111	Usil Chen	20.681308999999999	-88.932222999999993	69	1
5410	0112	Chahlicab	20.661721	-88.959399000000005	69	1
5411	0114	Kolanchén	20.642696000000001	-89.005702999999997	69	1
5412	0117	San Fernando	20.579564000000001	-89.053165000000007	69	1
5413	0121	Otzmal	20.512259	-89.025378000000003	69	1
5414	0124	Chan Kik	20.526253000000001	-89.027041999999994	69	1
5415	0126	Xholté	20.688351000000001	-88.939746	69	1
5416	0128	San Pedro	20.665223999999998	-88.949566000000004	69	1
5417	0129	San Juan Bautista	20.678132999999999	-88.927448999999996	69	1
5418	0137	Botochil	20.537951	-89.097368000000003	69	1
5419	0138	El Suco	20.59995	-89.070171999999999	69	1
5420	0141	Manuel González	20.604296999999999	-89.018172000000007	69	1
5421	0146	Ninguno	20.625405000000001	-88.841913000000005	69	1
5422	0147	Ninguno	20.636348999999999	-88.839916000000002	69	1
5423	0148	Miguel Hidalgo	20.606110999999999	-89.002222000000003	69	1
5424	0150	Pustunich	20.64303	-88.997491999999994	69	1
5425	0151	San Rafael	20.548432999999999	-89.099872000000005	69	1
5426	0153	Santa Esperanza	20.542636000000002	-88.995131999999998	69	1
5427	0154	Santa María	20.502276999999999	-88.946368000000007	69	1
5428	0155	Suytunchén	20.582025000000002	-89.043884000000006	69	1
5429	0157	Xbatil	20.532433000000001	-88.959973000000005	69	1
5430	0158	Xkatac	20.702055000000001	-89.059239000000005	69	1
5431	0159	San Andrés	20.596948000000001	-88.998642000000004	69	1
5432	0162	Marieta Cetina	20.610517000000002	-89.026762000000005	69	1
5433	0163	Xkancheil	20.595780999999999	-89.023488	69	1
5434	0164	Xlapak	20.590907999999999	-89.020639000000003	69	1
5435	0165	Nachicocom	20.607523	-89.001547000000002	69	1
5436	0166	San Marcos	20.610382999999999	-88.998776000000007	69	1
5437	0167	Kinkanché	20.701941000000001	-88.965556000000007	69	1
5438	0001	Sucilá	21.156165999999999	-88.313937999999993	70	1
5439	0004	Chuc Ac	21.138483000000001	-88.313558999999998	70	1
5440	0008	Jerusalén	21.287804999999999	-88.411090000000002	70	1
5441	0011	San Antonio	21.232488	-88.455603999999994	70	1
5442	0014	San Juan	21.284181	-88.393119999999996	70	1
5443	0015	San Miguel	21.128764	-88.310008999999994	70	1
5444	0016	Santa Rosa	21.289777999999998	-88.394800000000004	70	1
8497	1797	Cocal	21.365542000000001	-87.986137999999997	96	1
5445	0020	Sisbicchén	21.257128999999999	-88.414007999999995	70	1
5446	0021	San Isidro	21.132289	-88.291798	70	1
5447	0024	La Loma (La Loma Santa Lucia)	21.162168999999999	-88.322273999999993	70	1
5448	0025	Kan-Há	21.295784000000001	-88.406146000000007	70	1
5449	0029	La Flecha	21.194144999999999	-88.300773000000007	70	1
5450	0032	Santa Cecilia	21.233816999999998	-88.336320999999998	70	1
5451	0033	Chuntzalán	21.252804000000001	-88.445025999999999	70	1
5452	0035	San José	21.128150999999999	-88.307805999999999	70	1
5453	0036	San Francisco	21.215271000000001	-88.356306000000004	70	1
5454	0037	Tres Reyes	21.191237999999998	-88.429103999999995	70	1
5455	0038	Sahcabá	21.163070000000001	-88.443618000000001	70	1
5456	0039	El Cortijo	21.167082000000001	-88.428657999999999	70	1
5457	0040	San Diego	21.201972000000001	-88.332814999999997	70	1
5458	0041	La Candelaria	21.224153999999999	-88.326407000000003	70	1
5459	0045	Las Coloradas	21.283894	-88.361632999999998	70	1
5460	0046	Israel	21.294319999999999	-88.364886999999996	70	1
5461	0047	Guarda Costa	21.268464000000002	-88.410814999999999	70	1
5462	0048	Yoactún	21.285672000000002	-88.402101999999999	70	1
5463	0052	Almazán	21.236602000000001	-88.442182000000003	70	1
5464	0053	Bohchén	21.179573999999999	-88.352645999999993	70	1
5465	0054	Chac Lol	21.264959999999999	-88.362365999999994	70	1
5466	0055	Chan San José	21.214549000000002	-88.334228999999993	70	1
5467	0056	Chun Ox	21.246763000000001	-88.358161999999993	70	1
5468	0058	San Andrés	21.18995	-88.341621000000004	70	1
5469	0059	Kambul	21.206188000000001	-88.417676	70	1
5470	0060	Macancuch	21.166381000000001	-88.414968000000002	70	1
5471	0061	Mariachi	21.240037000000001	-88.433099999999996	70	1
5472	0062	Buena Esperanza	21.220874999999999	-88.456738999999999	70	1
5473	0063	Sayab Sanguino	21.231206	-88.346384999999998	70	1
5474	0065	Paraíso	21.159320000000001	-88.329132000000001	70	1
5475	0066	Pool Balam	21.204478000000002	-88.453933000000006	70	1
5476	0067	La S	21.220789	-88.339787999999999	70	1
5477	0068	Bohchén	21.175926	-88.315657999999999	70	1
5478	0070	San Dimas	21.283598000000001	-88.373140000000006	70	1
5479	0071	San Eraclio	21.184222999999999	-88.338836000000001	70	1
5480	0072	San Jorge	21.156651	-88.341887999999997	70	1
5481	0073	San Martín	21.162272000000002	-88.369928000000002	70	1
5482	0074	San Judas Macamay	21.186278999999999	-88.445372000000006	70	1
5483	0075	San Pedro Navajuelas	21.236349000000001	-88.430937999999998	70	1
5484	0076	San Ramón	21.202086999999999	-88.398722000000006	70	1
5485	0080	San Juan	21.156941	-88.376515999999995	70	1
5486	0081	Santa Martha	21.198236999999999	-88.419117999999997	70	1
5487	0083	Santa Teresa	21.290559999999999	-88.371487000000002	70	1
5488	0084	Santa Teresa	21.169979000000001	-88.376347999999993	70	1
5489	0085	Tierra Blanca	21.171809	-88.438023000000001	70	1
5490	0086	La Península	21.192823000000001	-88.344081000000003	70	1
5491	0087	San Francisco	21.212130999999999	-88.366455000000002	70	1
5492	0088	San Luis X-Cupul	21.146567000000001	-88.395152999999993	70	1
5493	0089	X-Diablo	21.211006000000001	-88.432982999999993	70	1
5494	0090	Xtul	21.190936000000001	-88.326053999999999	70	1
5495	0091	Akandzonot	21.267294	-88.448425999999998	70	1
5496	0092	Buena Vista	21.179199000000001	-88.353353999999996	70	1
5497	0096	Chaclol Dos	21.256546	-88.358341999999993	70	1
5498	0097	Dzonot Mat	21.229725999999999	-88.415495000000007	70	1
5499	0099	San José Cristo Tunich	21.254290000000001	-88.392297999999997	70	1
5500	0100	La Natividad	21.20825	-88.456632999999997	70	1
5501	0101	San José	21.194051999999999	-88.407978999999997	70	1
5502	0102	Oxcal San Fernando	21.207159999999998	-88.417034999999998	70	1
5503	0103	Oxcal San Antonio	21.209831000000001	-88.41798	70	1
5504	0104	San Antonio Pet-Hac	21.147604000000001	-88.337541999999999	70	1
5505	0105	Rajón Chen	21.192731999999999	-88.463791999999998	70	1
5506	0107	San Pedro	21.206689000000001	-88.404205000000005	70	1
5507	0108	San Pedro	21.242446000000001	-88.442114000000004	70	1
5508	0109	San Pedro	21.158923999999999	-88.365482999999998	70	1
5509	0110	San Luis	21.269728000000001	-88.457880000000003	70	1
5510	0111	San Jorge	21.238738000000001	-88.454663999999994	70	1
5511	0112	San Agustín	21.262359	-88.449078999999998	70	1
5512	0114	San Francisco Dzitox	21.171558999999998	-88.400881999999996	70	1
5513	0115	San Martín	21.213851999999999	-88.396507	70	1
5514	0116	San Martín	21.227260999999999	-88.447930999999997	70	1
5515	0118	San Miguel del Alto	21.192893000000002	-88.397519000000003	70	1
5516	0120	San Juan	21.239585999999999	-88.363833999999997	70	1
5517	0121	Xkahceh San Rafael	21.223063	-88.361662999999993	70	1
5518	0122	San Antonio	21.234286999999998	-88.362944999999996	70	1
5519	0123	San Gregorio	21.228822999999998	-88.357121000000006	70	1
5520	0126	Santa Teresa	21.237670999999999	-88.368678000000003	70	1
5521	0129	Cruz Tunich	21.261327999999999	-88.390395999999996	70	1
5522	0130	Kandzonot	21.275088	-88.412820999999994	70	1
5523	0134	San Juan	21.243057	-88.441969	70	1
5524	0136	Santa Teresita	21.224416000000002	-88.424347999999995	70	1
5525	0137	Xlahká	21.147565	-88.320251999999996	70	1
5526	0138	Santo Domingo	21.156528999999999	-88.372135999999998	70	1
5527	0139	X-Takay	21.252293000000002	-88.338832999999994	70	1
5528	0140	Yohactún	21.153915999999999	-88.324323000000007	70	1
5529	0141	Yoh-Dzadz San Lorenzo	21.179383999999999	-88.378888000000003	70	1
5530	0142	San Álvaro	21.204058	-88.376360000000005	70	1
5531	0143	Santa Teresita	21.190629999999999	-88.387130999999997	70	1
5532	0144	San Narcizo	21.188825000000001	-88.382969000000003	70	1
5533	0145	San Martín	21.190975000000002	-88.368550999999997	70	1
5534	0146	Abán	21.152619999999999	-88.379155999999995	70	1
5535	0147	San Juan	21.156123999999998	-88.374503000000004	70	1
5536	0148	San Felipe	21.194127000000002	-88.392295000000004	70	1
5537	0149	El Arcángel	21.206116000000002	-88.385301999999996	70	1
5538	0151	San José Guadalupe	21.202193000000001	-88.421502000000004	70	1
5539	0156	Paraíso	21.216645	-88.436454999999995	70	1
5540	0157	La Luz de Jesús	21.210992000000001	-88.442841000000001	70	1
5541	0158	Los Tres Reyes	21.214355999999999	-88.453484000000003	70	1
5542	0159	Santa Gertrudis (San Pedro)	21.147067	-88.317673999999997	70	1
5543	0160	Oxcal	21.227039000000001	-88.438232999999997	70	1
5544	0162	Santa Isabel	21.171281	-88.389238000000006	70	1
5545	0166	Santa Cecilia	21.254871999999999	-88.438648000000001	70	1
5546	0167	Santa Clara Dindzonot	21.268526999999999	-88.437034999999995	70	1
5547	0168	San Isidro Dindzonot	21.268221	-88.435575	70	1
5548	0169	África	21.266628999999998	-88.421499999999995	70	1
5549	0170	San Gabino	21.276411	-88.422478999999996	70	1
5550	0172	Xpalma	21.262549	-88.397784999999999	70	1
5551	0174	Cuybacab	21.252493999999999	-88.398148000000006	70	1
5552	0175	El Edén	21.250131	-88.407831000000002	70	1
5553	0178	Xmina de Oro	21.237670999999999	-88.399141	70	1
5554	0180	Yohactún	21.236575999999999	-88.377095999999995	70	1
5555	0181	Chun Canché	21.234176000000001	-88.382330999999994	70	1
5556	0182	Los Compadres	21.223649000000002	-88.385238999999999	70	1
5557	0183	San Román	21.224354999999999	-88.380633000000003	70	1
5558	0187	Justo Juez	21.221865999999999	-88.368211000000002	70	1
5559	0188	San Pedro	21.221205999999999	-88.372997999999995	70	1
5560	0191	San Gerónimo	21.176807	-88.331323999999995	70	1
5561	0193	Oxcal San Fernando	21.239353000000001	-88.351810999999998	70	1
5562	0195	San Lorenzo	21.293327999999999	-88.420372	70	1
5563	0199	Santa Librada	21.284154000000001	-88.425100999999998	70	1
5564	0200	Abal Ac	21.280538	-88.424622999999997	70	1
5565	0201	San Francisco	21.148423000000001	-88.311778000000004	70	1
5566	0203	Onichén	21.156141000000002	-88.290203000000005	70	1
5567	0206	San Martín	21.265702000000001	-88.457181000000006	70	1
5568	0207	San Jorge	21.185927	-88.369206000000005	70	1
5569	0211	Santa Rosa de Lima	21.175716999999999	-88.422588000000005	70	1
5570	0212	San Isidro	21.181014000000001	-88.419837999999999	70	1
5571	0213	San Toribio	21.185466999999999	-88.423215999999996	70	1
5572	0216	San Benito Dos	21.262616000000001	-88.432722999999996	70	1
5573	0217	Dindzonot	21.269784000000001	-88.427453999999997	70	1
5574	0219	Tzuc Xan	21.206909	-88.312697	70	1
5575	0220	Yok Naranja	21.193718000000001	-88.314897999999999	70	1
5576	0221	Las Tres Marías	21.274477000000001	-88.420063999999996	70	1
5577	0223	San Diego [Anexa]	21.209727999999998	-88.351292999999998	70	1
5578	0225	Macancuch [Anexa]	21.174985	-88.411427000000003	70	1
5579	0226	Los Laureles	21.219434	-88.377827999999994	70	1
5580	0227	Cascabel	21.259732	-88.399456000000001	70	1
5581	0228	La Ceiba	21.224060999999999	-88.411427000000003	70	1
5582	0229	Chan Panabá	21.184117000000001	-88.275448999999995	70	1
5583	0230	El Chaparral	21.156609	-88.326121000000001	70	1
5584	0231	Tepenac	21.255230999999998	-88.418273999999997	70	1
5585	0232	Chun Pich	21.241889	-88.382472000000007	70	1
5586	0233	Dzibi-Ac	21.217977999999999	-88.410685999999998	70	1
5587	0234	Guadalupe	21.256936	-88.382818999999998	70	1
5588	0235	Guadalupe	21.187555	-88.429906000000003	70	1
5589	0236	Mina de Oro	21.290897999999999	-88.416480000000007	70	1
5590	0239	Los Reyes	21.163188000000002	-88.293447999999998	70	1
5591	0240	San Andrés	21.198657999999998	-88.417250999999993	70	1
5592	0241	San Antonio	21.232068000000002	-88.368415999999996	70	1
5593	0243	San Diego	21.217341000000001	-88.406338000000005	70	1
5594	0244	San Felipe	21.260152999999999	-88.439367000000004	70	1
5595	0245	San Felipe	21.210515999999998	-88.383810999999994	70	1
5596	0246	San Fernando	21.289123	-88.398414000000002	70	1
5597	0247	San Gregorio	21.222206	-88.415237000000005	70	1
5598	0249	El Chivo	21.168143000000001	-88.303854000000001	70	1
5599	0251	San José	21.203962000000001	-88.357772999999995	70	1
5600	0252	San José	21.192245	-88.431934999999996	70	1
5601	0253	San Antonio	21.197603999999998	-88.422150000000002	70	1
5602	0255	San Martín	21.223768	-88.404259999999994	70	1
5603	0256	San Luis	21.24475	-88.390337000000002	70	1
5604	0257	San Pedro	21.258945000000001	-88.336656000000005	70	1
5605	0258	Actunchen	21.231328999999999	-88.375326000000001	70	1
5606	0259	San Pedro Dzudzenbac	21.251076999999999	-88.453734999999995	70	1
5607	0260	San Sebastián	21.205088	-88.437427	70	1
5608	0261	Santa Cruz	21.269895000000002	-88.392538999999999	70	1
5609	0262	Santa Elena	21.201788000000001	-88.381496999999996	70	1
5610	0263	Santa Elena	21.247841999999999	-88.416832999999997	70	1
5611	0264	Santa Inés Dos	21.156210999999999	-88.381309999999999	70	1
5612	0265	Santa Librada	21.189796999999999	-88.304737000000003	70	1
5613	0266	Santa Librada	21.266594999999999	-88.403846999999999	70	1
5614	0267	San José	21.162186999999999	-88.384107999999998	70	1
5615	0268	Santa Lucía	21.248978999999999	-88.361761000000001	70	1
5616	0269	Santa Lucía	21.220621000000001	-88.362238000000005	70	1
5617	0270	Santa María el Sol	21.159683999999999	-88.406571999999997	70	1
5618	0271	Santa María	21.213093000000001	-88.417721999999998	70	1
5619	0272	Santa Martha	21.225313	-88.449686999999997	70	1
5620	0273	Tres Reyes	21.211839000000001	-88.423133000000007	70	1
5621	0274	Santa Rita	21.247793999999999	-88.374403999999998	70	1
5622	0275	Santa Rosa de Lima	21.208000999999999	-88.381112000000002	70	1
5623	0276	Guadalupe	21.238046000000001	-88.382498999999996	70	1
5624	0277	Ninguno	21.267524999999999	-88.398003000000003	70	1
5625	0278	San José	21.272158999999998	-88.406533999999994	70	1
5626	0279	Chan Hugo	21.16479	-88.389784000000006	70	1
5627	0281	La Candelaria	21.217929999999999	-88.292478000000003	70	1
5628	0282	San Lorenzo	21.221847	-88.454515999999998	70	1
5629	0285	Santa Alicia	21.221454000000001	-88.433420999999996	70	1
5630	0286	Ninguno	21.231497000000001	-88.435158999999999	70	1
5631	0287	San Antonio	21.215478000000001	-88.426349999999999	70	1
5632	0288	Xtakay Uno	21.251746000000001	-88.339623000000003	70	1
5633	0289	Santa Elena	21.249846999999999	-88.348917	70	1
5634	0290	Santa Martha	21.245827999999999	-88.341247999999993	70	1
5635	0291	San Ángel	21.151384	-88.324421000000001	70	1
5636	0292	San Genaro	21.211607000000001	-88.368514000000005	70	1
5637	0293	San Rafael	21.293831000000001	-88.400335999999996	70	1
5638	0294	San José	21.299524999999999	-88.390702000000005	70	1
5639	0295	San José	21.173206	-88.281013000000002	70	1
5640	0296	Tierra Blanca	21.182365999999998	-88.431781000000001	70	1
5641	0297	El Vaticano	21.236863	-88.389528999999996	70	1
5642	0298	Victoria	21.248705999999999	-88.330055999999999	70	1
5643	0299	San Sebastián	21.202918	-88.313834	70	1
5644	0300	Xyoh-Dzonot	21.230695000000001	-88.404280999999997	70	1
5645	0301	Yok Naranja Número Dos	21.192938000000002	-88.315331	70	1
5646	0302	Chumucbé	21.179442000000002	-88.269738000000004	70	1
5647	0303	Natividad Uno	21.151149	-88.271214000000001	70	1
5648	0304	La Natividad	21.147563000000002	-88.271298000000002	70	1
5649	0305	X'pich	21.144179000000001	-88.273978999999997	70	1
5650	0306	Dzadz Fidel	21.276890999999999	-88.385695999999996	70	1
5651	0307	San Juan	21.232327999999999	-88.422405999999995	70	1
5652	0309	Cuauhtémoc	21.161135999999999	-88.372726	70	1
5653	0310	Dzinup	21.166218000000001	-88.365775999999997	70	1
5654	0311	Los Cerros [Establo]	21.174409000000001	-88.327253999999996	70	1
5655	0312	San Bedher	21.182174	-88.387984000000003	70	1
5656	0313	Jarritos	21.288641999999999	-88.404545999999996	70	1
5657	0314	El Niño de Atocha	21.150366000000002	-88.286938000000006	70	1
5658	0315	El Espíritu Santo	21.190011999999999	-88.419636999999994	70	1
5659	0316	Rancho Nuevo	21.184747999999999	-88.331798000000006	70	1
5660	0317	Sacnicté	21.220199999999998	-88.345495999999997	70	1
5661	0318	San Agustín	21.209251999999999	-88.402979000000002	70	1
5662	0319	San Daniel	21.175910999999999	-88.348094000000003	70	1
5663	0320	San Francisco	21.249459000000002	-88.356807000000003	70	1
5664	0321	San Juan	21.153162999999999	-88.276675999999995	70	1
5665	0322	Santa Cruz	21.213398000000002	-88.311593999999999	70	1
5666	0323	Santa Cruz	21.205086999999999	-88.425588000000005	70	1
5667	0325	Santa Martha Cuatro	21.2803	-88.418942999999999	70	1
5668	0326	Santa Rita	21.227820999999999	-88.410078999999996	70	1
5669	0327	Santa Teresita	21.216408999999999	-88.364902999999998	70	1
5670	0328	Ticimul	21.165179999999999	-88.347454999999997	70	1
5671	0329	Los Cerros (Rancho Nuevo)	21.180866000000002	-88.330051999999995	70	1
5672	0330	San Antonio de Abad	21.147580000000001	-88.306852000000006	70	1
5673	0333	San Carlos	21.138497999999998	-88.274987999999993	70	1
5674	0335	San Manuel	21.180852999999999	-88.280699999999996	70	1
5675	0336	Santa Elena de las Vegas	21.186139000000001	-88.301210999999995	70	1
5676	0337	Xtul [Anexa]	21.198929	-88.335588999999999	70	1
5677	0338	Buenaventura	21.221640000000001	-88.373930999999999	70	1
5678	0339	El Calvario	21.202093999999999	-88.410317000000006	70	1
5679	0340	El Encanto	21.147839999999999	-88.299519000000004	70	1
5680	0341	La Flor	21.167975999999999	-88.274855000000002	70	1
5681	0342	José Feliciano	21.225263000000002	-88.371748999999994	70	1
5682	0343	Los Laureles	21.219484999999999	-88.430100999999993	70	1
5683	0344	Pablo Quetzal	21.185981000000002	-88.430611999999996	70	1
5684	0345	San Martín	21.158888999999999	-88.385617999999994	70	1
5685	0346	Divino Niño	21.170928	-88.274534000000003	70	1
5686	0347	San Francisco	21.195222999999999	-88.402315000000002	70	1
5687	0348	San Isidro	21.251906999999999	-88.368292999999994	70	1
5688	0349	San José	21.147490000000001	-88.290481999999997	70	1
5689	0350	San Lorenzo Dos	21.293651000000001	-88.420182999999994	70	1
5690	0351	San Manuel	21.210955999999999	-88.453890000000001	70	1
5691	0352	San Martín	21.197520000000001	-88.393843000000004	70	1
5692	0353	San Miguel	21.147262999999999	-88.288377999999994	70	1
5693	0354	San Miguel	21.168316000000001	-88.289485999999997	70	1
5694	0355	San Pablo	21.164012	-88.380323000000004	70	1
5695	0356	Santa Clara	21.241918999999999	-88.3536	70	1
5696	0357	Santa Isabel	21.148826	-88.302869000000001	70	1
5697	0358	San Angel	21.138061	-88.313969	70	1
5698	0359	Santa Cruz Nony	21.169454999999999	-88.392605000000003	70	1
5699	0360	Santa Rita	21.152882999999999	-88.297683000000006	70	1
5700	0361	Las Tres Marías	21.245556000000001	-88.347161999999997	70	1
5701	0362	Los Tres Reyes	21.149735	-88.315887000000004	70	1
5702	0363	San Gabriel	21.165164000000001	-88.394159000000002	70	1
5703	0001	Sudzal	20.872095999999999	-88.988792000000004	71	1
5704	0002	San Antonio Chalante	20.861111000000001	-88.959506000000005	71	1
5705	0003	Chumbec	20.800771999999998	-88.816705999999996	71	1
5706	0006	Kancabchén de Valencia	20.724681	-88.850851000000006	71	1
5707	0010	Tohtol	20.799955000000001	-88.901606000000001	71	1
5708	0011	Tzalam	20.817354999999999	-88.866722999999993	71	1
5709	0012	Yaxcach	20.841470999999999	-88.913253999999995	71	1
5710	0043	San Felipe	20.750874	-88.846699000000001	71	1
5711	0047	San Diego	20.769045999999999	-88.841988000000001	71	1
5712	0049	X-Mabén	20.764227999999999	-88.885020999999995	71	1
5713	0051	San Martín	20.781777000000002	-88.850375999999997	71	1
5714	0055	Santa María	20.788442	-88.840832000000006	71	1
5715	0058	Chakmultún	20.836918000000001	-88.929395999999997	71	1
5716	0059	Acum	20.844313	-88.972810999999993	71	1
5717	0060	Kalax	20.844093999999998	-88.947275000000005	71	1
5718	0062	Yaxunal	20.869607999999999	-88.906862000000004	71	1
5719	0063	Flor de Mayo	20.867204000000001	-88.976643999999993	71	1
5720	0068	Chansuytún	20.851534000000001	-88.923209	71	1
5721	0078	Nuevo Tzalam	20.822116999999999	-88.877812000000006	71	1
5722	0080	Sacakal	20.780704	-88.856280999999996	71	1
5723	0081	San Antonio Kancabchén	20.882988999999998	-88.927250999999998	71	1
5724	0087	San Juan	20.817305999999999	-88.880492000000004	71	1
5725	0093	Tabasco	20.827793	-88.916702000000001	71	1
5726	0100	San Bernardino	20.822427999999999	-88.871964000000006	71	1
5727	0102	San Mario	20.754940999999999	-88.885570000000001	71	1
5728	0103	San Martín	20.735983000000001	-88.880742999999995	71	1
5729	0105	Cacaldzonot	20.745850999999998	-88.869011999999998	71	1
5730	0106	Los Laureles	20.690072000000001	-88.842260999999993	71	1
5731	0108	Brazil	20.869481	-88.942036999999999	71	1
5732	0109	Guadalupana [UAIM]	20.868459000000001	-88.974250999999995	71	1
5733	0110	Solidaridad [UAIM]	20.875686999999999	-88.996561999999997	71	1
5734	0111	San Pedro	20.741970999999999	-88.805695	71	1
5735	0112	San Crisanto	20.861761999999999	-88.994983000000005	71	1
5736	0114	Ninguno	20.876287999999999	-88.992052999999999	71	1
5737	0115	El Papayal	20.817913000000001	-88.860641000000001	71	1
5738	0116	Santa Catalina	20.859954999999999	-88.944543999999993	71	1
5739	0117	Las Tres Cruces	20.870711	-88.976516000000004	71	1
5740	0118	Yaxnic	20.801943999999999	-88.827974999999995	71	1
5741	0001	Suma	21.086490999999999	-89.148279000000002	72	1
5742	0002	Kininché	21.062290000000001	-89.160572000000002	72	1
5743	0003	San Nicolás	21.106351	-89.159554999999997	72	1
5744	0004	La Central	21.088711	-89.160957999999994	72	1
5745	0005	Centro Porcícola	21.101336	-89.138019	72	1
5746	0009	Haydzonot	21.107433	-89.152637999999996	72	1
5747	0010	La Herradura	21.112546999999999	-89.202568999999997	72	1
5748	0014	San Pedro	21.106995000000001	-89.131840999999994	72	1
5749	0018	Ukan Há	21.162244000000001	-89.149073000000001	72	1
5750	0021	X-Cabil	21.096329000000001	-89.092276999999996	72	1
5751	0023	Damaso	21.104049	-89.136588000000003	72	1
5752	0026	Sac Nicté	21.094707	-89.150133999999994	72	1
5753	0027	La Guadalupana [UAIM]	21.078634000000001	-89.149542999999994	72	1
5754	0028	Ninguno [Desfibradora]	21.092614999999999	-89.141762	72	1
5755	0030	Antonio Sánchez Yañez	21.134494	-89.172416999999996	72	1
5756	0031	Catalino Mac Tuz	21.135888000000001	-89.183644000000001	72	1
5757	0032	La Lupita	21.135251	-89.178484999999995	72	1
5758	0033	La Tabasqueña	21.134214	-89.173912999999999	72	1
5759	0001	Tahdziú	20.203821000000001	-88.944903999999994	73	1
5760	0003	Candelaria	20.253098000000001	-88.916229000000001	73	1
5761	0006	Ixinché	20.278397999999999	-88.930650999999997	73	1
5763	0011	Pambijib	20.234352000000001	-88.933437999999995	73	1
5764	0014	Sahcat	20.179855	-88.936001000000005	73	1
5765	0016	San Bartolo	20.218889999999998	-88.939638000000002	73	1
5766	0017	San Bernardino	20.175163999999999	-88.943393999999998	73	1
5767	0022	San Francisco	20.312798000000001	-88.911761999999996	73	1
5768	0023	San Ignacio	20.217357	-88.865470999999999	73	1
5769	0024	San Isidro	20.236376	-88.880992000000006	73	1
5770	0025	San Lorenzo	20.245809999999999	-88.948228	73	1
5771	0026	San Marcos	20.262764000000001	-88.887698999999998	73	1
5772	0027	San Miguel	20.221810999999999	-88.827250000000006	73	1
5773	0028	San Nicolás	20.240137000000001	-88.832756000000003	73	1
5774	0031	San Pedro	20.227834000000001	-88.884349999999998	73	1
5775	0032	Santa Ana	20.235482000000001	-88.962294	73	1
5776	0033	Santa Clara	20.289560999999999	-88.923353000000006	73	1
5777	0036	Santa Rita	20.215368000000002	-88.943790000000007	73	1
5778	0037	Santo Domingo	20.239407	-88.916848000000002	73	1
5779	0038	Santo Tomás	20.259672999999999	-88.910624999999996	73	1
5780	0047	X-Mactún	20.262436000000001	-88.930556999999993	73	1
5781	0051	San Felipe	20.226831000000001	-88.844617999999997	73	1
5782	0052	X-Bakain	20.241824000000001	-88.838802000000001	73	1
5783	0053	Blanca Flor	20.272897	-88.873031999999995	73	1
5784	0058	Sutupil	20.29186	-88.912563000000006	73	1
5785	0066	San Sebastián	20.205908000000001	-88.893867999999998	73	1
5786	0072	San Dionisio	20.204946	-88.958115000000006	73	1
5787	0076	Timul	20.311827000000001	-88.935975999999997	73	1
5788	0083	San Isidro Uno	20.204889000000001	-88.980958000000001	73	1
5789	0091	San Francisco	20.221838000000002	-88.936086000000003	73	1
5790	0094	Santa Úrsula	20.225368	-88.946478999999997	73	1
5791	0097	X-Tahzí	20.217017999999999	-88.968294999999998	73	1
5792	0098	X-Tohil	20.282278000000002	-88.836476000000005	73	1
5793	0100	San Pablo	20.219283999999998	-88.920170999999996	73	1
5794	0103	San Cristóbal	20.313724000000001	-88.966853	73	1
5795	0107	Tah Sánchez	20.291947	-88.963113000000007	73	1
5796	0108	San Salvador	20.196861999999999	-88.939401000000004	73	1
5797	0110	Santa Cruz	20.239543999999999	-88.933064999999999	73	1
5798	0112	Dzibac Tres	20.257164	-88.804883000000004	73	1
5799	0114	Santa Generosa	20.186163000000001	-88.934323000000006	73	1
5800	0118	Mocté Dos	20.212603000000001	-88.873508000000001	73	1
5801	0119	San Vicente	20.205237	-88.934511000000001	73	1
5802	0001	Tahmek	20.875534999999999	-89.255795000000006	74	1
5803	0002	Muna Planta	20.907343999999998	-89.241148999999993	74	1
5804	0005	Xtabay	20.855653	-89.259148999999994	74	1
5805	0014	Panabá	20.902681000000001	-89.295315000000002	74	1
5806	0021	San Matías	20.875675999999999	-89.304934000000003	74	1
5807	0023	Santa Concepción	20.879290000000001	-89.282207	74	1
5808	0024	Santa María	20.886047999999999	-89.259677999999994	74	1
5809	0029	Wamerú	20.850659	-89.259032000000005	74	1
5810	0030	San Jorge Chún Jabín	20.874314999999999	-89.298349000000002	74	1
5811	0031	San Celso	20.908882999999999	-89.252939999999995	74	1
5812	0032	San Juan	20.882981000000001	-89.295520999999994	74	1
5813	0033	San Martín	20.907222999999998	-89.275075000000001	74	1
5814	0034	Sac-Yé	20.91873	-89.285506999999996	74	1
5815	0036	X-Tut	20.850843000000001	-89.254572999999993	74	1
5816	0039	José Gamboa Ojeda	20.875627999999999	-89.309064000000006	74	1
5817	0040	Ninguno	20.858416999999999	-89.256636	74	1
5818	0041	Yun Kaax	20.860420999999999	-89.252442000000002	74	1
5819	0042	Keken Inquietas 17	20.872069	-89.294758000000002	74	1
5820	0043	Pixixil	20.857794999999999	-89.292064999999994	74	1
5821	0044	Las Potrancas	20.850099	-89.254212999999993	74	1
5822	0045	San Benito	20.881019999999999	-89.298101000000003	74	1
5823	0046	San Francisco	20.891825000000001	-89.245604999999998	74	1
5824	0047	Xana Mukuy	20.873297000000001	-89.332189999999997	74	1
5825	0048	San Demetrio	20.897044000000001	-89.286771999999999	74	1
5826	0049	San Pedro	20.886711999999999	-89.302290999999997	74	1
5827	0050	Bachoco	20.908246999999999	-89.295237	74	1
5828	0051	Las Cruces	20.891300999999999	-89.280713000000006	74	1
5829	0052	La Flor del Camino	20.878170999999998	-89.315668000000002	74	1
5830	0053	Tahmek [Granja]	20.872883000000002	-89.270503000000005	74	1
5831	0054	Guadalupe	20.911913999999999	-89.303116000000003	74	1
5832	0055	El Paisa	20.905548	-89.281453999999997	74	1
5833	0056	San Pedro [Rancho]	20.877099000000001	-89.268202000000002	74	1
5834	0057	La Roca	20.910969000000001	-89.299074000000005	74	1
5835	0058	San Felipe Celtún	20.863337999999999	-89.299773000000002	74	1
5836	0060	Santa Cruz Calotmul Habín	20.890716000000001	-89.279602999999994	74	1
5837	0061	Tosa	20.873296	-89.297505000000001	74	1
5838	0062	La Valentina II	20.874068999999999	-89.263642000000004	74	1
5839	0063	Zac-Nicté	20.878067999999999	-89.316192000000001	74	1
5840	0064	Otro Rollo [Rancho]	20.875834999999999	-89.313745999999995	74	1
5841	0065	Las Magnolias	20.877388	-89.324663999999999	74	1
5842	0066	Ninguno	20.869786999999999	-89.325444000000005	74	1
5843	0001	Teabo	20.400410999999998	-89.284919000000002	75	1
5844	0002	La Fátima	20.362065999999999	-89.184068999999994	75	1
5845	0006	San Juan	20.416425	-89.312173000000001	75	1
5846	0011	Kulché	20.368856999999998	-89.155102999999997	75	1
5847	0015	Sahcabá	20.352508	-89.137343000000001	75	1
5848	0018	San Esteban	20.359235999999999	-89.176630000000003	75	1
5849	0019	San Fernando	20.403207999999999	-89.160897000000006	75	1
5850	0025	San Pedro	20.390402999999999	-89.301666999999995	75	1
5851	0028	Santa Rita Alvarado	20.415469999999999	-89.280212000000006	75	1
5852	0035	San Miguel	20.343938000000001	-89.299853999999996	75	1
5853	0036	San Isidro Hupichén	20.439178999999999	-89.225600999999997	75	1
5854	0038	Kantirix	20.402085	-89.235577000000006	75	1
5855	0039	Becanchén	20.398012999999999	-89.224176999999997	75	1
5856	0043	San José Xmulheleb	20.365252000000002	-89.192892999999998	75	1
5857	0047	Nahau	20.353131999999999	-89.265315999999999	75	1
5858	0054	Ninguno	20.351137999999999	-89.231475000000003	75	1
5859	0055	Acadzindzín	20.392187	-89.141690999999994	75	1
5860	0058	San José Pich	20.372852000000002	-89.232311999999993	75	1
5861	0059	Canapich	20.373317	-89.224647000000004	75	1
5862	0060	Chantunchil	20.394127999999998	-89.206710999999999	75	1
5863	0062	Chechac	20.431341	-89.252078999999995	75	1
5864	0064	Guadalupe	20.401716	-89.300471999999999	75	1
5865	0067	Panabtunich	20.391590000000001	-89.195155999999997	75	1
5866	0068	Sacnaché	20.415921000000001	-89.183884000000006	75	1
5867	0070	San Andrés	20.352698	-89.208692999999997	75	1
5868	0071	San Antonio	20.332377999999999	-89.305179999999993	75	1
5869	0072	San Antonio Chaczán	20.35566	-89.175661000000005	75	1
5870	0073	San Antonio Sodzil	20.426203999999998	-89.226505000000003	75	1
5871	0074	San Antonio Sotkal	20.419716000000001	-89.204234	75	1
5872	0075	San Diego	20.407854	-89.282026000000002	75	1
5873	0076	San Diego Max	20.333335999999999	-89.235726	75	1
5874	0077	San Francisco Kom	20.359708000000001	-89.245035000000001	75	1
5875	0079	San Isidro	20.375133999999999	-89.270347999999998	75	1
5876	0081	San Juan	20.429801000000001	-89.240960000000001	75	1
5877	0083	San Lázaro	20.384509000000001	-89.245716000000002	75	1
5878	0084	San Manuel	20.339839000000001	-89.288338999999993	75	1
5879	0085	San Nicolás	20.416457999999999	-89.266844000000006	75	1
5880	0088	Santa Isabel	20.411669	-89.250432000000004	75	1
5881	0094	Santa Elena Tuk	20.398734999999999	-89.243920000000003	75	1
5882	0095	Vista Alegre	20.414165000000001	-89.286410000000004	75	1
5883	0096	Xcana Cruz	20.413101000000001	-89.241544000000005	75	1
5884	0097	Xcoop	20.402956	-89.300796000000005	75	1
5885	0098	Xiat	20.418346	-89.193842000000004	75	1
5886	0099	Xuxcab	20.36251	-89.203688	75	1
5887	0102	Parcelas Felipe Carrillo Puerto	20.399923999999999	-89.260987	75	1
5888	0105	San Luis	20.392232	-89.281283999999999	75	1
5889	0106	La Esperanza	20.39864	-89.272246999999993	75	1
5890	0107	Mucuyché	20.362259999999999	-89.284634999999994	75	1
5891	0111	Jesé Ek Moo	20.405373999999998	-89.286962000000003	75	1
5892	0112	San Rudo	20.405059999999999	-89.291766999999993	75	1
5893	0113	Santiago	20.417508999999999	-89.273100999999997	75	1
5894	0118	Santa Elena	20.341958999999999	-89.166247999999996	75	1
5895	0119	San Refugio Kulché	20.369572999999999	-89.157122000000001	75	1
5896	0120	San Mateo	20.396573	-89.290125000000003	75	1
5897	0121	Bonanza	20.422606999999999	-89.244161000000005	75	1
5898	0122	San Bernardino	20.352409999999999	-89.252694000000005	75	1
5899	0123	Sauceda	20.406669000000001	-89.274128000000005	75	1
5900	0126	San Diego Noh Buhtun	20.385304000000001	-89.281428000000005	75	1
5901	0127	Pacchén	20.377424000000001	-89.154522	75	1
5902	0128	San Valentín	20.343143999999999	-89.228008000000003	75	1
5903	0129	San José de la Montaña	20.347792999999999	-89.223992999999993	75	1
5904	0130	San José Kulché	20.431774000000001	-89.184053000000006	75	1
5905	0131	San Leonardo Hoy	20.418496999999999	-89.250342000000003	75	1
5906	0132	San Marcos	20.441738999999998	-89.182419999999993	75	1
5907	0135	Chenchomal	20.403400999999999	-89.273715999999993	75	1
5908	0136	Ninguno	20.407036000000002	-89.249354999999994	75	1
5909	0137	San Diego	20.409514999999999	-89.280670000000001	75	1
5910	0138	San Diego Koochlé	20.398855000000001	-89.271118000000001	75	1
5911	0139	San Pedro	20.407655999999999	-89.270356000000007	75	1
5912	0141	Santo Tomás	20.405166999999999	-89.273804999999996	75	1
5913	0143	San Higinio	20.334636	-89.215104999999994	75	1
5914	0144	Paxhuet	20.329184000000001	-89.209253000000004	75	1
5915	0145	Santa Lucía	20.412102999999998	-89.278261999999998	75	1
5916	0146	Autoservicio Yucatán [Gasolinera]	20.404281000000001	-89.306894	75	1
5917	0148	Carlos Ayora	20.411307000000001	-89.283023	75	1
5918	0150	San Eduardo	20.360880000000002	-89.206235000000007	75	1
5919	0151	Paxhuet 2	20.32949	-89.211118999999997	75	1
5920	0152	San José	20.395747	-89.290188999999998	75	1
5921	0153	Santa Cruz	20.400438999999999	-89.274488000000005	75	1
5922	0001	Tecoh	20.741726	-89.474301999999994	76	1
5923	0002	Chinkilá	20.695249	-89.392036000000004	76	1
5924	0003	Itzincab	20.753114	-89.561881	76	1
5925	0005	Lepán	20.712623000000001	-89.498187999999999	76	1
5926	0006	Mahzucil	20.553267000000002	-89.461905999999999	76	1
5927	0007	Oxtapacab	20.771553000000001	-89.504371000000006	76	1
5928	0008	Pixyá	20.642253	-89.414754000000002	76	1
5929	0009	Sabacché	20.659825999999999	-89.370608000000004	76	1
5930	0010	Santa Rita	20.752455999999999	-89.458833999999996	76	1
5931	0011	Sotuta de Peón	20.741980000000002	-89.576620000000005	76	1
5932	0012	Telchaquillo	20.646322999999999	-89.463638000000003	76	1
5933	0013	X-Kanchakán	20.625268999999999	-89.501362	76	1
5934	0014	Ayinal	20.656758	-89.399253999999999	76	1
5935	0016	Kuncheilá	20.718537000000001	-89.424881999999997	76	1
5936	0017	Mayapán [Zona Arqueológica]	20.629334	-89.460807000000003	76	1
5937	0018	Paraíso	20.74568	-89.459599999999995	76	1
5938	0019	Puccheiná	20.667822000000001	-89.446561000000003	76	1
5939	0021	San Antonio Suytunchén	20.710353999999999	-89.452243999999993	76	1
5940	0022	San Joaquín	20.715858000000001	-89.466070999999999	76	1
5941	0023	San Juan	20.681956	-89.484133999999997	76	1
5942	0026	San Antonio Xpakay	20.556951000000002	-89.411186000000001	76	1
5943	0030	Manuel Gamboa	20.728134000000001	-89.474979000000005	76	1
5944	0032	Chan Suytunchén	20.673020999999999	-89.389234000000002	76	1
5945	0035	Huá	20.675806000000001	-89.409405000000007	76	1
5946	0036	Lázaro Cárdenas	20.729019000000001	-89.455912999999995	76	1
5947	0037	Nohsuytunchén	20.637955000000002	-89.352997000000002	76	1
5948	0038	San Eduardo	20.616107	-89.452842000000004	76	1
5949	0039	San Isidro	20.745757999999999	-89.461270999999996	76	1
5950	0040	Santa Cruz	20.612238999999999	-89.457604000000003	76	1
5951	0044	Santo Domingo X-Tuchil	20.680385000000001	-89.406747999999993	76	1
5952	0045	Chuydzonot	20.645247999999999	-89.346540000000005	76	1
5953	0047	Granjas Tecoh	20.757570000000001	-89.471186000000003	76	1
5954	0049	Katy Díaz	20.757729000000001	-89.470748999999998	76	1
5955	0050	San Pedro	20.722954999999999	-89.476135999999997	76	1
5956	0051	San Eduardo	20.753945999999999	-89.480378999999999	76	1
5957	0052	San Eduardo	20.715032999999998	-89.435064999999994	76	1
5958	0053	Santa Fe	20.746300999999999	-89.495317	76	1
5959	0054	San José	20.622267999999998	-89.451396000000003	76	1
5960	0055	San Ricardo	20.754975000000002	-89.481449999999995	76	1
5961	0056	Tecoh	20.73413	-89.482254999999995	76	1
5962	0057	Xetiuil	20.733528	-89.467708999999999	76	1
5963	0058	San Juan	20.736111000000001	-89.459721999999999	76	1
5964	0059	San Judas Tadeo (Yaxcopoil)	20.770468000000001	-89.478784000000005	76	1
5965	0061	Gloria Mukul Martínez	20.742249999999999	-89.485328999999993	76	1
5966	0062	Ninguno	20.690612999999999	-89.392374000000004	76	1
5967	0063	San Jorge Gabriel	20.700918000000001	-89.470274000000003	76	1
5968	0064	Alfonso Aguilar	20.729130999999999	-89.464663000000002	76	1
5969	0065	Cactus	20.632840999999999	-89.459182999999996	76	1
5970	0067	Ninguno [Trituradora]	20.677029999999998	-89.469919000000004	76	1
5971	0068	Jorge Castillo	20.728992000000002	-89.476033000000001	76	1
5972	0069	Lepan [Rancho]	20.709757	-89.491298999999998	76	1
5973	0070	Raúl Medina	20.727574000000001	-89.476433	76	1
5974	0071	Juan Be Cocom	20.726844	-89.476810999999998	76	1
5975	0072	Guadalupe Pacheco	20.725203	-89.476848000000004	76	1
5976	0073	Ninguno	20.723551	-89.475898000000001	76	1
5977	0074	San Francisco	20.709133000000001	-89.491446999999994	76	1
5978	0075	San José	20.554679	-89.460038999999995	76	1
5979	0076	Los Grillos	20.761447	-89.485888000000003	76	1
5980	0077	Juan Antonio Chi Medina	20.746127999999999	-89.462295999999995	76	1
5981	0078	San Felipe Chucchumil	20.558026999999999	-89.430474000000004	76	1
5982	0079	Don Serafín	20.645741000000001	-89.414761999999996	76	1
5983	0001	Tekal de Venegas	21.014073	-88.947005000000004	77	1
5984	0002	El Ancla	21.063521000000001	-88.952194000000006	77	1
5985	0004	Oxwatz	21.052778	-88.768056000000001	77	1
5986	0005	Tohopkú	21.046582000000001	-88.932494000000005	77	1
5987	0007	Tixcancal	20.990518000000002	-88.845457999999994	77	1
5988	0012	San Felipe	21.016169000000001	-88.831980999999999	77	1
5989	0015	Komcheilá	21.024806000000002	-88.979579000000001	77	1
5990	0020	Choachac	20.999606	-88.944491999999997	77	1
5991	0021	Tzalbaychén	21.018598000000001	-88.953926999999993	77	1
5992	0024	Huaymil	21.005043000000001	-88.919819000000004	77	1
5993	0031	Mulsay	21.024160999999999	-88.933633999999998	77	1
5994	0033	Pacchén	21.063307999999999	-88.742193	77	1
5995	0041	San Antonio	21.026264000000001	-88.942496000000006	77	1
5996	0044	Santa Rosa	21.028534000000001	-88.795637999999997	77	1
5997	0047	Tiholop	21.011033000000001	-88.915317999999999	77	1
5998	0048	Tixcancal Anexa	20.991530000000001	-88.809742	77	1
5999	0050	X-Copax	20.998194000000002	-88.779961	77	1
6000	0053	X-Nohpica	21.026945000000001	-88.770385000000005	77	1
6001	0057	Santa María	21.026935000000002	-88.833781000000002	77	1
6002	0059	Chenkú	21.059396	-88.727743000000004	77	1
6003	0060	Noctunchén	20.991254000000001	-88.959016000000005	77	1
6004	0061	San Felipe	21.022046	-88.914601000000005	77	1
6005	0062	San Francisco	21.00657	-88.834429	77	1
6006	0063	Texas Número Dos	21.027757999999999	-88.724923000000004	77	1
6007	0064	X-Cocil	21.023762000000001	-88.738084000000001	77	1
6008	0065	El Crucero	20.989649	-88.820907000000005	77	1
6009	0066	San José	20.975687000000001	-88.786822000000001	77	1
6010	0067	La Gota de Rocío	21.006060999999999	-88.946988000000005	77	1
6011	0068	Luis Echeverría	21.013458	-88.955055999999999	77	1
6012	0069	San Antonio	20.998273000000001	-88.959305000000001	77	1
6013	0070	Chenbox	20.989533999999999	-88.876801999999998	77	1
6014	0071	San Antonio	21.005092000000001	-88.871289000000004	77	1
6015	0072	Los Tres Reyes	21.021891	-88.874036000000004	77	1
6016	0073	San Gilberto	20.991672000000001	-88.796336999999994	77	1
6017	0001	Tekantó	21.011647	-89.106083999999996	78	1
6018	0002	San Diego	20.99212	-89.114737000000005	78	1
6019	0003	San Francisco Dzón	20.983139000000001	-89.144465999999994	78	1
6020	0004	Sanlatah	21.041201000000001	-89.146529999999998	78	1
6021	0005	Tixkochoh	21.013888999999999	-89.080686999999998	78	1
6022	0010	San Pedro Catzín	20.965156	-89.098833999999997	78	1
6023	0011	Santa Isabel	20.987891000000001	-89.030474999999996	78	1
6024	0012	Santa María	20.984725000000001	-89.094189999999998	78	1
6025	0016	Felipe Carrillo Puerto	21.002386999999999	-89.089367999999993	78	1
6026	0018	San Miguel	21.004348	-89.134586999999996	78	1
6027	0019	San Pedro	21.000126999999999	-89.102990000000005	78	1
6028	0021	Ninguno [UAIM]	21.003501	-89.093002999999996	78	1
6029	0022	Vicente Guerrero	21.001404000000001	-89.089274000000003	78	1
6030	0023	Bisinchac	20.986704	-89.077714	78	1
6031	0024	Candelaria	21.018294000000001	-89.074797000000004	78	1
6032	0025	Tixcochoh [Granja]	21.011626	-89.070183	78	1
6033	0026	El Establo	21.019998000000001	-89.099356	78	1
6034	0027	San Antonio	20.981515999999999	-89.087684999999993	78	1
6035	0028	San Francisco Dzón [Granja]	20.968996000000001	-89.142257000000001	78	1
6036	0029	San Juan	21.003205999999999	-89.093259000000003	78	1
6037	0030	Dos [UAIM]	21.003636	-89.089489	78	1
6038	0031	Chumuc-Beh	21.012795000000001	-89.095213000000001	78	1
6039	0032	Hidalgo Número Uno	21.013387999999999	-89.118616000000003	78	1
6040	0033	Montecristo	21.036932	-89.138749000000004	78	1
6041	0034	San Pedro Número Uno	21.011384	-89.121388999999994	78	1
6042	0036	Ninguno	21.013587000000001	-89.117562000000007	78	1
6043	0037	Tekantó [Basurero Municipal]	21.021556	-89.125134000000003	78	1
6044	0038	Chilam Balam [Gasolinera]	21.010273000000002	-89.129334	78	1
6045	0039	Santa Elena	21.022375	-89.094215000000005	78	1
6046	0040	Santo Domingo	21.00985	-89.125720999999999	78	1
6047	0041	Hidalgo	21.021229000000002	-89.120384999999999	78	1
6048	0042	San Juan [Rancho]	21.020565999999999	-89.105176	78	1
6049	0043	Tekantó [Rastro Municipal]	21.009550000000001	-89.128947999999994	78	1
6050	0001	Tekax de Álvaro Obregón	20.203465000000001	-89.288387999999998	79	1
6051	0002	Becanchén	19.875558999999999	-89.217105000000004	79	1
6052	0003	Candelaria	20.174028	-89.328547999999998	79	1
6053	0004	Canek	20.200337000000001	-89.329443999999995	79	1
6054	0005	Manuel Cepeda Peraza	20.152255	-89.251507000000004	79	1
6055	0006	Chacmultún	20.176290999999999	-89.34393	79	1
6056	0009	Alfonso Caso	20.077311000000002	-89.147968000000006	79	1
6057	0010	Kancab	20.195785999999998	-89.345788999999996	79	1
6058	0011	Kinil	20.323744000000001	-89.133398	79	1
6059	0012	Nohalal	19.792642000000001	-89.332402000000002	79	1
6060	0013	Santa Cruz	20.303720999999999	-89.300336000000001	79	1
6061	0015	Pencuyut	20.292300999999998	-89.290503000000001	79	1
6062	0017	San Antonio Xnuc	20.105388999999999	-89.154156	79	1
6063	0018	San Diego Uno	20.305997999999999	-89.182416000000003	79	1
6064	0019	San Diego	20.217732999999999	-89.232907999999995	79	1
6065	0020	San Diego Buenavista	19.859473999999999	-89.296110999999996	79	1
6066	0021	San Diego Tekax	20.162336	-89.234325999999996	79	1
6067	0022	San Esteban	20.285171999999999	-89.305678999999998	79	1
6068	0024	San Felipe Segundo	19.812246999999999	-89.470222000000007	79	1
6069	0026	San Gaspar	19.949003999999999	-89.157010999999997	79	1
6070	0027	Mac-Yan (San Isidro Mac-Yan)	19.832419000000002	-89.418833000000006	79	1
6071	0029	San Juan	20.292271	-89.303265999999994	79	1
6072	0030	San Norberto	20.316191	-89.132337000000007	79	1
6073	0031	Nueva Santa Cruz (Santa Cruz Cutzá)	19.837496000000002	-89.325649999999996	79	1
6074	0033	Ticum	20.148969000000001	-89.216977999999997	79	1
6075	0034	Tixcuytún	20.209147999999999	-89.204430000000002	79	1
6076	0035	Tzekelhaltún	20.18055	-89.372803000000005	79	1
6077	0036	Xaya	20.296309000000001	-89.187258	79	1
6078	0039	San Pedro Xtokil	19.776803000000001	-89.436854999999994	79	1
6079	0040	San Jorge	20.119312000000001	-89.166533000000001	79	1
6080	0041	Sinaí	19.682518999999999	-89.411929000000001	79	1
6081	0042	Santa Rita	20.164175	-89.278148999999999	79	1
6082	0043	San Felipe	20.307845	-89.148936000000006	79	1
6083	0044	San Martín Hili (Kichmó)	19.903887999999998	-89.524958999999996	79	1
6084	0045	Emiliano Zapata	19.782019999999999	-89.413932000000003	79	1
6085	0046	San Juan Tekax	19.715025000000001	-89.441858999999994	79	1
6086	0047	San Luis	20.245135999999999	-89.225352000000001	79	1
6087	0048	Chan Dzinup	19.871974000000002	-89.481699000000006	79	1
6088	0051	Pocoboch	19.902626000000001	-89.308513000000005	79	1
6089	0056	Caobas	19.791743	-89.146865000000005	79	1
6090	0058	Ayim Dos	19.779326000000001	-89.171882999999994	79	1
6091	0062	San Isidro Yaxché	19.876974000000001	-89.438685000000007	79	1
6092	0063	San Salvador	19.870736999999998	-89.428389999999993	79	1
6093	0067	X-Keulí	20.333542999999999	-89.127493000000001	79	1
6094	0070	San Felipe	20.190771999999999	-89.180306999999999	79	1
6095	0071	San Juan	20.176973	-89.162111999999993	79	1
6096	0072	Holcá Nuevo	19.897938	-89.356758999999997	79	1
6097	0073	Chulbalam	19.902383	-89.339438999999999	79	1
6098	0075	San Perfecto	20.194136	-89.191001	79	1
6099	0076	Guadalupe	20.240341999999998	-89.231348999999994	79	1
6100	0077	San Juan Bautista	20.254791000000001	-89.201667999999998	79	1
6101	0080	San Román	20.283726000000001	-89.187735000000004	79	1
6102	0081	San Vicente	20.294851000000001	-89.199751000000006	79	1
6103	0082	Yaxactún	20.298037999999998	-89.204936000000004	79	1
6104	0083	San Eustaquio	20.303702999999999	-89.185310000000001	79	1
6105	0084	Hobonil	20.292069000000001	-89.179473000000002	79	1
6106	0085	Benito Juárez	19.917746999999999	-89.499374000000003	79	1
6107	0086	San Agustín (Salvador Alvarado)	19.979488	-89.488382000000001	79	1
6108	0087	San Pedro Dzulá	19.916910999999999	-89.523764999999997	79	1
6109	0088	Yalcobá Nuevo	19.891145999999999	-89.577237999999994	79	1
6110	0089	San Lorenzo	20.171938000000001	-89.282135999999994	79	1
6111	0090	San José	20.273626	-89.270009000000002	79	1
6112	0092	San Pedro	20.313714999999998	-89.292893000000007	79	1
6113	0095	San Pedro	20.227924999999999	-89.329735999999997	79	1
6114	0097	Santana	20.251508999999999	-89.273826	79	1
6115	0099	San Bartolomé	20.205052999999999	-89.248301999999995	79	1
6116	0100	Santa Bárbara	20.147175000000001	-89.265237999999997	79	1
6117	0102	Chumaneco	20.163799000000001	-89.270506999999995	79	1
6118	0104	Santa Isabel	20.190504000000001	-89.209333999999998	79	1
6119	0105	Plan Chac Pozo Uno	20.198954000000001	-89.256198999999995	79	1
6120	0106	Plan Chac Pozo Dos	20.190812999999999	-89.253776999999999	79	1
6121	0107	Plan Chac Pozo Cuatro	20.170931	-89.234271000000007	79	1
6122	0108	Plan Chac Pozo Cinco	20.168953999999999	-89.234823000000006	79	1
6123	0109	Plan Chac Pozo Seis	20.165140000000001	-89.225429000000005	79	1
6124	0113	Carolina	20.152287000000001	-89.259898000000007	79	1
6125	0117	San Anastacio	20.179138999999999	-89.336291000000003	79	1
6126	0119	Houitz	20.163862999999999	-89.336849000000001	79	1
6127	0120	Mocontún	20.012408000000001	-89.395101999999994	79	1
6128	0121	San Víctor	20.306825	-89.161327	79	1
6129	0124	San Marcelino	20.181878000000001	-89.357347000000004	79	1
6130	0131	San Mateo	19.873524	-89.141572999999994	79	1
6131	0132	Sacpukenhá	19.892945000000001	-89.154174999999995	79	1
6132	0133	Colohche-Akal	20.027203	-89.170179000000005	79	1
6133	0136	Sac-Akal	20.137647999999999	-89.220365000000001	79	1
6134	0171	Baxac	19.957792999999999	-89.175393	79	1
6135	0172	Catbeh	20.186654000000001	-89.312933999999998	79	1
6136	0175	Comanches	20.130053	-89.178376	79	1
6137	0176	Cruz Akal	19.657385000000001	-89.176811000000001	79	1
6138	0177	Cruz-Tunich	20.110555000000002	-89.355352999999994	79	1
6139	0179	Chulté	20.287944	-89.171644999999998	79	1
6140	0181	Felipe León	19.683737000000001	-89.375445999999997	79	1
6141	0182	Francisco Indalesio Madero	19.869774	-89.258611000000002	79	1
6142	0187	El Huiro	19.659822999999999	-89.144417000000004	79	1
6143	0188	Huntochac	19.806101000000002	-89.499725999999995	79	1
6144	0191	José López Portillo	19.934256999999999	-89.187691000000001	79	1
6145	0192	Kantemó	20.001079000000001	-89.308139999999995	79	1
6146	0196	Mesatunich	19.810428999999999	-89.418329	79	1
6147	0197	Jacinto Canek [Albergue Escolar]	19.883979	-89.217479999999995	79	1
6148	0198	Xnah Poot	20.161504000000001	-89.306985999999995	79	1
6149	0199	Nicho Balam	19.936402999999999	-89.257277000000002	79	1
6150	0200	Noh Becan	19.77617	-89.216427999999993	79	1
6151	0202	Poccheil	19.782216999999999	-89.361125999999999	79	1
6152	0203	Poltok	19.736170999999999	-89.130200000000002	79	1
6153	0205	San Pedro Rompoy	19.723655999999998	-89.146084000000002	79	1
6154	0207	Sudzal Chico	19.710217	-89.103487000000001	79	1
6155	0209	San Antonio	20.227022999999999	-89.291522999999998	79	1
6156	0210	San Antonio	19.767272999999999	-89.189967999999993	79	1
6157	0211	San Antonio Ek	20.300132999999999	-89.261673999999999	79	1
6158	0213	San Enrique	19.985651000000001	-89.231517999999994	79	1
6159	0214	San Isidro	19.917947999999999	-89.221868999999998	79	1
6160	0215	San Isidro	20.288879000000001	-89.177132999999998	79	1
6161	0216	San Joaquín	20.205551	-89.260497000000001	79	1
6162	0217	San José	20.225569	-89.196641	79	1
6163	0218	San José Ucil	19.920331999999998	-89.237093000000002	79	1
6164	0219	San José Xkabanché	20.224489999999999	-89.283510000000007	79	1
6165	0220	San Jorge	19.728923000000002	-89.468434000000002	79	1
6166	0221	Santa Teresa	19.744959999999999	-89.156464	79	1
6167	0224	San Francisco	20.286735	-89.269727000000003	79	1
6168	0228	San Lorenzo	20.298924	-89.253360999999998	79	1
6169	0229	San Luis Huechil	19.928281999999999	-89.283835999999994	79	1
6170	0231	San Marcos	19.995629999999998	-89.209379999999996	79	1
6171	0232	San Marcos	20.196667000000001	-89.325091	79	1
6172	0237	San Cristóbal (San Nicolás)	19.807949000000001	-89.394223999999994	79	1
6173	0238	San Pablo	20.296126999999998	-89.157188000000005	79	1
6174	0240	San Pedro	20.292870000000001	-89.182513	79	1
6175	0241	San Pedro	20.286549000000001	-89.197328999999996	79	1
6176	0242	San Marcelo	19.79908	-89.324509000000006	79	1
6177	0243	San Román	19.906893	-89.251603000000003	79	1
6178	0244	Santa Ana	20.203686999999999	-89.207903999999999	79	1
6179	0245	Santa Cruz	20.165462000000002	-89.289339999999996	79	1
6180	0246	Santa María	20.182013000000001	-89.257829999999998	79	1
6181	0247	Santa María	20.292214999999999	-89.298011000000002	79	1
6182	0248	Santa Rita	19.841953	-89.373531999999997	79	1
6183	0251	Santa Teresa	20.208355999999998	-89.270323000000005	79	1
6184	0252	Santa Teresa	19.811999	-89.372619	79	1
6185	0253	Santo Domingo	19.787842999999999	-89.319869999999995	79	1
6186	0254	Santo Tomás	20.255495	-89.185641000000004	79	1
6187	0256	Trinidad	20.217563999999999	-89.256576999999993	79	1
6188	0257	El Trébol	20.098261999999998	-89.145049	79	1
6189	0260	Xkuil	19.994021	-89.167359000000005	79	1
6190	0261	Xcunyá	19.807355999999999	-89.378630000000001	79	1
6191	0262	X-Kanlol	20.127967000000002	-89.189936000000003	79	1
6192	0264	Lopia	20.316897999999998	-89.190652	79	1
6193	0271	Yaxché	19.975992000000002	-89.264159000000006	79	1
6194	0272	Zabac-Halal	19.975524	-89.209968000000003	79	1
6195	0274	Ayim Uno	19.763141000000001	-89.167040999999998	79	1
6196	0276	San Joaquín	20.285077000000001	-89.193200000000004	79	1
6197	0278	San Alonso	20.146001999999999	-89.238213000000002	79	1
6198	0279	San Bernabé	20.149448	-89.247342000000003	79	1
6199	0281	San Antonio Tuk	20.250577	-89.248482999999993	79	1
6200	0282	Hamulcecab	20.170589	-89.247399000000001	79	1
6201	0284	San Antonio Abad	20.251147	-89.222273000000001	79	1
6202	0286	San Pedro	20.219332999999999	-89.190280000000001	79	1
6203	0289	Unidad Antigua	20.195139000000001	-89.265080999999995	79	1
6204	0291	Paraíso	20.216037	-89.278639999999996	79	1
6205	0295	San Luis	20.299475999999999	-89.197764000000006	79	1
6206	0296	San Felipe	20.303450000000002	-89.284318999999996	79	1
6207	0297	San Luis	20.180159	-89.338183000000001	79	1
6208	0298	San Cristóbal	20.203966999999999	-89.355425999999994	79	1
6209	0300	Tacché	20.049543	-89.302896000000004	79	1
6210	0303	Nuevo Popolá	19.907882000000001	-89.385570999999999	79	1
6211	0304	José López Portillo	19.813839000000002	-89.525096000000005	79	1
6212	0305	San Rufino	19.789888000000001	-89.353747999999996	79	1
6213	0306	San Gerónimo	20.263081	-89.246454	79	1
6214	0307	Santa Teresa	20.268977	-89.291803000000002	79	1
6215	0308	Emiliano Zapata	20.245673	-89.305169000000006	79	1
6216	0309	Plan Chac Pozo Tres	20.191027999999999	-89.244457999999995	79	1
6217	0311	Mexquituk	19.948803999999999	-89.342246000000003	79	1
6218	0312	X-Cunchacá	19.831415	-89.551359000000005	79	1
6219	0314	San Cristóbal	19.810776000000001	-89.373767000000001	79	1
6220	0315	Xtolokil	19.934342000000001	-89.158407999999994	79	1
6221	0316	Huacpelchén	19.920103000000001	-89.117869999999996	79	1
6222	0317	Nuevo Dzitás	19.774332999999999	-89.241921000000005	79	1
6223	0318	San Luis	19.734107000000002	-89.290717999999998	79	1
6224	0319	Lázaro Cárdenas	19.739287999999998	-89.178729000000004	79	1
6225	0320	El Huiro Dos	19.656495	-89.146795999999995	79	1
6226	0321	El Huiro Tres	19.650825999999999	-89.135542000000001	79	1
6227	0322	San Marcos Cuncheil	19.735748000000001	-89.436414999999997	79	1
6228	0323	San Arturo	20.11758	-89.402394000000001	79	1
6229	0325	Arrozal	19.808641000000001	-89.166901999999993	79	1
6230	0326	Ayim Blanca Flor	19.784286000000002	-89.154501999999994	79	1
6231	0327	La Bendición de Dios	19.820474000000001	-89.225971999999999	79	1
6232	0329	Chunmul	19.816579999999998	-89.192971	79	1
6233	0330	Felipe Carrillo Puerto	20.233958000000001	-89.295323999999994	79	1
6234	0333	Miguel Hidalgo	20.175536999999998	-89.312077000000002	79	1
6235	0334	Valle del Sur	19.768474000000001	-89.157231999999993	79	1
6236	0335	Paraíso	20.233232999999998	-89.213291999999996	79	1
6237	0336	Plan Chac Pozo Seis	20.157360000000001	-89.223933000000002	79	1
6238	0337	Plan Chac Pozo Siete	20.154091999999999	-89.221682999999999	79	1
6239	0339	San Francisco	20.145655000000001	-89.252797999999999	79	1
6240	0340	San Jorge	20.237829999999999	-89.212126999999995	79	1
6241	0341	San Nicolás	20.300547000000002	-89.277697000000003	79	1
6242	0342	San Pedro	20.234396	-89.239559	79	1
6243	0343	Santa Cruz	20.228974000000001	-89.230823999999998	79	1
6244	0344	Santa Isabel	20.248588999999999	-89.231127999999998	79	1
6245	0345	Santa Ana	20.248632000000001	-89.233847999999995	79	1
6246	0346	Santa Úrsula	20.235903	-89.238664999999997	79	1
6247	0348	La Paloma	20.180319999999998	-89.260632999999999	79	1
6248	0350	La Pilarcita	20.225868999999999	-89.247485999999995	79	1
6249	0352	Xkakal	20.111556	-89.346367999999998	79	1
6250	0355	Cinco de Mayo	20.214487999999999	-89.309916000000001	79	1
6251	0356	San Diego	20.160197	-89.260401000000002	79	1
6252	0357	San Julián	20.217604999999999	-89.204700000000003	79	1
6253	0358	Yaxactún Dos	20.313040000000001	-89.193033999999997	79	1
6254	0361	Comuneros	20.201601	-89.310918000000001	79	1
6255	0362	El Escondido	20.230349	-89.222458000000003	79	1
6256	0363	Pakan Xíiu Uno	20.208850000000002	-89.233346999999995	79	1
6257	0364	El Regalo	20.177879999999998	-89.257219000000006	79	1
6258	0365	San Miguel	20.236567999999998	-89.206366000000003	79	1
6259	0366	La Veleta	20.188831	-89.274570999999995	79	1
6260	0367	Alborada Chun Wuitz	19.754283000000001	-89.440269000000001	79	1
6261	0370	Kunchehaltún	20.002929000000002	-89.476031000000006	79	1
6262	0371	Pachpuc	20.128584	-89.204734000000002	79	1
6263	0372	San Antonio	19.897646000000002	-89.320447000000001	79	1
6264	0373	San Isidro Dos	19.874772	-89.454809999999995	79	1
6265	0374	San Manuel	19.801190999999999	-89.346723999999995	79	1
6266	0375	Santa Rosa	19.872109999999999	-89.472334000000004	79	1
6267	0376	Sinavila	20.064236999999999	-89.206348000000006	79	1
6268	0377	Yaxpeché	20.092338000000002	-89.211262000000005	79	1
6269	0378	Ayim	19.778210999999999	-89.164066000000005	79	1
6270	0379	Bacal	19.972484000000001	-89.241668000000004	79	1
6271	0380	San Andrés	19.833221000000002	-89.233624000000006	79	1
6272	0383	Florencio Pech May	19.839648	-89.235889999999998	79	1
6273	0384	Ninguno	19.770717999999999	-89.139628999999999	79	1
6274	0385	San Carlos	19.896236999999999	-89.246549000000002	79	1
6275	0386	Nuevo Sinaí	19.805126000000001	-89.175427999999997	79	1
6276	0387	Petén	19.748996000000002	-89.123857000000001	79	1
6277	0388	Pistaches	19.753585999999999	-89.125647000000001	79	1
6278	0389	El Renacimiento	19.775237000000001	-89.141682000000003	79	1
6279	0390	Héctor Verdes	19.762611	-89.133729000000002	79	1
6280	0391	San Cristobal de Pixoy	19.765833000000001	-89.174972999999994	79	1
6281	0392	San Francisco Acum Dos	19.973047000000001	-89.159062000000006	79	1
6282	0393	San Gabriel Noh-Becan	19.794511	-89.217888000000002	79	1
6283	0395	Santa Rita	19.798969	-89.332504999999998	79	1
6284	0397	Chulbalam	19.921064000000001	-89.347666000000004	79	1
6285	0398	Ichmul	19.816216000000001	-89.418930000000003	79	1
6286	0399	Santa Lucía	19.811788	-89.515012999999996	79	1
6287	0400	Antonio Basto	19.691908999999999	-89.127574999999993	79	1
6288	0403	Manuel David Chan	19.733954000000001	-89.277013999999994	79	1
6289	0405	San Gregorio	19.704070999999999	-89.113100000000003	79	1
6290	0406	Aristeo	20.170994	-89.247697000000002	79	1
6291	0407	Chan Santa Cruz	20.199774999999999	-89.311166	79	1
6292	0408	San Francisco Tixcuytún	20.229393999999999	-89.207189999999997	79	1
6293	0409	Los Cascabeles	20.182127999999999	-89.262828999999996	79	1
6294	0410	Rey de Reyes	20.172343999999999	-89.249736999999996	79	1
6295	0411	Los Laureles	20.177339	-89.255262000000002	79	1
6296	0412	San Carlos	20.211618000000001	-89.217996999999997	79	1
6297	0413	San Miguel Arcángel	20.172294999999998	-89.251008999999996	79	1
6298	0414	El Cedral	20.23462	-89.314766000000006	79	1
6299	0415	Chun Chucún	20.146974	-89.330391000000006	79	1
6300	0416	Santa Cruz	20.239605999999998	-89.321201000000002	79	1
6301	0417	Kadi [Rancho]	20.122477	-89.172827999999996	79	1
6302	0419	San Luis	20.313734	-89.285505000000001	79	1
6303	0420	San Felipe	20.264558999999998	-89.160306000000006	79	1
6304	0421	Muchté	20.250332	-89.160596999999996	79	1
6305	0422	San Lorenzo Uno	19.802762000000001	-89.233577999999994	79	1
6306	0423	San Pedro	20.219197999999999	-89.298552999999998	79	1
6307	0424	El Escondido	20.287075000000002	-89.168108000000004	79	1
6308	0425	Mactunich	20.111723999999999	-89.361012000000002	79	1
6309	0426	Marcelino Palomo	19.805958	-89.233953	79	1
6310	0427	Pakan Xíiu	20.211524000000001	-89.231415999999996	79	1
6311	0428	San Antonio	19.789400000000001	-89.425925000000007	79	1
6312	0430	Tres Hermanitas	19.814404	-89.425572000000003	79	1
6313	0433	El Ramonal	20.148264000000001	-89.336883	79	1
6314	0434	Agua Prieta	19.774837999999999	-89.207649000000004	79	1
6315	0435	Gamaliel Solís	19.751528	-89.169914000000006	79	1
6316	0436	Factor X [Alcohólicos Adictos]	20.153995999999999	-89.224103999999997	79	1
6317	0437	Agregados Peninsulares	20.298566999999998	-89.176378	79	1
6318	0438	Alfredo Cahum	20.206454000000001	-89.302595999999994	79	1
6319	0439	Anexo Nohalal	19.803726000000001	-89.332048999999998	79	1
6320	0440	El Cerrito	20.205686	-89.304918999999998	79	1
6321	0441	Chun Kanasín	19.863308	-89.247243999999995	79	1
6322	0442	Cruz Nok Tunich	20.191072999999999	-89.281784000000002	79	1
6323	0443	Los Cinco Caminos	19.732288	-89.251519000000002	79	1
6324	0444	La Flor de Nayarit	20.134184999999999	-89.212709000000004	79	1
6325	0445	Flor de Pozo	19.841964000000001	-89.399687999999998	79	1
6326	0447	Los Gavilanes	20.185814000000001	-89.270104000000003	79	1
6327	0448	Kim [Albergue]	20.212209999999999	-89.275120000000001	79	1
6328	0449	Juan Ramón Medina	20.17276	-89.250241000000003	79	1
6329	0450	Lopia Dos	20.317443999999998	-89.190004999999999	79	1
6330	0451	Leona Vicario Dos	20.172436000000001	-89.251579000000007	79	1
6331	0452	Ninguno	20.191331000000002	-89.260649999999998	79	1
6332	0453	Ninguno	19.98282	-89.317525000000003	79	1
6333	0454	Rangel Euán Luna	19.818242999999999	-89.221481999999995	79	1
6334	0455	La Tinta	19.824133	-89.231003999999999	79	1
6335	0456	Beto Caamal	19.792258	-89.253596000000002	79	1
6336	0457	Ninguno	19.741206999999999	-89.239154999999997	79	1
6337	0458	Montevideo	19.742211999999999	-89.250277999999994	79	1
6338	0459	Paraíso Dos	20.231428999999999	-89.216517999999994	79	1
6339	0460	El Recuerdo	20.297249999999998	-89.251614000000004	79	1
6340	0461	Ricardo Cetina	19.810642000000001	-89.468535000000003	79	1
6341	0462	San Antonio Dos	19.779433999999998	-89.186114000000003	79	1
6342	0463	San Bernabé	20.220534000000001	-89.289349999999999	79	1
6343	0464	San Diego	20.162770999999999	-89.238812999999993	79	1
6344	0465	San Manuel	19.648962000000001	-89.149996000000002	79	1
6345	0466	San Miguel	19.732635999999999	-89.236548999999997	79	1
6346	0467	San Pedro	19.904941999999998	-89.144740999999996	79	1
6347	0468	San Ucil Dos	19.894358	-89.234190999999996	79	1
6348	0469	Santa Lucía	19.830313	-89.325872000000004	79	1
6349	0470	Santa Rosa	20.294999000000001	-89.269086000000001	79	1
6350	0471	Santa Teresa	20.260490999999998	-89.248429999999999	79	1
6351	0472	Sartenejas	19.743364	-89.242238	79	1
6352	0474	X-Hualyuk	20.094564999999999	-89.349621999999997	79	1
6353	0475	X-Hualyuk Dos	20.096785000000001	-89.358305000000001	79	1
6354	0476	San Antonio Tuk	20.145505	-89.394300000000001	79	1
6355	0477	Kinil [Huerta]	20.330397999999999	-89.143251000000006	79	1
6356	0478	Sartenejas [Rancho]	20.193912000000001	-89.311481999999998	79	1
6357	0479	Santa Teresa [colonia]	20.210339000000001	-89.273144000000002	79	1
6358	0480	Paraíso [Colonia]	20.211634	-89.272036	79	1
6359	0481	Akan Pot	20.183313999999999	-89.288612999999998	79	1
6360	0482	El Sol [Rancho]	19.883875	-89.222735	79	1
6361	0483	Aquiles Serdán [Albergue Escolar Indígena]	20.153469000000001	-89.215743000000003	79	1
6362	0001	Tekit	20.533493	-89.333095	80	1
6363	0005	Dolores Aké	20.551760000000002	-89.288396000000006	80	1
6364	0012	San Antonio Xmequel	20.573573	-89.242605999999995	80	1
6365	0014	San José	20.582659	-89.212787000000006	80	1
6366	0028	Xixil	20.525760999999999	-89.320448999999996	80	1
6367	0030	Yaxic	20.538330999999999	-89.227732000000003	80	1
6368	0032	Jerusalén	20.516926999999999	-89.332661000000002	80	1
6369	0034	Tzekelá	20.576257999999999	-89.353441000000004	80	1
6370	0036	Silil	20.596235	-89.322398000000007	80	1
6371	0037	Chac Luum	20.523506000000001	-89.212524999999999	80	1
6372	0040	Benito Juárez	20.552306999999999	-89.362301000000002	80	1
6373	0041	Chacsuy	20.579993000000002	-89.244017999999997	80	1
6374	0044	Kancabdzonot	20.589783000000001	-89.172524999999993	80	1
6375	0045	Kankirixché	20.531938	-89.355564000000001	80	1
6376	0046	San José Kinchahau	20.545037000000001	-89.337998999999996	80	1
6377	0047	Hopolá	20.520593000000002	-89.308059	80	1
6378	0048	San Antonio Panabchén	20.542566000000001	-89.359538999999998	80	1
6379	0049	Susulá	20.610323000000001	-89.249250000000004	80	1
6380	0050	Susulá	20.541126999999999	-89.362378000000007	80	1
6381	0052	San Antonio Xpip	20.561347999999999	-89.360186999999996	80	1
6382	0054	San Juan	20.569206000000001	-89.386399999999995	80	1
6383	0057	San Rafael Ucum	20.502469000000001	-89.307612000000006	80	1
6384	0058	Santa Rosa	20.537928999999998	-89.239273999999995	80	1
6385	0059	Santa Teresa	20.576259	-89.255437000000001	80	1
6386	0060	Timul	20.593354999999999	-89.356048999999999	80	1
6387	0062	Cabichén [Unidad Porcícola]	20.535405000000001	-89.306749999999994	80	1
6388	0063	Yay-Ol	20.581471000000001	-89.233305999999999	80	1
6389	0065	San Antonio Uno	20.551235999999999	-89.376441	80	1
6390	0068	San Austerio	20.539095	-89.242628999999994	80	1
6391	0072	Chac-Teylá	20.545711000000001	-89.368713	80	1
6392	0073	Chunche-Já	20.554666000000001	-89.374358000000001	80	1
6393	0076	Holchén	20.535318	-89.224872000000005	80	1
6394	0077	Homola de los Reyes	20.582494000000001	-89.280016000000003	80	1
6395	0078	San José Kó	20.529461999999999	-89.197464999999994	80	1
6396	0080	Kankabdzonot	20.579298000000001	-89.288334000000006	80	1
6397	0082	Kum Luum	20.530995000000001	-89.221080000000001	80	1
6398	0083	Kum-Aak	20.528758	-89.242239999999995	80	1
6399	0084	Kumul	20.554452999999999	-89.217776999999998	80	1
6400	0085	San Luis	20.54401	-89.361867000000004	80	1
6401	0087	San Pedro Xpacay	20.539103000000001	-89.365155999999999	80	1
6402	0088	Santa Rosa	20.548821	-89.221147999999999	80	1
6403	0089	Sacalum	20.545369000000001	-89.225604000000004	80	1
6404	0091	San Martín	20.544452	-89.360512999999997	80	1
6405	0098	San José	20.533508999999999	-89.187236999999996	80	1
6406	0099	San Víctor	20.528592	-89.220900999999998	80	1
6407	0100	San Antonio	20.534621999999999	-89.230840000000001	80	1
6408	0101	Sahcabá	20.587972000000001	-89.159632000000002	80	1
6409	0102	La Dolorosa	20.541194999999998	-89.358975999999998	80	1
6410	0103	San Antonio Tecap	20.523513000000001	-89.374026999999998	80	1
6411	0104	San Gerónimo Telal	20.591619000000001	-89.155642	80	1
6412	0106	Santa Cruz Kuchacán	20.582263000000001	-89.326434000000006	80	1
6413	0107	Santiago	20.537683999999999	-89.233487999999994	80	1
6414	0109	Xay	20.531545000000001	-89.319087999999994	80	1
6415	0110	Chacsinicché	20.582865000000002	-89.170516000000006	80	1
6416	0111	Hualatún	20.568176000000001	-89.337513999999999	80	1
6417	0114	Chakil	20.543039	-89.243858000000003	80	1
6418	0115	San Leobardo	20.52177	-89.220270999999997	80	1
6419	0116	Chankax	20.580845	-89.299751999999998	80	1
6420	0117	Cucufato	20.537302	-89.343281000000005	80	1
6421	0118	Kopteylá	20.593844000000001	-89.227225000000004	80	1
6422	0119	San Francisco Saibe	20.544530000000002	-89.363491999999994	80	1
6423	0120	San Antonio Temozón	20.604810000000001	-89.237251000000001	80	1
6424	0121	San Antonio Xpujín	20.566647	-89.345909000000006	80	1
6425	0122	San Felipe	20.542743999999999	-89.365915999999999	80	1
6426	0123	San Ignacio	20.534548000000001	-89.282079999999993	80	1
6427	0124	San Isidro	20.563517999999998	-89.342293999999995	80	1
6428	0126	Suytunché	20.621808000000001	-89.242990000000006	80	1
6429	0128	Ninguno	20.541944000000001	-89.346389000000002	80	1
6430	0129	Ninguno	20.541015999999999	-89.347005999999993	80	1
6431	0130	Ninguno	20.539289	-89.347683000000004	80	1
6432	0131	Ninguno	20.538353000000001	-89.347330999999997	80	1
6433	0132	Ninguno	20.537058999999999	-89.347598000000005	80	1
6434	0133	Santa Estela	20.538785000000001	-89.239868000000001	80	1
6435	0134	San José Binakí	20.526730000000001	-89.333433999999997	80	1
6436	0135	Santo Domingo	20.534248999999999	-89.361975000000001	80	1
6437	0136	Sutupil	20.599305999999999	-89.207212999999996	80	1
6438	0001	Tekom	20.602225000000001	-88.264437999999998	81	1
6439	0002	Chibilub	20.437099	-88.393929999999997	81	1
6440	0003	Dzidzilché	20.492729000000001	-88.381028000000001	81	1
6441	0007	Santa Isabel	20.605318	-88.250844999999998	81	1
6442	0011	X-Cocmil	20.345551	-88.485731000000001	81	1
6443	0013	Pocbichén	20.462349	-88.481818000000004	81	1
6444	0014	Xuxcáb	20.447244999999999	-88.456483000000006	81	1
6445	0015	X-Habín	20.445993999999999	-88.427162999999993	81	1
6446	0020	Tzacal	20.52	-88.386388999999994	81	1
6447	0021	Chindzonot	20.515314	-88.419381999999999	81	1
6448	0022	Sucil	20.581083	-88.286797000000007	81	1
6449	0023	X-Koopchén	20.423055999999999	-88.432221999999996	81	1
6450	0027	Dzibiltunich	20.593907999999999	-88.271113999999997	81	1
6451	0029	Nohkancab	20.518839	-88.353814	81	1
6452	0030	San Andrés	20.605568999999999	-88.272448999999995	81	1
6453	0031	San Diego	20.583382	-88.322882000000007	81	1
6454	0033	San Francisco Nohkancab	20.610954	-88.256890999999996	81	1
6455	0035	San Pedro	20.531317000000001	-88.351785000000007	81	1
6456	0041	Tzucyá	20.543665000000001	-88.353949	81	1
6457	0042	X-Tohil	20.538611	-88.368333000000007	81	1
6458	0046	San Martín	20.501550000000002	-88.360552999999996	81	1
6459	0047	San Antonio	20.510833000000002	-88.347499999999997	81	1
6460	0048	Ekal	20.531641	-88.336222000000006	81	1
6461	0049	Hermanos Batún	20.583561	-88.254365000000007	81	1
6462	0050	San Francisco	20.611999999999998	-88.252247999999994	81	1
6463	0052	Blanca Flor	20.526281999999998	-88.342699999999994	81	1
6464	0053	San Felipe	20.536051	-88.347373000000005	81	1
6465	0054	Yaxcacab	20.486667000000001	-88.373610999999997	81	1
6466	0055	La Esperanza	20.601997000000001	-88.271878000000001	81	1
6467	0057	Pozo Nuevo	20.552102000000001	-88.342125999999993	81	1
6468	0058	San Cristóbal	20.556356000000001	-88.351293999999996	81	1
6469	0059	San Francisco Koopchén	20.586074	-88.302009999999996	81	1
6470	0060	Tres Magueyes	20.586212	-88.336912999999996	81	1
6471	0061	Chan Pich	20.535384000000001	-88.337610999999995	81	1
6472	0063	San Francisco	20.532779999999999	-88.336363000000006	81	1
6473	0064	San Marcos	20.525496	-88.345747000000003	81	1
6474	0065	Los Cedros	20.601436	-88.271033000000003	81	1
6475	0001	Telchac	21.203348999999999	-89.271266999999995	82	1
6476	0002	Jesús María	21.229899	-89.264636999999993	82	1
6477	0007	San Juan	21.208693	-89.245911000000007	82	1
6478	0008	Santa Rosa	21.194412	-89.265067000000002	82	1
6479	0009	Santa Teresa	21.225631	-89.251206999999994	82	1
6480	0011	Santa Cruz	21.196586	-89.258189999999999	82	1
6481	0013	San Roque	21.256681	-89.257846000000001	82	1
6482	0017	Xmahas	21.182362000000001	-89.266701999999995	82	1
6483	0019	Santa Lucía	21.175433000000002	-89.274855000000002	82	1
6484	0023	Xlah Sitio	21.224102999999999	-89.243791999999999	82	1
6485	0026	San Miguel	21.206073	-89.285589000000002	82	1
6486	0027	Agua Potable [Bomba]	21.189648999999999	-89.274079	82	1
6487	0028	Yum Kaax	21.177187	-89.275796999999997	82	1
6488	0029	San Alfonso	21.180309999999999	-89.274535999999998	82	1
6489	0032	San José	21.175194999999999	-89.274721	82	1
6490	0033	Las Misisipi	21.173349000000002	-89.275982999999997	82	1
6491	0034	Carmita	21.176563000000002	-89.279692999999995	82	1
6492	0035	San Isidro	21.174956999999999	-89.279263999999998	82	1
6493	0036	José María Morelos	21.173345000000001	-89.275294000000002	82	1
6494	0037	La Quinta	21.212664	-89.271454000000006	82	1
6495	0038	Santa Rosa	21.204494	-89.283778999999996	82	1
6496	0040	San José	21.190894	-89.273807000000005	82	1
6497	0041	Tumben Paak	21.181325999999999	-89.279458000000005	82	1
6498	0042	Los Cascabeles	21.191171000000001	-89.276534999999996	82	1
6499	0043	Ninguno	21.214455999999998	-89.267919000000006	82	1
6500	0044	Asunción Iuit	21.181546000000001	-89.277343000000002	82	1
6501	0046	San Juan Dos [Cítricos]	21.206426	-89.252525000000006	82	1
6502	0047	Los Laureles	21.173964999999999	-89.286198999999996	82	1
6503	0048	Lupita	21.207204000000001	-89.252909000000002	82	1
6504	0049	Telchac [Materiales]	21.222221000000001	-89.270565000000005	82	1
6505	0050	Telchac [Rastro Municipal]	21.184553999999999	-89.274687999999998	82	1
6506	0051	Santa Fe	21.211721000000001	-89.263486999999998	82	1
6507	0053	Victoria	21.177305	-89.270492000000004	82	1
6508	0054	La Lupita	21.249908999999999	-89.246707000000001	82	1
6509	0055	Guadalupe Vázquez	21.189473	-89.274006999999997	82	1
6510	0056	Avelino Azcorra	21.188489000000001	-89.274208000000002	82	1
6511	0057	Asociación Local Ganadera	21.187083000000001	-89.274392000000006	82	1
6512	0058	Ninguno	21.186823	-89.274585000000002	82	1
6513	0059	Chato Martín	21.181788999999998	-89.276538000000002	82	1
6514	0060	Asunción Iuit	21.182248999999999	-89.277728999999994	82	1
6515	0062	El Orégano [Rancho]	21.218966000000002	-89.255054000000001	82	1
6516	0063	Pabellón San Juan	21.209347999999999	-89.245113000000003	82	1
6517	0064	Pedro Ake Caamal	21.175169	-89.275470999999996	82	1
6518	0065	San Pedro	21.213585999999999	-89.235202999999998	82	1
6519	0001	Telchac Puerto	21.343004000000001	-89.264224999999996	83	1
6520	0004	El Zapote Dos	21.306252000000001	-89.259608999999998	83	1
6521	0005	San Antonio	21.311914999999999	-89.227585000000005	83	1
6522	0006	San Antonio Tzékel	21.288900000000002	-89.298392000000007	83	1
6523	0007	San Buenaventura	21.281448999999999	-89.288041000000007	83	1
6524	0010	Esperanza	21.308914000000001	-89.264015000000001	83	1
6525	0011	X-Paclán	21.317710999999999	-89.236697000000007	83	1
6526	0012	Mayan Beach [Hotel]	21.337615	-89.318898000000004	83	1
6527	0013	Esperanza	21.299275000000002	-89.265465000000006	83	1
6528	0018	San José Boxactún	21.279461000000001	-89.258189000000002	83	1
6529	0019	Santa María	21.316713	-89.250455000000002	83	1
6530	0020	El Zapote Uno	21.306601000000001	-89.24427	83	1
6531	0024	San Felipe	21.312062000000001	-89.264561999999998	83	1
6532	0025	Santa Isabel	21.318449999999999	-89.286457999999996	83	1
6533	0026	Telchac Puerto [Basurero Municipal]	21.328388	-89.261132000000003	83	1
6534	0028	San Roque	21.322120000000002	-89.262681999999998	83	1
6535	0029	Los Samueles	21.320273	-89.263234999999995	83	1
6536	0030	San Pedro	21.319239	-89.262551000000002	83	1
6537	0031	Los Limones	21.317778000000001	-89.262562000000003	83	1
6538	0032	Ninguno	21.317730000000001	-89.252640999999997	83	1
6539	0033	La Guadalupe	21.314582000000001	-89.263683999999998	83	1
6540	0034	Ninguno	21.308123999999999	-89.263940000000005	83	1
6541	0035	San Isidro	21.317419000000001	-89.237844999999993	83	1
6542	0036	El Milagro de Dios [Taller]	21.312913000000002	-89.262112000000002	83	1
6543	0037	Flamingo [Condominios]	21.282655999999999	-89.318372999999994	83	1
6544	0038	Montecristo [Inmobiliaria Hotelera]	21.337778	-89.315832999999998	83	1
6545	0001	Temax	21.151841000000001	-88.938633999999993	84	1
6546	0002	Cauaca	21.156828999999998	-89.009152	84	1
6547	0003	Chenché de las Torres	21.131015999999999	-88.98133	84	1
6548	0004	Chucmichén	21.229593999999999	-88.923186000000001	84	1
6549	0005	San Antonio Cámara	21.180064000000002	-88.859667999999999	84	1
6550	0006	San Dimas	21.110571	-88.927299000000005	84	1
6551	0008	San Luis	21.159374	-88.922595000000001	84	1
6552	0011	Balché	21.080023000000001	-88.93074	84	1
6553	0012	Balixché	21.155280000000001	-88.974726000000004	84	1
6554	0014	Carolina	21.076430999999999	-88.966566	84	1
6555	0015	Celaya	21.137048	-88.908417	84	1
6556	0016	San José	21.150172999999999	-88.823205000000002	84	1
6557	0019	Chonkil	21.16733	-88.824487000000005	84	1
6558	0020	San Manuel	21.114739	-88.943787	84	1
6559	0024	Diez Mil	21.279629	-88.812555000000003	84	1
6560	0026	La Herradura	21.273713999999998	-88.860332	84	1
6561	0027	X-Kábil	21.179469000000001	-88.938148999999996	84	1
6562	0030	El Dorado	21.185272000000001	-88.836943000000005	84	1
6563	0033	Pichichén	21.13533	-88.918218999999993	84	1
6564	0034	Sambulá	21.079491999999998	-88.948136000000005	84	1
6565	0035	Santiago	21.145299999999999	-88.929484000000002	84	1
6566	0036	Sisbic	21.109763999999998	-88.730545000000006	84	1
6567	0037	Sucopó	21.175663	-88.833479999999994	84	1
6568	0038	Sucuná	21.122406999999999	-88.780997999999997	84	1
6569	0039	Chan Antonio Acosta	21.206792	-88.856138000000001	84	1
6570	0040	San Benito Juárez	21.260738	-88.846715000000003	84	1
6571	0042	San Carlos	21.177247000000001	-88.966279999999998	84	1
6572	0043	San Felipe	21.199058000000001	-88.840003999999993	84	1
6573	0047	San Ignacio	21.260021999999999	-88.818244000000007	84	1
6574	0048	San José	21.161937000000002	-88.889910999999998	84	1
6575	0051	San Lorenzo	21.180425	-88.905373999999995	84	1
6576	0052	San Luis Castellanos	21.133300999999999	-88.947896999999998	84	1
6577	0054	Candelaria	21.105636000000001	-88.944293999999999	84	1
6578	0055	Santa Cruz	21.160060000000001	-88.879428000000004	84	1
6579	0057	San Pedro	21.216231000000001	-88.901931000000005	84	1
6580	0059	Santa Rita	21.154029000000001	-88.957773000000003	84	1
6581	0060	Santa Rosa	21.175753	-88.911287000000002	84	1
6582	0065	El Tajo	21.153168000000001	-88.922343999999995	84	1
6583	0066	X-Bajá	21.198270000000001	-88.849725000000007	84	1
6584	0067	Xpambihá	21.176051000000001	-88.973388999999997	84	1
6585	0068	X-Bohom	21.176016000000001	-88.897402999999997	84	1
6586	0071	Shan-Grila	21.216159000000001	-88.833879999999994	84	1
6587	0072	Santa Cruz	21.146754000000001	-88.925327999999993	84	1
6588	0073	Laurel	21.250546	-88.837554999999995	84	1
6589	0074	Santa María de Guadalupe	21.175428	-88.887913999999995	84	1
6590	0075	San Nicolás	21.184208999999999	-88.902887000000007	84	1
6591	0081	Chunchechén	21.153517999999998	-88.868146999999993	84	1
6592	0082	Crespo	21.131160999999999	-88.927233000000001	84	1
6593	0083	La Guadalupe	21.079677	-88.933349000000007	84	1
6594	0084	Hobondzó	21.160129999999999	-88.921448999999996	84	1
6595	0086	El Naranjo	21.182328999999999	-88.875067999999999	84	1
6596	0087	Noria	21.156071000000001	-88.897087999999997	84	1
6597	0088	San Ignacio	21.178377999999999	-88.937973999999997	84	1
6598	0089	San Juan	21.104413999999998	-88.905629000000005	84	1
6599	0090	San Manuel	21.123277999999999	-88.786063999999996	84	1
6600	0091	San Pedro	21.089873000000001	-88.900594999999996	84	1
6601	0093	Santa Isabel	21.118220999999998	-88.949256000000005	84	1
6602	0094	Santa Isabel Dos	21.176428000000001	-88.891678999999996	84	1
6603	0095	San Eduardo	21.186306999999999	-88.889425000000003	84	1
6604	0097	Manuel Campos	21.158248	-89.001003999999995	84	1
6605	0098	Tejón	21.171188999999998	-88.919529999999995	84	1
6606	0099	San Alberto	21.164833999999999	-88.911091999999996	84	1
6607	0100	Buu Kaax	21.21528	-88.932454000000007	84	1
6608	0104	Andrés Esquivel	21.134512000000001	-88.938856000000001	84	1
6609	0105	Boox Toro	21.199752	-88.932919999999996	84	1
6610	0106	Herradura Dos	21.265713000000002	-88.868786999999998	84	1
6611	0108	San Miguel [Rancho]	21.143035999999999	-88.925336999999999	84	1
6612	0111	Nuevo San Isidro	21.171026000000001	-88.909267999999997	84	1
6613	0112	San Diego	21.176663999999999	-88.961196000000001	84	1
6614	0113	San Isidro	21.143348	-88.915706	84	1
6615	0114	San José	21.148575999999998	-88.928021000000001	84	1
6616	0115	San Martin Caballero [Rancho]	21.079312000000002	-88.943630999999996	84	1
6617	0116	San Pedro	21.136223999999999	-88.935777999999999	84	1
6618	0117	Temax Vegetales	21.166056000000001	-88.939862000000005	84	1
6619	0118	Zozaya	21.150320000000001	-88.957419000000002	84	1
6620	0119	Buenavista	21.138489	-88.800568999999996	84	1
6621	0120	Kaytel	21.144953000000001	-88.802913000000004	84	1
6622	0121	Vicente Cel	21.168036000000001	-88.954531000000003	84	1
6623	0122	Manuel Campos	21.156872	-88.998568000000006	84	1
6624	0124	Los Laureles	21.204239000000001	-88.938507999999999	84	1
6625	0125	Los Negros	21.088346000000001	-88.941340999999994	84	1
6626	0126	Las Palmas	21.159683999999999	-88.942330999999996	84	1
6627	0127	Santo Domingo	21.186751000000001	-88.909980000000004	84	1
6628	0128	Conchi Gamboa	21.147366999999999	-88.929678999999993	84	1
6629	0129	Temax [Asociación Ganadera]	21.134838999999999	-88.938367	84	1
6630	0131	San Martín	21.170577999999999	-88.883414999999999	84	1
6631	0132	Chactún Puhuy	21.077531	-88.757020999999995	84	1
6632	0133	Chenkú	21.099287	-88.761342999999997	84	1
6633	0001	Temozón	20.80368	-88.201158000000007	85	1
6634	0002	Actuncoh	20.916311	-88.112577999999999	85	1
6635	0004	Bono	20.882563000000001	-87.993680999999995	85	1
6636	0011	Chacxibitún	20.879092	-88.196866999999997	85	1
6637	0013	Chelem	20.819741	-88.239902000000001	85	1
6638	0016	Dzalbay	20.834797999999999	-88.053158999999994	85	1
6639	0017	Dzibinoh	20.999441999999998	-87.960686999999993	85	1
6640	0019	Florida	20.834243000000001	-88.063143999999994	85	1
6641	0021	Hunukú	20.851845000000001	-88.090575999999999	85	1
6642	0024	X-Kanchechén	20.884537000000002	-88.018620999999996	85	1
6643	0025	Kantó	20.903334000000001	-88.116297000000003	85	1
6644	0030	Nahbalam	20.935442999999999	-88.008891000000006	85	1
6645	0031	Las Palomitas	20.823685000000001	-88.054103999999995	85	1
6646	0032	Sacabchén	20.947763999999999	-88.051276000000001	85	1
6647	0033	Sac Boc	20.947255999999999	-88.010439000000005	85	1
6648	0036	San Andrés	20.954021000000001	-87.906589999999994	85	1
6649	0041	San Francisco	20.795921	-88.227829999999997	85	1
6650	0043	San Isidro Tzamá	20.866399000000001	-88.231942000000004	85	1
6651	0055	Santa María	20.965727999999999	-87.985934999999998	85	1
6652	0057	Santa Rita	20.861294000000001	-88.145953000000006	85	1
6653	0068	X-Kátil	20.836632999999999	-88.247122000000005	85	1
6654	0074	X-Eb	20.922941000000002	-88.235371999999998	85	1
6655	0094	X'Tut	20.866788	-87.965610999999996	85	1
6656	0095	X-Uch	20.805330000000001	-88.135986000000003	85	1
6657	0096	Yodzil	20.920041999999999	-88.183047999999999	85	1
6658	0104	Yokdzonot	20.862784000000001	-88.063001999999997	85	1
6659	0105	Yokdzonot Box	20.902048000000001	-88.172381000000001	85	1
6660	0111	Kuxeb	20.840498	-88.116518999999997	85	1
6661	0112	X-Tuyuc	20.856624	-88.125873999999996	85	1
6662	0114	Santa Clara	20.783266000000001	-88.192289000000002	85	1
6663	0115	Tusik	20.792283000000001	-88.134635000000003	85	1
6664	0118	San Basilio	20.805288000000001	-88.141221999999999	85	1
6665	0130	Nenelá 2	20.802102999999999	-88.139212999999998	85	1
6666	0147	Santa Cruz	20.814074000000002	-88.237914000000004	85	1
6667	0152	X Chayil	20.907762999999999	-88.084366000000003	85	1
6668	0158	Chan Kopal	20.963754000000002	-88.029364999999999	85	1
6669	0159	San Antonio	20.858992000000001	-88.103581000000005	85	1
6670	0164	Yoohahua	20.871613	-88.071150000000003	85	1
6671	0173	San Isidro	20.819711000000002	-88.192223999999996	85	1
6672	0177	Cana Cruz	20.872584	-88.187916999999999	85	1
6673	0178	Ekbalam	20.892081999999998	-88.145764	85	1
6674	0181	Kambul	20.85867	-88.193623000000002	85	1
6675	0182	San Francisco	20.893214	-88.196104000000005	85	1
6676	0183	Kancabchén	20.896187999999999	-88.197709000000003	85	1
6677	0192	Chen Chayote	20.989788000000001	-87.961456999999996	85	1
6678	0197	X-Tohil	20.828914000000001	-88.111519000000001	85	1
6679	0203	San Andrés	20.841048000000001	-88.144445000000005	85	1
6680	0208	Kantó	20.903483999999999	-88.183306000000002	85	1
6681	0211	San Mateo	20.994102999999999	-87.947091999999998	85	1
6682	0212	X-Cen	20.971091999999999	-88.009105000000005	85	1
6683	0214	X-Tut	20.976054000000001	-87.979881000000006	85	1
6684	0216	San Pedro Dos	20.826878000000001	-88.253632999999994	85	1
6685	0223	Toh Chaltún	20.848419	-88.213946000000007	85	1
6686	0227	Balam Dzul	20.920237	-88.066597999999999	85	1
6687	0228	Bohchén	20.988254999999999	-87.969305000000006	85	1
6688	0229	Cehbalam	20.916598	-87.931858000000005	85	1
6689	0231	Chankom	20.819827	-88.262772999999996	85	1
6690	0233	Chan Santa Clara	20.788077000000001	-88.203023000000002	85	1
6691	0234	Chan X-Pich	20.921807999999999	-88.047903000000005	85	1
6692	0239	X'copoil	20.792786	-88.227783000000002	85	1
6693	0243	Santa María Kambul	20.861659	-88.192352999999997	85	1
6694	0244	Kaycahum	20.903984999999999	-88.046172999999996	85	1
6695	0247	Poop	20.882798999999999	-87.924879000000004	85	1
6696	0248	Los Rosales	20.813374	-88.128343999999998	85	1
6697	0249	San Isidro Kibix	20.862658	-88.283507999999998	85	1
6698	0251	San Antonio	20.883762000000001	-88.186285999999996	85	1
6699	0256	San Nemesio	20.971219000000001	-88.036686000000003	85	1
6700	0257	San José	20.836542999999999	-88.051708000000005	85	1
6701	0259	San José	20.879019	-88.075894000000005	85	1
6702	0260	San José Gil	20.971314	-87.910244000000006	85	1
6703	0262	San Miguel	20.946290999999999	-88.046420999999995	85	1
6704	0266	Santa Clara	20.861733999999998	-88.099310000000003	85	1
6705	0270	Susulá	20.832118999999999	-88.193201000000002	85	1
6706	0273	X-Canchic	20.850023	-88.103977999999998	85	1
6707	0274	X-Ché	20.796505	-88.106369000000001	85	1
6708	0281	Yaxleb	20.908024000000001	-88.217150000000004	85	1
6709	0282	Yokdzonot Sac-Baquecan	20.954381999999999	-88.153265000000005	85	1
6710	0283	Yuyumal	20.921661	-88.039421000000004	85	1
6711	0285	Yokdzonot Presentado	20.940794	-87.858596000000006	85	1
6712	0286	Kalaxán	20.866018	-88.087858999999995	85	1
6713	0290	X-Kalaxán	20.86243	-88.115605000000002	85	1
6714	0293	Acabchén	20.972823000000002	-87.966150999999996	85	1
6715	0295	San Juan Kibix (Santa Rosa)	20.854813	-88.274061000000003	85	1
6716	0297	Xnoh-Butún	20.826203	-88.116883999999999	85	1
6717	0298	Dzidzilché	20.848559000000002	-88.058571999999998	85	1
6718	0299	Hubikú	20.819004	-88.172060000000002	85	1
6719	0300	Yaxché	20.811861	-88.208346000000006	85	1
6720	0303	San Manuel	20.822735999999999	-88.190847000000005	85	1
6721	0305	San Isidro	20.903426	-88.231984999999995	85	1
6722	0311	Los Laureles	20.802623000000001	-88.167845	85	1
6723	0313	Embudo	20.966145000000001	-87.939187000000004	85	1
6724	0316	San Francisco	20.797160999999999	-88.142658999999995	85	1
6725	0319	Xuilub	20.797340999999999	-88.144447999999997	85	1
6726	0321	Yookop	20.789491000000002	-88.142534999999995	85	1
6727	0322	Kankab Lu'um	20.790116999999999	-88.134214999999998	85	1
6728	0323	San Máximo	20.789515999999999	-88.124381999999997	85	1
6729	0326	San José	20.792860999999998	-88.108801	85	1
6730	0327	Yax-On	20.807103000000001	-88.154858000000004	85	1
6731	0328	Halachó	20.833763999999999	-88.135855000000006	85	1
6732	0329	San José X-Pop Dos	20.852813000000001	-88.107140000000001	85	1
6733	0331	Xicinchá	20.864915	-88.256685000000004	85	1
6734	0333	Holpat	20.882988000000001	-88.170788000000002	85	1
6735	0335	Chac-Och	20.869516000000001	-88.192689000000001	85	1
6736	0336	San Diego	20.845682	-88.216424000000004	85	1
6737	0337	Chacteil Tres	20.830074	-88.182507999999999	85	1
6738	0338	Sahcab Tunich	20.831506999999998	-88.187135999999995	85	1
6739	0341	Santa María	20.848112	-88.019424000000001	85	1
6740	0346	X-Popol	20.875568999999999	-87.911992999999995	85	1
6741	0347	Poxil	20.874184	-87.921306000000001	85	1
6742	0348	X-Puhuy	20.888757999999999	-88.078312999999994	85	1
6743	0351	San Isidro X-Haas	20.921714000000001	-88.077319000000003	85	1
6744	0352	San Isidro X-Katil	20.830718999999998	-88.221525999999997	85	1
6745	0358	San Lorenzo	20.818356000000001	-88.118960000000001	85	1
6746	0359	Bolno	20.838391000000001	-88.102164999999999	85	1
6747	0362	Chan Dzonot	20.946650000000002	-87.821772999999993	85	1
6748	0363	San Isidro Kancabchén	20.888967000000001	-88.006820000000005	85	1
6749	0364	San Isidro	20.798192	-88.158293	85	1
6750	0366	Sosquil Chac	20.879145999999999	-88.186672999999999	85	1
6751	0367	San Carlos	20.832688999999998	-88.188017000000002	85	1
6752	0370	Chan San José	20.857250000000001	-88.256275000000002	85	1
6753	0372	Chan X-Katil	20.82883	-88.221773999999996	85	1
6754	0373	Xmactún	20.864753	-88.245805000000004	85	1
6755	0374	Chan Yohdzonot Uno	20.838479	-88.059673000000004	85	1
6756	0375	Chun Naranja	20.788872999999999	-88.146305999999996	85	1
6757	0377	Ekbalam	20.890682999999999	-88.136047000000005	85	1
6758	0378	Kana Dzonot	20.832269	-88.062152999999995	85	1
6759	0379	Kanlum	20.805425	-88.154014000000004	85	1
6760	0380	Kuncheil	20.785999	-88.182142999999996	85	1
6761	0382	Nenela Uno	20.805804999999999	-88.130870999999999	85	1
6762	0383	Ocencab	20.789542999999998	-88.168685999999994	85	1
6763	0384	Petac	20.831882	-88.224915999999993	85	1
6764	0385	Potol	20.837914999999999	-88.095023999999995	85	1
6765	0387	San Francisco	20.87631	-88.225184999999996	85	1
6766	0388	San Francisco	20.86814	-88.089089999999999	85	1
6767	0389	San Gregorio	20.819344000000001	-88.116448000000005	85	1
6768	0390	San José	20.959154000000002	-87.865108000000006	85	1
6769	0391	San Ramón	20.862006000000001	-88.155305999999996	85	1
6770	0395	Chan Santa Rita	20.853391999999999	-88.166244000000006	85	1
6771	0396	San Martín	20.892340000000001	-88.193690000000004	85	1
6772	0397	Villa Guadalupe	20.803402999999999	-88.147536000000002	85	1
6773	0399	X-Cail	20.859157	-88.027753000000004	85	1
6774	0400	X-Cail Dos	20.856390999999999	-88.0381	85	1
6775	0401	X-Hualtés	20.897031999999999	-88.082294000000005	85	1
6776	0402	San Antonio X-Huo Dos	20.865285	-88.099733999999998	85	1
6777	0403	X-Kanahaltún	20.782482999999999	-88.170641000000003	85	1
6778	0405	Xcehil	20.959596000000001	-88.012523999999999	85	1
6779	0406	Xchaquil	20.786731	-88.170197000000002	85	1
6780	0407	Yal Xan	20.815178	-88.141576999999998	85	1
6781	0408	Yohpiña	20.979172999999999	-87.975660000000005	85	1
6782	0410	Emiliano Zapata	20.896844000000002	-88.146145000000004	85	1
6783	0411	Kalaxán Uno	20.861825	-88.091003000000001	85	1
6784	0412	Kantubichén	20.842271	-88.078269000000006	85	1
6785	0413	Kaxek y Patux	20.882597000000001	-88.000592999999995	85	1
6786	0415	San Isidro	20.868238999999999	-88.081209000000001	85	1
6787	0418	Sinicché	20.833504000000001	-88.174104	85	1
6788	0420	San Miguel	20.843254999999999	-88.238354000000001	85	1
6789	0421	Yokdzonot	20.848921000000001	-88.131156000000004	85	1
6790	0422	El Carajo	20.803159000000001	-88.137393000000003	85	1
6791	0424	Yokdzonot	20.882552	-87.999775	85	1
6792	0426	La Guadalupana	20.827224000000001	-88.053516000000002	85	1
6793	0428	Poop	20.869992	-87.962524000000002	85	1
6794	0429	San Antonio Uno	20.856241000000001	-88.101079999999996	85	1
6795	0430	San Felipe	20.858847000000001	-88.095489999999998	85	1
6796	0431	Chendzonot	20.943563000000001	-88.189077999999995	85	1
6797	0434	Cuauhtémoc [Escuela Primaria]	20.842528000000001	-88.254497999999998	85	1
6798	0435	Kamxla	20.854158000000002	-88.192231000000007	85	1
6799	0436	Xcanacruz	20.866524999999999	-88.179304000000002	85	1
6800	0437	Ana Chablé	20.871272000000001	-88.175777999999994	85	1
6801	0438	Gastón Alegre	20.868987000000001	-88.187612999999999	85	1
6802	0439	Los Compadres	20.819002000000001	-88.214251000000004	85	1
6803	0440	San Marcos	20.801189000000001	-88.185973000000004	85	1
6804	0441	El Paraíso	20.839348000000001	-88.175450999999995	85	1
6805	0442	San Antonio	20.904845000000002	-88.190917999999996	85	1
6806	0443	Yokdzadz	20.901306000000002	-88.203846999999996	85	1
6807	0445	San Martín	20.845552000000001	-88.210773000000003	85	1
6808	0446	Génesis Dos	20.880139	-88.177420999999995	85	1
6809	0447	San Manuel	20.799489000000001	-88.232264000000001	85	1
6810	0448	San Miguel	20.828319	-88.189402999999999	85	1
6811	0449	San Román	20.917117999999999	-88.230134000000007	85	1
6812	0450	Santa Rosa	20.879141000000001	-88.189120000000003	85	1
6813	0451	San Vicente	20.788381999999999	-88.235911000000002	85	1
6814	0452	Xcanacruz	20.864543999999999	-88.185344999999998	85	1
6815	0454	Cenote Azul	20.992864000000001	-87.909548999999998	85	1
6816	0455	Lundzonot	20.963594000000001	-87.922578000000001	85	1
6817	0456	Nahbalam	20.946725000000001	-87.992793000000006	85	1
6818	0457	Rancho Gil	20.990770999999999	-87.925319000000002	85	1
6819	0458	San Carlos	20.933997000000002	-87.961264999999997	85	1
6820	0459	San José Cehbalam	20.925720999999999	-87.932131999999996	85	1
6821	0460	San Martín	20.941528999999999	-87.945982999999998	85	1
6822	0461	Santa Elena	20.891162999999999	-87.985765000000001	85	1
6823	0462	Ninguno	20.947673999999999	-87.940646999999998	85	1
6824	0463	Ninguno	20.938056	-87.905000000000001	85	1
6825	0464	Chunhuás	20.920522999999999	-88.204538999999997	85	1
6826	0465	Las Tres Cruces	20.894607000000001	-88.184472999999997	85	1
6827	0466	Ninguno	20.799968	-88.212590000000006	85	1
6828	0469	San Pedro Tzec	20.828426	-88.137736000000004	85	1
6829	0470	Unajil Ekbalam	20.892876999999999	-88.141884000000005	85	1
6830	0471	Villa de Guadalupe	20.915248999999999	-88.182766999999998	85	1
6831	0472	Xchamak	20.867647999999999	-88.278847999999996	85	1
6832	0473	San Juan Dohbichén	20.813102000000001	-88.144101000000006	85	1
6833	0474	Guadalupe [Parcela]	20.910881	-88.187934999999996	85	1
6834	0475	Tzimin Tunich	20.875885	-88.264120000000005	85	1
6835	0476	La Guadalupana	20.834712	-88.187802000000005	85	1
6836	0477	El Jaguar	20.818826999999999	-88.211804999999998	85	1
6837	0478	Tzecú	20.813352999999999	-88.225121999999999	85	1
6838	0479	El Cocal (Don Chetito y Doña Lupita)	20.782713000000001	-88.203068000000002	85	1
6839	0480	Ixbalanque	20.873643999999999	-88.189471999999995	85	1
6840	0481	Las Patronas	20.843361000000002	-88.1751	85	1
6841	0482	San Martín Caballero	20.848341999999999	-88.188485999999997	85	1
6842	0483	San Pedro	20.814397	-88.191963999999999	85	1
6843	0484	Santiaguito	20.824787000000001	-88.206430999999995	85	1
6844	0485	Uh Najil Yum Kin	20.873805999999998	-88.152788999999999	85	1
6845	0486	X-Copoil	20.838844000000002	-88.166008000000005	85	1
6846	0487	Xpich	20.803329999999999	-88.215740999999994	85	1
6847	0488	Xtabay-Kan	20.858533999999999	-88.168559000000002	85	1
6848	0489	Chono Novelo	20.839811000000001	-88.150471999999993	85	1
6849	0490	Kuxché	20.797727999999999	-88.126285999999993	85	1
6850	0491	Oksaj Kisín	20.818539999999999	-88.205862999999994	85	1
6851	0492	La Reverenda	20.783871999999999	-88.203794000000002	85	1
6852	0493	San Antonio	20.808710999999999	-88.143139000000005	85	1
6853	0494	San Antonio la Mal Querida	20.802267000000001	-88.172955999999999	85	1
6854	0495	San Isidro	20.817716999999998	-88.123497	85	1
6855	0496	San Marcos 2	20.802667	-88.186341999999996	85	1
6856	0497	San Román	20.825433	-88.150850000000005	85	1
6857	0498	San Salvador	20.795006000000001	-88.161952999999997	85	1
6858	0499	La Sombra	20.816414000000002	-88.255983000000001	85	1
6859	0500	Tanaaji	20.839680999999999	-88.107930999999994	85	1
6860	0501	Temozón [Parador Turístico]	20.787438999999999	-88.202332999999996	85	1
6861	0502	Uaymil	20.807611000000001	-88.126155999999995	85	1
6862	0503	X-Kotil	20.815041999999998	-88.156869	85	1
6863	0504	X-Nucbaas	20.795224999999999	-88.122533000000004	85	1
6864	0505	Yokdzonot	20.843063999999998	-88.092517000000001	85	1
6865	0506	Yóo Kóop	20.811727999999999	-88.155781000000005	85	1
6866	0001	Tepakán	21.049334000000002	-89.039411999999999	86	1
6867	0002	Kantirix	21.031075999999999	-89.030792000000005	86	1
6868	0003	Poccheiná	21.069413999999998	-88.985759000000002	86	1
6869	0004	Sahcatzín	21.03464	-89.043182999999999	86	1
6870	0007	Las Potrancas	21.053868000000001	-89.032663999999997	86	1
6871	0009	Tzalancab	21.023074000000001	-89.024721	86	1
6872	0012	San Antonio	21.095818000000001	-89.020424000000006	86	1
6873	0013	Cruz Ché	21.058574	-89.008776999999995	86	1
6874	0016	San Román	21.071981999999998	-89.021054000000007	86	1
6875	0021	Kanán	21.063110999999999	-89.009208999999998	86	1
6876	0022	Oasis	21.067191999999999	-89.031739000000002	86	1
6877	0027	Álvaro Obregón	21.048472	-89.047961000000001	86	1
6878	0028	Kekén	21.026854	-89.013676000000004	86	1
6879	0029	Guadalupe	21.076369	-89.025144999999995	86	1
6880	0030	Pixtal	21.072323999999998	-89.016328999999999	86	1
6881	0031	San Juan Escamilla	21.096426000000001	-89.002454999999998	86	1
6882	0035	San Felipe	21.055398	-89.040316000000004	86	1
6883	0036	San Rafael	21.093789999999998	-89.013298000000006	86	1
6884	0001	Tetiz	20.961912000000002	-89.933448999999996	87	1
6885	0002	Nohuayún	20.974719	-89.969038999999995	87	1
6886	0003	Las Bugambilias Tres	20.97747	-89.918120000000002	87	1
6887	0005	Xcoch-Jol	20.962548000000002	-90.140872999999999	87	1
6888	0007	El Ceibo	20.968012999999999	-89.958324000000005	87	1
6889	0008	Chan Jalal	20.965681	-90.088740000000001	87	1
6890	0009	Chen Ceballos	20.949746000000001	-90.057451999999998	87	1
6891	0014	Chic-Ché	20.966944999999999	-89.992915999999994	87	1
6892	0024	Lucecita Dos	20.976873000000001	-89.952209999999994	87	1
6893	0025	María de la Luz Uno	20.972901	-89.951937999999998	87	1
6894	0026	Los Castillo	20.973110999999999	-89.912929000000005	87	1
6895	0027	Mulsay	20.947293999999999	-89.936027999999993	87	1
6896	0030	Nohuayún	20.967977999999999	-89.946786000000003	87	1
6897	0032	Pa'kaal	20.982558000000001	-90.079363000000001	87	1
6898	0034	Rancho Nuevo	20.980214	-89.913787999999997	87	1
6899	0037	San Enrique Uno	20.975285	-89.913550999999998	87	1
6900	0052	San Antonio	20.948187999999998	-89.935094000000007	87	1
6901	0053	El Pescadito	20.981023	-89.913010999999997	87	1
6902	0056	Grupo Guadalupano	20.976877000000002	-89.918541000000005	87	1
6903	0057	Tetíz Postura	20.978881000000001	-89.919630999999995	87	1
6904	0059	San Luis	20.980315000000001	-89.914229000000006	87	1
6905	0064	Tetíz Crecimiento	20.951840000000001	-89.941722999999996	87	1
6906	0066	Santa Rita	20.986080999999999	-89.898409999999998	87	1
6907	0067	Lucecita Uno	20.976911999999999	-89.950085000000001	87	1
6908	0068	María de la Luz Dos	20.972102	-89.955761999999993	87	1
6909	0069	Paklam Balam	20.929475	-90.053004000000001	87	1
6910	0070	Pedregal	21.004923000000002	-89.985045999999997	87	1
6911	0071	San Enrique	20.974039000000001	-89.962590000000006	87	1
6912	0073	San Luis Pakam	20.949075000000001	-89.918824000000001	87	1
6913	0074	San Pascual	20.955518000000001	-90.047747000000001	87	1
6914	0075	San Rafael Abal	21.001290000000001	-89.941016000000005	87	1
6915	0076	Santa Cruz	20.979687999999999	-89.906644	87	1
6916	0077	San Isidro	20.975911	-89.916334000000006	87	1
6917	0079	Beatriz [Rancho]	20.982147000000001	-89.912799000000007	87	1
6918	0080	Santa Pilar	20.971074000000002	-89.916302999999999	87	1
6919	0081	San Martín de Porres	20.973438999999999	-89.921013000000002	87	1
6920	0083	Tetíz	20.956282999999999	-89.939385999999999	87	1
6921	0084	Polita	20.983927999999999	-89.909175000000005	87	1
6922	0085	San Manuel	20.977042000000001	-89.917499000000007	87	1
6923	0086	Tapatío	20.951656	-89.938789	87	1
6924	0087	Serapio Rendón [Telesecundaria]	20.972663000000001	-89.962288000000001	87	1
6925	0088	Tetiz [Basurero Municipal]	20.980243000000002	-89.909407999999999	87	1
6926	0089	La Bendición de Dios	20.973818000000001	-89.915036000000001	87	1
6927	0090	Díaz Ordaz	20.901668000000001	-89.994791000000006	87	1
6928	0001	Teya	21.048538000000001	-89.073708999999994	88	1
6929	0002	San Antonio Holcá	21.026088999999999	-89.058858999999998	88	1
6930	0003	Chenkú	21.082194999999999	-89.069411000000002	88	1
6931	0013	San Luis	21.075890999999999	-89.082134999999994	88	1
6932	0017	San Pedro	21.110154999999999	-89.047033999999996	88	1
6933	0021	Telal [UAIM]	21.030919000000001	-89.066491999999997	88	1
6934	0022	Zak Bok	21.120327	-89.036315000000002	88	1
6935	0033	San Diego Dzityá	21.076799000000001	-89.110068999999996	88	1
6936	0036	Ma'alob Wakax [Unión Ganadera]	21.046306000000001	-89.055908000000002	88	1
6937	0038	Chan Xunaan	21.039677000000001	-89.082319999999996	88	1
6938	0039	Cholul	21.064567	-89.094081000000003	88	1
6939	0041	Santa Cruz	21.071128999999999	-89.080628000000004	88	1
6940	0042	Chum Xa'an	21.081797999999999	-89.057996000000003	88	1
6941	0043	Uixcal	21.043106000000002	-89.078288999999998	88	1
6942	0001	Ticul	20.398340000000001	-89.534447	89	1
6943	0002	Balantunil	20.377374	-89.525558000000004	89	1
6944	0004	Xtuc	20.411054	-89.521130999999997	89	1
6945	0007	Pustunich	20.368721000000001	-89.512319000000005	89	1
6946	0012	Ticul [Unidad del Valle]	20.387598000000001	-89.554123000000004	89	1
6947	0013	Yosahcab	20.422705000000001	-89.503449000000003	89	1
6948	0014	Yotholín	20.327072999999999	-89.455397000000005	89	1
6949	0015	Plan Chac Número Seis	20.419308999999998	-89.550989000000001	89	1
6950	0016	Plan Chac Número Dos	20.418523	-89.536680000000004	89	1
6951	0027	Iván Farah Lara	20.443964000000001	-89.548304999999999	89	1
6952	0028	Lázaro Cárdenas	20.263157	-89.491622000000007	89	1
6953	0030	Panabchén	20.350365	-89.452376000000001	89	1
6954	0032	Sac-Akal	20.386458000000001	-89.654263	89	1
6955	0034	San Enrique	20.367305000000002	-89.506742000000003	89	1
6956	0035	San Fernando	20.317032999999999	-89.556326999999996	89	1
6957	0036	San Juan	20.389151999999999	-89.549565999999999	89	1
6958	0038	Santa Catarina	20.323681000000001	-89.446095999999997	89	1
6959	0039	Santa María	20.399279	-89.580577000000005	89	1
6960	0040	Santa Rosa	20.319982	-89.455659999999995	89	1
6961	0041	Santa Rosa	20.360703000000001	-89.511081000000004	89	1
6962	0042	San Juan Bautista Tabí	20.272347	-89.512287000000001	89	1
6963	0043	Mayor Uno [Unidad]	20.345596	-89.489844000000005	89	1
6964	0046	Yotholín Cuatro [Unidad]	20.334481	-89.463432999999995	89	1
6965	0048	Xocnaceh [Parcelas]	20.340453	-89.484302999999997	89	1
6966	0051	Yocat	20.421399999999998	-89.591746000000001	89	1
6967	0053	San Antonio Noc Ac	20.389047999999999	-89.495090000000005	89	1
6968	0054	San Antonio Paraíso	20.357479999999999	-89.505516999999998	89	1
6969	0059	Santa Rosalía	20.316203000000002	-89.548120999999995	89	1
6970	0064	Plan Chac Pozo Uno	20.430582999999999	-89.551293999999999	89	1
6971	0065	Plan Chac Pozo Cuatro	20.431650999999999	-89.554427000000004	89	1
6972	0066	Plan Chac Pozo Cinco	20.412800000000001	-89.548878999999999	89	1
6973	0067	Plan Chac Pozo Siete	20.427814000000001	-89.562010000000001	89	1
6974	0068	Plan Chac Pozo Ocho	20.421703999999998	-89.563394000000002	89	1
6975	0073	Miguel Be	20.362036	-89.512049000000005	89	1
6976	0074	Gotitas de Oro	20.362179000000001	-89.503362999999993	89	1
6977	0077	San Luis	20.327777999999999	-89.5625	89	1
6978	0078	Ticul [Basurero Municipal]	20.372714999999999	-89.569027000000006	89	1
6979	0080	Ch'um-Pu'uc	20.401540000000001	-89.565081000000006	89	1
6980	0082	La Cueva	20.381401	-89.552000000000007	89	1
6981	0083	Dzetabay	20.333393000000001	-89.563484000000003	89	1
6982	0085	Chum Pu'uc [Tinajas]	20.402812000000001	-89.567263999999994	89	1
6983	0087	Xocnaceh [Granja]	20.344764999999999	-89.477785999999995	89	1
6984	0088	Jesús de la Cruz	20.439024	-89.554265000000001	89	1
6985	0089	Jesús Uno	20.444264	-89.550826000000001	89	1
6986	0090	Campi	20.357868	-89.498821000000007	89	1
6987	0091	Luma	20.441873000000001	-89.509660999999994	89	1
6988	0092	Iván Farah Lara	20.438048999999999	-89.543757999999997	89	1
6989	0093	Jesús	20.360223000000001	-89.501389000000003	89	1
6990	0094	Plan Tabí Pozo Seis	20.268125999999999	-89.534065999999996	89	1
6991	0095	San Dimas	20.385840000000002	-89.526279000000002	89	1
6992	0097	San Juan	20.436112000000001	-89.536933000000005	89	1
6993	0098	San Manuel	20.427049	-89.535493000000002	89	1
6994	0099	San Pedro	20.425453000000001	-89.521279000000007	89	1
6995	0100	San Sebastián Dos	20.374089999999999	-89.506298999999999	89	1
6996	0101	Santa Clara	20.356653999999999	-89.496879000000007	89	1
6997	0102	Santa Rosario	20.413440000000001	-89.520610000000005	89	1
6998	0103	Cha' Altún	20.431073000000001	-89.497895	89	1
6999	0104	Santo Domingo	20.415499000000001	-89.517976000000004	89	1
7000	0107	Los Dos Potrillos [Anexo]	20.410499000000002	-89.524130999999997	89	1
7001	0110	Pozo Yotholín Tres	20.349716000000001	-89.485235000000003	89	1
7002	0111	San Juan	20.359596	-89.509604999999993	89	1
7003	0112	San Orlando	20.353131000000001	-89.501379	89	1
7004	0115	San Antonio [Rancho]	20.339704999999999	-89.477079000000003	89	1
7005	0119	Niño de Atocha	20.386626	-89.519008999999997	89	1
7006	0121	Los Pericos	20.386227999999999	-89.517292999999995	89	1
7007	0122	San Antonio Paraíso Uno	20.349803999999999	-89.497308000000004	89	1
7008	0123	Cumorah	20.383053	-89.504756	89	1
7009	0124	Juan Mex	20.361189	-89.514921000000001	89	1
7010	0125	José Eliseo	20.36253	-89.514380000000003	89	1
7011	0127	San Juan	20.362662	-89.513913000000002	89	1
7012	0128	Brasilia	20.402200000000001	-89.564601999999994	89	1
7013	0129	Los Dos Potrillos	20.412588	-89.523076000000003	89	1
7014	0130	San José	20.374679	-89.546126000000001	89	1
7015	0131	Noé Segura Cocom	20.390459	-89.554535999999999	89	1
7016	0132	Chaytania [SRI]	20.416516999999999	-89.516919000000001	89	1
7017	0134	San Marcos Usil	20.375889000000001	-89.515112999999999	89	1
7018	0135	San Sebastian	20.384640999999998	-89.511875000000003	89	1
7019	0136	CEMEX [Bodega]	20.401854	-89.562708000000001	89	1
7020	0137	Club de Tenis	20.384129000000001	-89.547613999999996	89	1
7021	0138	Dos Marías	20.384319000000001	-89.513645999999994	89	1
7022	0139	Salomón	20.394355999999998	-89.511242999999993	89	1
7023	0140	El Kus Kus	20.402455	-89.565466999999998	89	1
7024	0141	Manuel Cel Chan	20.409790000000001	-89.552327000000005	89	1
7025	0142	Joel Chuc	20.409614000000001	-89.539546000000001	89	1
7026	0143	Lorenzo Magaña	20.370396	-89.505526000000003	89	1
7027	0144	El Olvido	20.403063	-89.566461000000004	89	1
7028	0145	Santa Isabel	20.383226000000001	-89.510109	89	1
7029	0146	Santa Isabel	20.383405	-89.549199000000002	89	1
7030	0147	Santa Rita	20.395396000000002	-89.515428999999997	89	1
7031	0148	Cuauhtémoc [Secundaria]	20.357773999999999	-89.517195000000001	89	1
7032	0149	San Cristóbal	20.375934000000001	-89.507187999999999	89	1
7033	0001	Timucuy	20.810507999999999	-89.513504999999995	90	1
7034	0002	Subincancab	20.867083000000001	-89.531803999999994	90	1
7035	0003	Tekik de Regil	20.817111000000001	-89.560624000000004	90	1
7036	0004	Sihonal	20.849781	-89.520742999999996	90	1
7037	0005	Timucuy [Granjas]	20.819831000000001	-89.515300999999994	90	1
7038	0008	El Girasol	20.829084999999999	-89.520528999999996	90	1
7039	0010	Xkanchakán	20.830416	-89.500944000000004	90	1
7040	0011	San Francisco Dzí	20.788468999999999	-89.497112000000001	90	1
7041	0015	El Gran Tolete	20.823156000000001	-89.512051999999997	90	1
7042	0016	San Eduardo	20.816105	-89.522778000000002	90	1
7043	0017	Los Cinco Hermanos	20.829706999999999	-89.500659999999996	90	1
7044	0021	Kichpachupal	20.812733999999999	-89.524477000000005	90	1
7045	0022	San Antonio	20.758545999999999	-89.578703000000004	90	1
7046	0023	Oxpeh Ek	20.822422	-89.515319000000005	90	1
7047	0024	Koolebí	20.812306	-89.527523000000002	90	1
7048	0025	Maracuyá (Gilda Eugenia)	20.762892999999998	-89.575620000000001	90	1
7049	0026	Plantel Cuatro	20.831468000000001	-89.557946000000001	90	1
7050	0027	Plantel Veinticinco	20.824735	-89.564064999999999	90	1
7051	0028	San Gabriel	20.833756000000001	-89.558329000000001	90	1
7052	0029	Los Compadres	20.869115000000001	-89.499960999999999	90	1
7053	0030	Jalapa	20.870376	-89.535428999999993	90	1
7054	0031	Palmas de Lorán	20.746811999999998	-89.566766000000001	90	1
7055	0032	Alberto Castro	20.849011999999998	-89.509799999999998	90	1
7056	0033	Cecilio I	20.812422999999999	-89.488805999999997	90	1
7057	0034	El Rosario	20.859815000000001	-89.529722000000007	90	1
7058	0035	La Libertad	20.819723	-89.513503999999998	90	1
7059	0036	La Loma	20.819641000000001	-89.554328999999996	90	1
7060	0037	Ninguno	20.862310000000001	-89.532054000000002	90	1
7061	0038	Ninguno	20.817727999999999	-89.513751999999997	90	1
7062	0039	El Roble	20.812798000000001	-89.505606999999998	90	1
7063	0040	Jacinto Chan	20.803076000000001	-89.509418999999994	90	1
7064	0041	Mestiza II	20.816143	-89.554412999999997	90	1
7065	0042	Mestiza I	20.816437000000001	-89.553590999999997	90	1
7066	0043	San Isidro	20.858035000000001	-89.528912000000005	90	1
7067	0044	San Antonio	20.857030999999999	-89.527944000000005	90	1
7068	0045	Santiago de las Mujeres	20.820283	-89.559123999999997	90	1
7069	0046	Siibay Yunkú	20.862586	-89.531356000000002	90	1
7070	0047	Los Cocos	20.811876999999999	-89.527587999999994	90	1
7071	0048	Polok Tamán	20.862244	-89.531378000000004	90	1
7072	0049	San Pedro Buenos Aires	20.806854000000001	-89.523036000000005	90	1
7073	0050	Arqueles	20.868545000000001	-89.514094	90	1
7074	0051	Fausto Yeh Uc	20.868393000000001	-89.527456999999998	90	1
7075	0052	Federico Chablé	20.873293	-89.508465999999999	90	1
7076	0053	Las Palmas	20.861692000000001	-89.530811999999997	90	1
7077	0054	Los Laureles	20.810355999999999	-89.493039999999993	90	1
7078	0056	Julia Tun Noh	20.859542000000001	-89.530820000000006	90	1
7079	0057	Ninguno	20.849436000000001	-89.522036	90	1
7080	0058	Darío Hernández Marquez	20.868213000000001	-89.526786999999999	90	1
7081	0059	Don Mario	20.868001	-89.520703999999995	90	1
7082	0060	El Nojoch	20.860323000000001	-89.531025	90	1
7083	0062	San Diego	20.812698000000001	-89.505050999999995	90	1
7084	0063	Subín Ik	20.871606	-89.521541999999997	90	1
7085	0064	Santa Ana	20.826260000000001	-89.559031000000004	90	1
7086	0001	Tinum	20.767140999999999	-88.391238000000001	91	1
7087	0004	Chichén Itzá	20.678623999999999	-88.567847999999998	91	1
7088	0005	Loop Xul	20.669160000000002	-88.450587999999996	91	1
7089	0006	Pisté	20.698598	-88.588235999999995	91	1
7090	0007	Pom	20.804093999999999	-88.415428000000006	91	1
7091	0008	San Felipe	20.666944000000001	-88.511804999999995	91	1
7092	0009	San Francisco Grande	20.701039999999999	-88.472290999999998	91	1
7093	0011	Tohopkú	20.653969	-88.464102999999994	91	1
7094	0012	X-Calakoop	20.652138000000001	-88.526475000000005	91	1
7095	0015	San Miguel	20.709721999999999	-88.466110999999998	91	1
7096	0019	San Fabián	20.650648	-88.511375999999998	91	1
7097	0021	San Felipe Nuevo	20.683724000000002	-88.562932000000004	91	1
7098	0027	Kuxché	20.804746000000002	-88.361662999999993	91	1
7099	0034	Chich	20.847246999999999	-88.422578999999999	91	1
7100	0036	Santiago	20.703073	-88.491507999999996	91	1
7101	0038	Zodzilá	20.692271999999999	-88.469859999999997	91	1
7102	0042	Ik Kil	20.661058000000001	-88.550256000000005	91	1
7103	0043	Balam Ka'anché	20.658768999999999	-88.534886	91	1
7104	0048	Balmi	20.641393999999998	-88.631592999999995	91	1
7105	0051	Kilómetro Ciento Ocho	20.707336000000002	-88.674931000000001	91	1
7106	0052	Chacnicté	20.705909999999999	-88.678816999999995	91	1
7107	0056	Chan Chen	20.694299000000001	-88.508931000000004	91	1
7108	0057	Chendzonot	20.630690999999999	-88.636793999999995	91	1
7109	0063	Dolores Alba	20.664334	-88.549391	91	1
7110	0066	Guadalupana	20.705413	-88.662492999999998	91	1
7111	0071	San Felipe Kicil	20.673839000000001	-88.482634000000004	91	1
7112	0077	Muchucux	20.651128	-88.454982999999999	91	1
7113	0079	Xmahkabá	20.648161999999999	-88.509545000000003	91	1
7114	0088	San Ángel	20.648333000000001	-88.506122000000005	91	1
7115	0089	San Cristóbal	20.647281	-88.503429999999994	91	1
7116	0091	San Rigoberto	20.671202000000001	-88.469919000000004	91	1
7117	0093	San Gabriel	20.704319000000002	-88.640728999999993	91	1
7118	0099	San Rafael	20.824611000000001	-88.457487	91	1
7119	0103	Santa Clara	20.817572999999999	-88.451318999999998	91	1
7120	0104	Santa Tomasa	20.671178000000001	-88.483333000000002	91	1
7121	0106	Los Tres Reyes	20.702767999999999	-88.656193000000002	91	1
7122	0119	Guadalupana	20.712329	-88.661129000000003	91	1
7123	0128	Chan Xkanyuyum	20.681374999999999	-88.541876000000002	91	1
7124	0129	Balantún	20.794129999999999	-88.437031000000005	91	1
7125	0134	Santa Lucía	20.694016000000001	-88.465979000000004	91	1
7126	0139	San Gabriel	20.658111999999999	-88.512224000000003	91	1
7127	0140	Rancho Feliz	20.672087999999999	-88.478611000000001	91	1
7128	0142	San José	20.664179000000001	-88.524649999999994	91	1
7129	0143	San Marcos	20.697194	-88.525463999999999	91	1
7130	0144	Estación de Servicio Pisté [Gasolinera]	20.699618000000001	-88.599390999999997	91	1
7131	0147	Nuevo Jerusalén	20.774145999999998	-88.401149000000004	91	1
7132	0149	San Francisco	20.739637999999999	-88.581335999999993	91	1
7133	0150	San Mateo	20.767778	-88.339714000000001	91	1
7134	0152	Vivero Tinum	20.805631000000002	-88.449370999999999	91	1
7135	0157	Oka'an [Hotel]	20.676278	-88.540593000000001	91	1
7136	0158	Guadalupe	20.671503000000001	-88.453076999999993	91	1
7137	0159	San Rafael Dos	20.645966999999999	-88.498856000000004	91	1
7138	0160	Santa Elena	20.735800999999999	-88.383211000000003	91	1
7139	0161	Balansascab	20.770330000000001	-88.377927	91	1
7140	0162	El Lancón	20.787361000000001	-88.422618999999997	91	1
7141	0001	Tixcacalcupul	20.537089000000002	-88.270267000000004	92	1
7142	0002	Carolina	20.358018999999999	-88.301792000000006	92	1
7143	0003	Chacuá	20.388428000000001	-88.260433000000006	92	1
7144	0004	Ekpedz	20.317184000000001	-88.430329	92	1
7145	0007	Mahas	20.311209999999999	-88.331892999999994	92	1
7146	0008	Monte Verde	20.347998	-88.249381	92	1
7147	0009	Poop	20.330742999999998	-88.401195000000001	92	1
7148	0013	San Pedro	20.337416000000001	-88.321432000000001	92	1
7149	0014	San José Tecat	20.504999999999999	-88.259844999999999	92	1
7150	0019	X-Tohbil	20.304597000000001	-88.268568000000002	92	1
7151	0021	Yaxcheil	20.308458999999999	-88.287052000000003	92	1
7152	0022	Yoactún	20.355884	-88.388321000000005	92	1
7153	0023	San José	20.356117000000001	-88.415439000000006	92	1
7154	0026	Yaaxcab	20.551724	-88.267782999999994	92	1
7155	0028	Tzab	20.439499000000001	-88.371550999999997	92	1
7156	0029	Xmahkabá	20.386234999999999	-88.304989000000006	92	1
7157	0030	San Juan	20.407896000000001	-88.263819999999996	92	1
7158	0032	Cauich	20.375765999999999	-88.354637999999994	92	1
7159	0034	Sahcabchén	20.326685999999999	-88.256353000000004	92	1
7160	0048	Chactunhá	20.456766999999999	-88.363864000000007	92	1
7161	0049	Chan Suytún	20.469203	-88.267508000000007	92	1
7162	0051	Dzulem	20.456823	-88.277321000000001	92	1
7163	0054	San Francisco	20.480046000000002	-88.325192999999999	92	1
7164	0056	Kilómetro Cuarenta	20.349077999999999	-88.256899000000004	92	1
7165	0058	Luumchén	20.475808000000001	-88.322795999999997	92	1
7166	0059	Pacchén	20.466142000000001	-88.335344000000006	92	1
7167	0066	Susulá	20.513044000000001	-88.312183000000005	92	1
7168	0067	Suytún	20.510439000000002	-88.300714999999997	92	1
7169	0068	Yokdzonot	20.440086000000001	-88.264229999999998	92	1
7170	0070	Tziui	20.411089	-88.343625000000003	92	1
7171	0076	Xiaat	20.534973000000001	-88.305464000000001	92	1
7172	0077	San Luis [Hortícola]	20.540628999999999	-88.290648000000004	92	1
7173	0078	Xnohbutún	20.534082999999999	-88.300281999999996	92	1
7174	0079	Kanum	20.517189999999999	-88.293447	92	1
7175	0081	Culupnah	20.497782000000001	-88.318949000000003	92	1
7176	0082	Yuntunchén	20.490190999999999	-88.323919000000004	92	1
7177	0084	Chulul	20.480284000000001	-88.321053000000006	92	1
7178	0085	Cheul	20.461285	-88.325584000000006	92	1
7179	0086	X-Nuptún	20.550844000000001	-88.287943999999996	92	1
7180	0091	Xcopoil	20.276724000000002	-88.307837000000006	92	1
7181	0093	Omteil	20.471132000000001	-88.244343999999998	92	1
7182	0094	Santo Tomás	20.458448000000001	-88.291268000000002	92	1
7183	0097	Noc-Ac	20.530519000000002	-88.280011000000002	92	1
7184	0100	Sahcabchén	20.335122999999999	-88.338344000000006	92	1
7185	0104	Santiago	20.474281000000001	-88.262801999999994	92	1
7186	0106	Cohuó	20.476554	-88.288889999999995	92	1
7187	0108	Flor de Girasol	20.514469999999999	-88.271775000000005	92	1
7188	0110	San Mateo	20.420383000000001	-88.276647999999994	92	1
7189	0111	Dzucyá	20.488133999999999	-88.302959999999999	92	1
7190	0112	San José	20.550964	-88.258683000000005	92	1
7191	0113	Sodziltún	20.454568999999999	-88.289524999999998	92	1
7192	0114	Yok Koop	20.291105999999999	-88.300850999999994	92	1
7193	0115	Dzodz	20.545563000000001	-88.320081999999999	92	1
7194	0116	Mundo Maya [Mielera]	20.303501000000001	-88.277479	92	1
7195	0119	Etunchen	20.452648	-88.296671000000003	92	1
7196	0001	Tixkokob	21.002568	-89.394965999999997	93	1
7197	0003	San Antonio Millet	20.972829999999998	-89.397619000000006	93	1
7198	0004	Ekmul	20.965337999999999	-89.348985999999996	93	1
7199	0005	Euán	20.997900999999999	-89.341875999999999	93	1
7200	0006	Hubilá	20.926244000000001	-89.334681000000003	93	1
7201	0007	Kancabchén	21.043329	-89.383092000000005	93	1
7202	0008	Katanchel	20.938324000000001	-89.387467000000001	93	1
7203	0009	Nolo	21.009160999999999	-89.423643999999996	93	1
7204	0010	Ruinas de Aké	20.949403	-89.301863999999995	93	1
7205	0012	San Juan Hau	21.028523	-89.374415999999997	93	1
7206	0013	Santa Cruz	21.023638999999999	-89.435274000000007	93	1
7207	0014	Bacné-Ceh	21.015090000000001	-89.386531000000005	93	1
7208	0018	Benito Juárez	20.979182000000002	-89.364254000000003	93	1
7209	0021	Kanichén	20.983491000000001	-89.343335999999994	93	1
7210	0024	Pichilín	20.965456	-89.360054000000005	93	1
7211	0025	Kanyuyún	20.949777999999998	-89.349277000000001	93	1
7212	0027	Chumal	20.969541	-89.369314000000003	93	1
7213	0028	Katanchel	20.915058999999999	-89.379187999999999	93	1
7214	0029	San Francisco	21.018266000000001	-89.398092000000005	93	1
7215	0030	San Isidro	20.991909	-89.318979999999996	93	1
7216	0031	San Juan	20.911033	-89.335453000000001	93	1
7217	0032	La Victoria	21.044297	-89.377747999999997	93	1
7218	0033	Lázaro Cárdenas	20.903030999999999	-89.335704000000007	93	1
7219	0034	San Carlos	20.960460999999999	-89.330904000000004	93	1
7220	0035	Tixkokob [Basurero Municipal]	20.999003999999999	-89.363347000000005	93	1
7221	0036	Centro Bachillerato Tecnológico Agropecuario	21.001099	-89.377270999999993	93	1
7222	0037	Emiliano Zapata	20.980398999999998	-89.364082999999994	93	1
7223	0038	El Esfuerzo	20.901969000000001	-89.376566999999994	93	1
7224	0039	Ninguno	20.991329	-89.417071000000007	93	1
7225	0040	Carlos Burgos	20.99614	-89.404864000000003	93	1
7226	0042	Panteón	20.994838000000001	-89.401450999999994	93	1
7227	0044	San Manuel	20.988371000000001	-89.398492000000005	93	1
7228	0046	Yaxhuá	20.986173999999998	-89.394800000000004	93	1
7229	0047	José Verdugo	20.982907000000001	-89.397234999999995	93	1
7230	0048	San Luis	20.990570999999999	-89.389804999999996	93	1
7231	0049	Eduardo Tun	20.915078000000001	-89.391076999999996	93	1
7232	0050	María Eugenia	20.996701999999999	-89.409835999999999	93	1
7233	0052	San Gerónimo	20.993843999999999	-89.415825999999996	93	1
7234	0053	San Pedro	21.028625000000002	-89.449834999999993	93	1
7235	0054	Santa Cruz	20.994356	-89.410030000000006	93	1
7236	0055	Santa María Dos	21.027766	-89.446083000000002	93	1
7237	0056	Santa María Dzonot	21.008794999999999	-89.439661999999998	93	1
7238	0057	Tulum	21.001570000000001	-89.382292000000007	93	1
9129	0015	Tebec	20.844169000000001	-89.707935000000006	101	1
7239	0058	San Luis	20.983941000000002	-89.392544000000001	93	1
7240	0059	San Manuel	20.892272999999999	-89.362375	93	1
7241	0060	Santa María	20.924961	-89.354397000000006	93	1
7242	0061	San Antonio	20.981878999999999	-89.397313999999994	93	1
7243	0062	San Desiderio	20.955725000000001	-89.421509999999998	93	1
7244	0063	Santa Cruz	20.924209000000001	-89.416082000000003	93	1
7245	0064	San Antonio [Rancho]	20.976973999999998	-89.370185000000006	93	1
7246	0065	La Ilusión	21.014854	-89.397941000000003	93	1
7247	0066	Las Cruces [Rancho]	21.000723000000001	-89.370855000000006	93	1
7248	0067	San José	21.005279999999999	-89.377844999999994	93	1
7249	0068	Bricel [Quinta]	20.922318000000001	-89.342832999999999	93	1
7250	0069	El Roble	21.012184000000001	-89.408079999999998	93	1
7251	0070	El Rosarito	21.001431	-89.416143000000005	93	1
7252	0071	Francisco Villa I	20.978894	-89.362898999999999	93	1
7253	0072	Villas Amor	20.999578	-89.369960000000006	93	1
7254	0073	La Guadalupana	21.002669999999998	-89.415208000000007	93	1
7255	0074	Kilinchén	20.986539	-89.371825000000001	93	1
7256	0077	José del Carmen Santana	20.924866999999999	-89.357355999999996	93	1
7257	0078	Ninguno	21.033933999999999	-89.386459000000002	93	1
7258	0079	Carlos Coyoc	21.041198999999999	-89.383546999999993	93	1
7259	0080	Esteban Koyoc	21.041473	-89.383281999999994	93	1
7260	0081	San José Dos	21.001190999999999	-89.376102000000003	93	1
7261	0082	San Jerónimo	21.009156999999998	-89.381810999999999	93	1
7262	0083	Jorge Navarrete	21.012934999999999	-89.376452999999998	93	1
7263	0084	Marcos Canché	21.004221999999999	-89.412666000000002	93	1
7264	0085	Monserrat	20.904605	-89.377966999999998	93	1
7265	0086	Multel	20.905401000000001	-89.376969000000003	93	1
7266	0087	Pepe Puerto	21.004292	-89.410972000000001	93	1
7267	0088	Prila [Quinta]	20.988575999999998	-89.372817999999995	93	1
7268	0089	Autónomo I [Rancho]	20.956952000000001	-89.333478999999997	93	1
7269	0090	Elí [Rancho]	20.956275999999999	-89.331757999999994	93	1
7270	0091	San Guillermo [Rancho]	21.007883	-89.377560000000003	93	1
7271	0092	Santa Cruz [Rancho]	20.98254	-89.369855999999999	93	1
7272	0093	Raúl Pérez	21.003263	-89.410596999999996	93	1
7273	0094	Santa Cruz Ticún	20.968385999999999	-89.346890999999999	93	1
7274	0095	Santa Rosa	20.952432999999999	-89.417508999999995	93	1
7275	0096	Kaoxil	20.973502	-89.390265999999997	93	1
7276	0097	Humpicdziu [Hacienda]	21.017868	-89.367024000000001	93	1
7277	0098	Rafael Hernández Pech	21.014879000000001	-89.397103999999999	93	1
7278	0099	San Antonio Sahcitán	21.055772999999999	-89.357817999999995	93	1
7279	0100	La Casa del Chilán	21.006169	-89.412530000000004	93	1
7280	0101	El Sacrificio	21.006632	-89.413030000000006	93	1
7281	0102	Ekmul [Centro de Salud]	20.963303	-89.340129000000005	93	1
7282	0001	Tixmehuac	20.235721000000002	-89.109001000000006	94	1
7283	0002	Balantún	20.231946000000001	-89.092015000000004	94	1
7284	0004	Chaltunpuhuy	20.282350999999998	-89.076916999999995	94	1
7285	0005	Chicán	20.338975999999999	-89.159111999999993	94	1
7286	0007	Chuchub	20.355736	-89.07535	94	1
7287	0008	Dzutoh	20.261395	-89.062926000000004	94	1
7288	0010	Kimbilá	20.296399000000001	-89.084914999999995	94	1
7289	0015	Sabacché	20.315763	-89.026888	94	1
7290	0016	Sacchacán	20.199973	-89.106526000000002	94	1
7291	0017	San Felipe	20.261717999999998	-89.055762999999999	94	1
7292	0019	San Juan	20.311416999999999	-89.046329999999998	94	1
7293	0023	Sisbic	20.287718999999999	-89.066535000000002	94	1
7294	0025	Xcohil	20.294429999999998	-89.036118999999999	94	1
7295	0026	Xholenchén	20.279184000000001	-89.075851999999998	94	1
7296	0027	San Antonio Xpela	20.280850000000001	-89.023478999999995	94	1
7297	0028	Tumbenchén	20.281555000000001	-89.064104	94	1
7298	0031	San Jacobo	20.268802000000001	-89.100441000000004	94	1
7299	0038	Saal	20.296907000000001	-89.066536999999997	94	1
7300	0043	San José Balché	20.213341	-89.095161000000004	94	1
7301	0049	San Francisco Xbol	20.217275000000001	-89.062905999999998	94	1
7302	0056	San Lucas	20.250630999999998	-89.067177000000001	94	1
7303	0059	Pich	20.169001999999999	-89.098129999999998	94	1
7304	0062	Jasil	20.216749	-89.156469999999999	94	1
7305	0064	San Miguel Arcángel	20.235505	-89.117368999999997	94	1
7306	0065	Tixmehuac [Internado Escolar]	20.230851000000001	-89.095464000000007	94	1
7307	0068	Luis Poot	20.242629999999998	-89.105579000000006	94	1
7308	0071	San Miguel	20.258617999999998	-89.098489999999998	94	1
7309	0072	San Antonio del Monte	20.276218	-89.101888000000002	94	1
7310	0073	San Hilario	20.28979	-89.072537999999994	94	1
7311	0075	Telesecundaria Número Ciento Sesenta y Cinco	20.292704000000001	-89.086511999999999	94	1
7312	0076	Sabacché [Telesecundaria]	20.310873000000001	-89.028381999999993	94	1
7313	0081	Los Cocos	20.309725	-89.060821000000004	94	1
7314	0001	Tixpéhual	20.978168	-89.441902999999996	95	1
7315	0003	Chochoh	20.993393000000001	-89.467138000000006	95	1
7316	0004	Kilinché	20.997222000000001	-89.436851000000004	95	1
7317	0005	Sahé	20.922239000000001	-89.462737000000004	95	1
7318	0006	Techoh	20.972104000000002	-89.521298999999999	95	1
7319	0007	Loret de Mola	20.944213999999999	-89.454026999999996	95	1
7320	0013	El Almendro	20.977951000000001	-89.469324	95	1
7321	0015	La Nueva Bendición	20.977231	-89.455180999999996	95	1
7322	0017	Cartonera	20.977958999999998	-89.456326000000004	95	1
7323	0018	Paraje Palomé	20.978822000000001	-89.456515999999993	95	1
7324	0023	Cucá	20.93985	-89.406585000000007	95	1
7325	0024	Cerrito de los Hermanos	20.970821000000001	-89.502990999999994	95	1
7326	0025	Los Flamboyanes	20.977063999999999	-89.462762999999995	95	1
7327	0026	Cucá	20.943058000000001	-89.420810000000003	95	1
7328	0029	Campi [Forrajera]	20.980916000000001	-89.453615999999997	95	1
7329	0030	Ninguno	20.975791999999998	-89.461234000000005	95	1
7330	0032	Tixpéhual [Vivero]	20.975919999999999	-89.470528999999999	95	1
7331	0034	Casva	20.972660000000001	-89.509550000000004	95	1
7332	0035	Pedro Eb	20.978116	-89.467499000000004	95	1
7333	0037	Loret de Mola Uno	20.947088999999998	-89.451223999999996	95	1
7334	0038	Rancho Canajo	20.975729000000001	-89.472662	95	1
7335	0039	San Calixto	20.960758999999999	-89.443143000000006	95	1
7336	0041	San Eustaquio	20.965716	-89.441280000000006	95	1
7337	0043	Santo Domingo	20.958531000000001	-89.435258000000005	95	1
7338	0044	Ninguno	20.983557000000001	-89.467733999999993	95	1
7339	0045	Ninguno	20.980384000000001	-89.468807999999996	95	1
7340	0046	Angel Mex	20.975943999999998	-89.463009999999997	95	1
7341	0047	Ninguno	20.975100999999999	-89.456138999999993	95	1
7342	0048	Ninguno	20.972483	-89.534223999999995	95	1
9444	0183	Xuilub	20.417553000000002	-88.030039000000002	102	1
7343	0049	El Escondido	20.977333000000002	-89.525481999999997	95	1
7344	0050	Tixpéhual [Basurero Municipal]	20.960977	-89.430374999999998	95	1
7345	0051	Boy Bec	20.941541000000001	-89.442160999999999	95	1
7346	0052	Cítrico del Mayab	20.994230000000002	-89.437269999999998	95	1
7347	0053	Don Canul	20.986198000000002	-89.438934000000003	95	1
7348	0054	Marlet	20.991598	-89.440679000000003	95	1
7349	0055	Ramonales	20.962810000000001	-89.433885000000004	95	1
7350	0056	Antonio Yamá	20.968547999999998	-89.534980000000004	95	1
7351	0057	Chun Jabín	20.935061000000001	-89.458986999999993	95	1
7352	0058	Garcis [Granja]	20.970376000000002	-89.526786999999999	95	1
7353	0059	El Tuux [Granja]	20.970790999999998	-89.528982999999997	95	1
7354	0060	Santa Cruz	20.929355999999999	-89.459486999999996	95	1
7355	0061	Alberto Navarrete	20.963484999999999	-89.446742999999998	95	1
7356	0062	Cari	20.969650999999999	-89.529917999999995	95	1
7357	0064	Dásila [Constructora]	20.970829999999999	-89.532208999999995	95	1
7358	0066	Ninguno	20.968578000000001	-89.535560000000004	95	1
7359	0067	María Paola Ciau Cen	20.986761999999999	-89.439054999999996	95	1
7360	0068	San Román	20.971104	-89.428473999999994	95	1
7361	0069	Medina	20.967915000000001	-89.539178000000007	95	1
7362	0070	Mújica Mex	20.946798999999999	-89.430913000000004	95	1
7363	0071	Partes Usadas de Oriente	20.970488	-89.526357000000004	95	1
7364	0072	Los Cascabeles [Rancho]	20.914037	-89.464063999999993	95	1
7365	0073	San Juan	20.962485000000001	-89.447147000000001	95	1
7366	0074	San Pedro	20.984590000000001	-89.431420000000003	95	1
7367	0075	San Román	20.981908000000001	-89.427625000000006	95	1
7368	0076	Servitec Automotriz	20.969821	-89.530452999999994	95	1
7369	0077	Ninguno	20.991112999999999	-89.439547000000005	95	1
7370	0078	Manuel Medina	20.976614000000001	-89.453053999999995	95	1
7371	0079	Ninguno	20.976866000000001	-89.454516999999996	95	1
7372	0080	Alejandro Bastarrachea	20.975839000000001	-89.519481999999996	95	1
7373	0081	Ninguno	20.976296000000001	-89.520914000000005	95	1
7374	0082	Paraíso	20.977171999999999	-89.520612	95	1
7375	0083	Materiales de Yucatán [Mayucsa]	20.973068999999999	-89.478389000000007	95	1
7376	0001	Tizimín	21.143283	-88.151955000000001	96	1
7377	0003	Xbohom	21.162735000000001	-88.191847999999993	96	1
7378	0006	Buenaventura Kunchebilá	21.124545999999999	-88.002683000000005	96	1
7379	0007	Cenote Azul	21.276056000000001	-87.718531999999996	96	1
7380	0008	Colonia Yucatán	21.212247999999999	-87.725487000000001	96	1
7381	0009	El Cuyo	21.516859	-87.678139999999999	96	1
7382	0011	Chan San Antonio	21.222501999999999	-88.240087000000003	96	1
7383	0012	Chapas Dos	21.199574999999999	-87.770730999999998	96	1
7384	0013	Chenkekén	21.303902999999998	-88.057633999999993	96	1
7385	0014	Chunsubul	21.3248	-87.940123999999997	96	1
7386	0016	Dzadz Palma	21.321861999999999	-87.917648999999997	96	1
7387	0017	Dzonot Aké	21.236746	-87.936679999999996	96	1
7388	0018	Dzonot Box	21.324034000000001	-87.909289000000001	96	1
7389	0019	Dzonot Carretero	21.401966999999999	-87.878128000000004	96	1
7390	0020	Aguas Blancas	21.277138000000001	-87.981595999999996	96	1
7391	0021	Dzonot Mezo	21.038910999999999	-87.946610000000007	96	1
7392	0022	Dzonot Tigre	21.246435999999999	-87.910400999999993	96	1
7393	0023	El Edén (Yaxic)	21.044487	-87.678843999999998	96	1
7394	0024	La Herradura	21.190946	-87.902647000000002	96	1
7395	0026	Kikil	21.191053	-88.168340999999998	96	1
7396	0027	La Libertad	21.252071999999998	-87.780141999999998	96	1
7397	0028	Libre Unión	21.327407000000001	-87.949212000000003	96	1
7398	0029	Manuel Cepeda Peraza	21.231297999999999	-87.652946999999998	96	1
7399	0031	Moctezuma	21.411251	-87.708016000000001	96	1
7400	0032	Nuevo León	21.160205000000001	-88.067599999999999	96	1
7401	0033	X-Panhatoro	21.320048	-88.101500000000001	96	1
7402	0034	Popolnáh	20.993604000000001	-87.564194000000001	96	1
7403	0036	Los Pinos	21.142234999999999	-87.891498999999996	96	1
7404	0037	El Ramonal	21.131954	-87.933837999999994	96	1
7405	0039	Samaria	21.261638999999999	-87.748239999999996	96	1
7406	0040	Chocolate	21.226754	-87.826318000000001	96	1
7407	0041	San Arturo	21.267021	-87.537384000000003	96	1
7408	0043	San Francisco	21.479126000000001	-87.937398000000002	96	1
7409	0044	San Francisco Yohactún	21.431557000000002	-87.927104	96	1
7410	0045	San Isidro Kilómetro Catorce (San Isidro)	21.097014000000001	-87.673956000000004	96	1
7411	0049	San Lorenzo	21.284877999999999	-87.931011999999996	96	1
7412	0050	San Lorenzo Chiquilá	21.007314999999998	-87.901212000000001	96	1
7413	0051	San Luis	21.297723999999999	-87.980444000000006	96	1
7414	0052	San Luis Tzuctuk	21.082201999999999	-87.852645999999993	96	1
7415	0053	San Manuel	21.199954999999999	-87.815541999999994	96	1
7416	0055	Kalax Yokdzonot	21.328263	-87.890107999999998	96	1
7417	0056	San Pedro	21.515550999999999	-87.967223000000004	96	1
7418	0058	San Pedro Juárez	21.159139	-87.901330999999999	96	1
7419	0060	Santa Clara Dzibalkú	21.372674	-88.066429999999997	96	1
7420	0061	Santa Cruz	21.258220000000001	-88.079988999999998	96	1
7421	0062	San José	21.224015999999999	-87.982258999999999	96	1
7422	0063	Santa Elena	21.187889999999999	-87.674518000000006	96	1
7423	0064	Santa Isabel	21.341487999999998	-87.692746999999997	96	1
7424	0066	Santa Rosa	21.434809000000001	-87.966772000000006	96	1
7425	0067	Santa Rosa Concepción	21.152108999999999	-87.664019999999994	96	1
7426	0068	La Sierra	21.197755000000001	-87.718609999999998	96	1
7427	0069	Sucopó	21.161161	-88.048771000000002	96	1
7428	0070	Tezoco Nuevo	21.310428000000002	-87.561612999999994	96	1
7429	0071	Tixcancal	21.035328	-87.851408000000006	96	1
7430	0072	Tres Marías	21.198042999999998	-87.660083	96	1
7431	0073	Xkalax de Dzibalkú	21.393146999999999	-87.975487000000001	96	1
7432	0074	X-Makulán	21.296012999999999	-87.953024999999997	96	1
7433	0075	X-Pambihá	21.160150000000002	-88.185489000000004	96	1
7434	0076	Yaxchekú	21.207598000000001	-87.933158000000006	96	1
7435	0077	Yohactún de Hidalgo	21.417176000000001	-88.020658999999995	96	1
7436	0079	Yoktzitz	21.275210999999999	-88.116585999999998	96	1
7437	0080	Akankún	21.312626999999999	-88.083275999999998	96	1
7438	0083	Bohchén	21.110408	-87.861487999999994	96	1
7439	0084	Bondzonot Número Dos	21.241914000000001	-88.090997000000002	96	1
7440	0085	La Providencia	21.154821999999999	-87.913684000000003	96	1
7441	0086	Buena Esperanza	21.318455	-87.956934000000004	96	1
7442	0092	La Central	21.310410000000001	-88.120778999999999	96	1
7443	0093	Concepción	21.253122999999999	-88.161079000000001	96	1
7444	0100	San Ignacio	21.427264999999998	-88.040620000000004	96	1
7445	0105	Chumucbé	21.196874000000001	-87.997877000000003	96	1
7446	0111	Dzadz Lagarto	21.441745999999998	-88.002990999999994	96	1
7447	0117	Maya Agricola del Sureste	21.285074000000002	-88.075315000000003	96	1
7448	0119	Dzonot Pinto	21.338864999999998	-87.849380999999994	96	1
7449	0120	Dzoyilá	21.197852999999999	-88.249964000000006	96	1
7450	0134	Hibachén	21.174074000000001	-88.103883999999994	96	1
7451	0136	Jalisco	21.100000000000001	-87.875	96	1
7452	0139	Kancab	21.148202999999999	-88.081287000000003	96	1
7453	0140	Kancabá	21.225462	-88.212185000000005	96	1
7454	0142	San Isidro Kancabdzonot	21.007781000000001	-87.933899999999994	96	1
7455	0145	Komichén	21.130845999999998	-87.988991999999996	96	1
7456	0146	Komichén Uno (Kunché)	21.118921	-87.995251999999994	96	1
7457	0149	Kulubá	21.119519	-87.850784000000004	96	1
7458	0153	Moctezuma	21.412752000000001	-87.711033999999998	96	1
7459	0166	El Porvenir	21.466027	-88.041004000000001	96	1
7460	0177	Sahcabchén	21.278282999999998	-88.136578	96	1
7461	0178	Sahcabá	21.096952000000002	-88.109414000000001	96	1
7462	0180	San Andrés	21.108312999999999	-87.823282000000006	96	1
7463	0182	San Antonio Tres	21.170148000000001	-87.807186999999999	96	1
7464	0187	San Carlos Yokdzonot	21.164472	-88.118178999999998	96	1
7465	0188	Kin-Tab	21.536892000000002	-87.994687999999996	96	1
7466	0190	Haltún	21.239702000000001	-87.794909000000004	96	1
7467	0192	San Felipe	21.221834000000001	-87.858699000000001	96	1
7468	0196	San Fernando	21.443816999999999	-87.887264000000002	96	1
7469	0200	Jaibolito	21.180254999999999	-88.154229999999998	96	1
7470	0201	San Isidro	21.226040999999999	-87.837911000000005	96	1
7471	0202	San Isidro	21.191444000000001	-88.07432	96	1
7472	0205	San Isidro	21.385204999999999	-87.988254999999995	96	1
7473	0211	San Lorenzo	21.276036000000001	-87.929151000000005	96	1
7474	0213	San José Conde	21.163708	-87.663229000000001	96	1
7475	0218	San Manuel Kilómetro Once	21.122833	-87.675329000000005	96	1
7476	0219	San Marcos	21.360499000000001	-87.844959000000003	96	1
7477	0222	San Mateo	21.38682	-87.906392999999994	96	1
7478	0223	San Miguel	21.333850999999999	-87.771710999999996	96	1
7479	0230	San Pedro Bacab	21.296403999999999	-87.654561000000001	96	1
7480	0231	San Pedro Xtumpech	21.215447999999999	-87.854556000000002	96	1
7481	0232	San Rafael	21.448954000000001	-88.042156000000006	96	1
7482	0241	Santa Clara	21.27092	-87.616999000000007	96	1
7483	0244	Santa Fe	21.180430999999999	-88.159328000000002	96	1
7484	0246	Santa María Xluch	21.130587999999999	-88.077826999999999	96	1
7485	0263	Tres Hermanos	21.493608999999999	-87.997425000000007	96	1
7486	0314	San Hipólito	21.183793999999999	-87.653166999999996	96	1
7487	0315	Luis Rosado Vega	21.183838999999999	-87.643011000000001	96	1
7488	0316	Lázaro Cárdenas	21.180357000000001	-87.724931999999995	96	1
7489	0317	Felipe Carrillo Puerto Dos	21.172958000000001	-87.724936999999997	96	1
7490	0318	San Enrique	21.158055000000001	-87.729432000000003	96	1
7491	0319	Felipe Carrillo Puerto Número Uno	21.038091000000001	-87.658486999999994	96	1
7492	0320	El Álamo	21.287275999999999	-88.164648	96	1
7493	0322	San José Montecristo	21.065705999999999	-87.677318	96	1
7494	0323	Emiliano Zapata	21.202162000000001	-87.737177000000003	96	1
7495	0327	Francisco Villa	21.231484999999999	-87.689814999999996	96	1
7496	0329	El Limonar	21.318963	-87.566208000000003	96	1
7497	0330	San Bedher IV	21.226136	-88.206539000000006	96	1
7498	0331	La Pampa	21.502863999999999	-87.976625999999996	96	1
7499	0333	San Alfredo	21.484217999999998	-88.037280999999993	96	1
7500	0334	Chan Chelito	21.193429999999999	-88.129222999999996	96	1
7501	0337	Kokop	21.068967000000001	-88.048128000000005	96	1
7502	0338	San Roque	21.446546000000001	-87.708751000000007	96	1
7503	0339	La Alegría	21.524297000000001	-87.742340999999996	96	1
7504	0340	Tokipap	21.389907000000001	-88.086431000000005	96	1
7505	0343	Sinaí	21.439997999999999	-87.981606999999997	96	1
7506	0345	San Nicolás	21.443709999999999	-87.972260000000006	96	1
7507	0346	San Lorenzo	21.465706000000001	-87.916009000000003	96	1
7508	0348	El Sauce	21.459921000000001	-87.956766000000002	96	1
7509	0349	San Martín	21.468658999999999	-87.987545999999995	96	1
7510	0350	San Lorenzo	21.484753999999999	-87.985463999999993	96	1
7511	0351	Santa Cruz	21.442413999999999	-87.967527000000004	96	1
7512	0352	X-Lapak	21.410672999999999	-87.789449000000005	96	1
7513	0353	Dos Hermanos	21.471419999999998	-87.848511999999999	96	1
7514	0357	San Manuel	21.431919000000001	-87.791437000000002	96	1
7515	0358	San Liborio	21.404094000000001	-87.905285000000006	96	1
7516	0359	El Cafetal	21.360512	-88.117293000000004	96	1
7517	0360	Nuevo León	21.341581000000001	-87.590031999999994	96	1
7518	0361	San Agustín	21.288418	-88.195059000000001	96	1
7519	0362	El Cenote	21.329196	-88.071241000000001	96	1
7520	0363	Dzibalkú	21.315493	-88.067739000000003	96	1
7521	0364	San Antonio	21.319555999999999	-88.011823000000007	96	1
7522	0367	Maya Agrícola	21.282979999999998	-88.059004000000002	96	1
7523	0370	Kinchacán	21.340067999999999	-88.010977999999994	96	1
7524	0371	Santa Pilar	21.356542000000001	-87.748456000000004	96	1
7525	0374	Poop	21.309070999999999	-87.920699999999997	96	1
7526	0375	Santa Rosa y Anexas	21.311589000000001	-87.747561000000005	96	1
7527	0376	Adolfo López Mateos	21.258144999999999	-87.556589000000002	96	1
7528	0377	Santa María	21.354579000000001	-87.744297000000003	96	1
7529	0378	El Colorado	21.385598000000002	-87.722594000000001	96	1
7530	0382	El Tentadero (Santa Teresa Huchichén)	21.152670000000001	-87.921791999999996	96	1
7531	0383	Los Laureles	21.281749999999999	-88.196072999999998	96	1
7532	0384	El Parral	21.263812999999999	-88.172999000000004	96	1
7533	0385	Yoknicté	21.262953	-88.073981000000003	96	1
7534	0389	San Antonio	21.357709	-88.115857000000005	96	1
7535	0390	El Chaparral	21.242478999999999	-88.151106999999996	96	1
7536	0391	Topoxkú	21.312982999999999	-88.151523999999995	96	1
7537	0392	El Palomar	21.080857999999999	-88.068135999999996	96	1
7538	0394	El Cafetal	21.397258999999998	-87.741453000000007	96	1
7539	0395	Yokdzonot los Luises (Los Luises)	21.183209999999999	-87.938506000000004	96	1
7540	0396	Kalacdzonot	21.265091999999999	-87.816164000000001	96	1
7541	0397	Vista Hermosa (Los Tres Reyes)	21.313835999999998	-87.765930999999995	96	1
7542	0398	San Juan Kilómetro Cuatro	21.190142999999999	-87.688761999999997	96	1
7543	0400	Benito Juárez	21.255120000000002	-87.702342999999999	96	1
7544	0404	Teapa	21.196805000000001	-87.711150000000004	96	1
7545	0413	San Diego	21.147082000000001	-88.186346999999998	96	1
7546	0415	San Pedro	21.200191	-88.089481000000006	96	1
7547	0416	San Francisco	21.147157	-88.235827999999998	96	1
7548	0422	Tres Reyes	21.155895999999998	-88.079915	96	1
7549	0423	Santa Cruz	21.197139	-88.027090999999999	96	1
7550	0425	San José	21.533581999999999	-87.956204	96	1
7551	0426	San Gabriel	21.156438999999999	-88.053469000000007	96	1
7552	0430	La Rosita	21.120274999999999	-87.862735000000001	96	1
7553	0431	África	21.168773999999999	-88.181102999999993	96	1
7554	0434	Chuy Pul	21.132908	-87.839293999999995	96	1
7555	0436	Adolfo López Mateos	21.159772	-87.700423000000001	96	1
7556	0437	Acan-Balam	21.095590999999999	-87.854310999999996	96	1
7557	0440	Trascorral	21.014904999999999	-87.755196999999995	96	1
7558	0441	Chablé	21.020333000000001	-87.719587000000004	96	1
7559	0442	Vista Alegre	21.364806999999999	-87.741816999999998	96	1
7560	0444	San Rafael	21.170551	-88.185080999999997	96	1
7561	0448	Guadalupe	21.222859	-87.806528999999998	96	1
7562	0449	San Miguel	21.415586999999999	-87.990549999999999	96	1
7563	0451	Dos X (El Naranjal)	21.136918999999999	-87.793474000000003	96	1
7564	0452	San Matías	21.143746	-87.771724000000006	96	1
7565	0453	Xhopel	21.108277999999999	-87.800124999999994	96	1
7566	0457	Noria Chen	21.196335999999999	-88.087970999999996	96	1
7567	0459	San Juan	21.092928000000001	-88.067323000000002	96	1
7568	0464	Santa Cecilia	21.245692999999999	-87.810383999999999	96	1
7569	0465	Santa María	21.241496000000001	-87.858250999999996	96	1
7570	0466	Santa Martha	21.228467999999999	-87.861508999999998	96	1
7571	0467	Odzceh	21.268263000000001	-87.866410000000002	96	1
7572	0468	La Montaña	21.243821000000001	-87.828659000000002	96	1
7573	0469	Santa Cecilia	21.250833	-88.173492999999993	96	1
7574	0470	Santa Ana	21.254854999999999	-87.765118999999999	96	1
7575	0471	San Andrés	20.985185000000001	-87.691199999999995	96	1
7576	0472	Santa Catalina	21.515025000000001	-87.966173999999995	96	1
7577	0473	San Ignacio	21.207811	-88.209914999999995	96	1
7578	0474	Doble R	21.307395	-87.765179000000003	96	1
7579	0476	San Ramón	21.365393000000001	-87.742436999999995	96	1
7580	0488	Benito Juárez	21.454695999999998	-87.865268	96	1
7581	0489	El Zapotal	21.36354	-87.627429000000006	96	1
7582	0490	Buena Esperanza	21.212723	-88.054771000000002	96	1
7583	0491	San Buenaventura	21.170795999999999	-87.904334000000006	96	1
7584	0493	Buenavista	21.340017	-87.913798999999997	96	1
7585	0494	San José Buenavista	21.368528000000001	-87.738594000000006	96	1
7586	0496	Buenos Aires	21.045805999999999	-87.711608999999996	96	1
7587	0497	Kabichén	21.149504	-87.958637999999993	96	1
7588	0499	Carolina	21.164353999999999	-87.976410000000001	96	1
7589	0500	Santa Carolina Xluch	21.266760000000001	-88.189047000000002	96	1
7590	0502	Cenote Godín	21.219574000000001	-88.094531000000003	96	1
7591	0503	Cerritos	21.342998000000001	-88.029105000000001	96	1
7592	0504	Cerritos	21.48592	-87.881585000000001	96	1
7593	0505	Chac Lol	21.090833	-87.944166999999993	96	1
7594	0506	Chan Tres Reyes	21.000518	-87.682135000000002	96	1
7595	0507	Chakan Tzimín	21.447320999999999	-87.788465000000002	96	1
7596	0508	Chalín	21.450989	-88.011622000000003	96	1
7597	0509	Chan Cenote	20.991602	-87.785213999999996	96	1
7598	0512	Chan San Antonio Uno	21.239792000000001	-88.217367999999993	96	1
7599	0513	Chapas Cuatro	21.227712	-87.757718999999994	96	1
7600	0514	Chapas Tres	21.217113999999999	-87.770415999999997	96	1
7601	0520	Chocholá	21.094559	-88.044319000000002	96	1
7602	0521	Chumbec	21.059943000000001	-87.777592999999996	96	1
7603	0523	Chuncorral	21.346132000000001	-87.897879000000003	96	1
7604	0525	Dos Culebras	21.114730000000002	-87.936161999999996	96	1
7605	0526	Dolores	21.386181000000001	-87.949740000000006	96	1
7606	0531	Dzadz Mahas	21.329908	-87.955596	96	1
7607	0532	Dzibichén	21.082272	-88.102076999999994	96	1
7608	0533	Dzibichén	21.299296999999999	-88.010980000000004	96	1
7609	0534	Dzidzilá	21.270852999999999	-87.924854999999994	96	1
7610	0536	Yokdzonot Regadío	21.081060999999998	-88.056720999999996	96	1
7611	0537	Dzoyilá	21.265042000000001	-88.093667999999994	96	1
7612	0538	Dzununcán (San Juan Bautista Dzununcán)	21.113240999999999	-87.830760999999995	96	1
7613	0539	Yaax Kaaj	21.021667000000001	-87.679721999999998	96	1
7614	0540	Emmanuel	21.117249999999999	-87.845827999999997	96	1
7615	0543	Itzinté	21.057866000000001	-88.038741999999999	96	1
7616	0545	Gameba	21.249662000000001	-88.182838000000004	96	1
7617	0546	Guadalupe	21.417103000000001	-87.978562999999994	96	1
7618	0548	Santa Elena de la Cruz	21.512478000000002	-87.940646000000001	96	1
7619	0550	Los Pedregales	21.448367000000001	-87.955304999999996	96	1
7620	0551	San Pedro	21.453675	-87.961286000000001	96	1
7621	0552	San Juan los Cerros	21.446847999999999	-87.963166999999999	96	1
7622	0553	Mixnébalam	21.294713999999999	-87.770386000000002	96	1
7623	0554	Las Milpas	21.418064000000001	-87.739894000000007	96	1
7624	0558	Buenavista	21.131271000000002	-88.024793000000003	96	1
7625	0559	San Felipe	21.155681000000001	-88.059787	96	1
7626	0561	Diego	21.150556000000002	-88.104167000000004	96	1
7627	0563	La Paloma	21.151357000000001	-88.079558000000006	96	1
7628	0566	Sagrado Corazón	21.112995999999999	-88.167057	96	1
7629	0567	San Diego	21.228643000000002	-87.728638000000004	96	1
7630	0572	San Isidro	21.185292	-88.139054000000002	96	1
7631	0573	Del Rosario	21.147573000000001	-88.061852999999999	96	1
7632	0574	Kalax Viejo	21.282834000000001	-87.908269000000004	96	1
7633	0575	Xkalakmul	21.269642000000001	-88.037864999999996	96	1
7634	0577	Kanchacán	21.337140999999999	-87.734218999999996	96	1
7635	0579	Kankirixché	21.111211000000001	-88.033850000000001	96	1
7636	0580	Kantoke	21.064081999999999	-87.811357999999998	96	1
7637	0581	San Martín	21.225767999999999	-88.154269999999997	96	1
7638	0582	El Horizonte	21.155493	-88.063439000000002	96	1
7639	0583	Kincab	21.263573000000001	-87.914828999999997	96	1
7640	0584	Kinimil	21.148959000000001	-87.825315000000003	96	1
7641	0587	Pimienta Dos	21.071511000000001	-87.773208999999994	96	1
7642	0589	La Laguna	21.097512999999999	-87.920254	96	1
7643	0590	Los Laureles	21.111201000000001	-88.149631999999997	96	1
7644	0591	Los Laureles	21.136265999999999	-87.876047	96	1
7645	0592	Los Laureles	21.212447000000001	-87.789071000000007	96	1
7646	0593	Linda Flor	21.127723	-87.963953000000004	96	1
7647	0595	Luis Echeverría Álvarez	21.229718999999999	-87.743328000000005	96	1
7648	0596	Chan José	21.441963000000001	-87.709076999999994	96	1
7649	0598	El Milagro	21.150607999999998	-88.046643000000003	96	1
7650	0600	La Mina	21.542052999999999	-87.965181000000001	96	1
7651	0601	Mina de Oro	21.162538000000001	-88.078828999999999	96	1
7652	0602	Miraflor	21.132239999999999	-88.175818000000007	96	1
7653	0603	Costa Mar	21.425045999999998	-87.984999999999999	96	1
7654	0606	San Carlos	21.138608999999999	-88.233598999999998	96	1
7655	0607	Mulux Tun	21.091501000000001	-88.194626999999997	96	1
7656	0608	El Niño Dios	21.150670000000002	-88.040908999999999	96	1
7657	0610	Nueva York	21.031827	-87.707396000000003	96	1
7658	0612	Onichén	21.217835000000001	-88.173826000000005	96	1
7659	0613	Orizaba	21.121514000000001	-87.883099999999999	96	1
7660	0615	San Agustín	21.157361999999999	-87.956109999999995	96	1
7661	0616	El Palmar	21.069402	-87.705686	96	1
7662	0617	Las Palmas	21.420442000000001	-87.912235999999993	96	1
7663	0618	Las Palmas	21.378305000000001	-87.733140000000006	96	1
7664	0620	Las Palmas	21.351713	-87.802387999999993	96	1
7665	0622	San Francisco Uno	21.096893999999999	-87.860214999999997	96	1
7666	0623	Paraíso	21.422840999999998	-87.709277999999998	96	1
7667	0624	La Ceiba	21.158038000000001	-88.068161000000003	96	1
7668	0627	Pixtón	21.094366999999998	-88.145110000000003	96	1
7669	0629	Polceh	21.371478	-88.022405000000006	96	1
7670	0631	El Porvenir	21.261710999999998	-87.929171999999994	96	1
7671	0632	El Porvenir	21.172422000000001	-87.778940000000006	96	1
7672	0633	Providencia	21.480553	-88.066359000000006	96	1
7673	0634	Rancho Alegre	21.303560999999998	-87.769461000000007	96	1
7674	0635	Rancho Alegre	21.058664	-87.798354000000003	96	1
7675	0638	El Recuerdo	21.439954	-87.915655000000001	96	1
7676	0639	La Reja	21.498415000000001	-87.965013999999996	96	1
7677	0640	Remuda	21.238973000000001	-88.055203000000006	96	1
7678	0641	El Retiro	21.522124999999999	-87.988961000000003	96	1
7679	0642	Sac Nicté	21.480308000000001	-88.081299000000001	96	1
7680	0643	Sactoil	21.047678000000001	-87.988085999999996	96	1
7681	0646	San Isidro	21.361046000000002	-87.909369999999996	96	1
7682	0647	San Agustín	21.163919	-87.716369	96	1
7683	0648	San Agustín	21.038523999999999	-87.981903000000003	96	1
7684	0652	San Eduardo	21.415047999999999	-88.049021999999994	96	1
7685	0653	San Antonio	21.194092999999999	-88.159014999999997	96	1
7686	0654	San Antonio Playa	21.537431999999999	-87.976569999999995	96	1
7687	0655	San Antonio	21.432120000000001	-88.002568999999994	96	1
7688	0656	San Antonio	21.434293	-87.951348999999993	96	1
7689	0657	San Antonio Número Dos	21.284254000000001	-87.758821999999995	96	1
7690	0659	San Antonio Número Uno	21.279012999999999	-87.753439999999998	96	1
7691	0660	San Isidro Dzoyilá	21.198475999999999	-88.247641999999999	96	1
7692	0661	San Antonio Nabatún	21.197320000000001	-88.225488999999996	96	1
7693	0662	San Antonio Número Uno	21.201349	-87.833612000000002	96	1
7694	0663	San Antonio Ponce (San Antonio Dos)	21.211760999999999	-87.830532000000005	96	1
7695	0665	San Antonio Yohdzonot	21.175108000000002	-88.000279000000006	96	1
7696	0666	La Lupita (San Carlos)	21.356348000000001	-87.772577999999996	96	1
7697	0668	San Carlos	21.331503000000001	-88.037643000000003	96	1
7698	0671	Santo Domingo	21.123968999999999	-88.139455999999996	96	1
7699	0672	Chapultepec	21.087624999999999	-88.015283999999994	96	1
7700	0673	San Enrique	21.258866000000001	-87.853055999999995	96	1
7701	0674	San Enrique	21.498704	-87.930913000000004	96	1
7702	0675	El Gran Reto	21.262763	-87.804743999999999	96	1
7703	0676	San Enrique	21.139274	-88.190045999999995	96	1
7704	0678	San Enrique Pimienta	21.090820999999998	-87.758973999999995	96	1
7705	0679	San Fabián	21.233391000000001	-88.143773999999993	96	1
7706	0680	San Felipe	21.114149000000001	-87.733868999999999	96	1
7707	0682	San Felipe	21.145706000000001	-88.110369000000006	96	1
7708	0683	San Felipe Holchén (San Felipe)	21.120688000000001	-87.957069000000004	96	1
7709	0684	San Florencio	21.167657999999999	-87.894645999999995	96	1
7710	0686	San Francisco Dos	21.099034	-87.855518000000004	96	1
7711	0687	San Francisco	21.102274999999999	-87.8887	96	1
7712	0689	San Francisco	21.440891000000001	-88.043716000000003	96	1
7713	0690	San Francisco Nohdzonot	21.453329	-87.907703999999995	96	1
7714	0692	San Ramón	21.321373000000001	-87.952336000000003	96	1
7715	0693	San Isidro Labrador	21.349208999999998	-87.916645000000003	96	1
7716	0694	San Isidro	21.058745999999999	-88.006826000000004	96	1
7717	0695	San Isidro	21.287483000000002	-87.601499000000004	96	1
7718	0696	San Isidro Chuncopó	21.200724999999998	-87.952714999999998	96	1
7719	0698	San Isidro	21.093533999999998	-87.740730999999997	96	1
7720	0701	San José	21.385985999999999	-87.925230999999997	96	1
7721	0703	San José	21.510489	-87.851401999999993	96	1
7722	0704	San José	21.429352999999999	-88.009489000000002	96	1
7723	0705	San José	21.292853000000001	-88.211883999999998	96	1
7724	0706	San José	21.341972999999999	-88.071729000000005	96	1
7725	0707	San José	21.474540000000001	-87.876952000000003	96	1
7726	0709	San José (San José de la Colonia)	21.200005000000001	-87.802651999999995	96	1
7727	0710	San José	21.465987999999999	-88.008882	96	1
7728	0711	San José de la Montaña	21.24051	-88.174801000000002	96	1
7729	0712	San José	21.146474000000001	-87.808913000000004	96	1
7730	0714	San José	21.180257999999998	-87.895956999999996	96	1
7731	0716	San José Cañabrava	21.162130000000001	-87.986260999999999	96	1
7732	0717	San José Martín	21.301563999999999	-87.827506999999997	96	1
7733	0718	Ebenezer	21.096081000000002	-87.684454000000002	96	1
7734	0719	San José Xcobó	21.430595	-87.779988000000003	96	1
7735	0720	Yoactún	21.172893999999999	-88.200376000000006	96	1
7736	0721	San Juan	21.421071000000001	-87.918527999999995	96	1
7737	0723	San Juan	21.352419000000001	-88.082234	96	1
7738	0724	San Antonio	21.272136	-88.202347000000003	96	1
7739	0725	San Juan de los Cerros	21.348806	-87.930738000000005	96	1
7740	0726	San Juan	21.370175	-87.900509999999997	96	1
7741	0730	La Florida	21.344522000000001	-87.629765000000006	96	1
7742	0731	San Andrés	21.220741	-88.107125999999994	96	1
7743	0732	San Lorenzo	21.443093999999999	-88.020218999999997	96	1
7744	0733	San Lorenzo	21.353235999999999	-87.639754999999994	96	1
7745	0734	San Lorenzo Número Dos	21.454059999999998	-87.907402000000005	96	1
7746	0736	San Luis	21.294889000000001	-87.764109000000005	96	1
7747	0737	San Luis (San Luis Número Uno)	21.170359999999999	-87.912390000000002	96	1
7748	0738	San Luis	21.087893000000001	-87.734083999999996	96	1
7749	0739	San Luis	21.307789	-87.889694000000006	96	1
7750	0740	Nazaret	21.270144999999999	-88.190301000000005	96	1
7751	0741	San Luis	21.435563999999999	-88.069659000000001	96	1
7752	0743	San Luis	21.038561000000001	-87.953048999999993	96	1
7753	0745	San Manuel	21.099191999999999	-88.052314999999993	96	1
7754	0746	San Manuel	21.291882000000001	-88.171031999999997	96	1
7755	0747	San Manuel	21.479856000000002	-87.708054000000004	96	1
7756	0748	Renacimiento	21.381658000000002	-87.960932999999997	96	1
7757	0749	San Manuel	21.284762000000001	-87.742541000000003	96	1
7758	0752	San Manuel	21.467075999999999	-88.078772999999998	96	1
7759	0753	San Manuel	21.535554000000001	-87.985274000000004	96	1
7760	0755	San Mateo	21.129951999999999	-87.830583000000004	96	1
7761	0756	San Miguel	21.184550999999999	-88.088092000000003	96	1
7762	0759	San Miguel	21.172753	-88.133950999999996	96	1
7763	0760	San Miguel	21.169812	-88.034819999999996	96	1
7764	0761	San Miguel	21.253616000000001	-87.844443999999996	96	1
7765	0762	San Miguel	21.091486	-87.708377999999996	96	1
7766	0764	San Pastor	21.458458	-88.062394999999995	96	1
7767	0769	San Martín	21.122140000000002	-87.829014000000001	96	1
7768	0770	San Juan Dos	21.45674	-87.998062000000004	96	1
7769	0771	San Nicolás	21.458203000000001	-87.716817000000006	96	1
7770	0772	San Pablo	21.439881	-87.984562999999994	96	1
7771	0773	San Pablo	21.203688	-88.094571000000002	96	1
7772	0774	Yokzahum	21.216241	-88.176704000000001	96	1
7773	0775	San Pedro	21.447168999999999	-87.981209000000007	96	1
7774	0777	San Pedro	21.213283000000001	-88.217202999999998	96	1
7775	0780	San Rafael	21.209683999999999	-87.899732999999998	96	1
7776	0781	San Pedro	21.361753	-87.925444999999996	96	1
7777	0782	San Rafael	21.283995999999998	-87.900113000000005	96	1
7778	0784	San Raymundo	21.352342	-88.040513000000004	96	1
7779	0785	San Ramón Pomuch	21.019566999999999	-87.979866999999999	96	1
7780	0786	San Roque	21.504498000000002	-87.966667999999999	96	1
7781	0787	Tree Star	21.428742	-87.968521999999993	96	1
7782	0789	San Pedro	21.416981	-87.909451000000004	96	1
7783	0791	San Vicente	21.157814999999999	-88.082474000000005	96	1
7784	0793	San Vicente	21.175201999999999	-87.925319999999999	96	1
7785	0796	Santa Carolina	21.267963000000002	-88.180110999999997	96	1
7786	0797	La Morenita	21.096024	-88.061145999999994	96	1
7787	0798	Santa Nazaria	21.391667000000002	-88.001666999999998	96	1
7788	0799	Santa Cruz	21.153258000000001	-87.911004000000005	96	1
7789	0801	Santa Cruz	21.154167000000001	-87.784722000000002	96	1
7790	0802	Santa Cruz	21.419851000000001	-87.903713999999994	96	1
7791	0803	Dzadz Caldero	21.430862999999999	-87.966795000000005	96	1
7792	0804	Santa Elena	21.337890000000002	-87.927124000000006	96	1
7793	0805	Santa Eulalia	21.217206999999998	-87.967567000000003	96	1
7794	0806	Santa Inés Martín	21.290928000000001	-87.815758000000002	96	1
7795	0807	Santa Inés	21.465319000000001	-87.948132999999999	96	1
7796	0809	Santa Isabel	21.159569999999999	-88.029255000000006	96	1
7797	0810	Santa Juanita	21.273600999999999	-87.884674000000004	96	1
7798	0813	Santa María	21.079999999999998	-87.741111000000004	96	1
7799	0814	Santa María	21.052842999999999	-87.974249999999998	96	1
7800	0815	Santa María	21.210215000000002	-87.753214	96	1
7801	0816	San Antonio Yoknikté	21.087297	-87.966690999999997	96	1
7802	0818	Santa Matilde	21.206256	-88.166832999999997	96	1
7803	0819	Santa Mercedes	21.156161000000001	-88.043903999999998	96	1
7804	0821	Santa Mónica	21.218440000000001	-87.873053999999996	96	1
7805	0822	Santa Pilar	21.369821000000002	-87.996071999999998	96	1
7806	0823	Santa Rita	21.245853	-87.846042999999995	96	1
7807	0824	Santa Rita	21.035402999999999	-87.947342000000006	96	1
7808	0826	Santa Rosa	21.052643	-87.726009000000005	96	1
7809	0827	Oasis	21.170318000000002	-87.938991000000001	96	1
7810	0829	Santa Teresa	21.493901999999999	-87.954420999999996	96	1
7811	0830	Santa Teresita	21.148886000000001	-87.954318000000001	96	1
7812	0831	Santa Trinidad	21.475740999999999	-87.885698000000005	96	1
7813	0833	Sihomal	21.13026	-88.026703999999995	96	1
7814	0836	San Francisco Tres Bocas	21.459070000000001	-87.972673999999998	96	1
7815	0837	Tres Reyes	21.189004000000001	-87.762915000000007	96	1
7816	0838	Tres Reyes	21.103252999999999	-87.857050999999998	96	1
7817	0839	Tumba Pino	21.330093999999999	-87.750133000000005	96	1
7818	0840	Tzucpich Número Dos	21.107824999999998	-88.127161000000001	96	1
7819	0843	Santa Elena	21.402194000000001	-88.014718000000002	96	1
7820	0844	Uxmal	21.108820999999999	-87.902185000000003	96	1
7821	0845	Villa Concepción	21.365237	-87.767656000000002	96	1
7822	0846	Indimex	21.348963000000001	-87.711134999999999	96	1
7823	0847	William	21.427484	-87.757649000000001	96	1
7824	0848	Wollis-Há	21.3523	-87.833664999999996	96	1
7825	0849	X-Cail	21.239108999999999	-88.028622999999996	96	1
7826	0851	X-Can	21.0975	-87.981388999999993	96	1
7827	0852	X-Kanab (Santa Cruz X-Kanab)	21.154164000000002	-87.827299999999994	96	1
7828	0854	Xkanha	21.060950999999999	-87.757901000000004	96	1
7829	0857	El Pedregal	21.221729	-88.108913000000001	96	1
7830	0858	X-Lal	21.249683999999998	-88.015826000000004	96	1
7831	0859	Xlapak	21.059173999999999	-87.632717	96	1
7832	0860	Xlapak	21.104312	-88.053932000000003	96	1
7833	0863	Xnohuayum	21.295973	-88.152975999999995	96	1
7834	0864	San Antonio Tres	21.204021999999998	-88.223815000000002	96	1
7835	0865	X-Pabichén	21.187753000000001	-88.110287	96	1
7836	0866	X-Pech	21.139074000000001	-87.977524000000003	96	1
7837	0867	San José	21.168223000000001	-87.949183000000005	96	1
7838	0868	San Gabriel	21.259713000000001	-88.166278000000005	96	1
7839	0869	X-Uenkal	21.124224000000002	-88.184262000000004	96	1
7840	0870	San Román Yaxcabá	21.135052999999999	-88.102131	96	1
7841	0872	Yaxcabá	21.197002000000001	-88.177745999999999	96	1
7842	0873	Yaxché	21.232306000000001	-88.060561000000007	96	1
7843	0874	Xmantoras	21.406268000000001	-88.051471000000006	96	1
7844	0875	Yokpita	21.074919999999999	-88.073971999999998	96	1
7845	0877	Yokdzonot Mora	21.198761000000001	-88.053696000000002	96	1
7846	0878	San Andrés	21.360916	-87.715777000000003	96	1
7847	0881	Haltunchén	21.290071000000001	-88.181754999999995	96	1
7848	0884	Actún Pich	21.298673000000001	-87.939457000000004	96	1
7849	0886	Álamo	21.032938000000001	-87.642264999999995	96	1
7850	0888	San Jorge	21.44481	-87.775878000000006	96	1
7851	0889	San Martín	21.341891	-87.951785000000001	96	1
7852	0891	Santa Cruz	21.057613	-87.638651999999993	96	1
7853	0892	El Edén	21.372668999999998	-87.954042999999999	96	1
7854	0893	Santa Rita	21.358749	-88.029904000000002	96	1
7855	0894	Santa Elena	21.322700000000001	-88.054309000000003	96	1
7856	0897	San Isidro	21.192124	-87.955659999999995	96	1
7857	0898	El Puente	21.174931999999998	-87.927706999999998	96	1
7858	0899	Yoactún	21.131429000000001	-87.956254000000001	96	1
7859	0900	Tres Potrillos	21.084765000000001	-87.783823999999996	96	1
7860	0904	La Ceiba	21.130153	-87.807851999999997	96	1
7861	0905	Santa Rosa	21.374482	-87.761809	96	1
7862	0908	Santa Ana Dos	21.258752999999999	-87.763721000000004	96	1
7863	0910	San Bernardo	21.353014999999999	-87.749363000000002	96	1
7864	0911	San Fernando	21.429266999999999	-87.77928	96	1
7865	0912	Villa Concepción	21.443028999999999	-87.708488000000003	96	1
7866	0913	San Martín	21.495792999999999	-87.886868000000007	96	1
7867	0914	Paraíso	21.235510000000001	-87.680167999999995	96	1
7868	0915	Rancho Grande	21.242287000000001	-87.681149000000005	96	1
7869	0918	Tres Reyes	21.166357999999999	-88.121639000000002	96	1
7870	0920	Santa Trinidad	21.256077000000001	-88.040733000000003	96	1
7871	0922	San Agustín	21.287279000000002	-87.953218000000007	96	1
7872	0923	Tres Potrillos	21.292390999999999	-87.949670999999995	96	1
7873	0924	San Carlos	21.222480000000001	-88.173733999999996	96	1
7874	0926	Cuatro Soles	21.214953000000001	-88.207797999999997	96	1
7875	0928	Don Antonio	21.102709999999998	-88.158991	96	1
7876	0929	San Miguel	21.097079000000001	-88.155328999999995	96	1
7877	0939	Monterrey	21.169024	-88.160809	96	1
7878	0941	Todos Santos	21.169201000000001	-88.156903	96	1
7879	0942	Los Compadres	21.173978999999999	-88.162707999999995	96	1
7880	0943	San Enrique	21.174184	-88.164760999999999	96	1
7881	0946	Santa Lupita	21.155322999999999	-88.184376	96	1
7882	0947	Santa Teresa	21.134857	-88.202263000000002	96	1
7883	0949	La Dueña	21.144870000000001	-88.264223999999999	96	1
7884	0953	San Francisco	21.213336000000002	-88.244091999999995	96	1
7885	0954	Okotmax	21.222617	-88.077499000000003	96	1
7886	0956	Santa Isabel	21.198315000000001	-88.112718000000001	96	1
7887	0958	Buenavista	21.259421	-88.033143999999993	96	1
7888	0959	Santa Isabel	21.206382999999999	-88.117250999999996	96	1
7889	0960	San Antonio	21.245346999999999	-88.050102999999993	96	1
7890	0961	San Manuel	21.254334	-88.045993999999993	96	1
7891	0962	Santa Rosa	21.208708999999999	-88.159803999999994	96	1
7892	0964	Kikil Dos	21.216785999999999	-88.158083000000005	96	1
7893	0967	San José (Los Tres Hermanos)	21.22232	-88.152816999999999	96	1
7894	0970	San Juan	21.254939	-88.090798000000007	96	1
7895	0971	Rancho Nuevo	21.252768	-88.136636999999993	96	1
7896	0972	Santa Teresa	21.278775	-88.178531000000007	96	1
7897	0974	El Cerrito	21.226991999999999	-88.095116000000004	96	1
7898	0976	San Isidro	21.256685999999998	-88.090650999999994	96	1
7899	0977	San Manuel	21.215523000000001	-88.085747999999995	96	1
7900	0981	Candelaria	21.140062	-88.103568999999993	96	1
7901	0982	Amilcar	21.145900999999999	-88.113776000000001	96	1
7902	0984	San Isidro	21.125250000000001	-88.058426999999995	96	1
7903	0986	El Corralito	21.160070000000001	-88.019497999999999	96	1
7904	0988	El Potrillo	21.120274999999999	-88.051226999999997	96	1
7905	0993	Los Tres Hermanos	21.475193000000001	-87.681157999999996	96	1
7906	0994	San Jorge	21.474354999999999	-87.681471000000002	96	1
7907	0998	Chunkilín	21.510066999999999	-88.030078000000003	96	1
7908	1000	San Pedro	21.461110999999999	-87.630555999999999	96	1
7909	1001	San Pedro Sacboc	21.456672000000001	-87.643603999999996	96	1
7910	1002	El Oasis	21.180768	-88.064987000000002	96	1
7911	1003	Tres Reyes	21.147818000000001	-88.116529999999997	96	1
7912	1004	Chacalal	21.278497999999999	-88.158151000000004	96	1
7913	1006	San Francisco	21.229689	-87.672887000000003	96	1
7914	1007	Tres Marías	21.208544	-87.664946	96	1
7915	1009	Tres Cruces	21.27289	-87.787172999999996	96	1
7916	1010	San Vicente	21.139233999999998	-88.118046000000007	96	1
7917	1013	Santa Patricia Dos	21.103268	-88.161168000000004	96	1
7918	1017	San Judas Tadeo	21.140571000000001	-88.209936999999996	96	1
7919	1021	Concepción	21.164954999999999	-88.184314000000001	96	1
7920	1024	San Pedro	21.174354000000001	-88.158338999999998	96	1
7921	1030	San Isidro	21.144081	-88.069191000000004	96	1
7922	1031	Tres Reyes	21.129166999999999	-88.089444	96	1
7923	1033	Rancho Nuevo	21.110526	-88.027428	96	1
7924	1035	Las Trancas	21.171004	-88.150248000000005	96	1
7925	1042	El Colorado	21.172317	-88.125510000000006	96	1
7926	1043	Santa Cruz (San Rafael)	21.187885000000001	-88.127429000000006	96	1
7927	1044	Santa Rosa	21.185998000000001	-88.114935000000003	96	1
7928	1046	Ebché	21.196601000000001	-88.152456000000001	96	1
7929	1047	Cheroki	21.191337999999998	-88.120328999999998	96	1
7930	1050	El Paraíso	21.215298000000001	-88.106859	96	1
7931	1052	Linda Flor	21.164484000000002	-88.016239999999996	96	1
7932	1054	Las Rejas	21.238879000000001	-88.068316999999993	96	1
7933	1055	San Juan	21.248539999999998	-88.053470000000004	96	1
7934	1056	Yoactún	21.241455999999999	-88.072789	96	1
7935	1057	San Manuel	21.251836000000001	-88.078335999999993	96	1
7936	1058	San Marcos	21.273616000000001	-88.049514000000002	96	1
7937	1059	El Crucero	21.253377	-88.145573999999996	96	1
7938	1060	Santa Cruz	21.256720000000001	-88.143749999999997	96	1
7939	1065	Guadalupe	21.295669	-88.104619	96	1
7940	1068	Florida	21.331302999999998	-87.924294000000003	96	1
7941	1069	San Isidro	21.306296	-87.937308999999999	96	1
7942	1073	Avándaro	21.174156	-88.013565999999997	96	1
7943	1074	Cuzam	21.180817999999999	-88.038700000000006	96	1
7944	1078	Cuatro Caminos	21.109739999999999	-87.751105999999993	96	1
7945	1079	San José	21.075310000000002	-87.766793000000007	96	1
7946	1080	San Ignacio Dos	21.032425	-87.760845000000003	96	1
7947	1083	Samulá Candelaria	21.19276	-88.058223999999996	96	1
7948	1086	Diamante	21.143059999999998	-88.216971000000001	96	1
7949	1087	San Fernando Cach	21.047502999999999	-87.853785999999999	96	1
7950	1090	San José	21.037980999999998	-87.752885000000006	96	1
7951	1093	Chan Oxkal	21.217610000000001	-88.132867000000005	96	1
7952	1094	X-Cabil	21.204167000000002	-88.268998999999994	96	1
7953	1095	Los Limones	21.174444000000001	-88.140000000000001	96	1
7954	1096	San Felipe	21.177441999999999	-88.195164000000005	96	1
7955	1099	San Ignacio Yohdzadz	21.091539000000001	-88.211838	96	1
7956	1100	Xcanacruz	21.108595999999999	-88.076192000000006	96	1
7957	1101	Yoh-Cob	21.098168000000001	-88.039181999999997	96	1
7958	1107	Chan Patricia	21.343253000000001	-88.055627000000001	96	1
7959	1115	Santa Ana	21.424242	-87.938944000000006	96	1
7960	1117	San José	21.456600000000002	-87.824380000000005	96	1
7961	1120	Texas	21.426696	-87.839837000000003	96	1
7962	1121	Los Laureles	21.153468	-87.954950999999994	96	1
7963	1122	San Mateo	21.146013	-87.925064000000006	96	1
7964	1123	Las Potrancas	21.148201	-88.049429000000003	96	1
7965	1124	Santa Gabriela	21.403269000000002	-88.074753000000001	96	1
7966	1125	San Fernando	21.389612	-88.07347	96	1
7967	1126	Lirio	21.326841000000002	-88.130615000000006	96	1
7968	1131	Miramar	21.431093000000001	-87.979310999999996	96	1
7969	1134	Buena Esperanza	21.477443000000001	-87.906570000000002	96	1
7970	1136	San Isidro	21.493106000000001	-88.065246000000002	96	1
7971	1145	La Curva del Tigre	21.532737999999998	-88.033444000000003	96	1
7972	1152	El Rosario	21.530643999999999	-87.943731999999997	96	1
7973	1153	San Silvestre	21.454663	-87.715063999999998	96	1
7974	1154	Dos Leones	21.305591	-87.658958999999996	96	1
7975	1155	San Gabriel Número Dos	21.402203	-88.092125999999993	96	1
7976	1159	San Rafael (El Pedregal)	21.152864999999998	-88.025996000000006	96	1
7977	1160	Arizona	21.324400000000001	-88.123140000000006	96	1
7978	1162	Nabanché	21.164729999999999	-88.165614000000005	96	1
7979	1163	Blanca Flor	21.292076999999999	-88.202404999999999	96	1
7980	1165	Santo Domingo	21.175540000000002	-88.179874999999996	96	1
7981	1166	Las Elenas	21.183941000000001	-88.174266000000003	96	1
7982	1168	San Felipe	21.099930000000001	-88.153728999999998	96	1
7983	1169	San Martín	21.102222000000001	-88.155833000000001	96	1
7984	1170	Santa Isabel (Santa Rita)	21.181089	-88.176648999999998	96	1
7985	1171	El Ochenta y Nueve	21.166740999999998	-88.158124999999998	96	1
7986	1174	El Pocito	21.505586000000001	-87.958995999999999	96	1
7987	1175	La Abundancia	21.114597	-88.139498000000003	96	1
7988	1177	El Álamo	21.415436	-87.976489999999998	96	1
7989	1179	Las Américas	21.464365999999998	-87.707808	96	1
7990	1180	San Bernabé	21.255367	-88.042473000000001	96	1
7991	1181	La Bendición de Dios	21.487608999999999	-87.856155000000001	96	1
7992	1182	Bohchén	21.163703999999999	-88.175989999999999	96	1
7993	1184	El Cerrito	21.130278000000001	-87.884167000000005	96	1
7994	1185	Chacara Uberaba	21.152888000000001	-88.081822000000003	96	1
7995	1186	Yoactún	21.022085000000001	-87.841122999999996	96	1
7996	1187	Chan Santa Lucía	21.380825999999999	-88.124675999999994	96	1
7997	1188	Chan Santa Rosa	21.134041	-88.097065999999998	96	1
7998	1189	El Cacao	21.105528	-88.149812999999995	96	1
7999	1190	Chenchomac	21.192014	-88.092686	96	1
8000	1191	Chenteres	21.165253	-88.056325999999999	96	1
8001	1192	San Rafael	21.294291000000001	-88.044027999999997	96	1
8002	1193	Chun Hule	21.388065999999998	-87.716572999999997	96	1
8003	1194	Concepción	21.244844000000001	-87.919364000000002	96	1
8004	1195	Corral de Piedra	21.233566	-87.680065999999997	96	1
8005	1196	Maya Vista	21.186038	-88.164968999999999	96	1
8006	1197	Las Dalias	21.158875999999999	-88.138071999999994	96	1
8007	1198	Dos Arbolitos	21.167287000000002	-88.125973000000002	96	1
8008	1200	Dzidzilá	21.261375999999998	-87.928946999999994	96	1
8009	1201	Dzidzilché	21.074204000000002	-88.082808	96	1
8010	1202	Ejido Número Tres	21.214884999999999	-88.254603000000003	96	1
8011	1203	Emal San Lorenzo	21.519886	-87.890521000000007	96	1
8012	1204	Emmanuel	21.115570000000002	-88.078322999999997	96	1
8013	1209	Las Dos Hermanitas	21.473347	-87.674209000000005	96	1
8014	1210	Los Hermanos	21.211924	-88.081035	96	1
8015	1211	Jubichén	21.079999999999998	-88.015833000000001	96	1
8016	1212	Ignacio Zaragoza	21.403013999999999	-87.990036000000003	96	1
8017	1213	Ignacio Zaragoza	21.405386	-87.988332	96	1
8018	1214	Las Jabillas	21.161016	-88.075642999999999	96	1
8019	1215	San Carlos	21.201827000000002	-88.210678999999999	96	1
8020	1217	Kankabdzonot	21.009568000000002	-87.855137999999997	96	1
8021	1218	San Gregorio	20.971118000000001	-87.790520000000001	96	1
8022	1219	El Retiro	21.008544000000001	-87.747472000000002	96	1
8023	1220	Lerma	21.180268999999999	-88.129992999999999	96	1
8024	1221	Lilian Analí	21.470241999999999	-87.668501000000006	96	1
8025	1222	Limones	21.439012999999999	-87.963058000000004	96	1
8026	1223	Macalcuch	21.225085	-88.043929000000006	96	1
8027	1224	El Martillo	21.399166000000001	-87.712602000000004	96	1
8028	1225	Tres Hermanos	21.242805000000001	-87.940562999999997	96	1
8029	1226	El Mudo	21.401733	-88.002904000000001	96	1
8030	1227	San José	21.162768	-88.166725999999997	96	1
8031	1228	Ninguno [Núcleo Agrícola]	21.29935	-87.763557000000006	96	1
8032	1231	Chan Chen Número Uno	21.350759	-88.007148000000001	96	1
8033	1232	Pastejé	21.251805999999998	-87.931549000000004	96	1
8034	1233	San Judas	21.386150000000001	-88.113670999999997	96	1
8035	1234	El Pedregal	21.455323	-88.029886000000005	96	1
8036	1236	El Porvenir	21.099792000000001	-87.999352999999999	96	1
8037	1237	Pozo San Benito	21.290292999999998	-88.054427000000004	96	1
8038	1238	La Puesta del Sol	21.221686999999999	-88.175569999999993	96	1
8039	1240	Jaldzaz	21.415393999999999	-88.030325000000005	96	1
8040	1241	Ix-Chel	21.18693	-88.195931000000002	96	1
8041	1242	Rancho Nuevo	21.378685000000001	-87.899202000000002	96	1
8042	1243	La Rejollada	21.389817000000001	-87.992412000000002	96	1
8043	1244	El Paraíso	21.151506000000001	-88.081243000000001	96	1
8044	1245	Los Rosales	21.225142000000002	-88.154602999999994	96	1
8045	1246	Los Rosales	21.275735999999998	-88.162330999999995	96	1
8046	1247	Sahcachén	21.229609	-88.083253999999997	96	1
8047	1248	Sacabchén (Argote)	21.110037999999999	-88.138709000000006	96	1
8048	1249	San Agustín	21.179608000000002	-88.136653999999993	96	1
8049	1251	San Alberto	21.276803999999998	-87.891386999999995	96	1
8050	1252	San Alonso	21.180015999999998	-87.866980999999996	96	1
8051	1253	San Juan	21.241475999999999	-88.038832999999997	96	1
8052	1254	Los Tres Reyes	21.226233000000001	-88.103654000000006	96	1
8053	1255	San Anís	21.371696	-88.077748	96	1
8054	1256	La Calandria	21.135676	-88.089265999999995	96	1
8055	1257	San Francisco	21.126698999999999	-88.190994000000003	96	1
8056	1258	San Antonio	21.423929000000001	-87.888003999999995	96	1
8057	1259	San Antonio	21.400589	-87.800263000000001	96	1
8058	1260	San Antonio	21.468547999999998	-87.706193999999996	96	1
8059	1261	San Víctor	21.431187999999999	-87.882542999999998	96	1
8060	1263	Komichén (San Bernardo)	21.116909	-88.065183000000005	96	1
8061	1264	San Carlos	21.225712999999999	-88.070817000000005	96	1
8062	1265	San Emilio	21.405560999999999	-87.906936999999999	96	1
8063	1266	Los Tres Reyes	21.224398999999998	-88.205000999999996	96	1
8064	1267	San Enrique	21.261111	-88.052200999999997	96	1
8065	1268	San Enrique	21.400524000000001	-88.116449000000003	96	1
8066	1269	San Isidro	21.227753	-88.124623999999997	96	1
8067	1272	San Felipe	21.164604000000001	-87.723029999999994	96	1
8068	1273	San Fernando	21.235713000000001	-88.122817999999995	96	1
8069	1275	San Fernando	21.432706	-87.709102999999999	96	1
8070	1276	Tres Reyes	21.234667999999999	-88.096193999999997	96	1
8071	1277	San Miguel Número Dos	21.335920000000002	-87.793902000000003	96	1
8072	1278	San Francisco	21.429950999999999	-88.055995999999993	96	1
8073	1279	San Francisco	21.450906	-87.578894000000005	96	1
8074	1281	Altamar	21.429680000000001	-87.985890999999995	96	1
8075	1282	San Isidro	21.112276999999999	-88.221963000000002	96	1
8076	1284	San Isidro	21.460564999999999	-87.706976999999995	96	1
8077	1285	San Jacinto	21.453600000000002	-87.718728999999996	96	1
8078	1287	San Javier	21.463063999999999	-87.726523999999998	96	1
8079	1288	San Joaquín	21.119448999999999	-88.099638999999996	96	1
8080	1290	San Jorge	21.08531	-88.049467000000007	96	1
8081	1291	San Jorge	21.433492999999999	-88.013819999999996	96	1
8082	1293	San José	21.101445999999999	-88.174057000000005	96	1
8083	1294	San José	21.088222999999999	-88.041044999999997	96	1
8084	1295	San Chemas	21.136628999999999	-88.123841999999996	96	1
8085	1296	San José	21.082277000000001	-88.006602000000001	96	1
8086	1297	San José	21.135232999999999	-88.073269999999994	96	1
8087	1300	San José	21.175412999999999	-88.116021000000003	96	1
8088	1301	La Bendición de Dios	21.156987000000001	-88.076396000000003	96	1
8089	1302	San José Uno	21.158405999999999	-87.664377000000002	96	1
8090	1303	San José	21.387269	-88.116996999999998	96	1
8091	1305	San Juan	21.176732000000001	-88.173619000000002	96	1
8092	1306	San Juan	21.378584	-87.988028999999997	96	1
8093	1308	San Juan	21.463889000000002	-87.625	96	1
8094	1309	San Juan Uno	21.449051000000001	-87.994574999999998	96	1
8095	1310	San Judas Tadeo	21.426389	-87.635000000000005	96	1
8096	1312	San Lorenzo	21.403179999999999	-87.905063999999996	96	1
8097	1313	San Lucas	21.259664000000001	-88.082066999999995	96	1
8098	1314	Santa Rosa	21.256188000000002	-87.901201	96	1
8099	1316	Canán	21.167376999999998	-88.156892999999997	96	1
8100	1319	San Luis	21.4375	-87.656943999999996	96	1
8101	1322	San Juan	21.200903	-88.162350000000004	96	1
8102	1323	Gaoma	21.234003000000001	-88.020666000000006	96	1
8103	1324	San Manuel	21.152798000000001	-88.069044000000005	96	1
8104	1326	El Charro Negro	21.469999999999999	-87.696944000000002	96	1
8105	1327	San Manuel Número Dos	21.481138000000001	-87.691896999999997	96	1
8106	1329	San Martín	21.215883000000002	-88.066883000000004	96	1
8107	1330	San Eustaquio	21.474091000000001	-87.825810000000004	96	1
8108	1331	Nuevo México [Rancho]	21.090653	-87.819485	96	1
8109	1334	San Miguel	21.196985000000002	-87.855035999999998	96	1
8110	1335	San Miguel	21.273081000000001	-88.027416000000002	96	1
8111	1337	San Miguel	21.224236000000001	-87.714703999999998	96	1
8112	1338	San Pedro	21.386126999999998	-88.000376000000003	96	1
8113	1339	La Granja	21.388387000000002	-87.997544000000005	96	1
8114	1340	Los Venados	21.431944000000001	-87.665278000000001	96	1
8115	1343	San Pablo	21.411825	-88.019212999999993	96	1
8116	1344	San Silvestre	21.211182999999998	-88.087288999999998	96	1
8117	1345	San Isidro	21.156165999999999	-88.245902999999998	96	1
8118	1346	San Pedro	21.106304000000002	-88.052965999999998	96	1
8119	1347	San Pedro	21.115742999999998	-88.090968000000004	96	1
8120	1349	San Rafael	21.414080999999999	-87.947975999999997	96	1
8121	1352	San Roger	21.218499999999999	-88.074804	96	1
8122	1353	San Román	21.315529999999999	-88.013553000000002	96	1
8123	1354	San Santiago (Santiaguito)	21.416810999999999	-87.936820999999995	96	1
8124	1355	San Santiago	21.140045000000001	-88.034958000000003	96	1
8125	1356	San Serapio	21.445202999999999	-87.921706999999998	96	1
8126	1357	San Teófilo	21.476704999999999	-87.859263999999996	96	1
8127	1358	San Venancio	21.191351000000001	-88.121994000000001	96	1
8128	1359	San Vicente	21.231659000000001	-88.121176000000006	96	1
8129	1360	San Vicente	21.256149000000001	-88.197214000000002	96	1
8130	1362	San Vicente	21.496796	-87.787723999999997	96	1
8131	1363	Santa Candelaria	21.263590000000001	-88.047393	96	1
8132	1364	Candelaria	21.389990999999998	-87.909645999999995	96	1
8133	1367	Santa Concepción	21.280777	-87.622900999999999	96	1
8134	1368	Santa Cristina	21.132097000000002	-88.064532999999997	96	1
8135	1369	Santa Cruz	21.216066000000001	-87.943090999999995	96	1
8136	1370	Santa Cruz	21.264438999999999	-88.098776999999998	96	1
8137	1371	Santa Cruz	21.131456	-88.129602000000006	96	1
8138	1372	Santa Cruz	21.310683000000001	-88.032743999999994	96	1
8139	1373	Santa Cruz	21.390483	-87.980581000000001	96	1
8140	1374	Santa Eduviges	21.282731999999999	-88.020460999999997	96	1
8141	1376	Santa Elena	21.405854000000001	-88.084434000000002	96	1
8142	1377	Santa Elena	21.477049000000001	-87.977915999999993	96	1
8143	1378	Santa Fátima	21.213799000000002	-88.169321999999994	96	1
8144	1379	San Rafael	21.154537000000001	-88.178065000000004	96	1
8145	1380	Santa Graciela	21.395340999999998	-87.996438999999995	96	1
8146	1381	Santa Inés	21.406407000000002	-88.077460000000002	96	1
8147	1383	El Rosarito	21.175781000000001	-88.168347999999995	96	1
8148	1385	La Curva	21.483267000000001	-87.705860000000001	96	1
8149	1386	Santa Lucía Xpanhatoro	21.391202	-88.118393999999995	96	1
8150	1387	Santa Lupita	21.078195999999998	-88.041698999999994	96	1
8151	1389	Santa Patricia	21.167957999999999	-87.953100000000006	96	1
8152	1391	Santa Rita	21.228045000000002	-88.075138999999993	96	1
8153	1392	Santa Rita	21.122485000000001	-88.116934999999998	96	1
8154	1393	Santa Rita	21.411995999999998	-88.049673999999996	96	1
8155	1394	Santa Rosa	21.203025	-88.130604000000005	96	1
8156	1395	Santa Rosa	21.259353000000001	-88.109900999999994	96	1
8157	1396	San José	21.146221000000001	-88.108400000000003	96	1
8158	1397	Santo Domingo	21.407499999999999	-88.076667	96	1
8159	1398	San Isidro	21.170501000000002	-88.159477999999993	96	1
8160	1399	San Ramón	21.184263999999999	-88.123304000000005	96	1
8161	1400	Santa Elena	21.165735999999999	-88.135378000000003	96	1
8162	1401	Oasis Número Tres	21.291045	-87.908510000000007	96	1
8163	1402	San José	21.155998	-88.089928	96	1
8164	1403	San Carlos	21.163093	-88.129340999999997	96	1
8165	1404	Santa Cruz Uno	21.184329000000002	-88.134181999999996	96	1
8166	1405	San Isidro	21.159939999999999	-88.087338000000003	96	1
8167	1406	Las Jotas de Santa Julia	21.134910000000001	-88.212466000000006	96	1
8168	1408	Los Tres Reyes	21.092251999999998	-88.098832999999999	96	1
8169	1410	Ninguno	21.108332999999998	-88.091667000000001	96	1
8170	1411	Tumbenkuxtal San David Chumbec	21.113731000000001	-88.114804000000007	96	1
8171	1412	San Ignacio	21.073858999999999	-88.014256000000003	96	1
8172	1413	María Elena	21.166339000000001	-88.189205999999999	96	1
8173	1416	El Dólar	21.211528000000001	-88.203773999999996	96	1
8174	1417	Santa Julia	21.239243999999999	-88.043464999999998	96	1
8175	1418	Chan San Francisco	21.224602000000001	-88.083399	96	1
8176	1420	Ninguno	21.294862999999999	-88.053948000000005	96	1
8177	1426	El Jarocho	21.222151	-87.729607999999999	96	1
8178	1427	Santa Julia	21.247071999999999	-87.743998000000005	96	1
8179	1428	San Lorenzo	21.135898000000001	-87.954160000000002	96	1
8180	1429	Ninguno	21.402221999999998	-87.977778000000001	96	1
9978	0235	Xbac	20.618096000000001	-88.773094999999998	104	1
8181	1430	El Laurel	21.389216000000001	-87.717894000000001	96	1
8182	1432	Ninguno	21.436111	-87.660278000000005	96	1
8183	1433	Tumbotacho	21.427778	-87.633332999999993	96	1
8184	1434	Ninguno	21.428332999999999	-87.627778000000006	96	1
8185	1435	Ninguno	21.347318000000001	-87.712163000000004	96	1
8186	1436	La Isla	21.477222000000001	-87.706389000000001	96	1
8187	1437	Santa Cruz	21.470555999999998	-87.643056000000001	96	1
8188	1440	Ninguno	21.454167000000002	-87.569444000000004	96	1
8189	1442	Tabasquillo	21.150283999999999	-88.037477999999993	96	1
8190	1443	Tres Reyes	21.239639	-88.116853000000006	96	1
8191	1444	Tres Reyes	21.314924000000001	-87.911542999999995	96	1
8192	1446	Tzuc	21.050743000000001	-88.018669000000003	96	1
8193	1447	Tzucpich	21.118272999999999	-88.127522999999997	96	1
8194	1448	Vicente Guerrero	21.259871	-87.587978000000007	96	1
8195	1450	La Conchita	21.081023999999999	-87.792831000000007	96	1
8196	1451	Xpalma	21.239705000000001	-88.103842	96	1
8197	1452	Xpanbihá	21.020779000000001	-87.880999000000003	96	1
8198	1453	Xpop	21.085418000000001	-88.005311000000006	96	1
8199	1455	Yaxcabá	21.249935000000001	-87.937951999999996	96	1
8200	1456	Yohcop	21.108270999999998	-88.062312000000006	96	1
8201	1457	Yokdzonot	21.165037000000002	-88.089442000000005	96	1
8202	1458	Yokdzadz	21.100352999999998	-88.024485999999996	96	1
8203	1460	San Ramón	21.213325000000001	-88.087603000000001	96	1
8204	1462	San Manuel	21.076179	-88.055718999999996	96	1
8205	1464	Cenote Sábalo	21.417386	-87.595845999999995	96	1
8206	1465	Cleotilde Dos	21.232164000000001	-88.168347999999995	96	1
8207	1466	Guadalupe	21.399901	-88.006435999999994	96	1
8208	1468	San Pedro	21.189384	-87.708209999999994	96	1
8209	1471	El Ramonal	21.150348000000001	-88.093513000000002	96	1
8210	1472	San Antonio	21.228560999999999	-88.116414000000006	96	1
8211	1473	Claro de Luna	21.156579000000001	-87.707725999999994	96	1
8212	1474	San Isidro	21.247689000000001	-88.065558999999993	96	1
8213	1476	San Jorge	21.206188999999998	-88.177359999999993	96	1
8214	1477	San Jorge	21.152173999999999	-88.103091000000006	96	1
8215	1478	San José (San Jacinto)	21.207260000000002	-88.182292000000004	96	1
8216	1479	San José	21.158579	-88.101815999999999	96	1
8217	1480	San José	21.466667000000001	-87.646666999999994	96	1
8218	1481	San Juan	21.138483000000001	-88.080713000000003	96	1
8219	1482	La Dama y los Tres Caballeros	21.221551000000002	-87.737600999999998	96	1
8220	1484	San Luis	21.077580000000001	-87.805682000000004	96	1
8221	1485	San Manuel	21.420832999999998	-87.602500000000006	96	1
8222	1486	San Miguel	21.225190000000001	-88.116247000000001	96	1
8223	1487	San Miguel	21.203832999999999	-87.714766999999995	96	1
8224	1489	Santa Margarita	21.126812000000001	-88.129048999999995	96	1
8225	1491	Santo Domingo	21.184025999999999	-88.057803000000007	96	1
8226	1492	San Gabriel Número Uno	21.429186999999999	-87.704697999999993	96	1
8227	1493	Monte Pedro	21.167694999999998	-88.158613000000003	96	1
8228	1496	Yaxcabá	21.205088	-88.137623000000005	96	1
8229	1497	Rancho Chico	21.210032000000002	-88.121874000000005	96	1
8230	1499	Koopil	21.181187999999999	-88.117461000000006	96	1
8231	1500	San Antonio	21.212123999999999	-88.086466000000001	96	1
8232	1501	Kilómetro Once	21.22306	-88.069793000000004	96	1
8233	1502	San Martín	21.284081	-88.047083999999998	96	1
8234	1504	San José	21.149995000000001	-88.095948000000007	96	1
8235	1505	Caballeros	21.153946000000001	-88.095386000000005	96	1
8236	1506	Santa Cecilia	21.187089	-87.642043999999999	96	1
8237	1508	Las Margaritas	21.250926	-87.745857000000001	96	1
8238	1509	Ninguno	21.348725999999999	-87.750394	96	1
8239	1510	El Cardenal	21.400860000000002	-87.994411999999997	96	1
8240	1511	San Ángel	21.392261999999999	-87.993824000000004	96	1
8241	1512	Ninguno	21.432221999999999	-87.643889000000001	96	1
8242	1513	Ninguno	21.421666999999999	-87.612778000000006	96	1
8243	1515	Tres Reyes	21.164272	-87.667670000000001	96	1
8244	1516	Yodzadz	21.160245	-88.098995000000002	96	1
8245	1517	El Herradero	21.240041999999999	-88.175540999999996	96	1
8246	1518	El Esfuerzo	21.232178999999999	-88.084664000000004	96	1
8247	1520	Los Dos Robles	21.197534999999998	-88.168689999999998	96	1
8248	1521	Chun Yaxnic	21.213512999999999	-87.935993999999994	96	1
8249	1522	Emmanuel	21.005347	-87.629074000000003	96	1
8250	1523	Los Flamboyanes	21.237881999999999	-87.738720999999998	96	1
8251	1524	Lol Tun	21.191908999999999	-87.710051000000007	96	1
8252	1525	San Pablo	21.173110000000001	-87.657753999999997	96	1
8253	1526	El Forastero I	21.184546999999998	-87.648810999999995	96	1
8254	1527	Policarpo May	21.140288000000002	-87.693704999999994	96	1
8255	1528	San Manuel [Parcela]	21.120816000000001	-87.684055000000001	96	1
8256	1530	San Cosme	21.215983000000001	-87.940486000000007	96	1
8257	1531	Omar Lemos	21.252580999999999	-87.946008000000006	96	1
8258	1532	San Isidro	21.206596000000001	-87.659582999999998	96	1
8259	1533	Montecristo	21.096256	-87.689100999999994	96	1
8260	1534	El Oasis Dos	21.272179000000001	-87.907103000000006	96	1
8261	1535	Kanan Sayab	21.221439	-87.700089000000006	96	1
8262	1536	WW [Rancho]	21.104690000000002	-87.671927999999994	96	1
8263	1537	El Crucero	21.204930999999998	-87.722449999999995	96	1
8264	1538	San Carlos	21.196128000000002	-87.704305000000005	96	1
8265	1539	San Cristóbal	21.247419000000001	-87.926219000000003	96	1
8266	1540	San Francisco	21.228017999999999	-87.937308999999999	96	1
8267	1541	San Isidro	21.231560999999999	-87.684399999999997	96	1
8268	1542	San Jorge	21.240532999999999	-87.919528	96	1
8269	1543	San Miguelito	21.255893	-87.782606000000001	96	1
8270	1544	Santa Amalia	21.170339999999999	-87.725633000000002	96	1
8271	1545	Santa Ana Cinco	21.257667000000001	-87.758300000000006	96	1
8272	1546	Santa María	21.274559	-87.974300999999997	96	1
8273	1547	Las Tres Cruces	21.161259000000001	-87.682530999999997	96	1
8274	1548	Luis Echeverría Álvarez Uno [Unidad de Riego]	21.23047	-87.727908999999997	96	1
8275	1549	El Álamo	21.247070999999998	-88.064877999999993	96	1
8276	1550	El Reparo	21.175090000000001	-88.145600000000002	96	1
8277	1551	Buenos Aires	21.323917999999999	-87.951554000000002	96	1
8278	1552	La Bendición de Dios	21.140826000000001	-88.111493999999993	96	1
8279	1553	El Cedral	21.298525999999999	-87.928280000000001	96	1
8280	1554	El Cerrito	21.283270000000002	-87.989637999999999	96	1
8281	1555	Dos Robles	21.166423999999999	-88.170011000000002	96	1
8282	1556	San Bedher	21.194997999999998	-88.212644999999995	96	1
8283	1558	San Isidro Numero Uno	21.311131	-87.941237000000001	96	1
8284	1560	San Miguel Kilómetro Cuatro	21.181932	-88.122416999999999	96	1
8285	1562	Caballo Loco	21.200688	-88.212676999999999	96	1
8286	1563	Dos Potrillos	21.258610999999998	-88.022931999999997	96	1
8287	1564	Santa María	21.266341000000001	-87.998168000000007	96	1
8288	1565	El Escondido	21.147704999999998	-88.117582999999996	96	1
8289	1566	Esmeralda	21.274014000000001	-88.036868999999996	96	1
8290	1568	Flor de Río	21.271992999999998	-87.989568000000006	96	1
8291	1569	El Grano de Oro	21.297816999999998	-87.909130000000005	96	1
8292	1570	Guadalupe	21.229523	-88.113197999999997	96	1
8293	1571	San Dimas	21.178335000000001	-88.125416000000001	96	1
8294	1572	Comichén	21.120612999999999	-88.080389999999994	96	1
8295	1573	El Colorado	21.131847	-88.091938999999996	96	1
8296	1574	San Luis	21.128927000000001	-88.085916999999995	96	1
8297	1575	Guadalupana	21.139165999999999	-88.127526000000003	96	1
8298	1576	Sandoval	21.137418	-88.127780999999999	96	1
8299	1577	Sagrado Corazón	21.137474999999998	-88.070635999999993	96	1
8300	1578	Santa Ana	21.222864999999999	-88.033351999999994	96	1
8301	1579	Ninguno	21.207768000000002	-88.092568999999997	96	1
8302	1580	Jerusalén	21.094176999999998	-88.135097999999999	96	1
8303	1581	Florianí	21.164239999999999	-88.240495999999993	96	1
8304	1582	Ninguno	21.178563	-88.204750000000004	96	1
8305	1583	Santa Clara de Asís	21.185178000000001	-88.200705999999997	96	1
8306	1585	Ebenezer	21.182724	-88.190347000000003	96	1
8307	1586	Juan López	21.091933999999998	-88.217174	96	1
8308	1587	Ninguno	21.110448000000002	-88.193614999999994	96	1
8309	1588	San Román	21.138964000000001	-88.211059000000006	96	1
8310	1589	Santa Cruz	21.139952999999998	-88.209091999999998	96	1
8311	1590	Julián Fernández	21.103695999999999	-88.066857999999996	96	1
8312	1591	Santa Fe	21.100380000000001	-88.091166999999999	96	1
8313	1592	Librado Rejón	21.252002000000001	-88.083550000000002	96	1
8314	1593	Chocholá	21.189354999999999	-88.128658999999999	96	1
8315	1595	Santa Aracely	21.338875999999999	-87.898534999999995	96	1
8316	1597	Dzonot Kú	21.279152	-88.044238000000007	96	1
8317	1598	Roberto Canuto	21.290925000000001	-88.036967000000004	96	1
8318	1599	Victorioso	21.272811000000001	-88.046302999999995	96	1
8319	1600	Tigrillos Dos	21.265878000000001	-88.024671999999995	96	1
8320	1601	Monte Carmelo	21.265277999999999	-88.014722000000006	96	1
8321	1602	Santa Rosa	21.266748	-88.016670000000005	96	1
8322	1604	Santa Lucía	21.149867	-88.100133	96	1
8323	1606	San Judas Tadeo	21.157268999999999	-88.090761000000001	96	1
8324	1607	Hidalgo	21.172895	-88.076239000000001	96	1
8325	1608	Ninguno	21.155740999999999	-88.082060999999996	96	1
8326	1609	La Cabaña	21.331219999999998	-87.917463999999995	96	1
8327	1610	Tuzik	21.334554000000001	-87.945228999999998	96	1
8328	1611	Ninguno	21.32807	-87.953160999999994	96	1
8329	1612	San Andrés	21.297633999999999	-87.990117999999995	96	1
8330	1613	San José	21.290863000000002	-88.002938999999998	96	1
8331	1614	La Ilusión	21.290678	-87.980352999999994	96	1
8332	1615	San Manuel	21.301943999999999	-87.949444	96	1
8333	1616	Nopalitos	21.298805999999999	-87.910927999999998	96	1
8334	1618	Karina	21.139322	-88.078001999999998	96	1
8335	1619	Tuzikchén	21.194952000000001	-88.070142000000004	96	1
8336	1620	Komichén	21.154910000000001	-88.125673000000006	96	1
8337	1621	San Judas Tadeo	21.213259000000001	-88.158935999999997	96	1
8338	1622	Mina de Oro	21.098994000000001	-88.134259	96	1
8339	1623	Candelaria	21.284655000000001	-87.972314999999995	96	1
8340	1624	Los Primos	21.145440000000001	-88.171706999999998	96	1
8341	1625	El Ramonal	21.267033999999999	-88.007576999999998	96	1
8342	1626	San Martín Dos	21.133178000000001	-88.099976999999996	96	1
8343	1627	Rancho BR	21.223112	-88.096334999999996	96	1
8344	1628	El Retiro	21.199179000000001	-88.166656000000003	96	1
8345	1629	El Relicario	21.307628999999999	-87.954344000000006	96	1
8346	1631	San Ángel Libre Unión	21.318218000000002	-87.928939	96	1
8347	1633	Santa Cruz	21.149978999999998	-88.223995000000002	96	1
8348	1634	San Carlos	21.096205999999999	-88.234396000000004	96	1
8349	1635	San Daniel	21.078140999999999	-88.225607999999994	96	1
8350	1636	San Fernando	21.218347999999999	-88.084958999999998	96	1
8351	1637	San Fernando	21.092936000000002	-88.225890000000007	96	1
8352	1639	San Francisco	21.334299000000001	-87.935708000000005	96	1
8353	1640	Bb Junior	21.153755	-88.098403000000005	96	1
8354	1641	Guadalupe	21.097774000000001	-88.069446999999997	96	1
8355	1642	Las Palmas	21.258938000000001	-88.023043000000001	96	1
8356	1644	San José	21.147632999999999	-88.179034000000001	96	1
8357	1645	San José	21.127382000000001	-88.172329000000005	96	1
8358	1646	San Román	21.123586	-88.176141000000001	96	1
8359	1647	San José	21.100528000000001	-88.078894000000005	96	1
8360	1648	San José	21.107538000000002	-88.113647999999998	96	1
8361	1649	Las Dos Cruces	21.128768999999998	-88.129866000000007	96	1
8362	1650	San Juan	21.170856000000001	-88.090800000000002	96	1
8363	1651	San Julián	21.228702999999999	-88.153441999999998	96	1
8364	1653	San Luis	21.217676999999998	-88.140348000000003	96	1
8365	1655	San Miguel	21.233892999999998	-88.071163999999996	96	1
8366	1656	San Pastor	21.225683	-88.142043000000001	96	1
8367	1657	X-Lal	21.250917999999999	-88.019285999999994	96	1
8368	1658	San Pedro	21.205992999999999	-88.168992000000003	96	1
8369	1659	San Román	21.146591000000001	-88.196021999999999	96	1
8370	1660	San Francisco	21.217967999999999	-88.033918	96	1
8371	1662	Santa Cruz	21.094332000000001	-88.099919999999997	96	1
8372	1663	Santa Cruz	21.294233999999999	-88.033073999999999	96	1
8373	1664	Santa Elena	21.110638000000002	-88.083346000000006	96	1
8374	1665	Santa Elena	21.144449000000002	-88.080302000000003	96	1
8375	1666	Santa Elena	21.146139000000002	-88.115528999999995	96	1
8376	1667	Santa Inés	21.306764000000001	-87.932199999999995	96	1
8377	1668	La Guadalupana	21.113285999999999	-88.057556000000005	96	1
8378	1669	Los Tigrillos	21.263532999999999	-88.028696999999994	96	1
8379	1670	Santa Rita	21.133481	-88.211291000000003	96	1
8380	1671	Santa Rita	21.156981999999999	-88.129150999999993	96	1
8381	1673	La Gasera	21.109337	-88.158966000000007	96	1
8382	1674	La Herradura	21.127040000000001	-88.164268000000007	96	1
8383	1675	Los Tres Potrillos	21.308395000000001	-87.927122999999995	96	1
8384	1676	Tres Reyes	21.110195000000001	-88.069991000000002	96	1
8385	1677	Yoactún	21.096011000000001	-88.230502000000001	96	1
8386	1678	San Enrique	21.118206000000001	-88.107461000000001	96	1
8387	1679	El Almendro	21.019988999999999	-87.610943000000006	96	1
8388	1680	Víctor Manuel Chablé Couoh	20.994785	-87.571286999999998	96	1
8389	1681	San José	20.998342999999998	-87.595348999999999	96	1
8390	1683	San Isidro	21.251411999999998	-87.964654999999993	96	1
8391	1684	Prodilac	21.152455	-88.174182999999999	96	1
8392	1685	La Bendición de Dios	21.434443999999999	-87.653333000000003	96	1
8393	1686	El Bethel	21.417712999999999	-88.027009000000007	96	1
8394	1688	Caribe	21.343350000000001	-87.991112000000001	96	1
8395	1689	Tizimin [Centro de Capacitación Conagua]	21.161684000000001	-87.989108999999999	96	1
8396	1690	El Dos	21.439845999999999	-87.952573999999998	96	1
8397	1691	Las Dos Lagunas	21.435151999999999	-87.710542000000004	96	1
8398	1692	Los Dos Potrillos	21.016601999999999	-87.831137999999996	96	1
8399	1693	Dzodzil	21.160363	-88.071821999999997	96	1
8400	1694	Monterrey [Estancia]	21.164712000000002	-87.975993000000003	96	1
8401	1695	Guadalupe	21.072379999999999	-87.793716000000003	96	1
8402	1696	San Ignacio	21.026323999999999	-87.748974000000004	96	1
8403	1697	INIFAP [Centro de Investigación]	21.160788	-87.996115000000003	96	1
8404	1698	San Alberto Uno	21.317421	-87.986857999999998	96	1
8405	1700	San Manuel	21.406721000000001	-88.021186	96	1
8406	1701	Cenote Azul	21.405553999999999	-88.032437000000002	96	1
8407	1702	Ninguno	21.421389000000001	-87.614722	96	1
8408	1703	San Manuel Dos	21.459962999999998	-87.610833	96	1
8409	1704	El Pescadero	21.115293000000001	-88.180339000000004	96	1
8410	1705	San Isidoro	21.315235000000001	-87.952995000000001	96	1
8411	1706	Ninguno	20.995232999999999	-87.556933999999998	96	1
8412	1707	San Luis	21.116859000000002	-88.083533000000003	96	1
8413	1708	Xuial	21.146604	-88.052254000000005	96	1
8414	1709	Santa Rita	21.379338000000001	-87.686594999999997	96	1
8415	1711	San Jacinto	21.404278000000001	-88.009697000000003	96	1
8416	1712	Jesús de Nazaret	21.432500000000001	-87.662499999999994	96	1
8417	1713	El Pedregal	21.150670999999999	-88.073582999999999	96	1
8418	1714	El Perdido	21.435554	-87.676925999999995	96	1
8419	1715	El Porvenir	21.118551	-88.183418000000003	96	1
8420	1716	Santa Merly	21.162132	-88.066140000000004	96	1
8421	1717	Robles	21.419595999999999	-88.053821999999997	96	1
8422	1718	Santa Clara 2	21.390350000000002	-88.010897	96	1
8423	1719	San Isidro	21.437743999999999	-87.951577999999998	96	1
8424	1720	San Isidro	21.003979999999999	-87.808408	96	1
8425	1721	San Isidro	21.383475000000001	-87.911456999999999	96	1
8426	1722	San José	21.473077	-87.668858	96	1
8427	1723	San José	21.191666000000001	-87.881643999999994	96	1
8428	1724	San Luis	21.509893000000002	-88.012880999999993	96	1
8429	1725	San Manuel	21.514212000000001	-88.048049000000006	96	1
8430	1726	San Pedro	21.512747999999998	-87.656065999999996	96	1
8431	1727	San Pedro	21.103396	-88.085713999999996	96	1
8432	1728	San Pedro	21.175604	-88.026419000000004	96	1
8433	1729	San Pedro Tres	21.468610999999999	-87.636944	96	1
8434	1730	San Román	21.167109	-88.008116000000001	96	1
8435	1731	Santa María	21.417591000000002	-88.045300999999995	96	1
8436	1732	Santa María	21.322990000000001	-87.970715999999996	96	1
8437	1733	Santa María	21.120203	-88.170175	96	1
8438	1735	Santa Teresita	21.180575999999999	-87.653921999999994	96	1
8439	1736	La Tranca	21.150297999999999	-88.089873999999995	96	1
8440	1737	Xkaná	21.203088000000001	-88.078528000000006	96	1
8441	1738	Yohdzadz	21.369917000000001	-87.924733000000003	96	1
8442	1739	Canarias	21.135857999999999	-87.753449000000003	96	1
8443	1740	Cenote Azul	21.013808999999998	-87.889183000000003	96	1
8444	1741	Cielo y Tierra	21.241544999999999	-87.892341000000002	96	1
8445	1742	Cocoyol	21.04458	-87.694388000000004	96	1
8446	1743	Dos Calaveras	21.107074000000001	-87.772446000000002	96	1
8447	1744	Esperanza Dos	21.194444000000001	-87.677222	96	1
8448	1745	Flamboyán	21.168306000000001	-87.711012999999994	96	1
8449	1746	Monte Sinai [Rancho]	21.122805	-87.898793999999995	96	1
8450	1747	Kondzonot	20.998871000000001	-87.861193999999998	96	1
8451	1748	Libertad Dos	21.244271999999999	-87.781662999999995	96	1
8452	1749	Andrea	21.233059999999998	-87.738235000000003	96	1
8453	1750	Chibacanes	21.236991	-87.732173000000003	96	1
8454	1752	San Martín Caballero	21.121922000000001	-87.876540000000006	96	1
8455	1753	San Manuel	21.198698	-87.689997000000005	96	1
8456	1754	Yoc Actún	21.020347999999998	-87.687261000000007	96	1
8457	1756	San Enrique Dos	21.147221999999999	-87.733056000000005	96	1
8458	1757	San Martín	21.051971999999999	-87.78622	96	1
8459	1758	Petak	21.038349	-87.789883000000003	96	1
8460	1759	Vicente Torres	21.012991	-87.772126999999998	96	1
8461	1760	San Manuel	21.026613999999999	-87.781090000000006	96	1
8462	1761	San José	21.221111000000001	-87.9375	96	1
8463	1762	Luis Ochoa Ochoa	21.168803	-87.945171000000002	96	1
8464	1763	Yohdzadz	21.057835000000001	-87.825663000000006	96	1
8465	1765	Elmer Canto	21.181269	-87.917410000000004	96	1
8466	1766	Armando Polanco	21.143293	-87.940477999999999	96	1
8467	1767	Sucopó Dos	21.128095999999999	-87.971182999999996	96	1
8468	1768	San Guillermo	21.237925000000001	-87.725859999999997	96	1
8469	1769	El Naranjo	21.242259000000001	-87.988748000000001	96	1
8470	1770	El Naranjo	21.194191	-87.673519999999996	96	1
8471	1771	El Recuerdo	21.098317999999999	-87.823622	96	1
8472	1772	El Retiro (San Esteban)	21.218154999999999	-87.934714	96	1
8473	1773	Rosario Margarita	21.126605999999999	-87.886421999999996	96	1
8474	1774	La Rosita	21.018366	-87.815224999999998	96	1
8475	1775	San Carlos	21.245850000000001	-87.817177000000001	96	1
8476	1776	San José Cerros	21.129687000000001	-87.730587999999997	96	1
8477	1777	San Juan	21.150928	-87.704622999999998	96	1
8478	1778	San Juan Bautista	21.248684000000001	-87.905649999999994	96	1
8479	1779	San Nicolás	21.114854999999999	-87.893985999999998	96	1
8480	1780	San Luis	21.168641000000001	-87.682998999999995	96	1
8481	1781	San Luis Dos	21.164507	-87.912998999999999	96	1
8482	1782	San Manuel	21.115182999999998	-87.723787000000002	96	1
8483	1783	San Manuel Kilómetro Nueve	21.137913000000001	-87.697383000000002	96	1
8484	1784	San Marcos	21.141694000000001	-87.729384999999994	96	1
8485	1785	San Miguel	21.051074	-87.803461999999996	96	1
8486	1786	San Miguel Arcángel	21.217658	-87.716496000000006	96	1
8487	1787	San Raúl	21.20232	-87.788794999999993	96	1
8488	1788	Santa Elena Número Uno	21.198056000000001	-87.677778000000004	96	1
8489	1789	La Sigua	21.118395	-87.914940999999999	96	1
8490	1790	Trascorral	21.017126999999999	-87.746116000000001	96	1
8491	1791	Ximhá	21.048055999999999	-87.830832999999998	96	1
8492	1792	Yoc Actún	21.039083999999999	-87.668131000000002	96	1
8493	1793	Yokdzadz	21.170895999999999	-87.709198999999998	96	1
8494	1794	Marianito	21.176158000000001	-87.976797000000005	96	1
8495	1795	Lowa	21.152063999999999	-87.809016	96	1
8496	1796	Los Cedros	21.345828000000001	-87.709106000000006	96	1
8498	1798	Pancho Villa	21.357834	-87.902809000000005	96	1
8499	1799	Emmanuel	21.265388999999999	-87.951446000000004	96	1
8500	1800	La Libertad Tres	21.270897999999999	-87.773880000000005	96	1
8501	1801	Dzununcán	21.394466000000001	-87.716167999999996	96	1
8502	1802	Jorge Puerto	21.362227000000001	-87.887861000000001	96	1
8503	1803	Fátima del Rosario	21.325382000000001	-87.962622999999994	96	1
8504	1804	La Florida II	21.348284	-87.992101000000005	96	1
8505	1805	San José	21.318557999999999	-87.908968000000002	96	1
8506	1806	Nohoch Kín	21.258823	-87.988889	96	1
8507	1807	Jacobo Ek	21.281797999999998	-87.930702999999994	96	1
8508	1809	San Francisco	21.291038	-87.886570000000006	96	1
8509	1810	Santa Cruz	21.391855	-87.981386000000001	96	1
8510	1811	Alicia Puc	21.344203	-87.705003000000005	96	1
8511	1813	San Caballos	21.343415	-87.701356000000004	96	1
8512	1814	La Mosita	21.266931	-87.739902999999998	96	1
8513	1816	San Isidro	21.256326000000001	-87.693505999999999	96	1
8514	1817	San Agustin Dos	21.292551	-87.968890999999999	96	1
8515	1819	San Bernardo	21.349889000000001	-87.943706000000006	96	1
8516	1820	San Carlos	21.344208999999999	-87.662926999999996	96	1
8517	1821	San Claudio	21.396546000000001	-87.994917000000001	96	1
8518	1822	San Diego	21.349623999999999	-87.718862000000001	96	1
8519	1823	San Francisco	21.436948000000001	-87.708537000000007	96	1
8520	1824	San Francisco	21.360244999999999	-87.988225999999997	96	1
8521	1825	San Francisco Dos	21.375377	-87.986275000000006	96	1
8522	1826	San Isidro	21.282256	-87.907753999999997	96	1
8523	1827	San Javier	21.285219000000001	-87.925734000000006	96	1
8524	1828	San Luis Número Uno	21.256858999999999	-87.889994999999999	96	1
8525	1829	San Manuel	21.299579000000001	-87.995118000000005	96	1
8526	1830	San Manuel	21.448792999999998	-87.946859000000003	96	1
8527	1832	San Martín	21.399985999999998	-87.910597999999993	96	1
8528	1833	San Martín	21.276584	-87.981447000000003	96	1
8529	1835	San Miguel	21.356853999999998	-87.916561999999999	96	1
8530	1836	San Pedro	21.3462	-87.924895000000006	96	1
8531	1837	San Salvador	21.261044999999999	-87.959102999999999	96	1
8532	1838	Santa Clara Cinco	21.39537	-87.967212000000004	96	1
8533	1839	Santa Ermita	21.319711000000002	-87.921480000000003	96	1
8534	1840	Las Gabrielas Dos	21.421220999999999	-87.709496000000001	96	1
8535	1841	Santa Rita	21.433202000000001	-87.836721999999995	96	1
8536	1842	El Tumbo	21.421212000000001	-87.800291000000001	96	1
8537	1843	Los Cocos	21.291433000000001	-87.719909000000001	96	1
8538	1845	El Pocito	21.146446999999998	-87.747870000000006	96	1
8539	1847	Santa Ana	21.401769000000002	-87.886585999999994	96	1
8540	1848	San Antonio	21.446328999999999	-87.748487999999995	96	1
8541	1849	Los Dos Potrillos	21.188884000000002	-88.176051999999999	96	1
8542	1850	Las Lomas	21.148257999999998	-88.212406999999999	96	1
8543	1851	Gaoma Dos	21.238610999999999	-88.037261000000001	96	1
8544	1852	El Guamúchil	21.150686	-88.203704999999999	96	1
8545	1853	Kilómetro Dos	21.189164000000002	-88.179553999999996	96	1
8546	1854	Las Lomas	21.149602000000002	-88.216015999999996	96	1
8547	1855	La Roca	21.148575999999998	-88.193680999999998	96	1
8548	1856	Nuevo México (Chan San Antonio)	21.198879000000002	-88.270306000000005	96	1
8549	1857	La Reja	21.188486000000001	-88.167180999999999	96	1
8550	1858	Seyeb	21.106131000000001	-88.182868999999997	96	1
8551	1859	Ninguno	21.212520000000001	-88.013268999999994	96	1
8552	1860	San José	21.222349999999999	-88.013508999999999	96	1
8553	1861	Santa Elena	21.228261	-88.010641000000007	96	1
8554	1864	San Pedro	21.163874	-88.187730999999999	96	1
8555	1865	Cristino Xuluc	21.115542999999999	-88.198920000000001	96	1
8556	1866	Los Dos Potrillos	21.214344000000001	-88.169976000000005	96	1
8557	1867	El Peñiel	21.108476	-88.200000000000003	96	1
8558	1868	San Gabriel	21.101534000000001	-88.175809000000001	96	1
8559	1869	Purísima Concepción	21.189039000000001	-88.263643000000002	96	1
8560	1870	Chenkal	21.189031	-88.172414000000003	96	1
8561	1871	San Behder	21.100878000000002	-88.065281999999996	96	1
8562	1872	San Enrique	21.236304000000001	-88.250467999999998	96	1
8563	1873	San Francisco	21.100953000000001	-88.190853000000004	96	1
8564	1875	San Francisco	21.190249999999999	-88.181577000000004	96	1
8565	1876	San Jesús	21.080120000000001	-88.120825999999994	96	1
8566	1877	Guadalupe	21.190248	-88.186288000000005	96	1
8567	1878	San Juan	21.17248	-88.010129000000006	96	1
8568	1881	La Voluntad de Dios	21.188497999999999	-88.270545999999996	96	1
8569	1882	San Nicolás	21.135034999999998	-88.171732000000006	96	1
8570	1883	San Juan	21.107061999999999	-88.190866	96	1
8571	1884	Santa Clara	21.209008999999998	-88.173101000000003	96	1
8572	1885	Santa Elena	21.204049000000001	-88.261247999999995	96	1
8573	1886	Santa Rosario	21.229106000000002	-88.245686000000006	96	1
8574	1888	San Vicente	21.156606	-88.230231000000003	96	1
8575	1889	El Tajonal	21.232780000000002	-88.252673999999999	96	1
8576	1890	San Francisco	21.197955	-88.125754000000001	96	1
8577	1892	Cuauhtémoc	20.987841	-87.753612000000004	96	1
8578	1893	La Palma	20.999725000000002	-87.769054999999994	96	1
8579	1895	El Divino Niño	21.164124000000001	-87.989698000000004	96	1
8580	1896	Don Marcos	21.184237	-87.657420999999999	96	1
8581	1897	Los Cocoyoles	21.252161999999998	-87.74221	96	1
8582	1898	Ninguno	21.267499999999998	-87.75	96	1
8583	1899	San Juan	21.031486000000001	-87.778070999999997	96	1
8584	1901	Lluvia de Oro	21.16994	-87.658580000000001	96	1
8585	1902	El Potrillo	21.226111	-87.731110999999999	96	1
8586	1903	Armonía [Quinta]	21.227035000000001	-87.738077000000004	96	1
8587	1904	Sagrado Corazón de Jesús	21.189018999999998	-87.679215999999997	96	1
8588	1905	San Pablo	21.160610999999999	-88.014077	96	1
8589	1906	Santa Cruz	21.174785	-87.652519999999996	96	1
8590	1907	Santa Lucía	21.219957000000001	-87.728606999999997	96	1
8591	1908	Los Tres Hermanos	21.218841999999999	-87.711314999999999	96	1
8592	1910	San Felipe	21.005993	-87.818725999999998	96	1
8593	1911	San Adolfo	21.500775999999998	-87.890925999999993	96	1
8594	1912	San Esteban	21.504266999999999	-87.816815000000005	96	1
8595	1913	San Lorenzo	21.531120999999999	-87.867527999999993	96	1
8596	1914	San Luis	21.506829	-87.809044	96	1
8597	1915	Santa Dolores	21.508424999999999	-87.898137000000006	96	1
8598	1916	San Antonio	21.510781999999999	-87.831636000000003	96	1
8599	1917	Tres Hermanos	21.516241000000001	-87.870199	96	1
8600	1918	San Isidro	20.997969000000001	-87.932619000000003	96	1
8601	1919	Amajax	21.297499999999999	-87.911111000000005	96	1
8602	1920	Caballo Dorado	21.284780000000001	-88.039951000000002	96	1
8603	1922	San Miguel Arcángel	21.187515999999999	-87.896158	96	1
8604	1923	Cow Boy [Anexa]	21.183333000000001	-87.906943999999996	96	1
8605	1924	Dos Hermanos	21.145399000000001	-88.203506000000004	96	1
8606	1925	El Barranco	21.095488	-88.030313000000007	96	1
8607	1927	El Coyote	21.178436000000001	-88.199954000000005	96	1
8608	1928	El Triunfo	21.357524999999999	-87.972903000000002	96	1
8609	1929	La Espuela	21.376059000000001	-87.881148999999994	96	1
8610	1930	La Hondonada	21.102072	-88.175860999999998	96	1
8611	1931	La Sorpresa	21.276667	-87.716667000000001	96	1
8612	1932	Las Higueras	21.145192999999999	-88.167379999999994	96	1
8613	1933	Las Nubes	21.187266999999999	-88.121649000000005	96	1
8614	1934	San Francisco	21.468074000000001	-87.864099999999993	96	1
8615	1935	San Manuel	21.316842999999999	-87.940984999999998	96	1
8616	1936	Mario Gamboa [Anexa San Martín]	21.436865999999998	-88.005638000000005	96	1
8617	1939	San Luis Santos	21.259792999999998	-87.563795999999996	96	1
8618	1940	Girasoles	21.103670999999999	-88.092911000000001	96	1
8619	1943	San Agustín	21.143910999999999	-88.193003000000004	96	1
8620	1945	Capricornio	21.209655999999999	-88.126636000000005	96	1
8621	1946	Santa María Dos	21.237788999999999	-88.046711000000002	96	1
8622	1947	San José	21.246241000000001	-88.033264000000003	96	1
8623	1948	San Francisco	21.248011000000002	-88.032184999999998	96	1
8624	1949	San José	21.243797000000001	-88.047206000000003	96	1
8625	1950	Yokdzadz	21.15794	-88.107703000000001	96	1
8626	1951	San Diego	21.157005000000002	-88.103510999999997	96	1
8627	1952	Feliciano Poot	21.462778	-87.632221999999999	96	1
8628	1953	Monte Sinaí	21.276402000000001	-87.728105999999997	96	1
8629	1954	Yunchen	21.210394999999998	-88.123857000000001	96	1
8630	1955	San Enrique	21.221381000000001	-87.717113999999995	96	1
8631	1956	San Gabriel	21.352353000000001	-87.977288000000001	96	1
8632	1957	Santa Raquel	21.15165	-88.178765999999996	96	1
8633	1958	San Isidro	21.249077	-88.083473999999995	96	1
8634	1959	San José	21.321152999999999	-87.926573000000005	96	1
8635	1962	San Martín	21.125102999999999	-87.869922000000003	96	1
8636	1963	San Rafael	21.137508	-88.171807999999999	96	1
8637	1964	San Sebastián	21.122722	-88.187094999999999	96	1
8638	1965	El Escondido	21.278207999999999	-87.981228000000002	96	1
8639	1967	Santa Elena	21.264564	-88.035799999999995	96	1
8640	1968	Santa Martha	21.318591000000001	-87.912908000000002	96	1
8641	1969	Santa Martha	21.146221000000001	-88.213243000000006	96	1
8642	1970	Shacachén Uno	21.208333	-88.125	96	1
8643	1971	El Achiote	21.121993	-87.613431000000006	96	1
8644	1972	Bugambilias	21.143712000000001	-87.626517000000007	96	1
8645	1973	El Álamo	21.173100999999999	-87.577494999999999	96	1
8646	1975	San Antonio	21.080606	-87.620187999999999	96	1
8647	1976	Campana	21.122962999999999	-87.626946000000004	96	1
8648	1977	Los Caporales	21.201519000000001	-87.608103999999997	96	1
8649	1978	El Colorado	21.198269	-87.587823999999998	96	1
8650	1979	Dos Hermanos	21.091169000000001	-87.635919000000001	96	1
8651	1980	Emiliano Zapata Primero	21.222975999999999	-87.553498000000005	96	1
8652	1982	La Escondida	21.075050000000001	-87.646800999999996	96	1
8653	1983	San Antonio	21.185030000000001	-87.609784000000005	96	1
8654	1984	San Francisco	21.191068999999999	-87.610130999999996	96	1
8655	1985	Los Gavilanes	21.170902000000002	-87.571888000000001	96	1
8656	1986	El Girasol	21.181159000000001	-87.629383000000004	96	1
8657	1987	Hal-Be	21.146944000000001	-87.554542999999995	96	1
8658	1988	Kontinta	21.082657999999999	-87.613201000000004	96	1
8659	1989	Cocoyol	21.137899999999998	-87.541805999999994	96	1
8660	1992	Noh Cachí	21.207189	-87.580862999999994	96	1
8661	1993	El Palmar	21.203458999999999	-87.622985999999997	96	1
8662	1994	Las Palmas	20.969237	-87.554858999999993	96	1
8663	1995	Quintana	21.180281000000001	-87.621536000000006	96	1
8664	1996	Rancho Margely	21.155487999999998	-87.612612999999996	96	1
8665	1997	El Roble II	21.176949	-87.612291999999997	96	1
8666	1998	Cuatro Más Una	21.160910999999999	-87.564373000000003	96	1
8667	1999	San Antonio	21.074168	-87.566248000000002	96	1
8668	2000	San Antonio	21.098382999999998	-87.644130000000004	96	1
8669	2001	San Arsenio	21.165009000000001	-87.571622000000005	96	1
8670	2002	San Manuel	21.225966	-87.594735999999997	96	1
8671	2003	San Martín	21.235523000000001	-87.568144000000004	96	1
8672	2004	San Antonio	21.228141999999998	-87.595080999999993	96	1
8673	2005	San Miguel Dos	21.244823	-87.604230999999999	96	1
8674	2006	San Román	21.177447999999998	-87.596050000000005	96	1
8675	2007	Santa Clara	21.114635	-87.642825999999999	96	1
8676	2008	Santa Dorita	21.196897	-87.592858000000007	96	1
8677	2009	San Miguel	21.247001999999998	-88.003304999999997	96	1
8678	2010	Flanguyanes	21.241202999999999	-87.713701	96	1
8679	2011	La Guadalupe	21.477945999999999	-87.705562999999998	96	1
8680	2013	El Palomar Dos	21.233353000000001	-87.673646000000005	96	1
8681	2014	San Marcos	21.483616000000001	-87.698245	96	1
8682	2015	Santa Cecilia	21.156444	-87.688418999999996	96	1
8683	2016	Gala [Agropecuario]	21.177682999999998	-88.181089999999998	96	1
8684	2017	Los Almendros	21.155550999999999	-88.134268000000006	96	1
8685	2018	Los Aluxes	21.317364999999999	-87.756953999999993	96	1
8686	2020	La Lechería	21.258959000000001	-87.830117999999999	96	1
8687	2021	Los Cinco Hermanos	21.274808	-87.600263999999996	96	1
8688	2022	Los Dátiles	21.157464999999998	-88.027848000000006	96	1
8689	2023	El Divino Maestro	21.139036999999998	-88.032820999999998	96	1
8690	2024	Asunción	21.103704	-88.157150000000001	96	1
8691	2025	Dos Hermanos	21.122222000000001	-88.054444000000004	96	1
8692	2026	La Esperanza	21.215971	-88.116088000000005	96	1
8693	2027	La Esperanza	21.082664999999999	-87.673312999999993	96	1
8694	2028	Finca de Mora	21.207975000000001	-88.202973999999998	96	1
8695	2029	La Gracia de Dios	21.095571	-87.700416000000004	96	1
8696	2030	La Guadalupana	21.325555999999999	-87.934167000000002	96	1
8697	2031	La Guajira	21.214003999999999	-88.050084999999996	96	1
8698	2032	Linda Flor	21.099815	-88.151138000000003	96	1
8699	2033	Norberto Can Canché	21.103704	-88.158945000000003	96	1
8700	2034	Santa Gertrudis	21.164117000000001	-88.136863000000005	96	1
8701	2035	Doctor Eduardo Pasos	21.164648	-88.131997999999996	96	1
8702	2036	Samuel	21.125157999999999	-88.182633999999993	96	1
8703	2037	San Luis	21.128468000000002	-88.101635000000002	96	1
8704	2040	San Rigoberto	21.168365999999999	-88.185595000000006	96	1
8705	2044	Ninguno	21.316119	-88.000229000000004	96	1
8706	2045	Ninguno	21.326401000000001	-87.995497	96	1
8707	2047	Mi Terruño	21.131468999999999	-87.950640000000007	96	1
9979	0236	Xkom	20.620833000000001	-88.6875	104	1
8708	2048	Dos Hermanos	21.48039	-87.691293999999999	96	1
8709	2049	San Fernando	21.479444000000001	-87.687036000000006	96	1
8710	2051	Los Magueyes	21.162751	-88.185122000000007	96	1
8711	2052	Tizimín [Materiales y Triturados]	21.107054000000002	-88.160805999999994	96	1
8712	2053	Mis Dos Tesoros	21.243734	-87.739570000000001	96	1
8713	2054	El Pocito	21.226416	-88.240973999999994	96	1
8714	2055	El Porvenir	21.095645999999999	-88.161557999999999	96	1
8715	2056	Rancho Chico	21.182500000000001	-87.636388999999994	96	1
8716	2058	Recinto Ferial Tizimín	21.160753	-88.177466999999993	96	1
8717	2059	La Respuesta	21.273918999999999	-87.604827	96	1
8718	2060	Los Reyes	21.160070000000001	-88.163365999999996	96	1
8719	2061	El Rincón	21.320423000000002	-88.032410999999996	96	1
8720	2063	Sahcadzonot	21.211179000000001	-88.124702999999997	96	1
8721	2064	San Agustín	21.311912	-88.100040000000007	96	1
8722	2066	San Ángel	21.215060999999999	-88.110791000000006	96	1
8723	2067	San Antonio	21.385732000000001	-88.074976000000007	96	1
8724	2068	San Carlos	21.169461999999999	-88.18347	96	1
8725	2069	San Eduardo	21.315646000000001	-87.983772999999999	96	1
8726	2070	San Antonio Dos	21.414026	-88.057935999999998	96	1
8727	2071	San Jorge (Anexa San Juan)	21.370242999999999	-88.077704999999995	96	1
8728	2072	San Enrique Kabichén	21.115600000000001	-87.898578999999998	96	1
8729	2073	San Francisco Dos	21.089893	-87.855376000000007	96	1
8730	2074	San Gabriel	21.091832	-88.222092000000004	96	1
8731	2075	San Grabriel	21.099443999999998	-88.169647999999995	96	1
8732	2076	San Isidro Dos	21.280663000000001	-87.606612999999996	96	1
8733	2077	San Jorge	21.301646999999999	-88.069412	96	1
8734	2078	San Jorge	21.36731	-88.079297999999994	96	1
8735	2079	San José	21.246808999999999	-88.036328999999995	96	1
8736	2080	San Juan	21.116021	-88.188530999999998	96	1
8737	2081	San Judas Tadeo	21.168969000000001	-88.164445999999998	96	1
8738	2082	San Leonardo	21.319358999999999	-88.094682000000006	96	1
8739	2083	San Marcos	21.268193	-87.922989000000001	96	1
8740	2085	San Martín II	21.242773	-88.029764	96	1
8741	2088	San Vicente	21.141618999999999	-88.030471000000006	96	1
8742	2089	Santa Cecilia	21.375309999999999	-87.734128999999996	96	1
8743	2090	Santa Cruz	21.186401	-88.207435000000004	96	1
8744	2091	Santa Fe	21.138332999999999	-88.077222000000006	96	1
8745	2092	Santa Inés Dos	21.145555999999999	-88.080278000000007	96	1
8746	2093	Santa María	21.215748000000001	-88.207711000000003	96	1
8747	2094	Santa Rosa	21.203333000000001	-87.870277999999999	96	1
8748	2095	Santa Rosa	21.107126999999998	-88.158242999999999	96	1
8749	2096	Santa Rosa	21.311857	-88.102683999999996	96	1
8750	2099	Sinaí	21.292902999999999	-88.015208999999999	96	1
8751	2100	Sucilá	21.109482	-88.191084000000004	96	1
8752	2101	Los Tres Chakitos	21.245576	-87.752549000000002	96	1
8753	2102	Tres Estrellas	21.10529	-88.158811999999998	96	1
8754	2103	Tres Reyes	21.141839000000001	-88.032156000000001	96	1
8755	2104	Tulipanes	21.269953000000001	-87.993881000000002	96	1
8756	2105	La Ubre	21.400493000000001	-88.109425999999999	96	1
8757	2107	El Wanal	21.308761000000001	-88.104669000000001	96	1
8758	2108	Yohsascab	21.128610999999999	-88.174166999999997	96	1
8759	2109	El Corral	21.091004000000002	-88.160903000000005	96	1
8760	2110	La Bendición de Dios	21.160520999999999	-87.711843000000002	96	1
8761	2111	La Bendición de Dios	21.191800000000001	-87.545094000000006	96	1
8762	2112	Cannan	21.148924000000001	-88.197435999999996	96	1
8763	2114	La Curva	21.264341999999999	-87.737587000000005	96	1
8764	2115	Don Cleotilde	21.230117	-88.178291999999999	96	1
8765	2116	Los Dos Robles	21.166414	-88.168316000000004	96	1
8766	2117	Los Flamboyanes	21.259001000000001	-87.758520000000004	96	1
8767	2119	La Hoyanca	21.146877	-87.617717999999996	96	1
8768	2120	Kankaja	21.204564000000001	-88.125964999999994	96	1
8769	2121	Liborio May	21.230511	-87.572416000000004	96	1
8770	2122	Limonar 1	21.210861000000001	-87.584809000000007	96	1
8771	2124	Las Palomas	21.209551999999999	-88.163579999999996	96	1
8772	2125	El Paraíso	21.175917999999999	-88.070652999999993	96	1
8773	2126	El Paraíso	21.293472999999999	-87.989525999999998	96	1
8774	2127	Las Piedras	21.111146000000002	-88.080185	96	1
8775	2128	Las Quintas	21.134097000000001	-88.184158999999994	96	1
8776	2129	El Roble Dos	21.192451999999999	-87.639474000000007	96	1
8777	2130	San Agustín	21.146450999999999	-88.193207999999998	96	1
8778	2131	San Antonio	21.194955	-88.198569000000006	96	1
8779	2132	San Antonio	21.159081	-88.134848000000005	96	1
8780	2133	San Antonio	21.457806000000001	-87.643503999999993	96	1
8781	2134	San Felipe	21.232531999999999	-87.600532999999999	96	1
8782	2135	San Francisco	21.284521999999999	-88.209694999999996	96	1
8783	2136	San Francisco	21.252777999999999	-87.697221999999996	96	1
8784	2137	San Isidro	21.107641000000001	-88.177271000000005	96	1
8785	2138	San Isidro	21.159447	-88.187169999999995	96	1
8786	2139	San Isidro	21.100113	-88.057297000000005	96	1
8787	2140	San Jorge	21.144895000000002	-88.209942999999996	96	1
8788	2141	San José	21.150455999999998	-88.096872000000005	96	1
8789	2142	San Judas Tadeo	21.206928999999999	-88.099349000000004	96	1
8790	2143	San Martín Uno	21.134312000000001	-88.109333000000007	96	1
8791	2144	San Miguel Uno	21.244437999999999	-87.598271999999994	96	1
8792	2145	San Nicolás	21.269285	-87.991145000000003	96	1
8793	2146	Santa Ana (Libre Unión)	21.316872	-87.931931000000006	96	1
8794	2147	Santa Bárbara	21.142431999999999	-88.205107999999996	96	1
8795	2148	Santa Carolina	21.204044	-88.160760999999994	96	1
8796	2149	Santa Gilda	21.197683000000001	-88.203841999999995	96	1
8797	2150	Santa Margarita	21.158525000000001	-88.184685000000002	96	1
8798	2151	Santa María	21.219280999999999	-88.083747000000002	96	1
8799	2152	Santa Otila	21.099253999999998	-88.167428999999998	96	1
8800	2153	Santa Rosalía	21.209605	-88.168313999999995	96	1
8801	2154	Santísima	21.443959	-87.708251000000004	96	1
8802	2155	Susulá	21.169727000000002	-87.881136999999995	96	1
8803	2156	Yohactún	21.207847999999998	-88.257942	96	1
8804	2157	Sagrado Corazón	21.248308000000002	-87.919477999999998	96	1
8805	2158	Dos Hermanos	21.153319	-88.076227000000003	96	1
8806	2159	Milagroso	21.175756	-88.088026999999997	96	1
8807	2160	Santa Candelaria	21.253496999999999	-88.043943999999996	96	1
8808	2161	San Judas Tadeo	21.109926999999999	-88.038510000000002	96	1
8809	2162	San Antonio	21.157214	-88.135208000000006	96	1
8810	2163	San Enrique	21.231857000000002	-88.248497999999998	96	1
8811	2164	Santa Gabriela	21.175917999999999	-88.187252000000001	96	1
8812	2165	San Vicente	21.322372000000001	-87.929913999999997	96	1
8813	2166	Luis Gregorio Chan Chan	21.303106	-87.947140000000005	96	1
8814	2168	San Isidro	21.257792999999999	-88.016696999999994	96	1
8815	2169	El Paraíso	21.365846999999999	-87.945801000000003	96	1
8816	2170	San Manuel	21.194258999999999	-87.688942999999995	96	1
8817	2171	San Juan	21.170293000000001	-87.945758999999995	96	1
8818	2173	San Román	21.133998999999999	-87.935169000000002	96	1
8819	2174	Tres Copas	21.141811000000001	-88.030989000000005	96	1
8820	2175	Santa María	21.103498999999999	-87.669977000000003	96	1
8821	2176	Yaax-kaaj Uno	21.022971999999999	-87.679654999999997	96	1
8822	2177	Las Cinco Hermanas	21.232410999999999	-87.575492999999994	96	1
8823	2178	San Martín	21.524246999999999	-88.096615999999997	96	1
8824	2179	Oriente [Crematorio]	21.08503	-88.161634000000006	96	1
8825	2180	Chel Canuto	21.184728	-88.194480999999996	96	1
8826	2181	La Guadalupana	21.106881000000001	-88.099883000000005	96	1
8827	2182	San José	21.108508	-88.056183000000004	96	1
8828	2183	Candela Tizimín	21.146283	-88.119589000000005	96	1
8829	2184	Monforte	21.146305999999999	-88.122343999999998	96	1
8830	2185	Villa Guadalupe	21.125097	-88.146163999999999	96	1
8831	0001	Tunkás	20.902349999999998	-88.752279000000001	97	1
8832	0003	Chahua	20.935929000000002	-88.766514000000001	97	1
8833	0004	Kancabchén	20.920846000000001	-88.815200000000004	97	1
8834	0005	San José Pibtuch	20.946541	-88.674780999999996	97	1
8835	0006	San Isidro Pixtón	20.834419	-88.755441000000005	97	1
8836	0007	San Antonio Chuc	20.813036	-88.779616000000004	97	1
8837	0009	Kancabal	20.892372999999999	-88.819146000000003	97	1
8838	0010	San Román	20.828216000000001	-88.803928999999997	97	1
8839	0011	X-Mactún	20.882570000000001	-88.803841000000006	97	1
8840	0012	Santa Clara	20.893142999999998	-88.757315000000006	97	1
8841	0018	Chabak	20.911348	-88.830318000000005	97	1
8842	0019	El Tiburón	20.901021	-88.821933000000001	97	1
8843	0020	Cholul	20.897189000000001	-88.786308000000005	97	1
8844	0023	San Antonio Tepakán	20.871231999999999	-88.686515999999997	97	1
8845	0025	Kancabchén	20.861782000000002	-88.763891999999998	97	1
8846	0030	Chakán Ebulá	20.789280000000002	-88.696825000000004	97	1
8847	0032	Chandzonot	20.813015	-88.693304999999995	97	1
8848	0035	Dziuché	20.888923999999999	-88.719517999999994	97	1
8849	0038	Ninguno [UAIM]	20.914034999999998	-88.739388000000005	97	1
8850	0041	Kancabdzonot	20.853657999999999	-88.717217000000005	97	1
8851	0043	Santos Llanes	20.917656000000001	-88.733442999999994	97	1
8852	0047	Noc-Ac	20.870408000000001	-88.705596999999997	97	1
8853	0050	X-Topil	20.996867000000002	-88.732033000000001	97	1
8854	0051	San Agustín	20.996489	-88.734264999999994	97	1
8855	0055	San Francisco	20.894213000000001	-88.783674000000005	97	1
8856	0058	Kanasuytún	20.850315999999999	-88.816804000000005	97	1
8857	0059	San Luis	20.889441999999999	-88.752786999999998	97	1
8858	0060	San Pedro	20.891241999999998	-88.749972	97	1
8859	0062	Santa Cruz	20.913287	-88.737834000000007	97	1
8860	0063	Santa Cruz	21.014714999999999	-88.720361999999994	97	1
8861	0064	Santok	21.024799999999999	-88.707170000000005	97	1
8862	0065	Tukichén	20.888587999999999	-88.780958999999996	97	1
8863	0067	Ubichén	20.918523	-88.729494000000003	97	1
8864	0068	Onichén	20.835279	-88.840742000000006	97	1
8865	0076	Xtóhil	20.958594000000002	-88.757143999999997	97	1
8866	0079	Yaxhá	20.786802999999999	-88.721902999999998	97	1
8867	0081	San José	20.891493000000001	-88.802339000000003	97	1
8868	0083	Santa Rosa	20.776906	-88.691826000000006	97	1
8869	0087	San Carlos	20.879849	-88.739936	97	1
8870	0093	Tabichén	20.778984999999999	-88.728812000000005	97	1
8871	0094	Tixcancal Carrillo	20.782814999999999	-88.729506999999998	97	1
8872	0096	San Esteban	20.905404000000001	-88.841908000000004	97	1
8873	0097	San Jorge	20.90016	-88.768738999999997	97	1
8874	0100	Chucab	20.907838999999999	-88.762660999999994	97	1
8875	0101	Jordán	20.792631	-88.694497999999996	97	1
8876	0102	Nicte-Há	21.010449000000001	-88.725831999999997	97	1
8877	0103	San Gregorio	20.901743	-88.720609999999994	97	1
8878	0105	Centro Bachillerato Tecnológico Agropecuario	20.913404	-88.739812999999998	97	1
8879	0106	Chun-Ox	21.001417	-88.728127000000001	97	1
8880	0107	Kispay	20.977656	-88.745956000000007	97	1
8881	0108	San Antonio de Abad	20.925923999999998	-88.722174999999993	97	1
8882	0109	Top Tux	20.851362000000002	-88.676454000000007	97	1
8883	0110	San Juan	20.799398	-88.787550999999993	97	1
8884	0111	El Palmar	20.902145000000001	-88.825770000000006	97	1
8885	0112	Colonia del Sur	20.887557000000001	-88.751670000000004	97	1
8886	0113	El Divino Maestro	20.85286	-88.762956000000003	97	1
8887	0114	Ekbalam	20.896279	-88.678120000000007	97	1
8888	0115	Ninguno	20.910356	-88.852371000000005	97	1
8889	0116	Santa Cruz Dos	20.916349	-88.734396000000004	97	1
8890	0117	San Francisco	20.896000000000001	-88.764443999999997	97	1
8891	0001	Tzucacab	20.071932	-89.050330000000002	98	1
8892	0002	El Águila	19.820667	-89.054025999999993	98	1
8893	0003	San Francisco	19.801593	-89.050428999999994	98	1
8894	0005	Catmís	19.957393	-88.949375000000003	98	1
8895	0006	Caxaytuk	20.090855000000001	-89.133472999999995	98	1
8896	0008	Corral	19.812169000000001	-89.004390999999998	98	1
8897	0010	Dzemucut	20.118559000000001	-89.055864	98	1
8898	0011	Dzí	20.090318	-89.046422000000007	98	1
8899	0012	Ek-Balam	20.123394000000001	-89.065051999999994	98	1
8900	0017	Hobonil	20.016584999999999	-89.020439999999994	98	1
8901	0018	Kakalná	20.053363000000001	-89.061853999999997	98	1
8902	0021	Noh-Balché	20.147994000000001	-89.084564	98	1
8903	0022	Noh-Bec	19.870560000000001	-89.041759999999996	98	1
8904	0024	San Salvador Piste Akal	19.842051000000001	-89.106112999999993	98	1
8905	0025	Polhuacxil	19.896595000000001	-88.995700999999997	98	1
8906	0026	San Carlos	19.730723000000001	-89.070515	98	1
8907	0028	Sacbecán	19.913685999999998	-89.037412000000003	98	1
8908	0034	San José	19.837319999999998	-89.003619999999998	98	1
8909	0037	Tigre Grande	19.710182	-89.041963999999993	98	1
8910	0039	Xcobiakal (Xcobilakal)	19.838550000000001	-88.982556000000002	98	1
8911	0042	Santa Bárbara	19.813313000000001	-89.104731999999998	98	1
8912	0043	El Escondido	19.785803000000001	-89.052927999999994	98	1
8913	0045	Blanca Flor	19.797160999999999	-89.104978000000003	98	1
8914	0046	San Felipe	20.081800999999999	-89.018512000000001	98	1
8915	0049	San Cosme	20.023375999999999	-89.004801999999998	98	1
8916	0050	Montana	19.987898999999999	-88.976805999999996	98	1
8917	0056	San José	20.085314	-89.064801000000003	98	1
8918	0060	Thul	20.077463999999999	-89.104817999999995	98	1
8919	0061	X-Cimé	19.958297000000002	-89.061310000000006	98	1
8920	0062	La Aurora	20.067352	-89.073055999999994	98	1
8921	0063	Bella Flor	20.118563999999999	-89.029002000000006	98	1
8922	0064	Bichcopó	19.967115	-89.065856999999994	98	1
8923	0065	Bonanza (Granada)	19.970018	-88.972222000000002	98	1
8924	0066	Aguada la Celosa (La Celosa)	19.796854	-89.121048000000002	98	1
8925	0067	Calotmul	19.997838000000002	-88.995429000000001	98	1
8926	0068	Guadalupe de Catmis (Las Carretas)	19.985889	-88.980171999999996	98	1
8927	0069	Cholul	19.935483000000001	-88.935937999999993	98	1
8928	0070	Delicias del Sur	20.084709	-89.018968999999998	98	1
8929	0072	Kaabnal	20.096060999999999	-89.008630999999994	98	1
8930	0073	Emiliano Zapata	20.030449000000001	-89.104161000000005	98	1
8931	0074	La Esperanza	19.833009000000001	-89.052058000000002	98	1
8932	0075	La Flecha	19.979595	-88.956913	98	1
8933	0077	El Girasol	19.862739999999999	-88.928779000000006	98	1
8934	0078	La Gloria	20.105691	-89.043007000000003	98	1
8935	0079	La Herradura	20.037127999999999	-89.050787999999997	98	1
8936	0080	Juntura Uno	19.782505	-89.105661999999995	98	1
8937	0081	San Isidro (Juntura Dos)	19.784624000000001	-89.078012000000001	98	1
8938	0082	Álvaro Obregón	20.120691999999998	-89.120759000000007	98	1
8939	0083	Komchén	19.866823	-88.962710999999999	98	1
8940	0087	Los Reyes	19.900258000000001	-88.950984000000005	98	1
8941	0089	San Joaquín	19.906191	-89.008021999999997	98	1
8942	0092	San Antonio Chunhuas	20.002295	-89.075202000000004	98	1
8943	0093	San Enrique	19.91788	-88.985309999999998	98	1
8944	0096	San Francisco	19.924565999999999	-88.984734000000003	98	1
8945	0097	San Francisco	20.110002999999999	-89.057334999999995	98	1
8946	0099	San Felipe	19.923535000000001	-88.978211000000002	98	1
8947	0100	San Gaspar	20.107907999999998	-89.012658000000002	98	1
8948	0103	San Joaquín	19.897770999999999	-88.930195999999995	98	1
8949	0104	San Juan	20.055575000000001	-89.038576000000006	98	1
8950	0105	San Juan	19.904444000000002	-88.997694999999993	98	1
8951	0106	San Luis	20.038162	-89.018251000000006	98	1
8952	0107	San Martín	20.099015000000001	-89.060466000000005	98	1
8953	0110	San Nicolás	20.046258999999999	-89.022513000000004	98	1
8954	0111	San Pedro	20.069137999999999	-89.034970999999999	98	1
8955	0112	San Pedro	19.906676000000001	-88.982900000000001	98	1
8956	0114	San Roque	20.066105	-89.033620999999997	98	1
8957	0115	Santa Amelia	19.964248000000001	-88.960273999999998	98	1
8958	0117	Santa Trinidad	20.099999	-89.102963000000003	98	1
8959	0119	Tampich	19.933617999999999	-88.978650999999999	98	1
8960	0120	Tantakín	20.029810000000001	-89.049848999999995	98	1
8961	0121	Telil	20.027155	-89.011251999999999	98	1
8962	0122	Tzok-Tuk	20.105817999999999	-89.086044000000001	98	1
8963	0123	San Bartolo	20.083985999999999	-89.082830999999999	98	1
8964	0124	Felipe Carrillo Puerto	20.079729	-88.997062999999997	98	1
8965	0127	Pozo la Gloria	20.062273999999999	-89.034829000000002	98	1
8966	0129	Luis Echeverría Álvarez Uno	19.994240999999999	-89.090395000000001	98	1
8967	0130	El Porvenir	19.946162000000001	-88.989242000000004	98	1
8968	0132	San Isidro	20.067430999999999	-89.066817	98	1
8969	0133	Los Laureles	19.851745999999999	-89.063933000000006	98	1
8970	0138	Pomponzit	19.980186	-88.943759999999997	98	1
8971	0140	San Luis	19.8599	-88.934511000000001	98	1
8972	0141	Pozo Tzucacab Número 1	20.048919000000001	-89.024158	98	1
8973	0147	Kambulí	19.865089999999999	-89.008217999999999	98	1
8974	0148	La Pelusa	20.095136	-89.059670999999994	98	1
8975	0149	San Luis	20.082222999999999	-89.071308000000002	98	1
8976	0150	San Pedro	19.955959	-88.927757999999997	98	1
8977	0151	San Sebastián	19.744764	-89.085173999999995	98	1
8978	0152	Santa Ana	20.088612999999999	-89.098489999999998	98	1
8979	0154	Ninguno	20.108083000000001	-89.063492999999994	98	1
8980	0155	San Alonzo	19.935725000000001	-89.070899999999995	98	1
8981	0156	Agregados Peninsulares	20.106064	-89.150236000000007	98	1
8982	0158	Fausto Góngora	20.056387999999998	-89.034013000000002	98	1
8983	0160	Almeida	20.073817999999999	-89.034552000000005	98	1
8984	0161	Mariano	20.083701000000001	-89.009007999999994	98	1
8985	0162	Odiseo	20.080041999999999	-89.066631999999998	98	1
8986	0163	Lázaro Cárdenas	20.044730000000001	-89.075812999999997	98	1
8987	0164	San Felipe	20.033601000000001	-89.010064	98	1
8988	0165	San Manuel	20.034299000000001	-89.012786000000006	98	1
8989	0167	San Francisco	20.0486	-89.057401999999996	98	1
8990	0168	El Palomo	20.101803	-89.145949999999999	98	1
8991	0169	San Sebastian	20.069955	-89.066530999999998	98	1
8992	0170	Muulkum	20.073618	-88.991516000000004	98	1
8993	0173	San Antonio	20.078319	-89.072518000000002	98	1
8994	0174	San Bernardino	19.922225999999998	-89.007123000000007	98	1
8995	0177	Ernesto Caamal	20.000945999999999	-89.087728999999996	98	1
8996	0178	Noh-Bec [Unidad Ganadera]	19.866864	-89.050810999999996	98	1
8997	0179	Mario Efrén Estrada Camara	19.795660999999999	-89.088994	98	1
8998	0180	San Pedro	19.799353	-89.023698999999993	98	1
8999	0181	San Bernardino	19.830079999999999	-89.006953999999993	98	1
9000	0182	Armando Sulub Rivero	19.787818000000001	-89.040606999999994	98	1
9001	0183	Ebenezer	19.900798000000002	-89.065019000000007	98	1
9002	0184	Rancho Alegre	19.779101000000001	-89.101969999999994	98	1
9003	0185	San Isidro	19.785893999999999	-89.097479000000007	98	1
9004	0186	San Pablo	19.777297999999998	-89.046751	98	1
9005	0188	El Abuelo	19.989578999999999	-89.052493999999996	98	1
9006	0189	San Arturo	19.981586	-89.047760999999994	98	1
9007	0190	2 Hermanos	19.971523000000001	-89.052047000000002	98	1
9008	0191	Pozo Número Uno	19.709095999999999	-89.059935999999993	98	1
9009	0192	Calavera	19.957602999999999	-88.964095999999998	98	1
9010	0193	La Central	19.937434	-88.965342000000007	98	1
9011	0195	La Esperanza	19.931338	-88.953006999999999	98	1
9012	0196	Pozo Dos	19.93355	-88.916544999999999	98	1
9013	0197	La Prosperidad	19.942924000000001	-88.981943999999999	98	1
9014	0198	El Roble	19.922281999999999	-88.954375999999996	98	1
9015	0199	San Antonio	19.867177999999999	-88.991754	98	1
9016	0200	San José	19.871532999999999	-88.997688999999994	98	1
9017	0201	La Huerta	19.957273000000001	-88.922629000000001	98	1
9018	0202	San Manuel Nuevo	19.926145000000002	-88.967972000000003	98	1
9019	0203	San Medardo	19.943565	-88.965470999999994	98	1
9020	0204	Yaxché [Rancho]	19.994797999999999	-88.984054999999998	98	1
9021	0205	Santo Domingo	19.927586000000002	-88.960329000000002	98	1
9022	0206	Ancona Cuatro	19.922578000000001	-88.924752999999995	98	1
9023	0207	Caxaytuc Dos	20.101410999999999	-89.118819000000002	98	1
9024	0208	Guadalupe	20.057174	-89.091406000000006	98	1
9025	0209	Kaxán Kuxtal	20.119520999999999	-89.060102000000001	98	1
9026	0210	Cauich	20.005679000000001	-89.061955999999995	98	1
9027	0211	San Rafael	20.019317000000001	-89.001723999999996	98	1
9028	0212	Máximo Mukul	20.061986000000001	-89.008707999999999	98	1
9029	0213	Resurrección [Rancho]	20.065705999999999	-89.102273999999994	98	1
9030	0214	Carlos Rojas	20.066403999999999	-89.079443999999995	98	1
9031	0215	Diego Chulín	20.136068000000002	-89.073616000000001	98	1
9032	0216	San Bartolo	20.101479000000001	-89.050314	98	1
9033	0217	El Rosario	20.058810000000001	-89.035202999999996	98	1
9034	0218	Palomar	19.977301000000001	-88.971665000000002	98	1
9035	0219	Pozo Cinco	19.9269	-88.930667	98	1
9036	0221	El Divino Niño Jesús	20.084859000000002	-89.072210999999996	98	1
9037	0222	La Aguada	19.977181000000002	-88.968664000000004	98	1
9038	0223	El Castillo	20.048942	-89.027484000000001	98	1
9039	0224	Cirilo Ek	20.001783	-88.986238	98	1
9040	0225	El Despreciado	19.739858999999999	-89.096452999999997	98	1
9041	0226	Ismael Cocom	20.072592	-89.038967999999997	98	1
9042	0227	Esteban	20.061354000000001	-88.998627999999997	98	1
9043	0228	Guadalupe	20.011185999999999	-88.995199999999997	98	1
9044	0230	Ninguno	19.791620999999999	-89.143868999999995	98	1
9045	0231	La Micro	20.095901000000001	-89.142202999999995	98	1
9046	0232	Nicté Há	20.087502000000001	-89.089195000000004	98	1
9047	0233	Ochovenado	20.074059999999999	-89.036372999999998	98	1
9048	0234	Escondido	19.778701999999999	-89.039135999999999	98	1
9049	0235	El Ramonal	20.084244999999999	-89.079204000000004	98	1
9050	0236	Rancho Seco	19.877935000000001	-89.024539000000004	98	1
9051	0237	San Fernando	19.782131	-89.107151000000002	98	1
9052	0238	San Ignacio	20.108156000000001	-89.036170999999996	98	1
9053	0239	San Israel	19.779437999999999	-89.114913000000001	98	1
9054	0240	San Javier	19.874093999999999	-89.022428000000005	98	1
9055	0241	San Jorge	19.778962	-89.103595999999996	98	1
9056	0242	San Manuel	19.786227	-89.085481000000001	98	1
9057	0243	Santa Elena	19.798317999999998	-89.030238999999995	98	1
9058	0244	Solidaridad [Unidad Frutícola]	20.065822000000001	-89.007610999999997	98	1
9059	0245	San Cristóbal	19.900442999999999	-89.011914000000004	98	1
9060	0247	El Eden [Huerta]	20.090323000000001	-89.109076000000002	98	1
9061	0248	Guadalupe	19.895699	-88.914997	98	1
9062	0249	Cocoyol	19.982735999999999	-88.975693000000007	98	1
9063	0250	Don Lucas	19.982769000000001	-89.062732999999994	98	1
9064	0251	La Polvadera	20.005710000000001	-88.991213000000002	98	1
9065	0252	San Martín	20.009214	-89.068145999999999	98	1
9066	0001	Uayma	20.717787999999999	-88.317138999999997	99	1
9067	0003	Sahcabá	20.758375999999998	-88.342186999999996	99	1
9068	0005	San José Barrera	20.724012999999999	-88.298534000000004	99	1
9069	0006	San Lázaro	20.724384000000001	-88.319963999999999	99	1
9070	0007	San Miguel	20.717624000000001	-88.288445999999993	99	1
9071	0012	Sahcabá Número Tres	20.684066000000001	-88.383466999999996	99	1
9072	0016	Chucib	20.750774	-88.322861000000003	99	1
9073	0023	Santa María Aznar	20.825244999999999	-88.319288999999998	99	1
9074	0034	Poop	20.854970000000002	-88.377898000000002	99	1
9075	0037	Ch'oj	20.712789000000001	-88.353948000000003	99	1
9076	0038	Chunyá	20.795756999999998	-88.323873000000006	99	1
9077	0040	Koom	20.693622000000001	-88.352956000000006	99	1
9078	0046	Sacneké	20.704946	-88.319961000000006	99	1
9079	0048	San José	20.739737999999999	-88.328146000000004	99	1
9080	0054	Santa María Tuz	20.746110999999999	-88.310383999999999	99	1
9081	0057	Santa Rosa	20.733609000000001	-88.342134000000001	99	1
9082	0063	Santa Margarita	20.729924	-88.330223000000004	99	1
9083	0064	Ejido San Antonio	20.844995000000001	-88.405705999999995	99	1
9084	0067	Yokdzadz	20.842621999999999	-88.360134000000002	99	1
9085	0068	Nohak	20.817549	-88.371425000000002	99	1
9086	0077	San Celso	20.712439	-88.342139000000003	99	1
9087	0078	Santo Domingo	20.711552999999999	-88.322980999999999	99	1
9088	0080	San Lorenzo	20.674309000000001	-88.407550999999998	99	1
9089	0082	Chan Santa Cruz	20.678062000000001	-88.424019999999999	99	1
9090	0084	Haymil	20.684224	-88.436029000000005	99	1
9091	0085	Rosario	20.758751	-88.33672	99	1
9092	0087	Chujuk	20.748206	-88.371998000000005	99	1
9093	0088	Pagaja	20.690159000000001	-88.310436999999993	99	1
9094	0089	Utzi Chen	20.684721	-88.415441000000001	99	1
9095	0090	Ich Muul	20.814981	-88.317877999999993	99	1
9096	0091	San Isidro Número 3	20.765464999999999	-88.326825999999997	99	1
9097	0092	X-Noh Bo	20.758861	-88.383302999999998	99	1
9098	0001	Ucú	21.031735000000001	-89.746440000000007	100	1
9099	0002	Dzelchac	20.991982	-89.789530999999997	100	1
9100	0003	Yaxché de Peón	21.044878000000001	-89.756448000000006	100	1
9101	0004	Yohdzonot	21.026456	-89.769548999999998	100	1
9102	0005	Chaparral	21.035225000000001	-89.728998000000004	100	1
9103	0008	Rubén [Granja]	21.029319000000001	-89.730829	100	1
9104	0011	Eco Quinta Ucú	21.024978000000001	-89.726192999999995	100	1
9105	0012	Las Palomas	21.028410999999998	-89.735258999999999	100	1
9106	0015	San Juan	21.018858999999999	-89.738084999999998	100	1
9107	0016	Santa Rita	21.028065999999999	-89.732980999999995	100	1
9108	0018	Santa Teresa Dos	21.025561	-89.733417000000003	100	1
9109	0019	Santa Teresa Tres	21.026437000000001	-89.735614999999996	100	1
9110	0020	Santa Teresa Uno	21.021737999999999	-89.731406000000007	100	1
9111	0022	Las Palomas [Quinta]	21.024930000000001	-89.727126999999996	100	1
9112	0026	El Ancla	21.029855000000001	-89.737971000000002	100	1
9113	0027	Muchil	21.026888	-89.729185000000001	100	1
9114	0028	Letio'ob Sutkino'ob (Los Girasoles)	21.026959999999999	-89.730948999999995	100	1
9115	0029	Matute [Quinta]	21.02713	-89.732234000000005	100	1
9116	0030	Hulilá	21.066963999999999	-89.803979999999996	100	1
9117	0031	Universidad Politécnica de Yucatán	20.988593999999999	-89.737330999999998	100	1
9118	0001	Umán	20.881889999999999	-89.748283000000001	101	1
9119	0002	Bolón	20.849993000000001	-89.832161999999997	101	1
9120	0005	Dzibikak	20.900680999999999	-89.793897999999999	101	1
9121	0006	Hotzuc	20.807065000000001	-89.692576000000003	101	1
9122	0007	Hunxectamán	20.908047	-89.738736000000003	101	1
9123	0009	Oxcum	20.945705	-89.763699000000003	101	1
9124	0010	Oxholón	20.875427999999999	-89.807595000000006	101	1
9125	0011	Poxilá	20.818353999999999	-89.804794000000001	101	1
9126	0012	San Antonio Chum	20.877251000000001	-89.860118999999997	101	1
9127	0013	San Antonio Mulix	20.668447	-89.754168000000007	101	1
9128	0014	Taníl	20.891228000000002	-89.709670000000003	101	1
9130	0016	Ticimul	20.881357999999999	-89.682027000000005	101	1
9131	0017	Xcucul Sur	20.856950999999999	-89.671700999999999	101	1
9132	0018	Xtepén	20.823167000000002	-89.743324000000001	101	1
9133	0019	Yaxcopoil	20.745553999999998	-89.722020999999998	101	1
9134	0020	Badsan	20.876114999999999	-89.792845	101	1
9135	0022	Apilandia	20.881416999999999	-89.774170999999996	101	1
9136	0023	Blanca Flor	20.85915	-89.745459999999994	101	1
9137	0027	Ninguno [Granja]	20.833601999999999	-89.788949000000002	101	1
9138	0029	Chunchacá	20.807831	-89.838269999999994	101	1
9139	0030	Chunchil	20.858675999999999	-89.741676999999996	101	1
9140	0031	Chacho Lugo [Lienzo Charro]	20.865797000000001	-89.745337000000006	101	1
9141	0034	La Esperanza	20.912139	-89.738304999999997	101	1
9142	0035	Felipe Carrillo Puerto	20.859838	-89.833316999999994	101	1
9143	0041	Fausto José	20.856314000000001	-89.736234999999994	101	1
9144	0042	Santa Rita	20.864433999999999	-89.745510999999993	101	1
9145	0044	Japay	20.871680999999999	-89.726895999999996	101	1
9146	0047	Lázaro Cárdenas Veintiséis	20.828598	-89.810495000000003	101	1
9147	0048	El Limonar	20.850085	-89.745119000000003	101	1
9148	0050	El Nazareno	20.847707	-89.744174000000001	101	1
9149	0052	Monte Oreb	20.857137999999999	-89.735523999999998	101	1
9150	0054	El Paraíso	20.834823	-89.741950000000003	101	1
9151	0055	San Agustín	20.87743	-89.790345000000002	101	1
9152	0056	El Polvorín	20.842732000000002	-89.736908999999997	101	1
9153	0057	Sac Nicté	20.897169999999999	-89.817329000000001	101	1
9154	0059	Umán [Almacén de Calcio]	20.875813000000001	-89.729947999999993	101	1
9155	0060	San Alfredo	20.879048000000001	-89.791624999999996	101	1
9156	0062	San Carlos	20.859798999999999	-89.868725999999995	101	1
9157	0064	San Darío	20.852798	-89.744478999999998	101	1
9158	0065	San Diego	20.857825999999999	-89.744084000000001	101	1
9159	0066	Agrosol [Unidad Productiva]	20.879888000000001	-89.769298000000006	101	1
9160	0068	San Gabriel	20.876380000000001	-89.789698000000001	101	1
9161	0069	San Gregorio	20.852191000000001	-89.743182000000004	101	1
9162	0070	Rastro Kekén	20.856923999999999	-89.768629000000004	101	1
9163	0071	Sanjor Uno	20.864433999999999	-89.759005999999999	101	1
9164	0072	San José Uno	20.856231999999999	-89.836910000000003	101	1
9165	0077	San Lorencito	20.811509999999998	-89.736840999999998	101	1
9166	0078	San Manuel	20.969532000000001	-89.761227000000005	101	1
9167	0079	San Marcos	20.868366000000002	-89.860847000000007	101	1
9168	0080	San Martín	20.856293999999998	-89.839838999999998	101	1
9169	0082	San Miguel	20.864077000000002	-89.744799999999998	101	1
9170	0084	San Pablo Dos	20.831088000000001	-89.810229000000007	101	1
9171	0085	San Pedro Lara	20.847425999999999	-89.771405999999999	101	1
9172	0088	Santa Cecilia	20.851444000000001	-89.744546	101	1
9173	0089	Santa Fe	20.859311999999999	-89.763684999999995	101	1
9174	0090	Santa Julia	20.876781999999999	-89.791259999999994	101	1
9175	0092	Santo Tomás	20.808409000000001	-89.809377999999995	101	1
9176	0094	Mérida Dos	20.885297999999999	-89.692276000000007	101	1
9177	0096	Sukuná	20.862248999999998	-89.744651000000005	101	1
9178	0097	La Finquita	20.810157	-89.737284000000002	101	1
9179	0100	Tío Enrique	20.877544	-89.785760999999994	101	1
9180	0103	Bulucná	20.859521999999998	-89.881814000000006	101	1
9181	0105	Umán	20.786059000000002	-89.813980000000001	101	1
9182	0107	Janet	20.864684	-89.746302999999997	101	1
9183	0108	Xcansap	20.843049000000001	-89.769632999999999	101	1
9184	0109	San José	20.852661999999999	-89.758364	101	1
9185	0110	San Antonio Chimal	20.884333999999999	-89.732512	101	1
9186	0111	San Antonio Homodzonot	20.854735999999999	-89.777388999999999	101	1
9187	0113	Petec Biltún	20.828237999999999	-89.686755000000005	101	1
9188	0114	Pedregal de San Antonio	20.852620999999999	-89.734465	101	1
9189	0115	San José	20.848572999999998	-89.742228999999995	101	1
9190	0116	El Emporio	20.858798	-89.744641999999999	101	1
9191	0120	San Emilio	20.853497999999998	-89.736497999999997	101	1
9192	0124	San Pablo Uno	20.822861	-89.809849	101	1
9193	0126	El Porvenir	20.88259	-89.777493000000007	101	1
9194	0127	San Dimas	20.879923999999999	-89.777857999999995	101	1
9195	0129	El Refugio	20.815038999999999	-89.738939000000002	101	1
9196	0131	Pastoral del Amor	20.815458	-89.740273999999999	101	1
9197	0132	El Polvorín	20.866672000000001	-89.762165999999993	101	1
9198	0136	El Cedro	20.875730999999998	-89.794132000000005	101	1
9199	0137	Umán [Basurero Municipal]	20.877896	-89.768394999999998	101	1
9200	0138	Bolón Uno	20.851942999999999	-89.838584999999995	101	1
9201	0140	Los Casanovas	20.91236	-89.743686999999994	101	1
9202	0142	Cheyen	20.869634000000001	-89.724115999999995	101	1
9203	0143	Coole-Cab	20.819185999999998	-89.809070000000006	101	1
9204	0147	Oxholón [Granjas]	20.876425999999999	-89.818111999999999	101	1
9205	0150	Kunché	20.935949000000001	-89.757221000000001	101	1
9206	0153	El Rey	20.874089999999999	-89.727672999999996	101	1
9207	0154	Sac-Nicté	20.892078999999999	-89.823981000000003	101	1
9208	0155	San Andrés	20.825165999999999	-89.797366999999994	101	1
9209	0156	San Alfonso	20.807780000000001	-89.809244000000007	101	1
9210	0157	Daniel Cituk	20.903994000000001	-89.739367999999999	101	1
9211	0158	San Felipe de Jesús	20.856674000000002	-89.760030999999998	101	1
9212	0159	San Fernando	20.825012999999998	-89.794694000000007	101	1
9213	0160	San Antonio	20.900929999999999	-89.787572999999995	101	1
9214	0161	San Carlos	20.837378000000001	-89.785668999999999	101	1
9215	0162	San Isidro	20.83315	-89.837646000000007	101	1
9216	0163	El Esfuerzo	20.851174	-89.776368000000005	101	1
9217	0164	Nidia Mireya	20.881568999999999	-89.734979999999993	101	1
9218	0165	Santa Teresita	20.880534999999998	-89.732252000000003	101	1
9219	0166	Santa Vicenta	20.810243	-89.809736999999998	101	1
9220	0167	Saturno	20.88176	-89.771754000000001	101	1
9221	0168	Las Teresitas	20.911729999999999	-89.745735999999994	101	1
9222	0169	Los Laureles	20.872153000000001	-89.729219000000001	101	1
9223	0170	La Huerta	20.877603000000001	-89.766200999999995	101	1
9224	0171	Don Omar Uno	20.879393	-89.731550999999996	101	1
9225	0173	Villa Estela	20.911180999999999	-89.742998999999998	101	1
9226	0175	Yaxcopoil	20.761002999999999	-89.718924000000001	101	1
9227	0176	El Zacatal	20.870100999999998	-89.722504999999998	101	1
9228	0177	El Girasol	20.880267	-89.784238999999999	101	1
9229	0178	Masul	20.839079000000002	-89.815329000000006	101	1
9230	0179	San Antonio	20.876218999999999	-89.786242999999999	101	1
9231	0181	Silvia María	20.881340999999999	-89.734423000000007	101	1
9232	0183	Las Bugambilias	20.87698	-89.791726999999995	101	1
9233	0184	Carlos Castillo Puga	20.900869	-89.740161000000001	101	1
9234	0185	Tok-Chacní	20.842376999999999	-89.746881000000002	101	1
9235	0186	Camilo	20.884550000000001	-89.762354999999999	101	1
9236	0188	Castillo	20.876448	-89.779634999999999	101	1
9237	0189	Carlos Castillo	20.856342999999999	-89.740993000000003	101	1
9238	0190	Abraham Villareal	20.857913	-89.762440999999995	101	1
9239	0191	San Pablo Chail	20.865186000000001	-89.735866000000001	101	1
9240	0192	San Francisco Cortez	20.861205000000002	-89.735095000000001	101	1
9241	0193	Jorge Osorio	20.899438	-89.741782000000001	101	1
9242	0194	José Perfecto Baas	20.903268000000001	-89.740827999999993	101	1
9243	0195	Kinchil [Granjas]	20.877098	-89.765342000000004	101	1
9244	0196	D'Carlos [Granjas]	20.855756	-89.742687000000004	101	1
9245	0197	Oswaldo [Granja]	20.878395999999999	-89.780371000000002	101	1
9246	0198	César Cisneros	20.867094000000002	-89.721620999999999	101	1
9247	0199	Nana	20.878903999999999	-89.781937999999997	101	1
9248	0203	Los Potros	20.860907000000001	-89.677094999999994	101	1
9249	0205	Los Laureles	20.872335	-89.763014999999996	101	1
9250	0208	Mayamix	20.892503000000001	-89.754537999999997	101	1
9251	0209	Provi Purina	20.879211000000002	-89.781222	101	1
9252	0210	El Rey Uno	20.877699	-89.773179999999996	101	1
9253	0212	San Pedro	20.867495999999999	-89.755765999999994	101	1
9254	0213	Santa Clara	20.870712999999999	-89.768531999999993	101	1
9255	0214	Santa Cruz	20.883531999999999	-89.763608000000005	101	1
9256	0215	Santa Elena	20.868656999999999	-89.722385000000003	101	1
9257	0216	Santa Elena	20.873919000000001	-89.760583999999994	101	1
9258	0217	Santa Elena	20.874123000000001	-89.758007000000006	101	1
9259	0218	Santa Teresa	20.898713999999998	-89.743043999999998	101	1
9260	0219	Los Santos	20.902235000000001	-89.740491000000006	101	1
9261	0220	Sanjor [Talleres]	20.860240000000001	-89.762307000000007	101	1
9262	0222	Parque Mueblero	20.899965999999999	-89.7684	101	1
9263	0223	Dzikuk	20.895591	-89.758308999999997	101	1
9264	0224	El Gran Esfuerzo	20.895710999999999	-89.769572999999994	101	1
9265	0225	Juan Negrón	20.899194000000001	-89.771141999999998	101	1
9266	0226	Alimentos y Aderezos del Sureste	20.849954	-89.744142999999994	101	1
9267	0227	Américo	20.916637999999999	-89.733896999999999	101	1
9268	0228	Chacté	20.869156	-89.764449999999997	101	1
9269	0229	La Guadalupana	20.878937000000001	-89.722341	101	1
9270	0230	Don Fernando	20.901671	-89.741800999999995	101	1
9271	0231	Silvestre Cantún	20.904102000000002	-89.740899999999996	101	1
9272	0232	Osmar Castillo	20.90737	-89.744420000000005	101	1
9273	0233	Adolfo Durán	20.868645999999998	-89.723177000000007	101	1
9274	0234	Los Tres Marciales	20.870380000000001	-89.724599999999995	101	1
9275	0236	Humberto Miss	20.868787999999999	-89.723404000000002	101	1
9276	0237	San José	20.871886	-89.721109999999996	101	1
9277	0238	Santa María	20.870640000000002	-89.722779000000003	101	1
9278	0239	José Uitz	20.877738000000001	-89.721254999999999	101	1
9279	0240	Don Omar	20.876411000000001	-89.731067999999993	101	1
9280	0241	Don Trinidad	20.882307999999998	-89.734746999999999	101	1
9281	0242	Irma Xool	20.878957	-89.728246999999996	101	1
9282	0243	Eutimio Rodríguez Cauich	20.856742000000001	-89.748236000000006	101	1
9283	0244	William Montero Sáenz	20.854507999999999	-89.745079000000004	101	1
9284	0246	Reyes Xool	20.869505	-89.725491000000005	101	1
9285	0249	Kincil	20.914940999999999	-89.748639999999995	101	1
9286	0251	San Miguel	20.913432	-89.745040000000003	101	1
9287	0252	Santa María	20.874510999999998	-89.722654000000006	101	1
9288	0254	La Tortuga	20.874116999999998	-89.763838000000007	101	1
9289	0255	Carolina Poot Montero	20.871974000000002	-89.725769	101	1
9290	0256	Castaño [Rancho]	20.859086000000001	-89.662664000000007	101	1
9291	0257	Calan Estrella	20.840696000000001	-89.746866999999995	101	1
9292	0258	San Gerónimo	20.741966000000001	-89.717174	101	1
9293	0259	Felipe Cámara	20.847798999999998	-89.672138000000004	101	1
9294	0261	Familia Ayala Chan	20.853819999999999	-89.708028999999996	101	1
9295	0262	La Palapa	20.836915999999999	-89.742965999999996	101	1
9296	0263	Pretenzados	20.85848	-89.706896999999998	101	1
9297	0264	El Retorno [Lavadero -Restaurante]	20.838630999999999	-89.749728000000005	101	1
9298	0265	San Alberto	20.828173	-89.813668000000007	101	1
9299	0266	San Miguel Arcángel	20.851312	-89.672791000000004	101	1
9300	0267	Tres Reyes	20.835872999999999	-89.740373000000005	101	1
9301	0268	Efraín Lugo Galván [Gasolinera]	20.878481000000001	-89.773708999999997	101	1
9302	0269	Los Potrillos	20.877475	-89.788544000000002	101	1
9303	0271	Chilib	20.877811000000001	-89.791792999999998	101	1
9304	0272	Pedregales de Umán	20.879386	-89.765041999999994	101	1
9305	0273	Francisco Montero	20.846239000000001	-89.748768999999996	101	1
9306	0274	Los Kiau	20.941139	-89.760447999999997	101	1
9307	0275	Larc Industriales	20.902598000000001	-89.762602999999999	101	1
9308	0276	Cutberto Godoy Cano	20.898527999999999	-89.769775999999993	101	1
9309	0277	Concepción Tres	20.872425	-89.726860000000002	101	1
9310	0278	Doña Teresa	20.871435000000002	-89.724863999999997	101	1
9311	0279	Miguel Camacho	20.863786000000001	-89.745917000000006	101	1
9312	0280	Plantel Santa Rita	20.911992000000001	-89.736253000000005	101	1
9313	0281	La Pollita	20.908656000000001	-89.743578999999997	101	1
9314	0282	El Retiro	20.854378000000001	-89.773657	101	1
9315	0283	San Mateo	20.898073	-89.772082999999995	101	1
9316	0284	Yaya	20.840843	-89.782387	101	1
9317	0285	Yaya I	20.838809000000001	-89.784424000000001	101	1
9318	0286	Ninguno [UGRY]	20.853553000000002	-89.768056000000001	101	1
9319	0287	Nohoch Tunich	20.819982	-89.786843000000005	101	1
9320	0288	Chentoro	20.838014000000001	-89.751596000000006	101	1
9321	0289	San Marcos [Citrícola]	20.837142	-89.787868000000003	101	1
9322	0290	Yaxchilán [Granja de Peces]	20.804531999999998	-89.812067999999996	101	1
9323	0291	Dogre	20.903832999999999	-89.741815000000003	101	1
9324	0292	El Toro	20.832312999999999	-89.761388999999994	101	1
9325	0293	El Roble Qually [Gasolinera]	20.836866000000001	-89.752116999999998	101	1
9326	0294	María del Carmen González Trujeque	20.838242999999999	-89.748213000000007	101	1
9327	0295	San Pedro [Granja]	20.845303000000001	-89.774242000000001	101	1
9328	0296	Peschen Han [Granja de Peces]	20.805458999999999	-89.809420000000003	101	1
9329	0297	Labná [Granja]	20.883317999999999	-89.817733000000004	101	1
9330	0298	Las Veletas [Rancho]	20.901433000000001	-89.739913000000001	101	1
9331	0299	Martha Balam	20.871455000000001	-89.726318000000006	101	1
9332	0300	San José	20.878947	-89.728004999999996	101	1
9333	0301	Don Jalisco [Freddy]	20.878596999999999	-89.728442000000001	101	1
9334	0302	José Baas Quintal	20.903831	-89.740752999999998	101	1
9335	0303	El Argentino	20.903624000000001	-89.743872999999994	101	1
9336	0304	Mauricio Ché	20.903081	-89.741652999999999	101	1
9337	0305	May Gonzalo	20.902785000000002	-89.740228000000002	101	1
9338	0306	Eduardo Euán	20.903725999999999	-89.739352999999994	101	1
9339	0307	Rafael Castillo	20.903699	-89.739846	101	1
9340	0308	Manuel Pacheco	20.900718000000001	-89.740967999999995	101	1
9341	0309	San Manuel	20.899407	-89.745444000000006	101	1
9342	0310	Juan Chuc	20.898218	-89.745281000000006	101	1
9343	0311	Arturo Canché	20.896896999999999	-89.772184999999993	101	1
9344	0312	Mario Borges	20.899094000000002	-89.742187000000001	101	1
9345	0313	Hilario Santos	20.898934000000001	-89.741944000000004	101	1
9346	0314	Xcanchakán	20.857579999999999	-89.800118999999995	101	1
9347	0315	Carlos Pérez	20.898423000000001	-89.769503	101	1
9348	0316	El Establo	20.903749000000001	-89.806903000000005	101	1
9349	0317	Florentina Pool Canché	20.841421	-89.780584000000005	101	1
9350	0318	Charlys	20.83916	-89.782611000000003	101	1
9351	0319	Manuel Jesús Canul Chan	20.875375999999999	-89.790835999999999	101	1
9352	0321	Setenta y Siete DK	20.897883	-89.769952000000004	101	1
9353	0322	El Limonar	20.898256	-89.771265999999997	101	1
9354	0323	Lilos Tinal	20.898700999999999	-89.772473000000005	101	1
9355	0324	Los Cocos	20.898944	-89.773173	101	1
9356	0325	Chitolín	20.900375	-89.774737999999999	101	1
9357	0326	Las Dalias	20.904955000000001	-89.789559999999994	101	1
9358	0327	San Antonio Uno	20.902252000000001	-89.775828000000004	101	1
9359	0328	Las Palmas	20.901323999999999	-89.774820000000005	101	1
9360	0329	Ninguno	20.900300000000001	-89.772617999999994	101	1
9361	0330	Juan Morales [Granja]	20.900366999999999	-89.771163000000001	101	1
9362	0331	La Flor de Abigail [Vivero]	20.899287000000001	-89.770944	101	1
9363	0333	José y Franklin Domínguez	20.840982	-89.744665999999995	101	1
9364	0335	Manuel Guillen	20.835691000000001	-89.752915000000002	101	1
9365	0336	La Aurora	20.833884000000001	-89.759776000000002	101	1
9366	0337	Sureste [PCP]	20.844574999999999	-89.777664999999999	101	1
9367	0338	Perfecto	20.904413999999999	-89.740707999999998	101	1
9368	0339	Ya-Há	20.837797999999999	-89.790715000000006	101	1
9369	0340	San Jorge	20.87294	-89.762558999999996	101	1
9370	0341	Ninguno [REPSA]	20.894784999999999	-89.757598999999999	101	1
9371	0342	San Diego	20.824911	-89.804255999999995	101	1
9372	0343	San Eliodoro	20.871613	-89.725960000000001	101	1
9373	0344	San Esteban	20.840693000000002	-89.785593000000006	101	1
9374	0345	San Juan	20.900981000000002	-89.741067999999999	101	1
9375	0346	Chaparral	20.852944999999998	-89.731106999999994	101	1
9376	0347	Kal-Dzonot	20.85003	-89.666636999999994	101	1
9377	0348	Lol-Há	20.857437000000001	-89.760587999999998	101	1
9378	0349	Los Padrinos	20.849111000000001	-89.666810999999996	101	1
9379	0350	Rablalicana	20.861865999999999	-89.679309000000003	101	1
9380	0351	Refugio	20.832943	-89.787948999999998	101	1
9381	0352	San Antonio	20.866413999999999	-89.781560999999996	101	1
9382	0353	San Pablo	20.849921999999999	-89.707223999999997	101	1
9383	0354	Sinaí	20.856439000000002	-89.74436	101	1
9384	0355	Yaxcopoil	20.765231	-89.717105000000004	101	1
9385	0356	El Xut	20.849640000000001	-89.668437999999995	101	1
9386	0357	Ninguno	20.903134999999999	-89.788124999999994	101	1
9387	0358	San Antonio	20.882679	-89.872017999999997	101	1
9388	0359	Ninguno	20.893291000000001	-89.716773000000003	101	1
9389	0361	Cab Balam	20.852563	-89.657623000000001	101	1
9390	0362	Productos de Concreto Peninsulares [Procon]	20.861794	-89.719361000000006	101	1
9391	0363	Disuresa	20.878496999999999	-89.761581000000007	101	1
9392	0001	Valladolid	20.689726	-88.200980000000001	102	1
9393	0002	Akabchén	20.693169000000001	-88.055743000000007	102	1
9394	0016	Consuc	20.758212	-88.176196000000004	102	1
9395	0033	Chiquén	20.694488	-88.148928999999995	102	1
9396	0034	Chioplé	20.720953000000002	-88.076188000000002	102	1
9397	0036	Chompool	20.772241999999999	-88.030816000000002	102	1
9398	0037	Chuc-Yuc	20.755092000000001	-88.198956999999993	102	1
9399	0038	Chan Xchu'ul Chakaj	20.761901999999999	-88.239633999999995	102	1
9400	0044	Dzibil	20.525677999999999	-88.024412999999996	102	1
9401	0045	Dzitnup	20.647103999999999	-88.244774000000007	102	1
9402	0046	Dzoyolá	20.603325000000002	-88.116805999999997	102	1
9403	0047	Ebtún	20.664943000000001	-88.257633999999996	102	1
9404	0049	Izhuá	20.740874999999999	-88.043030999999999	102	1
9405	0051	Xkampepén	20.478414999999998	-88.095928999999998	102	1
9406	0055	Kanxoc	20.617329999999999	-88.099981	102	1
9407	0060	Koopchén	20.753716000000001	-88.183062000000007	102	1
9408	0066	Ninibeh	20.55555	-88.034684999999996	102	1
9409	0068	Xnoh-Ox	20.606051999999998	-88.025063000000003	102	1
9410	0069	Nohsuytún	20.435151000000001	-88.096535000000003	102	1
9411	0071	Papagayo	20.712489000000001	-88.156059999999997	102	1
9412	0072	Paraíso	20.748560000000001	-88.175560000000004	102	1
9413	0075	Pixoy	20.715661000000001	-88.262810999999999	102	1
9414	0077	Popolá	20.732481	-88.237859999999998	102	1
9415	0080	Sac-Helbach	20.688237999999998	-88.166801000000007	102	1
9416	0081	San Andrés X-Bac	20.718308	-88.068239000000005	102	1
9417	0082	San Antonio	20.414379	-88.094031999999999	102	1
9418	0084	San Antonio	20.631229000000001	-88.057426000000007	102	1
9419	0087	San Felipe	20.778009999999998	-88.042814000000007	102	1
9420	0089	San Francisco	20.692439	-88.076802000000001	102	1
9421	0098	San Lorenzo	20.725838	-88.188147000000001	102	1
9422	0108	Santa Clara	20.696099	-88.165379999999999	102	1
9423	0110	Santa Cruz	20.747288000000001	-88.214575999999994	102	1
9424	0114	Chan Chakán (Santa Rosa)	20.651695	-88.109858000000003	102	1
9425	0116	Santa Rosa	20.493134000000001	-88.095698999999996	102	1
9426	0117	San Vicente	20.717074	-88.072507000000002	102	1
9427	0119	Sidrakín	20.513501000000002	-87.986099999999993	102	1
9428	0127	Tahmuy	20.759257000000002	-88.142207999999997	102	1
9429	0129	Tesoco	20.722469	-88.154544999999999	102	1
9430	0130	Tikuch	20.703078000000001	-88.112183000000002	102	1
9431	0132	Tixhualactún	20.643974	-88.143043000000006	102	1
9432	0139	X-Akabchén	20.579450999999999	-88.163472999999996	102	1
9433	0145	Chan X-Batún	20.548598999999999	-88.061184999999995	102	1
9434	0149	X-Cohuó	20.804186000000001	-87.949241000000001	102	1
9435	0150	Chakán	20.654731000000002	-88.117243000000002	102	1
9436	0155	Santa Rita	20.695526000000001	-88.130332999999993	102	1
9437	0167	X-Lahchén	20.714948	-88.215897999999996	102	1
9438	0168	X-Marina	20.733039000000002	-88.245401000000001	102	1
9439	0169	X-Mitán	20.695989000000001	-88.076105999999996	102	1
9440	0172	X-Noh	20.661425000000001	-88.118627000000004	102	1
9441	0174	Xocén	20.598844	-88.163691999999998	102	1
9442	0177	X-Polulum	20.666647999999999	-88.149327999999997	102	1
9443	0182	Xuilub	20.640605000000001	-88.151798999999997	102	1
9445	0184	Xunchan	20.745269	-88.133187000000007	102	1
9446	0186	Yaax-Kix	20.690608000000001	-88.070425	102	1
9447	0187	Yokdzonot	20.659473999999999	-88.020172000000002	102	1
9448	0188	Yalcobá	20.790673999999999	-88.038337999999996	102	1
9449	0189	Yalcón	20.67953	-88.157846000000006	102	1
9450	0192	Yaxché	20.718014	-88.088853999999998	102	1
9451	0196	Chan Yohalal	20.765872999999999	-88.172428999999994	102	1
9452	0202	Chan Suytum	20.442091999999999	-88.070616999999999	102	1
9453	0209	San Antonio	20.694289999999999	-88.258058000000005	102	1
9454	0213	Santa Elena	20.588691000000001	-88.162222	102	1
9455	0214	Teya	20.677305	-88.081624000000005	102	1
9456	0217	X-Bohbat	20.756052	-88.033829999999995	102	1
9457	0221	Dzekul	20.656506	-88.168115999999998	102	1
9458	0222	X-Katil	20.48443	-88.088881999999998	102	1
9459	0223	X-Puhá	20.671061000000002	-88.121159000000006	102	1
9460	0224	Rancho Tekal	20.645437999999999	-88.105734999999996	102	1
9461	0228	Chablé	20.671880999999999	-88.123248000000004	102	1
9462	0233	Yokdzonot Dos	20.663708	-88.080549000000005	102	1
9463	0245	Santa Rosa	20.719083000000001	-88.209826000000007	102	1
9464	0246	Kaan Ac	20.728677999999999	-88.198576000000003	102	1
9465	0252	Tres Marías	20.705309	-88.241039000000001	102	1
9466	0254	San Román	20.775122	-88.206096000000002	102	1
9467	0256	La Guadalupana	20.706665999999998	-88.234222000000003	102	1
9468	0259	Kankabchén	20.645129000000001	-88.169392000000002	102	1
9469	0260	Noc-Ac	20.680149	-88.104315999999997	102	1
9470	0262	San Antonio	20.704947000000001	-88.088628999999997	102	1
9471	0263	Chan Yokdzonot	20.768730999999999	-88.182877000000005	102	1
9472	0270	Acantún	20.601227999999999	-88.153541000000004	102	1
9473	0271	X-Bahil	20.595230999999998	-88.153949999999995	102	1
9474	0272	San José	20.614833000000001	-88.143822999999998	102	1
9475	0275	Yokdzonot	20.669844000000001	-88.188434999999998	102	1
9476	0280	Akabchén	20.775406	-88.018285000000006	102	1
9477	0282	Blanca Flor	20.722104999999999	-88.205684000000005	102	1
9478	0283	Butum-Chén	20.784936999999999	-88.019737000000006	102	1
9479	0284	Las Camelias	20.689442	-88.075470999999993	102	1
9480	0287	Rancho Yucatán	20.601711000000002	-88.127522999999997	102	1
9481	0288	Carolina	20.678751999999999	-88.072089000000005	102	1
9482	0289	Catzín	20.671309000000001	-88.173186000000001	102	1
9483	0290	Caxayché	20.735887999999999	-88.205654999999993	102	1
9484	0291	Centro Bachillerato Tecnológico Agropecuario	20.654059	-88.213001000000006	102	1
9485	0293	Cocom	20.681304000000001	-88.167486999999994	102	1
9486	0299	Chan Poop	20.477829	-88.036942999999994	102	1
9487	0300	Chamul	20.377749999999999	-88.065678000000005	102	1
9488	0302	Chan Hunukú	20.747665999999999	-88.184839999999994	102	1
9489	0303	Chan Popolá	20.661249999999999	-88.271051999999997	102	1
9490	0304	Cardenales	20.745377999999999	-88.209548999999996	102	1
9491	0307	X-Cabil Dos	20.750315000000001	-88.250764000000004	102	1
9492	0310	San Diego Chumucbé	20.753084999999999	-88.210125000000005	102	1
9493	0311	Chuyche	20.719857999999999	-88.117056000000005	102	1
9494	0318	Sil-Balam	20.609480000000001	-88.040118000000007	102	1
9495	0319	Ek-Balam	20.699508999999999	-88.130994000000001	102	1
9496	0320	Secundaria Técnica Seis	20.663451999999999	-88.209592999999998	102	1
9497	0321	Géneva	20.838125000000002	-88.013177999999996	102	1
9498	0322	Rancho Cervera [Granja Porcícola]	20.773849999999999	-88.045665999999997	102	1
9499	0323	Hau-Och	20.735824000000001	-88.011904999999999	102	1
9500	0324	Uspib	20.798369000000001	-88.048445999999998	102	1
9501	0325	Xochol	20.688841	-88.157908000000006	102	1
9502	0328	Valladolid [CDI]	20.665659000000002	-88.208280999999999	102	1
9503	0329	Jacarandas	20.706506000000001	-88.122026000000005	102	1
9504	0331	X-Kambul	20.673558	-88.162321000000006	102	1
9505	0333	Nueva Jerusalén	20.556836000000001	-87.988821000000002	102	1
9506	0335	Kix Abán	20.685110000000002	-88.062246000000002	102	1
9507	0336	Chan Kiuik	20.648326000000001	-88.073245999999997	102	1
9508	0337	Kulinché	20.783787	-88.019068000000004	102	1
9509	0338	Kumal	20.742201000000001	-88.074327999999994	102	1
9510	0340	Kuxbilá	20.764589000000001	-88.208387999999999	102	1
9511	0344	Xnohbutún	20.636043999999998	-88.034141000000005	102	1
9512	0345	Nohtoc	20.785910999999999	-88.101491999999993	102	1
9513	0347	Nueva Margarita	20.77739	-88.023621000000006	102	1
9514	0348	K'an Ac	20.718616999999998	-88.201346999999998	102	1
9515	0351	Palomar	20.631381000000001	-88.123389000000003	102	1
9516	0352	Las Palomas	20.707384999999999	-88.208710999999994	102	1
9517	0355	X-Pich Kauil	20.632883	-88.107866000000001	102	1
9518	0356	La Piedra	20.685258000000001	-88.041230999999996	102	1
9519	0357	La Poderosa del Oriente	20.706911999999999	-88.202535999999995	102	1
9520	0359	Chan Puhuy	20.764609	-88.187549000000004	102	1
9521	0363	Sahcabá	20.731439000000002	-88.216544999999996	102	1
9522	0368	San Antonio	20.650161000000001	-88.220768000000007	102	1
9523	0369	San Antonio Chic-Chan	20.686060999999999	-88.083237999999994	102	1
9524	0371	San Cristóbal	20.675145000000001	-88.209832000000006	102	1
9525	0372	La Ceiba	20.694734	-88.163764	102	1
9526	0375	San Isidro	20.767047000000002	-88.181292999999997	102	1
9527	0377	San Isidro	20.772734	-88.182834999999997	102	1
9528	0378	San Isidro	20.698847000000001	-88.048136	102	1
9529	0381	San Jacinto	20.812083999999999	-88.008049999999997	102	1
9530	0385	San Lorenzo	20.707456000000001	-88.263537999999997	102	1
9531	0388	San Lorenzo Oxmán	20.667961999999999	-88.229724000000004	102	1
9532	0391	San Mateo	20.762028999999998	-88.215892999999994	102	1
9533	0392	San Miguel	20.760164	-88.213976000000002	102	1
9534	0393	San Miguel	20.624234000000001	-88.055768	102	1
9535	0394	San Pablo	20.406243	-88.088071999999997	102	1
9536	0395	San Pedro Sula	20.708981999999999	-88.088386	102	1
9537	0396	San Pedro	20.674358999999999	-88.160073999999994	102	1
9538	0397	San Pedro	20.758801999999999	-88.213060999999996	102	1
9539	0399	Santa Barbara	20.707830999999999	-88.214618999999999	102	1
9540	0400	Santa Cruz	20.676739999999999	-88.045069999999996	102	1
9541	0401	Santa Cruz	20.762165	-88.057203999999999	102	1
9542	0402	Santa Cruz	20.631761999999998	-88.093986000000001	102	1
9543	0404	Santa Cruz	20.523396999999999	-88.038171000000006	102	1
9544	0408	Santa Fermina	20.775770999999999	-88.212853999999993	102	1
9545	0409	Villa Elidé	20.695974	-88.164327999999998	102	1
9546	0415	Suytún	20.667157	-88.179496999999998	102	1
9547	0418	Tixcancal	20.686886999999999	-88.058046000000004	102	1
9548	0423	Tres Reyes	20.760762	-88.188508999999996	102	1
9549	0425	San Miguel (Tusik)	20.710723999999999	-88.124183000000002	102	1
9550	0426	Tzulá	20.693854000000002	-88.046700000000001	102	1
9551	0430	X-Balché	20.449286000000001	-88.063371000000004	102	1
9552	0431	X-Nohbutún	20.621341000000001	-88.173325000000006	102	1
9553	0433	X-Cabil	20.748225000000001	-88.249564000000007	102	1
9554	0434	X-Can	20.437384000000002	-88.034848999999994	102	1
9555	0435	Actún	20.629746000000001	-88.145584999999997	102	1
9556	0436	Chunhuás	20.805257999999998	-88.042795999999996	102	1
9557	0439	X-Kanahaltún	20.770702	-88.213628999999997	102	1
9558	0444	Kumil	20.732184	-88.056173000000001	102	1
9559	0445	Lachén	20.679727	-88.160976000000005	102	1
9560	0450	San Diego Xpalib	20.723445999999999	-88.224971999999994	102	1
9561	0451	X-Pech	20.763781999999999	-88.044158999999993	102	1
9562	0452	X-Tohil	20.784085999999999	-88.028844000000007	102	1
9563	0453	X-Tohbil	20.687221999999998	-88.271944000000005	102	1
9564	0454	X-Tohbil	20.777159000000001	-88.177749000000006	102	1
9565	0455	X-Uech	20.614128999999998	-88.122119999999995	102	1
9566	0456	Yax-Kax	20.676054000000001	-88.218613000000005	102	1
9567	0458	Yalxan	20.723251000000001	-88.097690999999998	102	1
9568	0460	Yaxché	20.777408999999999	-88.076914000000002	102	1
9569	0461	Yaxkukul	20.786738	-88.248964000000001	102	1
9570	0463	San José	20.765999000000001	-88.194505000000007	102	1
9571	0465	Yok-Halal	20.764913	-88.223292999999998	102	1
9572	0466	Yohpilá	20.592203999999999	-88.141582999999997	102	1
9573	0467	El Rosario (Dzadz Nal)	20.701279	-88.232583000000005	102	1
9574	0469	Yuyumal	20.699698000000001	-88.081633999999994	102	1
9575	0470	Zahamal	20.676382	-88.242232000000001	102	1
9576	0477	Kantunil	20.688924	-88.098242999999997	102	1
9577	0479	Katil	20.681965000000002	-88.134353000000004	102	1
9578	0480	Kulinché	20.717808999999999	-88.125159999999994	102	1
9579	0481	X-Bacab	20.792645	-87.980029999999999	102	1
9580	0483	San Isidro	20.745875000000002	-88.206417000000002	102	1
9581	0485	San Gerónimo	20.769556999999999	-88.196591999999995	102	1
9582	0486	Felipe Carrillo Puerto	20.698822	-88.264038999999997	102	1
9583	0488	San Diego	20.752783000000001	-88.178554000000005	102	1
9584	0489	Agua Azul	20.827933999999999	-88.032028999999994	102	1
9585	0494	San Miguel	20.648256	-88.157542000000007	102	1
9586	0500	Noh-Chunchacá	20.770385000000001	-88.244592999999995	102	1
9587	0504	Gas Peninsular [Gasera]	20.700937	-88.237115000000003	102	1
9588	0506	Cecembak	20.735119999999998	-88.008189000000002	102	1
9589	0507	Kutzcab	20.775137000000001	-88.044421999999997	102	1
9590	0508	Holop	20.751705999999999	-88.023540999999994	102	1
9591	0510	San Andrés Kampocolché	20.770614999999999	-88.025927999999993	102	1
9592	0511	Akabchén Dos	20.773631000000002	-88.017021	102	1
9593	0512	El Remanso de Nachi Cocom	20.678356000000001	-88.243893999999997	102	1
9594	0515	X-Kamazná	20.712796000000001	-88.071438999999998	102	1
9595	0516	X-Kanakú	20.727247999999999	-88.080836000000005	102	1
9596	0521	Santa Cruz	20.585215000000002	-88.154971000000003	102	1
9597	0523	X-Batún	20.549175000000002	-88.060317999999995	102	1
9598	0525	San Antonio	20.613271999999998	-88.091943999999998	102	1
9599	0526	Tres Reyes	20.463718	-88.084220999999999	102	1
9600	0529	San Salvador	20.442402999999999	-88.047030000000007	102	1
9601	0530	X-Quiahuil	20.452577999999999	-88.067580000000007	102	1
9602	0533	Chumpila	20.721454000000001	-88.120222999999996	102	1
9603	0535	Chan Kot Kahum (Los Cocales)	20.711642999999999	-88.109753999999995	102	1
9604	0536	X-Wó	20.73583	-88.143833999999998	102	1
9605	0537	Yunchén	20.744727000000001	-88.118928999999994	102	1
9606	0538	Zodzilchén	20.747712	-88.124392	102	1
9607	0539	Chanil	20.745318999999999	-88.121993000000003	102	1
9608	0540	X-Catbé	20.738039000000001	-88.122760999999997	102	1
9609	0541	X-Bojón	20.732211	-88.137581999999995	102	1
9610	0542	X-Culumpich	20.782353000000001	-88.087267999999995	102	1
9611	0547	La Ermita de Guadalupe	20.670345000000001	-88.246288000000007	102	1
9612	0548	X-Cux	20.649979999999999	-88.154308999999998	102	1
9613	0549	San Antonio	20.595129	-88.156565999999998	102	1
9614	0550	X-Cuhá	20.554895999999999	-88.147998999999999	102	1
9615	0551	Santa Cruz Uno	20.623090999999999	-88.062872999999996	102	1
9616	0554	Santa Rosa	20.501389	-87.950063999999998	102	1
9617	0561	San Román	20.814039999999999	-88.047944999999999	102	1
9618	0566	X-Uech	20.818396	-88.002426	102	1
9619	0567	Chan-Xpop	20.820416999999999	-87.987882999999997	102	1
9620	0569	Balanté	20.834586999999999	-87.985256000000007	102	1
9621	0570	Chan Tzimín	20.846451999999999	-87.987435000000005	102	1
9622	0574	Pol-Kee	20.808985	-87.991076000000007	102	1
9623	0575	Chocholá	20.841009	-88.009343999999999	102	1
9624	0578	Takú	20.732237000000001	-88.115425000000002	102	1
9625	0580	El Gato Negro	20.694595	-88.167255999999995	102	1
9626	0581	Sac-Bé	20.694372999999999	-88.169779000000005	102	1
9627	0584	Santa María (Xpetzuuc)	20.716577999999998	-88.1661	102	1
9628	0587	X-Kankandzonot	20.756768999999998	-88.164411000000001	102	1
9629	0588	X-Kanahaltún	20.772694000000001	-88.164306999999994	102	1
9630	0590	Santa Teresa	20.752409	-88.220462999999995	102	1
9631	0592	X-Sac-Uil	20.794647999999999	-87.994536999999994	102	1
9632	0594	Totilá	20.762827000000001	-88.046847999999997	102	1
9633	0595	Yokdzonot Reyes	20.508839999999999	-87.947766000000001	102	1
9634	0598	X-Kekén	20.660502000000001	-88.243105	102	1
9635	0599	Chan Tzimín	20.768440999999999	-88.131765000000001	102	1
9636	0600	Cuzanchén	20.777858999999999	-88.134798000000004	102	1
9637	0603	Yohkoop	20.751543999999999	-88.156750000000002	102	1
9638	0605	Suytún	20.739872999999999	-88.162445000000005	102	1
9639	0608	Tepakán	20.742740999999999	-88.166477999999998	102	1
9640	0609	Chun Pom	20.609681999999999	-88.034771000000006	102	1
9641	0610	Chan Cojil	20.594052000000001	-88.005967999999996	102	1
9642	0612	Pacelchén	20.765837000000001	-88.154110000000003	102	1
9643	0615	San Juan Chen	20.515385999999999	-88.069715000000002	102	1
9644	0616	Pihbail	20.446358	-88.072587999999996	102	1
9645	0617	Chun Subul	20.449968999999999	-88.089855	102	1
9646	0621	Timas	20.486916000000001	-87.991615999999993	102	1
9647	0622	Noxkituc	20.613731999999999	-88.078429	102	1
9648	0624	Tukichén	20.691517999999999	-88.143108999999995	102	1
9649	0626	Kanxoc-Chen	20.808931999999999	-87.967653999999996	102	1
9650	0627	San Salvador	20.547839	-88.061207999999993	102	1
9651	0628	Ce-Ac	20.774692999999999	-88.172302999999999	102	1
9652	0629	Petzuuc	20.651586000000002	-88.136229	102	1
9653	0630	X-Gonsascab	20.763781999999999	-88.130347	102	1
9654	0631	Bolmay	20.549029000000001	-87.934760999999995	102	1
9655	0632	Bretaña	20.822019999999998	-88.032008000000005	102	1
9656	0633	Chan Kop-Dzadz	20.717693000000001	-88.180042	102	1
9657	0634	Chan Pom	20.770586000000002	-88.129349000000005	102	1
9658	0635	Chice Santa Cruz	20.809747000000002	-88.036985000000001	102	1
9659	0636	El Diezmo	20.710273999999998	-88.204239999999999	102	1
9660	0638	Halal	20.70505	-88.198819	102	1
9661	0640	Kaal'ak	20.686827000000001	-88.156684999999996	102	1
9662	0643	El Laurel	20.680053000000001	-88.239328	102	1
9663	0644	Nah-Capat	20.768443999999999	-88.191699999999997	102	1
9664	0646	Quex	20.684042999999999	-88.152683999999994	102	1
9665	0648	Sahuinché	20.810573999999999	-88.049065999999996	102	1
9666	0650	San José	20.717289999999998	-88.174522999999994	102	1
9667	0651	San Miguel	20.706391	-88.142638000000005	102	1
9668	0652	San Pedro	20.742819999999998	-88.158309000000003	102	1
9669	0653	San Ramón	20.689993999999999	-88.062995999999998	102	1
9670	0654	Santa Diana	20.644259000000002	-88.212991000000002	102	1
9671	0655	Santa Eleuteria	20.668887000000002	-88.330956999999998	102	1
9672	0656	Santa Rosa	20.778867000000002	-88.048783999999998	102	1
9673	0658	San Antonio	20.766105	-88.207818000000003	102	1
9674	0659	San Juan X-Cabil	20.761579000000001	-88.246385000000004	102	1
9675	0660	Ninguno [CFE]	20.706568000000001	-88.203429999999997	102	1
9676	0661	Tumben Cuxtal	20.731539000000001	-88.203505000000007	102	1
9677	0662	Caxayché	20.730855999999999	-88.208083999999999	102	1
9678	0666	Noc-Pek	20.468163000000001	-88.066816000000003	102	1
9679	0667	Suytún	20.70064	-88.128151000000003	102	1
9680	0668	Tumbenchén	20.604306999999999	-88.100871999999995	102	1
9681	0669	X-Dzul	20.817468000000002	-88.029268000000002	102	1
9682	0670	Pacabtuncito Uno y Dos	20.706980000000001	-88.096175000000002	102	1
9683	0671	Yaax-Hal	20.831351000000002	-88.027833000000001	102	1
9684	0673	Modelo [Escuela]	20.691375000000001	-88.173322999999996	102	1
9685	0675	Chan Xkituk	20.61186	-88.078632999999996	102	1
9686	0676	X-Chiceh	20.808024	-88.040442999999996	102	1
9687	0679	San Francisco	20.630821000000001	-88.038815999999997	102	1
9688	0680	Santa Matilde	20.600277999999999	-88.052699000000004	102	1
9689	0681	Santa Rita	20.709167000000001	-88.107763000000006	102	1
9690	0682	Figueroa Martínez [Gasolinera]	20.698654999999999	-88.135339000000002	102	1
9691	0685	X-Bohón	20.660408	-88.137096	102	1
9692	0686	X-Kanahaltún	20.838269	-88.019236000000006	102	1
9693	0687	Kuchechén	20.727004999999998	-88.115061999999995	102	1
9694	0688	X-Kutzab	20.769269000000001	-88.151719999999997	102	1
9695	0690	San José	20.762115000000001	-88.059127000000004	102	1
9696	0691	Chi-Ceh	20.808610999999999	-88.036944000000005	102	1
9697	0693	San Francisco de Asís	20.759658999999999	-88.059302000000002	102	1
9698	0694	Palmar	20.766819999999999	-88.045737000000003	102	1
9699	0695	Bacilio Caballero	20.767880999999999	-88.049345000000002	102	1
9700	0696	Sah-Kachén	20.798136	-88.037034000000006	102	1
9701	0697	Samulá	20.597819000000001	-88.145515000000003	102	1
9702	0698	San Felipe	20.578220999999999	-88.122540999999998	102	1
9703	0699	Kancab	20.836261	-87.979290000000006	102	1
9704	0700	Kancabdzonot	20.840980999999999	-87.97775	102	1
9705	0701	Pom	20.555893000000001	-88.089667000000006	102	1
9706	0702	San Martín	20.806591000000001	-88.046429000000003	102	1
9707	0703	X-Pech Dos	20.763234000000001	-88.042259999999999	102	1
9708	0704	Juchín	20.809805999999998	-87.978088	102	1
9709	0705	Ninguno [Bodega Sabritas]	20.694526	-88.168751999999998	102	1
9710	0707	Chac-Halal	20.737300000000001	-88.171211999999997	102	1
9711	0708	Chan Dzub	20.748384000000001	-88.147424999999998	102	1
9712	0709	Chan Suytún	20.698768000000001	-88.125928000000002	102	1
9713	0710	La Choza	20.670304000000002	-88.254465999999994	102	1
9714	0711	Curtiduría Chávez	20.755799	-88.207522999999995	102	1
9715	0712	San Manuel	20.660454999999999	-88.171918000000005	102	1
9716	0713	San Eusebio Balam	20.674928000000001	-88.171001000000004	102	1
9717	0714	San Luis	20.672211000000001	-88.221475999999996	102	1
9718	0715	Sagrado Corazón de Jesús	20.684819000000001	-88.249669999999995	102	1
9719	0716	Saamal Cinco	20.681156000000001	-88.236863999999997	102	1
9720	0720	San Ángel	20.681018000000002	-88.161225999999999	102	1
9721	0725	Sergio Maza	20.773349	-88.202184000000003	102	1
9722	0726	Promatza	20.728061	-88.204392999999996	102	1
9723	0728	La Piedra Angular	20.694813	-88.162490000000005	102	1
9724	0729	Sahcabá Dos	20.731902999999999	-88.222853000000001	102	1
9725	0731	San Antonio	20.704657999999998	-88.093558000000002	102	1
9726	0732	X-Calaptzo	20.663005999999999	-88.250376000000003	102	1
9727	0733	San Juan Bubul	20.697638999999999	-88.237495999999993	102	1
9728	0734	San Judas Tadeo	20.649311000000001	-88.213589999999996	102	1
9729	0735	San Lorenzo	20.737947999999999	-88.118994999999998	102	1
9730	0736	San Manuel	20.685589	-88.238562000000002	102	1
9731	0737	San Manuel	20.687730999999999	-88.131746000000007	102	1
9732	0738	Dos Gallos	20.763292	-88.198374999999999	102	1
9733	0740	Kauán	20.537921000000001	-88.017278000000005	102	1
9734	0741	Noh Chaca	20.568163999999999	-88.041739000000007	102	1
9735	0742	San Lucio	20.592317000000001	-88.099801999999997	102	1
9736	0743	Xaybé	20.75469	-88.233017000000004	102	1
9737	0744	Chac-Batz	20.724167000000001	-88.055481999999998	102	1
9738	0745	Chanyokdzonot Dos	20.735672999999998	-88.200509999999994	102	1
9739	0746	Chelem	20.659033999999998	-88.049522999999994	102	1
9740	0747	Chan Chen	20.646001999999999	-88.050749999999994	102	1
9741	0749	Huayaba	20.626131000000001	-88.089778999999993	102	1
9742	0750	Kuncheil	20.509526000000001	-88.016208000000006	102	1
9743	0751	San Felipe	20.622914999999999	-88.068245000000005	102	1
9744	0752	San Francisco	20.524999999999999	-88.165278000000001	102	1
9745	0754	San José	20.675022999999999	-88.151791000000003	102	1
9746	0755	San Marcos	20.688659000000001	-88.062832999999998	102	1
9747	0756	San Vicente	20.643452	-88.086669000000001	102	1
9748	0757	Santa María	20.594456000000001	-88.018293	102	1
9749	0758	Santa María	20.620007000000001	-88.084397999999993	102	1
9750	0759	Chiquis [Paradero]	20.696451	-88.152300999999994	102	1
9751	0760	La Fátima	20.697984000000002	-88.101119999999995	102	1
9752	0761	Mi Gallo	20.667940000000002	-88.248818999999997	102	1
9753	0762	Novelo [Rancho]	20.711099999999998	-88.218024	102	1
9754	0763	Sinail	20.55641	-88.031783000000004	102	1
9755	0764	Sodzil	20.621689	-88.109533999999996	102	1
9756	0765	Celkop	20.631675000000001	-88.077506	102	1
9757	0766	Susulá	20.703710000000001	-88.075839999999999	102	1
9758	0767	Xcojil	20.599706000000001	-88.012491999999995	102	1
9759	0772	Santa María	20.734963	-87.995390999999998	102	1
9760	0773	Chansus	20.711175999999998	-88.110425000000006	102	1
9761	0774	Chunhalal	20.774166999999998	-88.172499999999999	102	1
9762	0776	San Esteban	20.703970000000002	-88.158698000000001	102	1
9763	0777	San Antonio Takú	20.732478	-88.114636000000004	102	1
9764	0779	Yoh Mul	20.742956	-88.150378000000003	102	1
9765	0780	X-Kalacdzonot	20.835716999999999	-87.983341999999993	102	1
9766	0781	X-Maax	20.828755000000001	-87.97663	102	1
9767	0783	Chanchén	20.467604000000001	-88.068492000000006	102	1
9768	0784	Construrama	20.730682000000002	-88.207192000000006	102	1
9769	0785	Humberto Díaz Martínez	20.707678000000001	-88.203277	102	1
9770	0787	Xisbic	20.721442	-88.245418999999998	102	1
9771	0789	Azteca [Televisión]	20.708192	-88.202522999999999	102	1
9772	0790	Paraíso	20.746846999999999	-88.205838999999997	102	1
9773	0791	San Lorenzo	20.478432999999999	-88.090858999999995	102	1
9774	0792	Santa Inés	20.761561	-88.213081000000003	102	1
9775	0793	Yohdzonot	20.497102999999999	-88.095534999999998	102	1
9776	0794	Zak Bocol	20.726147000000001	-88.243266000000006	102	1
9777	0796	Agua Dulce	20.817453	-88.054102	102	1
9778	0797	Chan Xkauil	20.635505999999999	-88.165576999999999	102	1
9779	0798	Club Sesenta y Nueve	20.701086	-88.157852000000005	102	1
9780	0799	Dzonot Petká	20.461479000000001	-87.988290000000006	102	1
9781	0800	Dzoyolchac	20.503139000000001	-88.072528000000005	102	1
9782	0803	San Felipe	20.766918	-88.205505000000002	102	1
9783	0805	María Bonita	20.704722	-88.203747000000007	102	1
9784	0806	Opil	20.621586000000001	-88.159289000000001	102	1
9785	0807	Petká	20.457408999999998	-87.980439000000004	102	1
9786	0808	La Rosa de Guadalupe	20.809684000000001	-88.045139000000006	102	1
9787	0809	Sambulá	20.661901	-88.243875000000003	102	1
9788	0810	Modelo [Universidad]	20.691441999999999	-88.174773000000002	102	1
9789	0811	Xojolchén	20.605591	-88.079759999999993	102	1
9790	0813	Maya K'yín	20.680772999999999	-88.237307999999999	102	1
9791	0814	Ninguno	20.696791999999999	-88.149681999999999	102	1
9792	0815	San Isidro	20.775307999999999	-88.118707999999998	102	1
9793	0816	Santa Inés Dos	20.775365000000001	-88.201222000000001	102	1
9794	0817	Chan Hunuku	20.747851000000001	-88.193668000000002	102	1
9795	0818	Chan Xbutum Dos	20.777915	-88.023343999999994	102	1
9796	0819	Gran Hacienda Valladolid	20.653396999999998	-88.198224999999994	102	1
9797	0820	Santa Librada	20.635898000000001	-88.033885999999995	102	1
9798	0821	Yaax Hom Timas	20.654143999999999	-88.085148000000004	102	1
9799	0822	La Santa Cruz	20.58886	-88.153886	102	1
9800	0823	Ka'anan	20.555247999999999	-88.033776000000003	102	1
9801	0824	Santa Isabel	20.461790000000001	-88.127887000000001	102	1
9802	0825	X-Juubil	20.453942000000001	-88.129698000000005	102	1
9803	0826	Santa Eleuteria	20.78266	-88.172811999999993	102	1
9804	0827	Nenelá	20.744146000000001	-87.999764999999996	102	1
9805	0828	Kumal Dos	20.737117000000001	-88.075237000000001	102	1
9806	0829	Labín Subín	20.688178000000001	-88.109943000000001	102	1
9807	0830	La Rejollada	20.635570999999999	-88.099176	102	1
9808	0831	San Miguel Chablé	20.670786	-88.123711999999998	102	1
9809	0832	Santa Rita [Anexa]	20.693239999999999	-88.129811000000004	102	1
9810	0833	X-Pich	20.648040999999999	-88.089140999999998	102	1
9811	0834	Xux-Há	20.687042000000002	-88.056471999999999	102	1
9812	0835	Cosil	20.813013000000002	-88.285340000000005	102	1
9813	0836	Dzon Kú (Hermanos Ricalde)	20.781531000000001	-88.098281	102	1
9814	0837	Kalakop	20.762581000000001	-88.040341999999995	102	1
9815	0838	Lodgecol	20.864222000000002	-88.005756000000005	102	1
9816	0839	San Antonio	20.759613999999999	-88.218411000000003	102	1
9817	0840	San Miguel	20.764931000000001	-88.16225	102	1
9818	0841	San Isidro 2	20.782281000000001	-88.194922000000005	102	1
9819	0842	Divino Niño	20.669684	-88.286505000000005	102	1
9820	0843	San Lorenzo	20.684479	-88.175568999999996	102	1
9821	0844	Santa Cecilia	20.685331999999999	-88.176895999999999	102	1
9822	0845	Merza [Grupo Comercial]	20.682572	-88.244072000000003	102	1
9823	0846	Instituto Tecnológico Superior de Valladolid	20.721944000000001	-88.196667000000005	102	1
9824	0001	Xocchel	20.833489	-89.183718999999996	103	1
9825	0002	Lolbé	20.829984	-89.155752000000007	103	1
9826	0003	Candelaria	20.810753999999999	-89.181320999999997	103	1
9827	0004	Concepción	20.797395999999999	-89.084359000000006	103	1
9828	0005	Chakán	20.826640999999999	-89.108875999999995	103	1
9829	0006	Del Prado	20.828028	-89.197849000000005	103	1
9830	0008	Paraíso	20.833666999999998	-89.107956999999999	103	1
9831	0010	Salactún	20.789017000000001	-89.126676000000003	103	1
9832	0024	San Cristóbal	20.808681	-89.087953999999996	103	1
9833	0025	San Pedro Actunchén	20.800587	-89.176432000000005	103	1
9834	0027	San Hilario	20.820312999999999	-89.183631000000005	103	1
9835	0034	Xocchel	20.844514	-89.184768000000005	103	1
9836	0037	San Juan Bautista	20.817698	-89.180305000000004	103	1
9837	0039	San Francisco	20.824335999999999	-89.194641000000004	103	1
9838	0041	San Eustaquio	20.810576999999999	-89.137642999999997	103	1
9839	0042	Yalkakán	20.831910000000001	-89.193652	103	1
9840	0044	Santa Cruz	20.827251	-89.101802000000006	103	1
9841	0045	Clara Cetina	20.827475	-89.175072999999998	103	1
9842	0046	Xyat [Rancho]	20.825575000000001	-89.174092999999999	103	1
9843	0001	Yaxcabá	20.549126000000001	-88.827206000000004	104	1
9844	0002	Canakom	20.441488	-88.761936000000006	104	1
9845	0003	Si-Hó	20.364948999999999	-88.734132000000002	104	1
9846	0004	Kuxché	20.416094999999999	-88.737455999999995	104	1
9847	0005	San Felipe	20.273520000000001	-88.645020000000002	104	1
9848	0008	Yaxché	20.510207999999999	-88.639235999999997	104	1
9849	0010	Tinuncah	20.262554999999999	-88.682799000000003	104	1
9850	0011	Cipché	20.311803999999999	-88.597611000000001	104	1
9851	0013	Santa María Ku	20.289521000000001	-88.598757000000006	104	1
9852	0014	San Marcos Dos	20.431685000000002	-88.888851000000003	104	1
9853	0015	Xnicteil	20.228176000000001	-88.618702999999996	104	1
9854	0016	San Rafael	20.244837	-88.643556000000004	104	1
9855	0017	X-Ochil	20.379978999999999	-88.729153999999994	104	1
9856	0018	San Pedro	20.390488000000001	-88.722363000000001	104	1
9857	0019	Tiholop	20.331721999999999	-88.688901999999999	104	1
9858	0020	Chan-Chen	20.262017	-88.603871999999996	104	1
9859	0021	Xlapak	20.256314	-88.628968	104	1
9860	0022	Santo Tomás	20.295553999999999	-88.744408000000007	104	1
9861	0023	Ixinché	20.482500000000002	-88.751389000000003	104	1
9862	0024	Cholul	20.285043999999999	-88.725153000000006	104	1
9863	0027	Yokdzonot-Hú	20.460305000000002	-88.642756000000006	104	1
9864	0031	Huechen Balam	20.394271	-88.681359999999998	104	1
9865	0032	Libre Unión	20.707355	-88.809972000000002	104	1
9866	0033	Noc-Ac	20.620994	-88.740684999999999	104	1
9867	0035	Yokdzonot	20.710833000000001	-88.731026999999997	104	1
9868	0036	Nachicocom	20.707104999999999	-88.760559000000001	104	1
9869	0041	X-Mexil	20.657216999999999	-88.735994000000005	104	1
9870	0042	Tiholop Xtancia	20.582325999999998	-88.688305	104	1
9871	0043	Yaxunah	20.541022000000002	-88.676534000000004	104	1
9872	0045	Chimay	20.540647	-88.727669000000006	104	1
9873	0047	Santa María	20.505455999999999	-88.660668000000001	104	1
9874	0050	Santa Amalia Yohactún	20.477499999999999	-88.747777999999997	104	1
9875	0051	Kancabdzonot	20.509478000000001	-88.711280000000002	104	1
9876	0052	Tixcacaltuyub	20.49315	-88.917557000000002	104	1
9877	0053	Popox	20.407139000000001	-88.944607000000005	104	1
9878	0054	San Marcos	20.257197999999999	-88.650088999999994	104	1
9879	0056	Popolá	20.595694000000002	-88.650396000000001	104	1
9880	0057	Cenote Abán	20.611284999999999	-88.652529999999999	104	1
9881	0059	Xanlá	20.613014	-88.668650999999997	104	1
9882	0060	Tahdzibichén	20.450098000000001	-88.831711999999996	104	1
9883	0061	San Juan	20.358787	-88.838817000000006	104	1
9884	0062	San Emilio	20.368200000000002	-88.862763000000001	104	1
9885	0064	Sahcabá	20.374168999999998	-88.848543000000006	104	1
9886	0067	Cisteil	20.320156999999998	-88.845133000000004	104	1
9887	0071	Rancho Grande	20.341843999999998	-88.806732999999994	104	1
9888	0074	María Eugenia	20.401423999999999	-88.757983999999993	104	1
9889	0076	Santa Rita	20.657312000000001	-88.793453	104	1
9890	0078	San Pedro	20.406109000000001	-88.888593999999998	104	1
9891	0081	Santa Pilar	20.607890999999999	-88.676640000000006	104	1
9892	0083	Sac-Nicté	20.537108	-88.783073000000002	104	1
9893	0085	Thel-Hú	20.492346999999999	-88.780428999999998	104	1
9894	0092	Zac-Né	20.689574	-88.771210999999994	104	1
9895	0093	Culné	20.661812000000001	-88.768349000000001	104	1
9896	0095	Chan-Campech	20.363230999999999	-88.945610000000002	104	1
9897	0096	Chan Pich	20.297350000000002	-88.837013999999996	104	1
9898	0099	Chic	20.668448000000001	-88.734560999999999	104	1
9899	0101	Dolores	20.301321000000002	-88.783998999999994	104	1
9900	0104	Ekbalam	20.412862000000001	-88.928107999999995	104	1
9901	0105	El Faisán	20.678025000000002	-88.745761999999999	104	1
9902	0107	Acapulco	20.623017999999998	-88.815218000000002	104	1
9903	0108	Kambul	20.565059000000002	-88.761007000000006	104	1
9904	0109	Kancabchén	20.349401	-88.790541000000005	104	1
9905	0112	Och-Aké	20.676504999999999	-88.818090999999995	104	1
9906	0113	Kutub	20.413381000000001	-88.840919999999997	104	1
9907	0114	Say-Ucil	20.684843999999998	-88.804472000000004	104	1
9908	0115	Box-Há	20.414065000000001	-88.867085000000003	104	1
9909	0120	Sahcabchén	20.599881	-88.819800000000001	104	1
9910	0122	San Alfonso	20.328136000000001	-88.888519000000002	104	1
9911	0123	Santo Domingo	20.525592	-88.737198000000006	104	1
9912	0125	San Antonio Xu'ul	20.491555000000002	-88.784755000000004	104	1
9913	0126	San Arturo	20.392977999999999	-88.860225999999997	104	1
9914	0127	San Arturito	20.382010000000001	-88.847299000000007	104	1
9915	0128	Santa Cruz	20.468104	-88.864399000000006	104	1
9916	0131	X-Pom	20.361062	-88.867822000000004	104	1
9917	0132	San Diego	20.550837000000001	-88.925357000000005	104	1
9918	0133	San Felipe	20.632739000000001	-88.812864000000005	104	1
9919	0135	San Fidel	20.397953999999999	-88.840976999999995	104	1
9920	0136	San Francisco	20.658670999999998	-88.808526000000001	104	1
9921	0139	San Ignacio	20.408197999999999	-88.843768999999995	104	1
9922	0140	San Isidro	20.623856	-88.818565000000007	104	1
9923	0141	San Jorge	20.68835	-88.811982	104	1
9924	0142	Ayil	20.408021999999999	-88.756354000000002	104	1
9925	0144	San José Yaxché	20.574069999999999	-88.773793999999995	104	1
9926	0145	San José Quintana Roo	20.464397999999999	-88.699556000000001	104	1
9927	0147	San Juan	20.387613999999999	-88.739065999999994	104	1
9928	0149	San Manuel	20.647122	-88.814454999999995	104	1
9929	0150	San Buenaventura	20.307963999999998	-88.811721000000006	104	1
9930	0151	San Marcos	20.632389	-88.713920999999999	104	1
9931	0152	San Pedro	20.64996	-88.706439000000003	104	1
9932	0153	San Marcos	20.428826000000001	-88.904498000000004	104	1
9933	0155	San Mateo Uno	20.430793000000001	-88.921109999999999	104	1
9934	0156	San Mateo Dos	20.435438999999999	-88.932913999999997	104	1
9935	0158	San Miguel	20.367961999999999	-88.775599	104	1
9936	0159	San Martín	20.418462999999999	-88.892573999999996	104	1
9937	0160	San Pedro	20.535463	-88.916537000000005	104	1
9938	0161	San Pedro	20.472612000000002	-88.870679999999993	104	1
9939	0164	San Valerio	20.334192000000002	-88.828777000000002	104	1
9940	0167	Santa Inés	20.481476000000001	-88.781754000000006	104	1
9941	0168	Santa Lucía	20.478099	-88.907781999999997	104	1
9942	0169	Santa María	20.395771	-88.904961	104	1
9943	0170	Santa Rosa	20.271353000000001	-88.813097999999997	104	1
9944	0171	Santa Rosa	20.320958000000001	-88.885113000000004	104	1
9945	0172	Bithá	20.655176000000001	-88.792845	104	1
9946	0173	De la Garza	20.635738	-88.685728999999995	104	1
9947	0175	Santa Rosario	20.416183	-88.932458999999994	104	1
9948	0176	Santa Teresa	20.349228	-88.780294999999995	104	1
9949	0182	Tahdzibil	20.468730999999998	-88.667443000000006	104	1
9950	0183	Tahdzibil Dos	20.465952999999999	-88.667008999999993	104	1
9951	0184	Tikincacab	20.424893999999998	-88.717741000000004	104	1
9952	0186	Usichén	20.365808000000001	-88.826148000000003	104	1
9953	0191	San Pedro	20.389893000000001	-88.937954000000005	104	1
9954	0192	Xbac	20.4375	-88.969999999999999	104	1
9955	0194	Xpanil	20.525879	-88.749870000000001	104	1
9956	0197	Xpondzonot	20.307632999999999	-88.867204999999998	104	1
9957	0198	Xtojil	20.359404999999999	-88.905900000000003	104	1
9958	0199	Yaxcheil	20.475888999999999	-88.734380999999999	104	1
9959	0201	Kancabchén	20.285623000000001	-88.665884000000005	104	1
9960	0203	San Arnulfo	20.346007	-88.880225999999993	104	1
9961	0206	El Porvenir	20.693680000000001	-88.812853000000004	104	1
9962	0207	San Rafael	20.653561	-88.691119999999998	104	1
9963	0211	Chamizal	20.721654000000001	-88.810137999999995	104	1
9964	0214	Tumben Chen	20.659544	-88.726060000000004	104	1
9965	0216	Cacalchén	20.579819000000001	-88.820473000000007	104	1
9966	0222	Kuxché	20.580068000000001	-88.746024000000006	104	1
9967	0223	Santa Petronila	20.415382000000001	-88.871793999999994	104	1
9968	0224	San Eustaquio	20.357963000000002	-88.919031000000004	104	1
9969	0225	X-Pica	20.344767999999998	-88.889458000000005	104	1
9970	0226	San Antonio	20.296002000000001	-88.580084999999997	104	1
9971	0227	Yax-Há	20.592352000000002	-88.819766999999999	104	1
9972	0228	Chan-Chen	20.347044	-88.895476000000002	104	1
9973	0229	Los Cenotes	20.612712999999999	-88.774423999999996	104	1
9974	0230	Robles	20.316976	-88.808907000000005	104	1
9975	0231	San Felipe el Carrizal	20.612777000000001	-88.817939999999993	104	1
9976	0232	San Martín	20.332802999999998	-88.789289999999994	104	1
9977	0234	Tahdzibil	20.511955	-88.731849999999994	104	1
9980	0237	Santa Isabel	20.655919999999998	-88.738596000000001	104	1
9981	0238	Ninguno	20.544013	-88.816445999999999	104	1
9982	0240	Blanca Flor	20.335450999999999	-88.911432000000005	104	1
9983	0241	Escuela Secundaria Técnica Número Sesenta	20.690933999999999	-88.812017999999995	104	1
9984	0242	Los Flamboyanes	20.317696000000002	-88.797955999999999	104	1
9985	0245	Ninguno	20.609010999999999	-88.680273	104	1
9986	0246	Centro de Actualización para Maestros	20.558859000000002	-88.826213999999993	104	1
9987	0247	Ninguno	20.535617999999999	-88.763602000000006	104	1
9988	0250	Ixinché	20.315895999999999	-88.732551000000001	104	1
9989	0251	Kan-Há	20.556698000000001	-88.661974999999998	104	1
9990	0252	Kancabchén	20.326127	-88.873568000000006	104	1
9991	0253	Miguel Hidalgo	20.429839000000001	-88.669618	104	1
9992	0254	Nahchaltún	20.451806000000001	-88.846783000000002	104	1
9993	0255	Oxolá	20.581561000000001	-88.676286000000005	104	1
9994	0256	San Antonio	20.289418999999999	-88.702160000000006	104	1
9995	0257	San Cosme	20.271276	-88.802480000000003	104	1
9996	0258	San Felipe	20.332853	-88.917749000000001	104	1
9997	0261	San Juan	20.372133000000002	-88.789017999999999	104	1
9998	0263	San Nicolás	20.706095000000001	-88.778450000000007	104	1
9999	0266	Santa Teresa	20.315299	-88.699275	104	1
10000	0267	Santa Victoria	20.253464000000001	-88.622220999999996	104	1
10001	0268	Thel Hú	20.490134000000001	-88.772463000000002	104	1
10002	0270	Yaxunah [Zona Arqueológica]	20.542413	-88.663313000000002	104	1
10003	0271	Rancho Chico	20.327608999999999	-88.784208000000007	104	1
10004	0272	Ninguno	20.544584	-88.831096000000002	104	1
10005	0273	Ninguno	20.555402999999998	-88.822827000000004	104	1
10006	0274	Cementerio	20.708500999999998	-88.742842999999993	104	1
10007	0275	La Guadalupana	20.708905999999999	-88.816865000000007	104	1
10008	0276	San Diego de Alcalá	20.710297000000001	-88.714859000000004	104	1
10009	0277	Santa Rosa	20.638695999999999	-88.678256000000005	104	1
10010	0278	Susulyuc	20.384778000000001	-88.730132999999995	104	1
10011	0279	Yaxcabá [Secundaria]	20.33727	-88.697537999999994	104	1
10012	0280	Santa Cecilia	20.556576	-88.826894999999993	104	1
10013	0281	Donato Moo Canto	20.557459999999999	-88.826510999999996	104	1
10014	0282	Ninguno	20.539501999999999	-88.828056000000004	104	1
10015	0283	Garby	20.329920999999999	-88.803194000000005	104	1
10016	0284	San Bernardino	20.327213	-88.777490999999998	104	1
10017	0285	X-Holob	20.736376	-88.821691000000001	104	1
10018	0001	Yaxkukul	21.063479000000001	-89.419238000000007	105	1
10019	0002	San Juan de las Flores	21.071957000000001	-89.417861000000002	105	1
10020	0003	San Pedro Chacabal	21.050553000000001	-89.445644000000001	105	1
10021	0006	Bachoco Veintitrés de Abril	21.035582999999999	-89.421152000000006	105	1
10022	0007	San Francisco	21.043081000000001	-89.418893999999995	105	1
10023	0008	Los Cardenales	21.037147999999998	-89.420051999999998	105	1
10024	0009	Kampocolché	21.065773	-89.402268000000007	105	1
10025	0013	Luis Echeverría	21.060628000000001	-89.490753999999995	105	1
10026	0016	San Lorenzo	21.063860999999999	-89.452439999999996	105	1
10027	0017	Xyoactún	21.066593999999998	-89.453335999999993	105	1
10028	0018	Guadalupe	21.043766000000002	-89.437342999999998	105	1
10029	0019	San Felipe	21.068999000000002	-89.458278000000007	105	1
10030	0020	Tohbichén	21.066126000000001	-89.463588000000001	105	1
10031	0021	Mina de Oro	21.069168000000001	-89.429776000000004	105	1
10032	0022	San Isidro [Plantel]	21.044796000000002	-89.421099999999996	105	1
10033	0023	Aldea Conkal	21.057697999999998	-89.487352999999999	105	1
10034	0024	Alondra	21.059504	-89.424969000000004	105	1
10035	0025	Concepción	21.050944000000001	-89.421340999999998	105	1
10036	0026	Miguel Hidalgo [Desfibradora]	21.047179	-89.421612999999994	105	1
10037	0027	Ya'ax Lu'um	21.058304	-89.491771	105	1
10038	0028	Padilla	21.064284000000001	-89.432169000000002	105	1
10039	0029	María Erminia Chuc Aguilar	21.064349	-89.430927999999994	105	1
10040	0031	Alberto Escobedo	21.038304	-89.423264000000003	105	1
10041	0033	San Isidro	21.049951	-89.421486999999999	105	1
10042	0034	La Bonita	21.068303	-89.433328000000003	105	1
10043	0035	Teodoro Pech	21.070633000000001	-89.438175000000001	105	1
10044	0036	Canto	21.061049000000001	-89.435293999999999	105	1
10045	0039	Don Lau	21.059059000000001	-89.428359	105	1
10046	0040	Santa Cruz	21.066783999999998	-89.413943000000003	105	1
10047	0041	Secundaria Vicente Guerrero	21.051255999999999	-89.419950999999998	105	1
10048	0042	Andrés Morales	21.067640000000001	-89.422222000000005	105	1
10049	0043	Ninguno [Granja Avícola]	21.051235999999999	-89.493097000000006	105	1
10050	0001	Yobaín	21.233467999999998	-89.116500000000002	106	1
10051	0002	Chabihau	21.356283000000001	-89.117919000000001	106	1
10052	0004	Santa Anita	21.231408999999999	-89.141323999999997	106	1
10053	0005	Santa Bárbara	21.248695999999999	-89.137051999999997	106	1
10054	0007	San Antonio Chumul	21.266241000000001	-89.112545999999995	106	1
10055	0008	Noc Ac	21.286148000000001	-89.122327999999996	106	1
10056	0009	Kalakdzonot	21.278995999999999	-89.082881	106	1
10057	0010	San Cristóbal	21.302334999999999	-89.137103999999994	106	1
10058	0011	Santo Domingo	21.254631	-89.100479000000007	106	1
10059	0013	Belén	21.289444	-89.113611000000006	106	1
10060	0015	Chehuayacán	21.316936999999999	-89.111908	106	1
10061	0018	Limonaria	21.239775000000002	-89.100634999999997	106	1
10062	0020	Porvenir	21.211704999999998	-89.139443999999997	106	1
10063	0022	San Rafael	21.311831999999999	-89.143648999999996	106	1
10064	0023	San Albino	21.253382999999999	-89.116326000000001	106	1
10065	0025	San Diego	21.231521999999998	-89.106845000000007	106	1
10066	0026	Santa Inés	21.321687000000001	-89.113322999999994	106	1
10067	0027	San Juan	21.296869000000001	-89.110395999999994	106	1
10068	0028	Monte Bello	21.316246	-89.100667999999999	106	1
10069	0029	Santa Lucía	21.266711999999998	-89.146343999999999	106	1
10070	0032	San Pablo	21.231857000000002	-89.129022000000006	106	1
10071	0036	Belem	21.326156000000001	-89.113292000000001	106	1
10072	0037	Granja Número Uno	21.336383999999999	-89.113140000000001	106	1
10073	0038	Lakin Há	21.240863999999998	-89.084089000000006	106	1
10074	0039	San Pablo	21.266724	-89.128437000000005	106	1
10075	0040	San Lorenzo	21.327698000000002	-89.112593000000004	106	1
10076	0041	San Lorenzo	21.305070000000001	-89.109485000000006	106	1
10077	0046	Xpakbipilá	21.301186000000001	-89.145140999999995	106	1
10078	0047	La Mensura	21.328571	-89.116168000000002	106	1
10079	0048	San Lorenzo	21.326184999999999	-89.114570000000001	106	1
10080	0050	La Central	21.245773	-89.117478000000006	106	1
10081	0051	Progenitores Peninsulares	21.238104	-89.092141999999996	106	1
10082	0052	Lol-Beh	21.248419999999999	-89.117193	106	1
10083	0053	Mah-Tubzquen	21.252182000000001	-89.115204000000006	106	1
10084	0054	Puerto de Abrigo	21.354514000000002	-89.142561000000001	106	1
10085	0056	Manuel Vázquez Avilés	21.232488	-89.123152000000005	106	1
10086	0057	Unidad Número Cinco	21.260511000000001	-89.107946999999996	106	1
10087	0059	Tumbem Ik	21.278644	-89.112105	106	1
10088	0060	Tumbem Lum	21.258731000000001	-89.117593999999997	106	1
10089	0061	Las Gaviotas	21.354116000000001	-89.156167999999994	106	1
10090	0062	Don Galdino Pat	21.231552000000001	-89.109418000000005	106	1
10091	0063	Elia y Ruth	21.354149	-89.153199999999998	106	1
10092	0064	Los Ladrones [Privada]	21.355048	-89.129108000000002	106	1
10093	0065	Carroll Launius	21.358122999999999	-89.109785000000002	106	1
10094	0066	San Nicolás	21.261429	-89.120030999999997	106	1
10095	0067	Ninguno	21.329851999999999	-89.173822999999999	106	1
\.


--
-- TOC entry 3065 (class 0 OID 21266)
-- Dependencies: 205
-- Data for Name: Log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Log" ("iIdLog", "vLog", "dFecha") FROM stdin;
\.


--
-- TOC entry 3067 (class 0 OID 21271)
-- Dependencies: 207
-- Data for Name: Municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Municipio" ("iIdMunicipio", "vMunicipio", "iActivo", "vClaveInegi") FROM stdin;
1	Abalá	1	001
2	Acanceh	1	002
3	Akil	1	003
4	Baca	1	004
5	Bokobá	1	005
6	Buctzotz	1	006
7	Cacalchén	1	007
8	Calotmul	1	008
9	Cansahcab	1	009
10	Cantamayec	1	010
11	Celestún	1	011
12	Cenotillo	1	012
13	Conkal	1	013
14	Cuncunul	1	014
15	Cuzamá	1	015
16	Chacsinkín	1	016
17	Chankom	1	017
18	Chapab	1	018
19	Chemax	1	019
20	Chicxulub Pueblo	1	020
21	Chichimilá	1	021
22	Chikindzonot	1	022
23	Chocholá	1	023
24	Chumayel	1	024
25	Dzán	1	025
26	Dzemul	1	026
27	Dzidzantún	1	027
28	Dzilam de Bravo	1	028
29	Dzilam González	1	029
30	Dzitás	1	030
31	Dzoncauich	1	031
32	Espita	1	032
33	Halachó	1	033
34	Hocabá	1	034
35	Hoctún	1	035
36	Homún	1	036
37	Huhí	1	037
38	Hunucmá	1	038
39	Ixil	1	039
40	Izamal	1	040
41	Kanasín	1	041
42	Kantunil	1	042
43	Kaua	1	043
44	Kinchil	1	044
45	Kopomá	1	045
46	Mama	1	046
47	Maní	1	047
48	Maxcanú	1	048
49	Mayapán	1	049
50	Mérida	1	050
51	Mocochá	1	051
52	Motul	1	052
53	Muna	1	053
54	Muxupip	1	054
55	Opichén	1	055
56	Oxkutzcab	1	056
57	Panabá	1	057
58	Peto	1	058
59	Progreso	1	059
60	Quintana Roo	1	060
61	Río Lagartos	1	061
62	Sacalum	1	062
63	Samahil	1	063
64	Sanahcat	1	064
65	San Felipe	1	065
66	Santa Elena	1	066
67	Seyé	1	067
68	Sinanché	1	068
69	Sotuta	1	069
70	Sucilá	1	070
71	Sudzal	1	071
72	Suma	1	072
73	Tahdziú	1	073
74	Tahmek	1	074
75	Teabo	1	075
76	Tecoh	1	076
77	Tekal de Venegas	1	077
78	Tekantó	1	078
79	Tekax	1	079
80	Tekit	1	080
81	Tekom	1	081
82	Telchac Pueblo	1	082
83	Telchac Puerto	1	083
84	Temax	1	084
85	Temozón	1	085
86	Tepakán	1	086
87	Tetiz	1	087
88	Teya	1	088
89	Ticul	1	089
90	Timucuy	1	090
91	Tinum	1	091
92	Tixcacalcupul	1	092
93	Tixkokob	1	093
94	Tixmehuac	1	094
95	Tixpéhual	1	095
96	Tizimín	1	096
97	Tunkás	1	097
98	Tzucacab	1	098
99	Uayma	1	099
100	Ucú	1	100
101	Umán	1	101
102	Valladolid	1	102
103	Xocchel	1	103
104	Yaxcabá	1	104
105	Yaxkukul	1	105
106	Yobaín	1	106
\.


--
-- TOC entry 3069 (class 0 OID 21277)
-- Dependencies: 209
-- Data for Name: Ocupacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ocupacion" ("iIdOcupacion", "vClaveInegi", "vOcupacion", "iActivo") FROM stdin;
1	1111	Altas autoridades gubernamentales y jurisdiccionales	1
2	1112	Legisladores	1
3	1113	Presidentes y autoridades municipales	1
4	1121	Presidentes y directores generales en instituciones públicas	1
5	1122	Presidentes y directores generales en instituciones y empresas privadas	1
6	1129	Otros presidentes y directores generales, no clasificados anteriormente	1
7	1131	Directores de organizaciones políticas	1
8	1132	Directores de organizaciones sindicales	1
9	1133	Directores de organizaciones empresariales	1
10	1134	Directores de organizaciones agrarias	1
11	1135	Directores de organizaciones civiles y religiosas	1
12	1211	Directores y gerentes en administración, recursos humanos y mercadotecnia	1
13	1212	Directores y gerentes en servicios contables, financieros, banca y seguros	1
14	1221	Directores y gerentes en servicios de salud, protección civil y medio ambiente	1
15	1222	Directores y gerentes en desarrollo social y económico	1
16	1223	Directores y gerentes en centros de enseñanza y capacitación	1
17	1224	Jueces de juzgado, directores y gerentes en servicios legales y procuración de justicia	1
18	1225	Comandantes de las fuerzas armadas	1
19	1226	Directores en servicios de vigilancia y seguridad	1
20	1311	Directores y gerentes en producción agropecuaria, silvícola y pesquera	1
21	1312	Directores y gerentes en producción minera, petrolera y gas	1
22	1313	Directores y gerentes en generación y provisión de energía eléctrica y agua 	1
23	1314	Directores y gerentes en producción manufacturera	1
24	1315	Directores y gerentes en construcción, reparación y mantenimiento	1
25	1321	Directores y gerentes en informática	1
26	1322	Directores y gerentes en comunicación y telecomunicaciones	1
27	1323	Directores y gerentes en servicios de transporte	1
28	1324	Directores y gerentes en centros de investigación y desarrollo tecnológico	1
29	1411	Directores y gerentes de ventas, comercialización y alquiler	1
30	1412	Directores y gerentes de restaurantes y hoteles	1
31	1421	Directores y productores artísticos de cine, teatro y afines	1
32	1422	Directores y gerentes de museos, cines y otros establecimientos deportivos y culturales	1
33	1423	Directores y gerentes en servicios funerarios y otros servicios	1
34	1511	Coordinadores y jefes de área en administración, recursos humanos y mercadotecnia	1
35	1512	Coordinadores y jefes de área en servicios contables, financieros, banca y seguros	1
36	1521	Coordinadores y jefes de área en servicios de salud, protección civil y medio ambiente	1
37	1522	Coordinadores y jefes de área en desarrollo social y económico	1
38	1523	Coordinadores y jefes de área en centros de enseñanza y capacitación	1
39	1524	Coordinadores y jefes de área en servicios legales, jueces calificadores y fiscales	1
40	1525	Capitanes, tenientes y jefes de área de las fuerzas armadas	1
41	1526	Coordinadores y jefes de área en servicios de vigilancia y seguridad	1
42	1611	Coordinadores y jefes de área en producción agropecuaria, silvícola y pesquera	1
43	1612	Coordinadores y jefes de área en producción minera, petrolera y gas	1
44	1613	Coordinadores y jefes de área en generación y provisión de energía eléctrica y agua  	1
45	1614	Coordinadores y jefes de área en producción manufacturera	1
46	1615	Coordinadores y jefes de área en construcción, reparación y mantenimiento	1
47	1619	Otros coordinadores y jefes de área en producción agropecuaria, industrial, construcción y mantenimiento, no clasificados anteriormente	1
48	1621	Coordinadores y jefes de área en informática	1
49	1622	Coordinadores y jefes de área en comunicación y telecomunicaciones	1
50	1623	Coordinadores y jefes de área en servicios de transporte	1
51	1624	Coordinadores y jefes de área en centros de investigación y desarrollo tecnológico	1
52	1629	Otros coordinadores y jefes de área  en informática, telecomunicaciones, transporte y en investigación y desarrollo tecnológico, no clasificados anteriormente	1
53	1711	Coordinadores y jefes de área de ventas, comercialización y alquiler	1
54	1712	Coordinadores y jefes de área de restaurantes y hoteles	1
55	1721	Coordinadores y jefes de área en actividades artísticas, de cine, teatro y afines	1
56	1722	Coordinadores y jefes de área en museos, cines, deportivos y servicios culturales	1
57	1723	Coordinadores y jefes de área en servicios funerarios y otros servicios	1
58	1999	Otros directores, funcionarios, gerentes, coordinadores y jefes de área, no clasificados  anteriormente	1
59	2111	Administradores y especialistas en recursos humanos y sistemas de gestión	1
60	2112	Especialistas y consultores en mercadotecnia, publicidad, comunicación y comercio exterior	1
61	2113	Especialistas en hotelería y turismo	1
62	2121	Contadores y auditores	1
63	2122	Asesores y analistas en finanzas	1
64	2123	Economistas, consultores e investigadores en política económica	1
65	2131	Antropólogos, arqueólogos e historiadores	1
66	2132	Investigadores y especialistas en sociología y desarrollo social	1
67	2133	Investigadores y especialistas en ciencias políticas y administración pública 	1
68	2134	Geógrafos 	1
69	2135	Abogados	1
70	2141	Investigadores y especialistas en filosofía y letras (filólogos)	1
71	2142	Psicólogos 	1
72	2143	Especialistas en trabajo social	1
73	2144	Especialistas en archivonomía, biblioteconomía y museografía	1
74	2145	Sacerdotes, pastores y otros teólogos	1
75	2151	Escritores y críticos literarios	1
76	2152	Periodistas y redactores	1
77	2153	Traductores e intérpretes 	1
78	2161	Pintores	1
79	2162	Dibujantes y diseñadores artísticos, ilustradores y grabadores	1
80	2163	Escultores	1
81	2164	Escenógrafos	1
82	2171	Compositores y arreglistas	1
83	2172	Músicos	1
84	2173	Cantantes	1
85	2174	Bailarines y coreógrafos	1
86	2175	Actores	1
87	2211	Investigadores y especialistas en física	1
88	2212	Investigadores y especialistas en matemáticas, estadística y actuaría	1
89	2221	Biólogos y especialistas en ciencias del mar y oceanógrafos	1
90	2222	Químicos	1
91	2223	Ecólogos y especialistas en ciencias atmosféricas	1
92	2231	Agrónomos	1
93	2232	Veterinarios y zootecnistas	1
94	2233	Especialistas en forestación	1
95	2234	Especialistas en pesca y en acuacultura	1
96	2241	Ingenieros eléctricos 	1
97	2242	Ingenieros electrónicos	1
98	2251	Ingenieros químicos	1
99	2252	Ingenieros mecánicos	1
100	2253	Ingenieros industriales	1
101	2254	Ingenieros en minas, metalurgia y petróleo	1
102	2261	Ingenieros civiles y de la construcción	1
103	2262	Ingenieros en topografía, hidrología, geología y geodesia	1
104	2263	Arquitectos, planificadores urbanos y del transporte	1
105	2271	Desarrolladores y analistas de software y multimedia	1
106	2272	Administradores de bases de datos y redes de computadora	1
107	2281	Ingenieros en comunicaciones y telecomunicaciones	1
108	2311	Supervisores e inspectores educativos	1
109	2312	Pedagogos, orientadores educativos y otros especialistas en ciencias educativas	1
110	2321	Profesores universitarios y de enseñanza superior	1
111	2322	Profesores de preparatoria y equivalentes	1
112	2331	Profesores de enseñanza secundaria	1
113	2332	Profesores de enseñanza primaria	1
114	2333	Alfabetizadores	1
115	2334	Profesores de enseñanza bilingüe (indígena)	1
116	2335	Profesores de enseñanza preescolar	1
117	2339	Otros profesores de nivel básico, no clasificados anteriormente	1
118	2341	Profesores de personas con problemas de audición y lenguaje	1
119	2342	Profesores de personas con problemas de aprendizaje	1
120	2343	Otros profesores de enseñanza especial	1
121	2391	Otros profesores y especialistas en docencia, no clasificados anteriormente	1
122	2411	Médicos generales y familiares	1
123	2412	Médicos especialistas	1
124	2413	Dentistas	1
125	2421	Ingenieros biomédicos	1
126	2422	Optometristas	1
127	2423	Nutriólogos	1
128	2424	Especialistas en seguridad e higiene y salud pública	1
129	2425	Especialistas en medicina tradicional y alternativa	1
130	2426	Enfermeras especialistas	1
131	2427	Fisioterapeutas, audiólogos y logopedas	1
132	2428	Farmacólogos	1
133	2511	Auxiliares en administración, mercadotecnia, comercialización y comercio exterior	1
134	2512	Auxiliares en contabilidad, economía, finanzas y agentes de bolsa	1
135	2513	Tramitadores aduanales 	1
136	2514	Valuadores, subastadores y rematadores	1
137	2521	Oficiales del ministerio público y detectives	1
138	2522	Agentes aduanales y fronterizos	1
139	2523	Agentes de recaudación tributaria y de licencias	1
140	2524	Inspectores en seguridad social, de precios y otros inspectores públicos	1
141	2531	Auxiliares en ciencias sociales y humanistas	1
142	2532	Auxiliares en servicios jurídicos	1
143	2533	Monjas y predicadores	1
144	2541	Diseñadores de moda y vestuario	1
145	2542	Diseñadores industriales	1
146	2543	Diseñadores gráficos	1
147	2544	Decoradores de interiores, jardines y diversos materiales (tazas, llaveros, etcétera)	1
148	2551	Locutores de radio, televisión y otros medios de comunicación	1
149	2552	Animadores y organizadores de eventos	1
150	2553	Payasos, mimos y cirqueros	1
151	2561	Deportistas	1
152	2562	Entrenadores deportivos y directores técnicos	1
153	2563	Árbitros y jueces deportivos	1
154	2611	Auxiliares y técnicos en física, matemáticas, estadística y actuaría	1
155	2612	Auxiliares y técnicos en ciencias biológicas, químicas y del medio ambiente	1
156	2613	Auxiliares y técnicos en agronomía	1
157	2614	Auxiliares y técnicos en veterinaria, pesca y forestación	1
158	2621	Auxiliares y técnicos industriales y químicos	1
159	2622	Auxiliares y técnicos topógrafos, en hidrología y geología	1
160	2623	Auxiliares y técnicos mineros, metalúrgicos y petroleros	1
161	2624	Auxiliares y técnicos en construcción y arquitectura	1
162	2625	Dibujantes técnicos	1
163	2630	Supervisores de mecánicos y técnicos en mantenimiento y reparación de equipos mecánicos, vehículos  de motor, instrumentos industriales y equipo de refrigeración	1
164	2631	Técnicos en mantenimiento y reparación de vehículos de motor	1
165	2632	Mecánicos en mantenimiento y reparación de vehículos de motor	1
166	2633	Técnicos en mantenimiento y reparación de maquinaria e instrumentos industriales	1
167	2634	Mecánicos en mantenimiento y reparación de maquinaria e instrumentos industriales	1
168	2635	Técnicos en mantenimiento y reparación de instrumentos de precisión y musicales	1
169	2636	Mecánicos en mantenimiento y reparación de instrumentos de precisión y musicales	1
170	2637	Técnicos en la instalación, reparación y mantenimiento de equipos de refrigeración, climas y aire acondicionado	1
338	7332	Tejedores de fibras	1
171	2638	Mecánicos en  instalación, mantenimiento y reparación de equipos de refrigeración, climas y aire acondicionado.	1
172	2639	Otras ocupaciones de mecánicos y técnicos en el mantenimiento y reparación de equipos mecánicos, vehículos de motor e instrumentos industriales, no clasificados anteriormente	1
173	2640	Supervisores de técnicos eléctricos, en electrónica y de equipos en telecomunicaciones y electromecánicos	1
174	2641	Técnicos eléctricos	1
175	2642	Electricistas y linieros	1
176	2643	Técnicos en instalación y reparación de equipos electrónicos, telecomunicaciones y electrodoméstico (excepto equipos informáticos)	1
177	2644	Trabajadores en instalación y reparación de equipos electrónicos, telecomunicaciones y electrodoméstico (excepto equipos informáticos)	1
178	2645	Técnicos en reparación de equipos electromecánicos	1
179	2646	Trabajadores en reparación de equipos electromecánicos	1
180	2649	Otros técnicos eléctricos, en electrónica y de equipos en telecomunicaciones y electromecánicos, no clasificados anteriormente	1
181	2651	Técnicos en la instalación y reparación de redes, equipos y en sistemas computacionales	1
182	2652	Técnicos en operaciones de equipos de radio	1
183	2653	Auxiliares y técnicos de equipos de grabación y reproducción de video	1
184	2654	Auxiliares y técnicos de ingeniería de audio, sonido e iluminación	1
185	2655	Fotógrafos	1
186	2661	Controladores de tráfico aéreo	1
187	2662	Controladores de tráfico de otros transportes (terrestre, ferroviario y marítimo)	1
188	2711	Auxiliares y técnicos en pedagogía y en educación	1
189	2712	Instructores en estudios y capacitación artística	1
190	2713	Instructores en estudios y capacitación comercial y administrativa	1
191	2714	Instructores en idiomas extranjeros	1
192	2715	Instructores y capacitadores en oficios y para el trabajo	1
193	2716	Profesores en educación física y deporte	1
194	2811	Enfermeras (técnicas)	1
195	2812	Técnicos en aparatos de diagnóstico, tratamiento médico, podólogos y fisioterapeutas	1
196	2813	Técnicos de laboratorios médicos	1
197	2814	Técnicos y asistentes farmacéuticos	1
198	2815	Técnicos de prótesis médicas y dentales	1
199	2816	Técnicos dietistas y nutriólogos	1
200	2817	Técnicos en medicina alternativa	1
201	2821	Auxiliares en enfermería y paramédicos	1
202	2822	Auxiliares y asistentes dentales	1
203	2823	Auxiliares hospitalarios y de medicina	1
204	2824	Parteras	1
205	2825	Técnicos en seguridad en el trabajo e higiene	1
206	2826	Curanderos, hierberos y hueseros	1
207	2827	Fumigadores y controladores de plagas	1
208	2991	Otros especialistas no clasificados anteriormente	1
209	2992	Otros técnicos no clasificados anteriormente	1
210	3101	Supervisores de secretarias, capturistas, cajeros y trabajadores de control de archivo y transporte	1
211	3111	Secretarias 	1
212	3112	Taquígrafos, mecanógrafos y similares	1
213	3113	Capturistas de datos	1
214	3114	Operadores de máquinas de oficina (fotocopiadora, etc.)	1
215	3115	Trabajadores de apoyo en actividades administrativas diversas	1
216	3121	Cajeros, taquilleros y receptores de apuestas	1
217	3122	Cobradores, pagadores y prestamistas	1
218	3131	Trabajadores en archivo y correspondencia	1
219	3132	Encargados y trabajadores en control de almacén y bodega	1
220	3141	Despachadores de transporte	1
221	3142	Checadores y revisores de transporte	1
222	3201	Supervisores de trabajadores que brindan y manejan información	1
223	3211	Recepcionistas y trabajadores que brindan información (de forma personal)	1
224	3212	Trabajadores que brindan información por teléfono (centro de llamadas) y anunciadores 	1
225	3213	Telefonistas y telegrafistas	1
226	3221	Trabajadores en agencias de viajes	1
227	3222	Guías de turismo en museos, casinos, parques, cines y otros centros recreativos	1
228	3231	Encuestadores 	1
229	3232	Codificadores de información	1
230	3999	Otras secretarias, capturistas, cajeros y trabajadores que brindan información, no clasificados anteriormente	1
231	4111	Comerciantes en establecimientos	1
232	4201	Encargados y supervisores de ventas de productos y de servicios financieros y de alquiler	1
233	4211	Empleados de ventas, despachadores y dependientes en comercios	1
234	4212	Anaqueleros, acomodadores y seleccionadores de mercancías y alimentadores de máquinas expendedoras	1
235	4213	Vendedores por teléfono 	1
236	4214	Choferes vendedores	1
237	4221	Agentes y representantes de ventas y consignatarios	1
238	4222	Agentes de seguros y servicios financieros (ejecutivos de cuenta)	1
239	4223	Agentes de bienes raíces 	1
240	4224	Vendedores por catálogo	1
241	4231	Demostradores y promotores	1
242	4232	Edecanes 	1
243	4233	Modelos de moda, arte y publicidad	1
244	4311	Trabajadores en el alquiler inmobiliario (casas, terrenos, etcétera)	1
245	4312	Trabajadores en el alquiler de bienes muebles (loza, películas, videojuegos, etcétera)	1
246	4999	Otros comerciantes, empleados en ventas y agentes de ventas en establecimientos, no clasificados anteriormente	1
247	5101	Supervisores en la preparación y servicio de alimentos y bebidas, así como en servicios de esparcimiento y de hotelería	1
248	5111	Cocineros	1
249	5112	Fonderos, vendedores y comerciantes de comida	1
250	5113	Cocineros domésticos	1
251	5114	Taqueros y preparadores de comida rápida, antojitos, pizzas, hot dogs, jugos, café, etcétera	1
252	5115	Cantineros	1
253	5116	Meseros 	1
254	5201	Supervisores y encargados de trabajadores en cuidados personales y del hogar	1
255	5211	Peluqueros, barberos, estilistas y peinadores	1
256	5212	Maquillistas, manicuristas, pedicuristas y tatuadores	1
257	5213	Bañeros y masajistas	1
258	5221	Cuidadores de niños, personas con discapacidad y ancianos en establecimientos	1
259	5222	Cuidadores de niños, personas con discapacidad y ancianos en casas particulares	1
260	5231	Azafatas y sobrecargos	1
261	5241	Jardineros en establecimientos	1
262	5242	Jardineros en casas particulares	1
263	5251	Astrólogos, adivinadores y afines	1
264	5252	Trabajadores dedicados a la prostitución	1
265	5253	Trabajadores en servicios funerarios	1
266	5254	Entrenadores de animales y ocupaciones relacionadas con el cuidado de mascotas	1
267	5301	Supervisores en servicios de protección y vigilancia 	1
268	5311	Bomberos	1
269	5312	Policías y agentes de tránsito 	1
270	5313	Vigilantes y guardias en establecimientos	1
271	5314	Vigilantes y porteros en casas particulares	1
272	5401	Supervisores de las fuerzas armadas	1
273	5411	Trabajadores de la fuerza armada aérea	1
274	5412	Trabajadores de la fuerza armada marítima	1
275	5413	Trabajadores de la fuerza armada terrestre	1
276	5999	Otras ocupaciones en servicios personales y vigilancia, no clasificadas anteriormente	1
277	6101	Supervisores, encargados y capataces agropecuarios	1
278	6111	Trabajadores en el cultivo de maíz y/o frijol	1
279	6112	Trabajadores en el cultivo de hortalizas y verduras	1
280	6113	Trabajadores en el cultivo de café, cacao y tabaco	1
281	6114	Trabajadores en el cultivo de frutales	1
282	6115	Trabajadores en el cultivo de flores	1
283	6116	Trabajadores en otros cultivos agrícolas	1
284	6117	Trabajadores en actividades de beneficio de productos agrícolas	1
285	6119	Otros trabajadores en actividades agrícolas, no clasificados anteriormente	1
286	6121	Trabajadores en la cría de ganado bovino	1
287	6122	Trabajadores en la cría de porcinos	1
288	6123	Trabajadores en la cría avícola	1
289	6124	Trabajadores en la cría de caprinos y ovinos	1
290	6125	Trabajadores en la cría de equinos	1
291	6126	Trabajadores en la apicultura	1
292	6127	Trabajadores en la cría y cuidado de otro tipo de animales	1
293	6128	Trabajadores en actividades de beneficio de productos pecuarios	1
294	6129	Otros trabajadores en actividades ganaderas y en la cría de animales, no clasificados anteriormente	1
295	6131	Trabajadores que combinan actividades agrícolas con ganaderas	1
296	6201	Supervisores, encargados y capataces de trabajadores en actividades pesqueras, acuícolas, forestales, caza y similares	1
297	6211	Trabajadores en actividades pesqueras	1
298	6212	Trabajadores en actividades de acuacultura	1
299	6213	Trabajadores en actividades de beneficio de productos pesqueros o acuícolas	1
300	6221	Taladores, trocadores, cortadores de árboles y similares	1
301	6222	Caucheros, chicleros, resineros y similares	1
302	6223	Trabajadores en viveros e invernaderos	1
303	6224	Trabajadores en actividades de plantación, reforestación y conservación de bosques	1
304	6225	Cortadores de leña 	1
305	6226	Trabajadores en actividades de recolección de plantas, hierbas y raíces no cultivadas	1
306	6227	Productores de carbón vegetal	1
307	6231	Trabajadores en actividades de caza, trampería y similares	1
308	6311	Operadores de maquinaria agropecuaria y forestal	1
309	6999	Otros trabajadores en actividades agrícolas, ganaderas, forestales, caza y pesca, no clasificados anteriormente	1
310	7101	Supervisores de trabajadores en la extracción, albañiles y en acabados de la construcción	1
311	7111	Mineros y trabajadores en la extracción en minas de minerales metálicos 	1
312	7112	Trabajadores en la extracción de cantera, arcilla, arena, piedra y grava	1
313	7113	Dinamiteros y buzos en perforación de pozos y en la construcción	1
314	7121	Albañiles, mamposteros y afines  	1
315	7122	Techadores (colocadores de palapas, etcétera) 	1
316	7123	Carpinteros de obra negra 	1
317	7131	Yeseros, escayolistas y otros recubridores de techos y paredes  	1
318	7132	Instaladores de pisos, azulejos, mosaicos y baldosas	1
319	7133	Instaladores de material aislante, de impermeabilización, vidrio y otros materiales	1
320	7134	Plomeros, fontaneros e instaladores de tubería 	1
321	7135	Pintores de brocha gorda 	1
322	7201	Supervisores de artesanos y trabajadores en el tratamiento y elaboración de productos de metal	1
323	7211	Moldeadores, torneros y troqueladores	1
324	7212	Soldadores y oxicortadores	1
325	7213	Hojalateros, chaperos, latoneros, cobreros y pintores de metales	1
326	7214	Montadores de estructuras metálicas	1
327	7221	Herreros, balconeros, aluminadores y forjadores	1
328	7222	Cerrajeros, afiladores y pulidores de herramientas	1
329	7223	Joyeros, orfebres, plateros y pulidores de metal	1
330	7301	Supervisores de artesanos y trabajadores en la elaboración de productos de madera, papel, textiles y de cuero y piel	1
331	7311	Carpinteros, ebanistas y cepilladores en la elaboración de productos de madera	1
332	7312	Pintores y barnizadores de madera	1
333	7313	Artesanos de productos de bejuco, vara, palma, carrizo y mimbre, excepto madera	1
334	7321	Artesanos y trabajadores en la elaboración de productos de papel y cartón	1
335	7322	Impresores, linotipistas, fotograbadores y encuadernadores	1
336	7323	Reveladores e impresores de fotografías	1
337	7331	Trabajadores en la preparación de fibras e hilados 	1
339	7341	Sastres y modistos, costureras y confeccionadores de prendas de vestir	1
340	7342	Artesanos y confeccionadores de productos textiles  	1
341	7343	Bordadores y deshiladores 	1
342	7344	Patronistas de productos textiles 	1
343	7351	Tapiceros 	1
344	7352	Peleteros, cortadores, curtidores y teñidores de cuero, piel y similares 	1
345	7353	Zapateros artesanales 	1
346	7401	Supervisores de artesanos y trabajadores en la elaboración de productos de hule, caucho, plásticos y de sustancias químicas 	1
347	7411	Trabajadores en la elaboración y reparación de productos de hule, caucho, plásticos y vulcanización de neumáticos 	1
348	7412	Trabajadores en la elaboración de sustancias y compuestos químicos 	1
349	7501	Supervisores de trabajadores en la elaboración y procesamiento de alimentos, bebidas y productos de tabaco	1
350	7511	Trabajadores en la elaboración de productos de carne, pescado y sus derivados 	1
351	7512	Trabajadores en la elaboración de productos lácteos 	1
352	7513	Trabajadores en la elaboración de pan, tortilla, repostería, y otros productos de cereales y harinas 	1
353	7514	Trabajadores en la elaboración de productos a base de frutas y verduras 	1
354	7515	Trabajadores en la elaboración de productos a base de azúcar, chocolate, confitería y tabaco 	1
355	7516	Trabajadores en la elaboración de aceites, grasas, sal y especias	1
356	7517	Trabajadores en la elaboración de bebidas alcohólicas y no alcohólicas 	1
357	7601	Supervisores de artesanos y trabajadores en la elaboración de productos de cerámica, vidrio, azulejo y similares 	1
358	7611	Alfareros y trabajadores ceramistas 	1
359	7612	Trabajadores en la elaboración de productos de cemento, cal, yeso, azulejo, piedra y ladrilleros 	1
360	7613	Trabajadores del vidrio y similares 	1
361	7614	Trabajadores en la elaboración de productos de hueso, concha, coral y similares	1
362	7999	Otros trabajadores artesanales, no clasificados anteriormente	1
363	8101	Supervisores de operadores de maquinaria industrial	1
364	8111	Operadores de máquinas y equipos para la extracción y beneficio en minas y canteras	1
365	8112	Operadores de máquinas y equipos para la extracción en pozos petroleros	1
366	8113	Operadores de máquinas y equipos para la captación, bombeo y distribución de agua	1
367	8114	Operadores de equipos portátiles especializados para la construcción	1
368	8121	Operadores de hornos metalúrgicos, coladores y laminadores y operadores de máquinas trefiladoras y estiradoras de metales	1
369	8122	Operadores de máquinas pulidoras, galvanizadoras y recubridoras de metal	1
370	8123	Operadores de máquinas que cortan, perforan, doblan, troquelan, sueldan, etc., piezas y productos metálicos	1
371	8131	Operadores de máquinas para la elaboración de productos químicos	1
372	8132	Operadores de máquinas para la elaboración de productos farmacéuticos y cosméticos	1
373	8133	Operadores de máquinas para la elaboración y ensamble de productos de plástico y hule	1
374	8134	Operadores de máquinas para el tratamiento de agua	1
375	8135	Operadores de máquinas y equipos para la refinación del petróleo y gas	1
376	8141	Operadores de máquinas para el tratamiento de la madera y elaboración de aglomerados y triplay	1
377	8142	Operadores de máquinas para la elaboración de productos de madera, bejuco, mimbre  y similares	1
378	8143	Operadores de máquinas en la elaboración de celulosa, papel y similares	1
379	8144	Operadores de máquinas para la impresión y encuadernación	1
380	8145	Operadores de máquinas para la elaboración de productos a base de papel y cartón	1
381	8151	Operadores de máquinas y equipos de hilar y bobinar fibras textiles naturales y sintéticas	1
382	8152	Operadores de máquinas para fabricar tejidos de punto, telas y alfombras 	1
383	8153	Operadores de máquinas de costura, bordado y de corte para la confección de productos textiles y prendas de vestir	1
384	8154	Operadores de máquinas en el tratamiento del cuero, piel y la elaboración de calzado	1
385	8155	Operadores de máquinas de lavado, blanqueo, teñido, estampado, afelpado, planchado y acabado de productos textiles, cuero, piel y similares	1
386	8161	Operadores de máquinas en la elaboración de alimentos, aceites, grasas, sal y especias	1
387	8162	Operadores de máquinas en la elaboración de tabaco	1
388	8163	Operadores de máquinas en la elaboración de bebidas alcohólicas y no alcohólicas	1
389	8171	Operadores de máquinas en la elaboración de cemento, cal, yeso y productos de cemento	1
390	8172	Operadores de máquinas en la elaboración de productos de cerámica, mosaico, azulejo y similares	1
391	8173	Operadores de máquinas en la elaboración de vidrio y productos de vidrio y similares	1
392	8181	Operadores de máquinas e instalaciones para la generación de energía	1
393	8199	Otros operadores de instalaciones y maquinaria fija industrial, no clasificados anteriormente	1
394	8201	Supervisores en procesos de ensamblado y montaje de  maquinaria, herramientas y productos metálicos y electrónicos	1
395	8211	Ensambladores y montadores de herramientas, maquinaria y productos metálicos	1
396	8212	Ensambladores y montadores de partes eléctricas y electrónicas	1
397	8301	Supervisores de conductores de transporte y de maquinaria móvil	1
398	8311	Pilotos de aviación	1
399	8321	Capitanes y conductores de transporte marítimo	1
400	8322	Oficiales y marineros de cubierta y prácticos	1
401	8323	Oficiales maquinistas de transporte marítimo	1
402	8324	Conductores de pequeñas embarcaciones (lanchas, botes, trajineras, etcétera)	1
403	8331	Conductores de transporte en vías férreas (tren, metro y tren ligero)	1
404	8341	Conductores de camiones, camionetas y automóviles de carga 	1
405	8342	Conductores de autobuses, camiones, camionetas, taxis y automóviles de pasajeros 	1
406	8343	Choferes en casas particulares	1
407	8344	Conductores de motocicleta	1
408	8349	Otros conductores de transporte terrestre con motor, no clasificados anteriormente	1
409	8351	Conductores de maquinaria móvil para la construcción y minería	1
410	8352	Conductores de maquinaria móvil para el movimiento de mercancías en fábricas, puertos, comercios, etcétera.	1
411	8999	Otros operadores de maquinaria industrial, ensambladores y conductores de transporte, no clasificados anteriormente	1
412	9111	Trabajadores de apoyo en actividades agrícolas	1
413	9112	Trabajadores de apoyo en actividades ganaderas	1
414	9113	Trabajadores de apoyo que realizan actividades agrícolas y ganaderas	1
415	9121	Trabajadores de apoyo en actividades silvícolas y forestales	1
416	9122	Trabajadores de apoyo en actividades de acuicultura y pesca	1
417	9123	Trabajadores de apoyo en actividades de caza y captura	1
418	9124	Recolectores de leña y acarreadores de agua	1
419	9211	Trabajadores de apoyo en la minería 	1
420	9212	Trabajadores de apoyo en la extracción	1
421	9221	Trabajadores de apoyo en la construcción	1
422	9222	Trabajadores de apoyo en plomería e instalación de tuberías	1
423	9231	Trabajadores de apoyo en la elaboración, reparación y mantenimiento mecánico de equipos, maquinaria y productos de metal y de precisión 	1
424	9232	Trabajadores de apoyo en la industria eléctrica, electrónica y comunicaciones	1
425	9233	Trabajadores de apoyo en la industria química, petroquímica y plásticos	1
426	9234	Trabajadores de apoyo en la industria de la madera, papel y cartón	1
427	9235	Trabajadores de apoyo en la industria textil y del zapato	1
428	9236	Trabajadores de apoyo en la industria de alimentos, bebidas y productos de tabaco	1
429	9237	Trabajadores de apoyo en la industria de la cerámica, vidrio y similares	1
430	9239	Trabajadores de apoyo en la industria, no clasificados anteriormente	1
431	9311	Ayudantes de conductores de transporte terrestre con motor	1
432	9312	Ayudantes de conductores de transporte en vías férreas	1
433	9321	Conductores de vehículos de transporte en bicicleta	1
434	9322	Conductores de transporte de tracción animal (carretas, arrieros, etcétera)	1
435	9331	Cargadores	1
436	9332	Cargadores por propina	1
437	9411	Ayudantes en la preparación de alimentos	1
438	9511	Vendedores ambulantes de periódicos y lotería	1
439	9512	Vendedores ambulantes de artículos diversos (excluyendo los de venta de alimentos)	1
440	9521	Preparadores y vendedores ambulantes de alimentos	1
441	9601	Supervisores en limpieza, amas de llaves, mayordomos y en estacionamientos	1
442	9611	Trabajadores domésticos 	1
443	9621	Barrenderos y trabajadores de limpieza  (excepto en hoteles y restaurantes)	1
444	9622	Recamaristas y camaristas	1
445	9623	Mozos de hotel y restaurante	1
446	9624	Limpiadores de calzado	1
447	9631	Lavadores de vehículos en establecimientos	1
448	9632	Lavadores de vehículos en vía pública	1
449	9633	Cuidadores y acomodadores de autos en estacionamientos	1
450	9634	Cuidadores de autos por propina	1
451	9641	Lavanderos en establecimientos	1
452	9642	Planchadores y tintoreros en establecimientos	1
453	9643	Lavanderos y planchadores domésticos	1
454	9651	Ayudantes de jardineros	1
455	9661	Recolectores de basura y material reciclable	1
456	9662	Clasificadores de desechos	1
457	9663	Recolectores de otros materiales	1
458	9711	Trabajadores de paquetería, maleteros y botones de hotel 	1
459	9712	Empacadores de objetos y mercancías	1
460	9713	Trabajadores de apoyo a la realización de espectáculos, deportes y en parques de diversiones	1
461	9721	Carteros (a pie y en bicicleta)	1
462	9722	Repartidores de mensajería (a pie y en bicicleta) y mandaderos	1
463	9723	Repartidores de mercancías (a pie y en bicicleta)	1
464	9731	Lecturistas de medidores	1
465	9732	Recolectores de dinero 	1
466	9733	Elevadoristas y ascensoristas	1
467	9899	Otros trabajadores en actividades elementales y de apoyo, no clasificados anteriormente	1
468	9999	Ocupaciones no especificadas	1
\.


--
-- TOC entry 3093 (class 0 OID 21557)
-- Dependencies: 233
-- Data for Name: Parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Parametro" ("iIdParametro", "vParametro", "vDescripcion", "vValor", "vId", "iActivo") FROM stdin;
1	InicioCapturaPropuestas	Fecha de inicio de camptura de propuestas	2018-03-21	INI_CAP_PRO	1
2	FinCapturaPropuestas	Fecha límite para la captura de propuestas	2018-01-02	FIN_CAP_PRO	1
3	InicioIntegracion	Fecha de inicio para la integración de propuestas	2018-01-03	INI_INT_PRO	1
4	FinIntegracion	Fecha límite para integrar propuestas	2018-10-31	FIN_INT_PRO	1
5	InicioCapturaComentarios	Fecha de inicio para la captura de comentarios de usuarios en las propuestas	2018-11-02	INI_CAP_COM	1
6	FinCapturaComentarios	Fecha de límite para la captura de comentarios de usuarios en las propuestas	2018-11-22	FIN_CAP_COM	1
7	InicioVotacion	Fecha de inicio de votaciones	2011-11-02	INI_VOT	1
8	FinVotacion	Fecha límite de votaciones	2018-11-22	FIN_VOT	1
\.


--
-- TOC entry 3071 (class 0 OID 21288)
-- Dependencies: 211
-- Data for Name: Permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Permiso" ("iIdPermiso", "vPermiso", "vDescripcion", "vIdentificador", "vUrl", "vImagen", "iOrden", "iIdPermisoPadre", "iTipo", "iActivo") FROM stdin;
1	Catálogos	Módulo de catálogos	MCAT	#	mdi mdi-database	1	0	1	1
2	Usuarios	Módulo de usuarios	MUSR	C_seguridad/index_usuarios	mdi mdi-comment-processing	1	1	1	1
5	Parámetros	Módulo para configurar parametros del proceso	MPAR	C_parametros/index_parametros	mdi mdi-settings	4	0	1	1
4	Propuestas	Módulo de propuestas	MPRO	C_propuestas_admin/index_propuestas	mdi mdi-folder	3	0	1	1
3	Comentarios	Módulo de moderación de comentarios	MCOM	C_propuestas/modera_comentario	mdi mdi-comment-processing	2	0	1	1
\.


--
-- TOC entry 3098 (class 0 OID 21624)
-- Dependencies: 238
-- Data for Name: Pregunta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pregunta" ("iIdPregunta", "vPregunta", "iIdTabla", "vTabla", "iTipo", "iActivo") FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 21577)
-- Dependencies: 234
-- Data for Name: PresupuestoUsuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PresupuestoUsuario" ("iIdTema", "iIdUsuario", "dFecha") FROM stdin;
\.


--
-- TOC entry 3073 (class 0 OID 21297)
-- Dependencies: 213
-- Data for Name: Propuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Propuesta" ("iIdPropuesta", "vTitulo", "tDescripcion", "iIdTema", "vUrlVideoExterno", "nLatDec", "nLongDec", "iEstatus", "iIdUsuario", "vCodigo", "dFecha", "iIdMunicipio") FROM stdin;
40	Planes de estudio mas enfocados a la investigación	<table align="center" style="width:600px">\n\t<tbody>\n\t\t<tr>\n\t\t\t<td>\n\t\t\t<h2>stimado(a) Jorge Emilio:</h2>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Su usuario ha sido&nbsp;bloqueado&nbsp;por infringir los terminos de uso de la p&aacute;gina de Consulta Ciudadana.</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>&nbsp;</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td>Atte. Sistema de Consulta Ciudadana.</td>\n\t\t</tr>\n\t</tbody>\n</table>\n	2	https://www.youtube.com/watch?v=LrW0eUNPOZ0	21.006388999999999	-89.179444000000004	3	1	PYUC-0102-0040	2018-11-15 05:43:47	5
39	Planes de estudio mas enfocados a la investigación	<p>Un&nbsp;<strong><a href="https://es.wikipedia.org/wiki/An%C3%A1logo_a_la_Tierra">an&aacute;logo a la Tierra</a></strong>&nbsp;&mdash;tambi&eacute;n llamado&nbsp;<strong>Tierra gemela</strong>,&nbsp;<strong>exotierra</strong>,&nbsp;<strong>segunda Tierra</strong>,&nbsp;<strong>Tierra alien&iacute;gena</strong>,&nbsp;<strong>Tierra 2</strong>&nbsp;o&nbsp;<strong>planeta tipo Tierra</strong>&mdash; es un&nbsp;<a href="https://es.wikipedia.org/wiki/Planeta">planeta</a>&nbsp;con condiciones similares a las encontradas en la&nbsp;<a href="https://es.wikipedia.org/wiki/Tierra">Tierra</a>. Para ser considerado un an&aacute;logo terrestre, un cuerpo planetario debe orbitar alrededor de su&nbsp;<a href="https://es.wikipedia.org/wiki/Estrella">estrella</a>&nbsp;en la&nbsp;<a href="https://es.wikipedia.org/wiki/Zona_de_habitabilidad">zona de habitabilidad</a>del sistema &mdash;coloquialmente denominada&nbsp;<em><a href="https://es.wikipedia.org/wiki/Planeta_Ricitos_de_Oro">zona &laquo;Ricitos de Oro&raquo;</a></em>&mdash;, tener una&nbsp;<a href="https://es.wikipedia.org/wiki/Masa">masa</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/Radio_(geometr%C3%ADa)">radio</a>parecidos a los de la Tierra, contar con una composici&oacute;n atmosf&eacute;rica adecuada, pertenecer a una estrella similar al&nbsp;<a href="https://es.wikipedia.org/wiki/Sol">Sol</a>&nbsp;y disponer del resto de rasgos b&aacute;sicos de nuestro planeta que permiten, en conjunci&oacute;n con los anteriores, la presencia de&nbsp;<a href="https://es.wikipedia.org/wiki/Vida">vida</a>&nbsp;tal y como la conocemos.</p>\n\n<p>Desde que en 1995 los&nbsp;<a href="https://es.wikipedia.org/wiki/Astr%C3%B3nomo">astr&oacute;nomos</a>&nbsp;<a href="https://es.wikipedia.org/wiki/Michel_Mayor">Michel Mayor</a>&nbsp;y&nbsp;<a href="https://es.wikipedia.org/wiki/Didier_Queloz">Didier Queloz</a>&nbsp;descubriesen el primer&nbsp;<a href="https://es.wikipedia.org/wiki/Exoplaneta">exoplaneta</a>&nbsp;orbitando una estrella similar al Sol,&nbsp;<a href="https://es.wikipedia.org/wiki/51_Pegasi_b">51 Pegasi b</a>, el gran objetivo de los expertos en&nbsp;<a href="https://es.wikipedia.org/wiki/Exoplanetolog%C3%ADa">exoplanetolog&iacute;a</a>&nbsp;ha sido hallar una segunda Tierra. En los a&ntilde;os posteriores y hasta el lanzamiento del&nbsp;<a href="https://es.wikipedia.org/wiki/Kepler_(sat%C3%A9lite)">telescopio Kepler</a>, los descubrimientos eran mayoritariamente de&nbsp;<a href="https://es.wikipedia.org/wiki/Gigante_gaseoso">gigantes gaseosos</a>&nbsp;que&nbsp;<a href="https://es.wikipedia.org/wiki/%C3%93rbita">orbitaban</a>&nbsp;sus estrellas a distancias muy cortas, dadas las limitaciones de los instrumentos de la &eacute;poca. Esta clase de cuerpos, denominados&nbsp;<a href="https://es.wikipedia.org/wiki/J%C3%BApiter_caliente">jup&iacute;teres calientes</a>, influyen en gran medida en sus estrellas y&nbsp;<a href="https://es.wikipedia.org/wiki/Tr%C3%A1nsito_astron%C3%B3mico">transitan</a>&nbsp;con frecuencia, lo que facilitaba su detecci&oacute;n y parec&iacute;a apuntar una clara supremac&iacute;a cuantitativa de este tipo de planetas frente al resto por&nbsp;<a href="https://es.wikipedia.org/wiki/Sesgo_muestral">sesgo</a>. Con el tiempo, la mejora en las herramientas de investigaci&oacute;n invirti&oacute; la tendencia, siendo evidente el predominio de&nbsp;<a href="https://es.wikipedia.org/wiki/Planeta_terrestre">cuerpos tel&uacute;ricos</a>&nbsp;de masas similares a la terrestre por encima de aquellos de mayor tama&ntilde;o.</p>\n	1	https://www.youtube.com/watch?v=f4Mc-NYPHaQ	0	0	3	1	PYUC-0101-0039	2018-11-15 17:35:41	0
\.


--
-- TOC entry 3074 (class 0 OID 21305)
-- Dependencies: 214
-- Data for Name: PropuestaAdjunto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PropuestaAdjunto" ("iIdPropuestaAdjunto", "vNombreAdjunto", "vRutaAdjunto", "iTipo", "vExtension", "iIdPropuesta", "dFecha", "iActivo") FROM stdin;
70	120316362f32c31.jpg	archivos/imagenes/IMG_1_39.jpg	1	jpg	39	2018-11-15 17:35:42	1
71	economia_yucatan2_0.jpg	archivos/imagenes/IMG_2_39.jpg	1	jpg	39	2018-11-15 17:35:42	1
72	transporte-merida-turibus.jpg	archivos/imagenes/IMG_3_39.jpg	1	jpg	39	2018-11-15 17:35:42	1
73	2.4 Tipos de cerveza.pdf	archivos/pdf/PDF_1_39.pdf	2	pdf	39	2018-11-15 17:56:32	1
\.


--
-- TOC entry 3076 (class 0 OID 21310)
-- Dependencies: 216
-- Data for Name: PropuestaLike; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PropuestaLike" ("iIdPropuesta", "iIdUsuario", "iLike", "dFecha") FROM stdin;
\.


--
-- TOC entry 3077 (class 0 OID 21313)
-- Dependencies: 217
-- Data for Name: PropuestaOrigen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PropuestaOrigen" ("iIdPropuesta", "iIdPropuestaOrigen") FROM stdin;
40	39
\.


--
-- TOC entry 3096 (class 0 OID 21594)
-- Dependencies: 236
-- Data for Name: ProyectoEstrategico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProyectoEstrategico" ("iIdProyectoEstrategico", "vProyectoEstrategico", "iActivo") FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 21633)
-- Dependencies: 240
-- Data for Name: Respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Respuesta" ("iIdRespuesta", "iIdPregunta", "vRespuesta", "iTipoElemento", "iActivo") FROM stdin;
\.


--
-- TOC entry 3079 (class 0 OID 21318)
-- Dependencies: 219
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol" ("iIdRol", "vRol", "iActivo") FROM stdin;
1	Administrador	1
2	Público	1
3	Moderador	1
\.


--
-- TOC entry 3080 (class 0 OID 21322)
-- Dependencies: 220
-- Data for Name: RolPermiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RolPermiso" ("iIdRol", "iIdPermiso", "iTipoAcceso") FROM stdin;
1	1	2
1	2	2
1	3	2
1	4	2
1	5	2
\.


--
-- TOC entry 3082 (class 0 OID 21327)
-- Dependencies: 222
-- Data for Name: Sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sector" ("iIdSector", "vSector", "iActivo") FROM stdin;
1	Economía	1
2	Social	1
3	Seguridad	1
4	Educación	1
5	Territorio	1
6	Gobierno	1
\.


--
-- TOC entry 3084 (class 0 OID 21332)
-- Dependencies: 224
-- Data for Name: Tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tema" ("iIdTema", "vTema", "iIdSector", "iActivo") FROM stdin;
1	Desarrollo agropecuario, rural, pesquero y agroindustrial	1	1
2	Investigación y desarrollo, productividad	1	1
3	Competitividad y empleo	1	1
4	Turismo	1	1
5	Salud	2	1
6	Pobreza	2	1
7	Desigualdad	2	1
8	Pueblo Maya	2	1
9	Vulnerabilidad	2	1
10	Prevención del delito	3	1
11	Estado de Derecho	3	1
12	Certeza jurídica	3	1
13	Gobernabilidad	3	1
14	Protección civil	3	1
15	Seguridad	3	1
16	justicia	3	1
17	Educación Básica	4	1
18	Educación Media Superior	4	1
19	Educación Superior	4	1
20	Cultura  	4	1
21	Cultura Física y Deporte	4	1
22	Infraestructura para el desarrollo	5	1
23	Desarrollo urbano y metropolitano	5	1
24	Vivienda	5	1
25	Medio ambiente	5	1
26	Gobierno Eficiente	6	1
27	Transparencia y Rendición de cuentas	6	1
28	innovación y modernización de la administración	6	1
\.


--
-- TOC entry 3086 (class 0 OID 21338)
-- Dependencies: 226
-- Data for Name: TipoAsentamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoAsentamiento" ("iIdTipoAsentamiento", "vTipoAsentamiento", "iActivo") FROM stdin;
1	Fraccionamiento	1
2	Colonia	1
3	Unidad habitacional	1
4	Residencial	1
5	Gran usuario	1
6	Zona comercial	1
7	Ampliación	1
8	Conjunto habitacional	1
9	Zona industrial	1
10	Aeropuerto	1
11	Ejido	1
12	Pueblo	1
13	Hacienda	1
14	Ranchería	1
15	Condominio	1
16	Rancho	1
17	Zona federal	1
18	Equipamiento	1
19	Villa	1
20	Estación	1
\.


--
-- TOC entry 3088 (class 0 OID 21344)
-- Dependencies: 228
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("iIdUsuario", "vNombre", "vApellidoPaterno", "vApellidoMaterno", "vCorreo", "vContrasenia", "dFechaNacimiento", "iGenero", "iIdAsentamiento", "iIdGradoEstudio", "iIdOcupacion", "iEstatus", "iIdRol", "vToken", "iRegistroCon", "dFechaRegistro") FROM stdin;
18	wismar	Soberanis	Cabrera	wismar.soberanis@yucatan.gob.mx	7c4a8d09ca3762af61e59520943dc26494f8941b	1984-12-12	1	808	5	69	1	2	c8bdb3c113e545105846884be7aede1d	1	2018-11-15 17:20:23
7	Jorge Emilio	Estrella Zavala		jorge.alph@gmail.com	356a192b7913b04c54574d18c28d46e6395428ab	2005-02-28	1	349	1	69	0	2	f769edb25a5e2f5d04186d64091aeaf5	1	\N
16	Eric de Jesús	Mateos	Del valle	sumamademsn@hotmail.com	2050a0254f5912c913ea5ac53ef3d5c889b2c05f	1988-01-03	1	753	6	125	1	2	a2b6fbcdc3f72065a2590787bc553342	1	2018-11-13 10:16:18
17	Jorge Emilio	Estrella Zavala	Estrella Zavala	jorg.alph@gmail.com	7c4a8d09ca3762af61e59520943dc26494f8941b	2003-03-03	1	349	2	106	3	2	a8eafa5498d531304e5ef983b9996f6e	1	2018-11-13 18:01:13
6	Jorge Emilio	Estrella Zavala		jorge.alph@gmail.com	356a192b7913b04c54574d18c28d46e6395428ab	2005-02-28	1	349	1	69	0	2	660d906900be3ec2f42f7b1512463f76	1	\N
8	Jorge Emilio	Estrella Zavala		elias.abdala@live.com	8d177005fcd76b028f5b2190e9c851240630a47a	1989-06-07	1	346	6	69	0	2	4ef10883e6ab4e6bb503f2ef8f0ba541	1	2018-10-24 16:55:06
13	Pepe	Pecas		jorge_alph@hotmail.com	7110eda4d09e062aa5e4a390b0a572ac0d2c0220	1997-03-15	1	351	5	69	2	3	9a6e8def3a267dece7625b5ecae5680d	1	2018-11-12 16:43:57
12	Luis	Davalos		ladavalose@gmail.com	7c4a8d09ca3762af61e59520943dc26494f8941b	2004-02-29	1	346	1	105	1	2	b390722481463bd999aa908fde3598f2	1	2018-11-01 01:50:46
9	Luis	Estrada		jorge.estrella@yucatan.gob.mx	7c4a8d09ca3762af61e59520943dc26494f8941b	1999-04-04	1	2	5	69	2	2	c46153f996521fac203984188c9fa02b	1	2018-10-31 23:23:18
4	Jorge Emilio	Estrella Zavala		jorge_alph@hotmail.com	40bd001563085fc35165329ea1ff5c5ecbdbbeef	1988-06-07	1	347	2	86	0	2	\N	1	\N
1	Jorge Emilio	Estrella	Zavala	admin	7c4a8d09ca3762af61e59520943dc26494f8941b	1989-08-07	1	347	6	1	2	1		1	\N
5	Jorge Emilio	Estrella	Zavala	jorge.alph@gmail.com	7110eda4d09e062aa5e4a390b0a572ac0d2c0220	1989-04-10	1	347	5	105	3	2	89ae3756f865a9a2dcd74552f9793b1b	1	\N
14	victor geovanni	barbosa	reyes	bobis_gio90@hotmail.com	b2ee60370ad57d9bc3877e9024c507ab99303a64	1989-11-20	1	738	5	105	1	2	b74dc00410db67a85cb3875ff656bccf	1	2018-11-12 19:55:47
15	Eric de Jesús	Mateos	Del Valle	sumamadems@hotmail.com	7c4a8d09ca3762af61e59520943dc26494f8941b	1988-01-04	1	753	6	125	0	2	51b8cf4fb38aa197f78215b68f7d3958	1	2018-11-13 10:11:27
\.


--
-- TOC entry 3089 (class 0 OID 21352)
-- Dependencies: 229
-- Data for Name: UsuarioPermiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UsuarioPermiso" ("iIdUsuario", "iIdPermiso", "iTipoAcceso") FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 21644)
-- Dependencies: 241
-- Data for Name: UsuarioRespuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UsuarioRespuesta" ("iIdUsuario", "iIdRespuesta", "vRespuesta") FROM stdin;
\.


--
-- TOC entry 3091 (class 0 OID 21357)
-- Dependencies: 231
-- Data for Name: VotoPropuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."VotoPropuesta" ("iIdPropuesta", "iIdUsuario", "vVoto", "dFecha") FROM stdin;
39	1	1	2018-11-15 18:23:08
\.


--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 197
-- Name: Asentamiento_iIdAsentamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Asentamiento_iIdAsentamiento_seq"', 1, false);


--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 200
-- Name: Comentario_iIdComentario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Comentario_iIdComentario_seq"', 7, true);


--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 202
-- Name: GradoEstudio_iIdGradoEstudio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."GradoEstudio_iIdGradoEstudio_seq"', 1, false);


--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 204
-- Name: Localidad_iIdLocalidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Localidad_iIdLocalidad_seq"', 1, false);


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 206
-- Name: Log_iIdLog_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Log_iIdLog_seq"', 1, false);


--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 208
-- Name: Municipio_iIdMunicipio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Municipio_iIdMunicipio_seq"', 106, true);


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 210
-- Name: Ocupacion_iIdOcupacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ocupacion_iIdOcupacion_seq"', 1, false);


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 232
-- Name: Parametro_iIdParametro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Parametro_iIdParametro_seq"', 1, false);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 212
-- Name: Permiso_iIdPermiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Permiso_iIdPermiso_seq"', 6, true);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 237
-- Name: Pregunta_iIdPregunta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pregunta_iIdPregunta_seq"', 1, false);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 215
-- Name: PropuestaAdjunto_iIdPropuestaAdjunto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PropuestaAdjunto_iIdPropuestaAdjunto_seq"', 73, true);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 218
-- Name: Propuesta_iIdPropuesta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Propuesta_iIdPropuesta_seq"', 40, true);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 235
-- Name: ProyectoEstrategico_iIdProyectoEstrategico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ProyectoEstrategico_iIdProyectoEstrategico_seq"', 1, false);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 239
-- Name: Respuesta_iIdRespuesta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Respuesta_iIdRespuesta_seq"', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 221
-- Name: Rol_iIdRol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Rol_iIdRol_seq"', 3, true);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 223
-- Name: Sector_iIdSector_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sector_iIdSector_seq"', 6, true);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 225
-- Name: Tema_iIdTema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tema_iIdTema_seq"', 28, true);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 227
-- Name: TipoAsentamiento_iIdTipoAsentamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TipoAsentamiento_iIdTipoAsentamiento_seq"', 1, false);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 230
-- Name: Usuario_iIdUsuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Usuario_iIdUsuario_seq"', 18, true);


--
-- TOC entry 2852 (class 2606 OID 21377)
-- Name: Asentamiento PKiIdAsentamiento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asentamiento"
    ADD CONSTRAINT "PKiIdAsentamiento" PRIMARY KEY ("iIdAsentamiento");


--
-- TOC entry 2854 (class 2606 OID 21379)
-- Name: Comentario PKiIdComentario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comentario"
    ADD CONSTRAINT "PKiIdComentario" PRIMARY KEY ("iIdComentario");


--
-- TOC entry 2856 (class 2606 OID 21381)
-- Name: ComentarioLike PKiIdComentarioiIdUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComentarioLike"
    ADD CONSTRAINT "PKiIdComentarioiIdUsuario" PRIMARY KEY ("iIdCometario", "iIdUsuario");


--
-- TOC entry 2858 (class 2606 OID 21383)
-- Name: GradoEstudio PKiIdGradoEstudio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GradoEstudio"
    ADD CONSTRAINT "PKiIdGradoEstudio" PRIMARY KEY ("iIdGradoEstudio");


--
-- TOC entry 2860 (class 2606 OID 21385)
-- Name: Localidad PKiIdLocalidad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localidad"
    ADD CONSTRAINT "PKiIdLocalidad" PRIMARY KEY ("iIdLocalidad");


--
-- TOC entry 2862 (class 2606 OID 21387)
-- Name: Log PKiIdLog; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Log"
    ADD CONSTRAINT "PKiIdLog" PRIMARY KEY ("iIdLog");


--
-- TOC entry 2864 (class 2606 OID 21389)
-- Name: Municipio PKiIdMunicipio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Municipio"
    ADD CONSTRAINT "PKiIdMunicipio" PRIMARY KEY ("iIdMunicipio");


--
-- TOC entry 2866 (class 2606 OID 21391)
-- Name: Ocupacion PKiIdOcupacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ocupacion"
    ADD CONSTRAINT "PKiIdOcupacion" PRIMARY KEY ("iIdOcupacion");


--
-- TOC entry 2868 (class 2606 OID 21395)
-- Name: Permiso PKiIdPermiso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permiso"
    ADD CONSTRAINT "PKiIdPermiso" PRIMARY KEY ("iIdPermiso");


--
-- TOC entry 2870 (class 2606 OID 21397)
-- Name: Propuesta PKiIdPropuesta; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Propuesta"
    ADD CONSTRAINT "PKiIdPropuesta" PRIMARY KEY ("iIdPropuesta");


--
-- TOC entry 2872 (class 2606 OID 21399)
-- Name: PropuestaAdjunto PKiIdPropuestaAdjunto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaAdjunto"
    ADD CONSTRAINT "PKiIdPropuestaAdjunto" PRIMARY KEY ("iIdPropuestaAdjunto");


--
-- TOC entry 2876 (class 2606 OID 21401)
-- Name: PropuestaOrigen PKiIdPropuestaiIdPropuestaOrigen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaOrigen"
    ADD CONSTRAINT "PKiIdPropuestaiIdPropuestaOrigen" PRIMARY KEY ("iIdPropuesta", "iIdPropuestaOrigen");


--
-- TOC entry 2892 (class 2606 OID 21403)
-- Name: VotoPropuesta PKiIdPropuestaiIdUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VotoPropuesta"
    ADD CONSTRAINT "PKiIdPropuestaiIdUsuario" PRIMARY KEY ("iIdPropuesta", "iIdUsuario");


--
-- TOC entry 2874 (class 2606 OID 21405)
-- Name: PropuestaLike PKiIdPropuestaiIdUsuarioLike; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaLike"
    ADD CONSTRAINT "PKiIdPropuestaiIdUsuarioLike" PRIMARY KEY ("iIdPropuesta", "iIdUsuario");


--
-- TOC entry 2878 (class 2606 OID 21407)
-- Name: Rol PKiIdRol; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "PKiIdRol" PRIMARY KEY ("iIdRol");


--
-- TOC entry 2880 (class 2606 OID 21409)
-- Name: RolPermiso PKiIdRoliIdPermiso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolPermiso"
    ADD CONSTRAINT "PKiIdRoliIdPermiso" PRIMARY KEY ("iIdRol", "iIdPermiso");


--
-- TOC entry 2882 (class 2606 OID 21411)
-- Name: Sector PKiIdSector; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sector"
    ADD CONSTRAINT "PKiIdSector" PRIMARY KEY ("iIdSector");


--
-- TOC entry 2884 (class 2606 OID 21413)
-- Name: Tema PKiIdTema; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "PKiIdTema" PRIMARY KEY ("iIdTema");


--
-- TOC entry 2886 (class 2606 OID 21415)
-- Name: TipoAsentamiento PKiIdTipoAsentamiento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoAsentamiento"
    ADD CONSTRAINT "PKiIdTipoAsentamiento" PRIMARY KEY ("iIdTipoAsentamiento");


--
-- TOC entry 2888 (class 2606 OID 21417)
-- Name: Usuario PKiIdUsuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "PKiIdUsuario" PRIMARY KEY ("iIdUsuario");


--
-- TOC entry 2890 (class 2606 OID 21419)
-- Name: UsuarioPermiso PKiIdUsuarioiIdPermiso; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioPermiso"
    ADD CONSTRAINT "PKiIdUsuarioiIdPermiso" PRIMARY KEY ("iIdUsuario", "iIdPermiso");


--
-- TOC entry 2894 (class 2606 OID 21563)
-- Name: Parametro Parametro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parametro"
    ADD CONSTRAINT "Parametro_pkey" PRIMARY KEY ("iIdParametro");


--
-- TOC entry 2900 (class 2606 OID 21630)
-- Name: Pregunta Pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pregunta"
    ADD CONSTRAINT "Pregunta_pkey" PRIMARY KEY ("iIdPregunta");


--
-- TOC entry 2896 (class 2606 OID 21581)
-- Name: PresupuestoUsuario PresupuestoUsuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PresupuestoUsuario"
    ADD CONSTRAINT "PresupuestoUsuario_pkey" PRIMARY KEY ("iIdTema", "iIdUsuario");


--
-- TOC entry 2898 (class 2606 OID 21599)
-- Name: ProyectoEstrategico ProyectoEstrategico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProyectoEstrategico"
    ADD CONSTRAINT "ProyectoEstrategico_pkey" PRIMARY KEY ("iIdProyectoEstrategico");


--
-- TOC entry 2902 (class 2606 OID 21638)
-- Name: Respuesta Respuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Respuesta"
    ADD CONSTRAINT "Respuesta_pkey" PRIMARY KEY ("iIdRespuesta");


--
-- TOC entry 2904 (class 2606 OID 21648)
-- Name: UsuarioRespuesta UsuarioRespuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioRespuesta"
    ADD CONSTRAINT "UsuarioRespuesta_pkey" PRIMARY KEY ("iIdUsuario", "iIdRespuesta");


--
-- TOC entry 2905 (class 2606 OID 21420)
-- Name: Asentamiento FKAsentamientoLocalidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asentamiento"
    ADD CONSTRAINT "FKAsentamientoLocalidad" FOREIGN KEY ("iIdLocalidad") REFERENCES public."Localidad"("iIdLocalidad");


--
-- TOC entry 2906 (class 2606 OID 21425)
-- Name: Asentamiento FKAsentamientoTipoAsentamiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asentamiento"
    ADD CONSTRAINT "FKAsentamientoTipoAsentamiento" FOREIGN KEY ("iIdTipoAsentamiento") REFERENCES public."TipoAsentamiento"("iIdTipoAsentamiento");


--
-- TOC entry 2909 (class 2606 OID 21430)
-- Name: ComentarioLike FKComentarioLikeComentario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComentarioLike"
    ADD CONSTRAINT "FKComentarioLikeComentario" FOREIGN KEY ("iIdCometario") REFERENCES public."Comentario"("iIdComentario");


--
-- TOC entry 2910 (class 2606 OID 21435)
-- Name: ComentarioLike FKComentarioLikeUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComentarioLike"
    ADD CONSTRAINT "FKComentarioLikeUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario");


--
-- TOC entry 2907 (class 2606 OID 21440)
-- Name: Comentario FKComentarioPropuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comentario"
    ADD CONSTRAINT "FKComentarioPropuesta" FOREIGN KEY ("iIdPropuesta") REFERENCES public."Propuesta"("iIdPropuesta");


--
-- TOC entry 2908 (class 2606 OID 21445)
-- Name: Comentario FKComentarioUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comentario"
    ADD CONSTRAINT "FKComentarioUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario");


--
-- TOC entry 2911 (class 2606 OID 21450)
-- Name: Localidad FKLocalidadMunicipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Localidad"
    ADD CONSTRAINT "FKLocalidadMunicipio" FOREIGN KEY ("iIdMunicipio") REFERENCES public."Municipio"("iIdMunicipio");


--
-- TOC entry 2930 (class 2606 OID 21582)
-- Name: PresupuestoUsuario FKPresupuestoUsuarioTema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PresupuestoUsuario"
    ADD CONSTRAINT "FKPresupuestoUsuarioTema" FOREIGN KEY ("iIdTema") REFERENCES public."Tema"("iIdTema") ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2931 (class 2606 OID 21587)
-- Name: PresupuestoUsuario FKPresupuestoUsuarioUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PresupuestoUsuario"
    ADD CONSTRAINT "FKPresupuestoUsuarioUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario") ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2914 (class 2606 OID 21455)
-- Name: PropuestaAdjunto FKPropuestaAdjuntoPropuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaAdjunto"
    ADD CONSTRAINT "FKPropuestaAdjuntoPropuesta" FOREIGN KEY ("iIdPropuesta") REFERENCES public."Propuesta"("iIdPropuesta");


--
-- TOC entry 2915 (class 2606 OID 21460)
-- Name: PropuestaLike FKPropuestaLikePropuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaLike"
    ADD CONSTRAINT "FKPropuestaLikePropuesta" FOREIGN KEY ("iIdPropuesta") REFERENCES public."Propuesta"("iIdPropuesta");


--
-- TOC entry 2916 (class 2606 OID 21465)
-- Name: PropuestaLike FKPropuestaLikeUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaLike"
    ADD CONSTRAINT "FKPropuestaLikeUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario");


--
-- TOC entry 2917 (class 2606 OID 21470)
-- Name: PropuestaOrigen FKPropuestaOrigenPropuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaOrigen"
    ADD CONSTRAINT "FKPropuestaOrigenPropuesta" FOREIGN KEY ("iIdPropuesta") REFERENCES public."Propuesta"("iIdPropuesta");


--
-- TOC entry 2912 (class 2606 OID 21475)
-- Name: Propuesta FKPropuestaTema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Propuesta"
    ADD CONSTRAINT "FKPropuestaTema" FOREIGN KEY ("iIdTema") REFERENCES public."Tema"("iIdTema");


--
-- TOC entry 2913 (class 2606 OID 21480)
-- Name: Propuesta FKPropuestaUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Propuesta"
    ADD CONSTRAINT "FKPropuestaUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario");


--
-- TOC entry 2919 (class 2606 OID 21485)
-- Name: RolPermiso FKRolPermisoPermiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolPermiso"
    ADD CONSTRAINT "FKRolPermisoPermiso" FOREIGN KEY ("iIdPermiso") REFERENCES public."Permiso"("iIdPermiso");


--
-- TOC entry 2920 (class 2606 OID 21490)
-- Name: RolPermiso FKRolPermisoRol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolPermiso"
    ADD CONSTRAINT "FKRolPermisoRol" FOREIGN KEY ("iIdRol") REFERENCES public."Rol"("iIdRol");


--
-- TOC entry 2921 (class 2606 OID 21495)
-- Name: Tema FKTemaSector; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "FKTemaSector" FOREIGN KEY ("iIdSector") REFERENCES public."Sector"("iIdSector");


--
-- TOC entry 2922 (class 2606 OID 21500)
-- Name: Usuario FKUsuarioAsentamiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FKUsuarioAsentamiento" FOREIGN KEY ("iIdAsentamiento") REFERENCES public."Asentamiento"("iIdAsentamiento");


--
-- TOC entry 2923 (class 2606 OID 21505)
-- Name: Usuario FKUsuarioGradoEstudio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FKUsuarioGradoEstudio" FOREIGN KEY ("iIdGradoEstudio") REFERENCES public."GradoEstudio"("iIdGradoEstudio");


--
-- TOC entry 2924 (class 2606 OID 21510)
-- Name: Usuario FKUsuarioOcupacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FKUsuarioOcupacion" FOREIGN KEY ("iIdOcupacion") REFERENCES public."Ocupacion"("iIdOcupacion");


--
-- TOC entry 2926 (class 2606 OID 21515)
-- Name: UsuarioPermiso FKUsuarioPermisoPermiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioPermiso"
    ADD CONSTRAINT "FKUsuarioPermisoPermiso" FOREIGN KEY ("iIdPermiso") REFERENCES public."Permiso"("iIdPermiso");


--
-- TOC entry 2927 (class 2606 OID 21520)
-- Name: UsuarioPermiso FKUsuarioPermisoUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioPermiso"
    ADD CONSTRAINT "FKUsuarioPermisoUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario");


--
-- TOC entry 2934 (class 2606 OID 21654)
-- Name: UsuarioRespuesta FKUsuarioRespuestaRespuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioRespuesta"
    ADD CONSTRAINT "FKUsuarioRespuestaRespuesta" FOREIGN KEY ("iIdRespuesta") REFERENCES public."Respuesta"("iIdRespuesta") ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2933 (class 2606 OID 21649)
-- Name: UsuarioRespuesta FKUsuarioRespuestaUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioRespuesta"
    ADD CONSTRAINT "FKUsuarioRespuestaUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario") ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2925 (class 2606 OID 21525)
-- Name: Usuario FKUsuarioRol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FKUsuarioRol" FOREIGN KEY ("iIdRol") REFERENCES public."Rol"("iIdRol");


--
-- TOC entry 2928 (class 2606 OID 21530)
-- Name: VotoPropuesta FKiIdPropuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VotoPropuesta"
    ADD CONSTRAINT "FKiIdPropuesta" FOREIGN KEY ("iIdPropuesta") REFERENCES public."Propuesta"("iIdPropuesta");


--
-- TOC entry 2929 (class 2606 OID 21535)
-- Name: VotoPropuesta FKiIdUsuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VotoPropuesta"
    ADD CONSTRAINT "FKiIdUsuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario");


--
-- TOC entry 2918 (class 2606 OID 21540)
-- Name: PropuestaOrigen PropuestaOrigenPropuestaOrigen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PropuestaOrigen"
    ADD CONSTRAINT "PropuestaOrigenPropuestaOrigen" FOREIGN KEY ("iIdPropuestaOrigen") REFERENCES public."Propuesta"("iIdPropuesta");


--
-- TOC entry 2932 (class 2606 OID 21639)
-- Name: Respuesta RespuestaPregunta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Respuesta"
    ADD CONSTRAINT "RespuestaPregunta" FOREIGN KEY ("iIdPregunta") REFERENCES public."Pregunta"("iIdPregunta") ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2018-11-16 18:09:46

--
-- PostgreSQL database dump complete
--

