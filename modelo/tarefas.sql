--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Ubuntu 13.5-0ubuntu0.21.10.1)
-- Dumped by pg_dump version 13.5 (Ubuntu 13.5-0ubuntu0.21.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: atendimento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atendimento (
    idatendimento integer NOT NULL,
    pessoa_idpessoa integer,
    tarefa_idtarefa integer
);


ALTER TABLE public.atendimento OWNER TO postgres;

--
-- Name: atendimento_idatendimento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.atendimento_idatendimento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atendimento_idatendimento_seq OWNER TO postgres;

--
-- Name: atendimento_idatendimento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.atendimento_idatendimento_seq OWNED BY public.atendimento.idatendimento;


--
-- Name: pessoa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pessoa (
    idpessoa integer NOT NULL,
    nome character varying(200) NOT NULL,
    funcao character varying(25) NOT NULL
);


ALTER TABLE public.pessoa OWNER TO postgres;

--
-- Name: pessoa_idpessoa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pessoa_idpessoa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pessoa_idpessoa_seq OWNER TO postgres;

--
-- Name: pessoa_idpessoa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pessoa_idpessoa_seq OWNED BY public.pessoa.idpessoa;


--
-- Name: situacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.situacao (
    idsituacao integer NOT NULL,
    descricao character varying(25) NOT NULL
);


ALTER TABLE public.situacao OWNER TO postgres;

--
-- Name: situacao_idsituacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.situacao_idsituacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.situacao_idsituacao_seq OWNER TO postgres;

--
-- Name: situacao_idsituacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.situacao_idsituacao_seq OWNED BY public.situacao.idsituacao;


--
-- Name: tarefa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarefa (
    idtarefa integer NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    data_inicio_p date,
    data_inicio_r date,
    data_fim_p date,
    data_fim_r date,
    situacao_idsituacao integer
);


ALTER TABLE public.tarefa OWNER TO postgres;

--
-- Name: tarefa_idtarefa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarefa_idtarefa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarefa_idtarefa_seq OWNER TO postgres;

--
-- Name: tarefa_idtarefa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarefa_idtarefa_seq OWNED BY public.tarefa.idtarefa;


--
-- Name: atendimento idatendimento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento ALTER COLUMN idatendimento SET DEFAULT nextval('public.atendimento_idatendimento_seq'::regclass);


--
-- Name: pessoa idpessoa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa ALTER COLUMN idpessoa SET DEFAULT nextval('public.pessoa_idpessoa_seq'::regclass);


--
-- Name: situacao idsituacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situacao ALTER COLUMN idsituacao SET DEFAULT nextval('public.situacao_idsituacao_seq'::regclass);


--
-- Name: tarefa idtarefa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefa ALTER COLUMN idtarefa SET DEFAULT nextval('public.tarefa_idtarefa_seq'::regclass);


--
-- Data for Name: atendimento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atendimento (idatendimento, pessoa_idpessoa, tarefa_idtarefa) FROM stdin;
\.


--
-- Data for Name: pessoa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pessoa (idpessoa, nome, funcao) FROM stdin;
1	Rafael	Professor
3	Thiago	Analista
4	Matheus	Programador
\.


--
-- Data for Name: situacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.situacao (idsituacao, descricao) FROM stdin;
1	Concluída
4	Em atendimento
6	Aberta
3	Em atraso
\.


--
-- Data for Name: tarefa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarefa (idtarefa, nome, descricao, data_inicio_p, data_inicio_r, data_fim_p, data_fim_r, situacao_idsituacao) FROM stdin;
\.


--
-- Name: atendimento_idatendimento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.atendimento_idatendimento_seq', 1, false);


--
-- Name: pessoa_idpessoa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pessoa_idpessoa_seq', 4, true);


--
-- Name: situacao_idsituacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.situacao_idsituacao_seq', 8, true);


--
-- Name: tarefa_idtarefa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarefa_idtarefa_seq', 1, false);


--
-- Name: atendimento atendimento_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT atendimento_pk PRIMARY KEY (idatendimento);


--
-- Name: pessoa pessoa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pk PRIMARY KEY (idpessoa);


--
-- Name: situacao situacao_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.situacao
    ADD CONSTRAINT situacao_pk PRIMARY KEY (idsituacao);


--
-- Name: tarefa tarefa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefa
    ADD CONSTRAINT tarefa_pk PRIMARY KEY (idtarefa);


--
-- Name: atendimento pessoa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT pessoa_fk FOREIGN KEY (pessoa_idpessoa) REFERENCES public.pessoa(idpessoa) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: tarefa situacao_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarefa
    ADD CONSTRAINT situacao_fk FOREIGN KEY (situacao_idsituacao) REFERENCES public.situacao(idsituacao) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: atendimento tarefa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimento
    ADD CONSTRAINT tarefa_fk FOREIGN KEY (tarefa_idtarefa) REFERENCES public.tarefa(idtarefa) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

