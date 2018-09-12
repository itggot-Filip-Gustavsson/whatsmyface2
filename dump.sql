--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: whatsmyface
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    workspace_id integer NOT NULL
);


ALTER TABLE public.groups OWNER TO whatsmyface;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: whatsmyface
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO whatsmyface;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whatsmyface
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: whatsmyface
--

CREATE TABLE public.people (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    group_id integer NOT NULL,
    picture character varying(255),
    notes character varying(255)
);


ALTER TABLE public.people OWNER TO whatsmyface;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: whatsmyface
--

CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_id_seq OWNER TO whatsmyface;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whatsmyface
--

ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;


--
-- Name: user_ws; Type: TABLE; Schema: public; Owner: whatsmyface
--

CREATE TABLE public.user_ws (
    user_id integer NOT NULL,
    workspace_id integer NOT NULL
);


ALTER TABLE public.user_ws OWNER TO whatsmyface;

--
-- Name: users; Type: TABLE; Schema: public; Owner: whatsmyface
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    hash character varying(60) NOT NULL,
    picture character varying(255),
    role integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO whatsmyface;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: whatsmyface
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO whatsmyface;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whatsmyface
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: whatsmyface
--

CREATE TABLE public.workspaces (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    company character varying(255) NOT NULL,
    code character varying(255) NOT NULL
);


ALTER TABLE public.workspaces OWNER TO whatsmyface;

--
-- Name: workspace_id_seq; Type: SEQUENCE; Schema: public; Owner: whatsmyface
--

CREATE SEQUENCE public.workspace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workspace_id_seq OWNER TO whatsmyface;

--
-- Name: workspace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: whatsmyface
--

ALTER SEQUENCE public.workspace_id_seq OWNED BY public.workspaces.id;


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: workspaces id; Type: DEFAULT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.workspaces ALTER COLUMN id SET DEFAULT nextval('public.workspace_id_seq'::regclass);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: whatsmyface
--

COPY public.groups (id, name, workspace_id) FROM stdin;
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: whatsmyface
--

COPY public.people (id, name, group_id, picture, notes) FROM stdin;
\.


--
-- Data for Name: user_ws; Type: TABLE DATA; Schema: public; Owner: whatsmyface
--

COPY public.user_ws (user_id, workspace_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: whatsmyface
--

COPY public.users (id, email, name, hash, picture, role) FROM stdin;
1	sotis1999@gmail.com	Filip	gej	\N	1
2	exampel@exampel.com	kianosh	$2b$12$c2OP63pMMQY9YJ.GEkwDce2M0.xRKx4U8YfZ/CAWkoQBQwi9vlabe	\N	1
3	testmail	putte	$2b$12$.BdJ4fcFDsZCJBmZ.nkcXuCckIgmMDNlumw3NUTW25KgucSiT5Tci	\N	1
4	lol	kaka	$2b$12$M8D.NuViuDqKeUpRkbcdJu8yexPa.Poc1KiEr47eVI1YU9suy936G	\N	1
5	lud	lud	$2b$12$4szG5X7G3MPc4dLx1CA/nO8sCc2f5IW47gMrHJIdguukoiAqf.AfK	\N	1
\.


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: whatsmyface
--

COPY public.workspaces (id, name, company, code) FROM stdin;
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whatsmyface
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whatsmyface
--

SELECT pg_catalog.setval('public.people_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whatsmyface
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: workspace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: whatsmyface
--

SELECT pg_catalog.setval('public.workspace_id_seq', 1, false);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workspaces workspace_pkey; Type: CONSTRAINT; Schema: public; Owner: whatsmyface
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspace_pkey PRIMARY KEY (id);


--
-- Name: users_name_uindex; Type: INDEX; Schema: public; Owner: whatsmyface
--

CREATE UNIQUE INDEX users_name_uindex ON public.users USING btree (name);


--
-- PostgreSQL database dump complete
--

