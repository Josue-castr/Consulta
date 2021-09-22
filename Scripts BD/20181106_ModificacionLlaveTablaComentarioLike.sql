/*
	Se corrije error ortográfico en el nombre de columna
*/

-- ----------------------------
-- Tabla ComentarioLIke
-- ----------------------------

ALTER TABLE public."ComentarioLike"
    RENAME "iIdCometario" TO "iIdComentario";

ALTER TABLE public."ComentarioLike"
    ALTER COLUMN "iIdComentario" TYPE integer (4);