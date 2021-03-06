CREATE TABLE distritos_seccion (
    id                  uuid            NOT NULL    DEFAULT uuid_generate_v4 (),
    entidad             INT             NOT NULL,
    nombre_entidad      VARCHAR(255)    NOT NULL,
    distrito            INT             NOT NULL,
    municipio           INT             NOT NULL,
    nombre_municipio    VARCHAR(255)    NOT NULL,
    seccion             INT             NOT NULL,
    tipo                VARCHAR(255)    NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE diputade (
    bancada_original    VARCHAR(255)    NOT NULL,
    nombre_diputade     VARCHAR(255)    NOT NULL,
    entidad             VARCHAR(255)    NOT NULL,
    num_entidad         INT             NOT NULL,
    num_distrito        INT             NOT NULL,
    distrito            VARCHAR(255)    NOT NULL,
    tipo                VARCHAR(255)    NOT NULL,
    id_legislativo      INT             NOT NULL,
    bancada_actual      VARCHAR(255)    NOT NULL,
    reeleccion          BOOLEAN         NOT NULL,
    reeleccion_suplente BOOLEAN         NOT NULL,
    licencia            BOOLEAN         NOT NULL,
    licencia_deceso     BOOLEAN         NOT NULL,
    nombre_suplente     VARCHAR(255)    NOT NULL,
    foto                VARCHAR(255)    NOT NULL,
    PRIMARY KEY (id_legislativo)
);

CREATE TABLE preguntas_quiz (
    id_pregunta         SERIAL          NOT NULL,
    pregunta            VARCHAR(255)    NOT NULL,
    pregunta_corta      VARCHAR(255)    NOT NULL,
    input               JSON            NOT NULL,
    PRIMARY KEY (id_pregunta)
);

CREATE TABLE respuestas_usuarie_quiz (
    id_respuesta_usuarie    SERIAL          NOT NULL,
    id_pregunta             INT             NOT NULL,
    respuesta               VARCHAR(255)    NOT NULL,
    distrito_usuarie        INT             NOT NULL,
    entidad                 INT             NOT NULL,
    seccion                 INT             NOT NULL,
    CONSTRAINT fk_pregunta
        FOREIGN KEY(id_pregunta) 
        REFERENCES preguntas_quiz(id_pregunta)
            ON DELETE CASCADE
);

CREATE TABLE correos_usuaries (
    id_correo   uuid            NOT NULL    DEFAULT uuid_generate_v4 (),
    correo      VARCHAR(255),
    UNIQUE(correo)
);

CREATE TABLE votaciones_partidos (
    id_respuesta_partido    SERIAL          NOT NULL,
    id_pregunta             INT             NOT NULL,
    partido                 VARCHAR(255)    NOT NULL,
    votacion                VARCHAR(255)    NOT NULL,
    count                   INT             NOT NULL,
    CONSTRAINT fk_pregunta
        FOREIGN KEY(id_pregunta) 
        REFERENCES preguntas_quiz(id_pregunta)
            ON DELETE CASCADE
);

CREATE TABLE votaciones_diputade (
    id_respuesta_diputade   SERIAL          NOT NULL,
    id_pregunta             INT             NOT NULL,
    votacion                VARCHAR(255)    NOT NULL,
    id_legislativo          INT             NOT NULL,
    CONSTRAINT fk_pregunta
        FOREIGN KEY(id_pregunta) 
        REFERENCES preguntas_quiz(id_pregunta)
            ON DELETE CASCADE,
    CONSTRAINT fk_diputade
        FOREIGN KEY(id_legislativo) 
        REFERENCES diputade(id_legislativo)
            ON DELETE CASCADE
);

INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de la creaci??n de la Guardia Nacional en sustituci??n de la Polic??a Federal?', 'Creaci??n de la Guardia Nacional', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de la legalizaci??n de la marihuana para fines recreativos?', 'Legalizaci??n de la marihuana para fines recreativos', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor de que se regulen los cigarros electr??nicos, vaporizadores, productos de administraci??n de nicotina y calentado de tabaco en lugar de prohibirlos?', 'Regulaci??n en lugar de prohibici??n de los cigarros electr??nicos, vaporizadores, productos de administraci??n de nicotina y calentado de tabaco', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de quitarle flexibilidad a las empresas para contratar empleados a trav??s de intermediarios?', 'Quitarle flexibilidad a las empresas para contratar empleados a trav??s de intermediarios', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de que te pidan datos biom??tricos como tu huella digital o tu iris para contratar una l??nea de tel??fono celular?', 'Recolecci??n de datos biom??tricos para contratar una l??nea de tel??fono celular', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de que exista la posibilidad de votar a la mitad del sexenio si el presidente debe continuar o retirarse de su puesto?', 'Votar a la mitad del sexenio si el presidente debe continuar o retirarse de su puesto', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de que se ampl??e la lista de delitos que en los que el acusado est?? preso durante el juicio? (delitos electorales, huachicoleo, violaci??n, secuestro, feminicidio)', 'Ampliaci??n de la lista de delitos que en los que el acusado est?? preso durante el juicio', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de que los ciudadanos puedan disponer de sus ahorros voluntarios en las afores cuando lo deseen?', 'Disposici??n de los ciudadanos de sus ahorros voluntarios en las afores cuando lo deseen', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de que se eliminen los fideicomisos para instituciones educativas, cultura, protecci??n de Derechos Humanos y periodistas, desastres naturales y deporte con la promesa de crear otros mecanismos de financiamiento?', 'Eliminaci??n de los fideicomisos a cambio de otros mecanismos de financiamiento', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');
INSERT INTO preguntas_quiz(pregunta, pregunta_corta, input)
VALUES ('??Est??s a favor o en contra de que se le d?? prioridad a la CFE sobre empresas privadas en materia el??ctrica aunque pueda haber afectaciones en el medio ambiente?', 'Prioridad a la CFE sobre empresas privadas en materia el??ctrica', '{"type":"radio","values":[{"label":"A favor ???","value":"A favor"},{"label":"Indeciso/a ????","value":"Indecisi??n"},{"label":"En contra ???","value":"En contra"}]}');