--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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
-- Name: commandes; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.commandes (
    id bigint NOT NULL,
    status_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    creator_id bigint
);



--
-- Name: commandes_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.commandes_id_seq OWNED BY public.commandes.id;


--
-- Name: enregistrements; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.enregistrements (
    id bigint NOT NULL,
    inventaire_id bigint NOT NULL,
    CodeKit character varying(30) NOT NULL,
    Stock bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);



--
-- Name: enregistrements_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.enregistrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: enregistrements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.enregistrements_id_seq OWNED BY public.enregistrements.id;


--
-- Name: fabricants; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.fabricants (
    CodeF character varying(30) NOT NULL,
    Nom character varying(255) DEFAULT NULL::character varying,
    Pays character varying(255) DEFAULT NULL::character varying,
    Ville character varying(255) DEFAULT NULL::character varying
);



--
-- Name: inventaires; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.inventaires (
    id bigint NOT NULL,
    creator_id bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);



--
-- Name: inventaires_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.inventaires_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: inventaires_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.inventaires_id_seq OWNED BY public.inventaires.id;


--
-- Name: kits; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.kits (
    CodeKit character varying(30) NOT NULL,
    prix double precision,
    Annee date,
    Duree bigint,
    CodeF character varying(30) DEFAULT NULL::character varying,
    Stock bigint DEFAULT '0'::bigint
);



--
-- Name: ligne_commandes; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.ligne_commandes (
    id bigint NOT NULL,
    CodeKit character varying(30) NOT NULL,
    Qte bigint NOT NULL,
    commande_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);



--
-- Name: ligne_commandes_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.ligne_commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: ligne_commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.ligne_commandes_id_seq OWNED BY public.ligne_commandes.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.migrations (
    id bigint NOT NULL,
    migration character varying(255) NOT NULL,
    batch bigint NOT NULL
);



--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    libelle character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);



--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: role_permission; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.role_permission (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);



--
-- Name: roles; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    libelle character varying(255) NOT NULL,
    niveau bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);



--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: statuses; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.statuses (
    id bigint NOT NULL,
    libelle character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);



--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.statuses_id_seq OWNED BY public.statuses.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: piman
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(191) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(255) DEFAULT NULL::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role_id bigint,
    deleted_at timestamp without time zone
);



--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: piman
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: piman
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: commandes id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.commandes ALTER COLUMN id SET DEFAULT nextval('public.commandes_id_seq'::regclass);


--
-- Name: enregistrements id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.enregistrements ALTER COLUMN id SET DEFAULT nextval('public.enregistrements_id_seq'::regclass);


--
-- Name: inventaires id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.inventaires ALTER COLUMN id SET DEFAULT nextval('public.inventaires_id_seq'::regclass);


--
-- Name: ligne_commandes id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.ligne_commandes ALTER COLUMN id SET DEFAULT nextval('public.ligne_commandes_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.statuses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: commandes; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.commandes (id, status_id, created_at, updated_at, creator_id) FROM stdin;
3	2	2020-01-13 19:04:00	2020-01-13 19:04:04	2
4	2	2020-01-13 19:13:43	2020-03-29 13:38:50	2
5	2	2020-01-13 19:14:07	2020-01-14 17:54:48	2
6	2	2020-01-14 17:43:34	2020-01-14 17:43:46	2
7	1	2020-01-14 18:13:12	2020-01-14 18:13:12	2
8	2	2020-01-15 13:44:02	2020-01-15 13:44:12	3
\.


--
-- Data for Name: enregistrements; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.enregistrements (id, inventaire_id, CodeKit, stock, created_at, updated_at) FROM stdin;
113	19	K001	7	2020-01-13 19:07:26	2020-01-13 19:07:26
114	19	K002	2	2020-01-13 19:07:26	2020-01-13 19:07:26
115	19	K003	1	2020-01-13 19:07:26	2020-01-13 19:07:26
116	19	K004	12	2020-01-13 19:07:26	2020-01-13 19:07:26
117	19	K005	3	2020-01-13 19:07:26	2020-01-13 19:07:26
118	20	K001	2	2020-01-13 19:07:39	2020-01-13 19:07:39
119	20	K002	12	2020-01-13 19:07:39	2020-01-13 19:07:39
120	20	K003	9	2020-01-13 19:07:39	2020-01-13 19:07:39
121	20	K004	2	2020-01-13 19:07:39	2020-01-13 19:07:39
122	20	K005	3	2020-01-13 19:07:39	2020-01-13 19:07:39
123	21	K001	4	2020-01-13 19:07:55	2020-01-13 19:07:55
124	21	K002	18	2020-01-13 19:07:55	2020-01-13 19:07:55
125	21	K003	2	2020-01-13 19:07:55	2020-01-13 19:07:55
126	21	K004	17	2020-01-13 19:07:55	2020-01-13 19:07:55
127	21	K005	9	2020-01-13 19:07:55	2020-01-13 19:07:55
128	22	K001	4	2020-01-13 19:09:04	2020-01-13 19:09:04
129	22	K002	8	2020-01-13 19:09:04	2020-01-13 19:09:04
130	22	K003	2	2020-01-13 19:09:04	2020-01-13 19:09:04
131	22	K004	1	2020-01-13 19:09:04	2020-01-13 19:09:04
132	22	K005	9	2020-01-13 19:09:04	2020-01-13 19:09:04
133	23	K001	4	2020-01-13 19:10:49	2020-01-13 19:10:49
134	23	K002	8	2020-01-13 19:10:49	2020-01-13 19:10:49
135	23	K003	2	2020-01-13 19:10:49	2020-01-13 19:10:49
136	23	K004	1	2020-01-13 19:10:49	2020-01-13 19:10:49
137	23	K005	9	2020-01-13 19:10:49	2020-01-13 19:10:49
138	24	K001	4	2020-01-13 19:11:17	2020-01-13 19:11:17
139	24	K002	8	2020-01-13 19:11:17	2020-01-13 19:11:17
140	24	K003	2	2020-01-13 19:11:17	2020-01-13 19:11:17
141	24	K004	19	2020-01-13 19:11:17	2020-01-13 19:11:17
142	24	K005	11	2020-01-13 19:11:17	2020-01-13 19:11:17
143	25	K001	10	2020-01-15 07:44:09	2020-01-15 07:44:09
144	25	K002	14	2020-01-15 07:44:09	2020-01-15 07:44:09
145	25	K003	14	2020-01-15 07:44:09	2020-01-15 07:44:09
146	25	K004	22	2020-01-15 07:44:09	2020-01-15 07:44:09
147	25	K005	12	2020-01-15 07:44:09	2020-01-15 07:44:09
148	25	K006	9	2020-01-15 07:44:09	2020-01-15 07:44:09
149	25	K007	22	2020-01-15 07:44:09	2020-01-15 07:44:09
150	25	K009	0	2020-01-15 07:44:09	2020-01-15 07:44:09
151	26	K001	12	2020-01-15 08:00:10	2020-01-15 08:00:10
152	26	K002	16	2020-01-15 08:00:10	2020-01-15 08:00:10
153	26	K003	14	2020-01-15 08:00:10	2020-01-15 08:00:10
154	26	K004	22	2020-01-15 08:00:10	2020-01-15 08:00:10
155	26	K005	12	2020-01-15 08:00:10	2020-01-15 08:00:10
156	26	K006	9	2020-01-15 08:00:10	2020-01-15 08:00:10
157	26	K007	22	2020-01-15 08:00:10	2020-01-15 08:00:10
158	26	K009	1	2020-01-15 08:00:10	2020-01-15 08:00:10
159	27	K001	18	2020-01-15 13:37:32	2020-01-15 13:37:32
160	27	K002	2	2020-01-15 13:37:32	2020-01-15 13:37:32
161	27	K003	14	2020-01-15 13:37:32	2020-01-15 13:37:32
162	27	K004	22	2020-01-15 13:37:32	2020-01-15 13:37:32
163	27	K005	12	2020-01-15 13:37:32	2020-01-15 13:37:32
164	27	K006	9	2020-01-15 13:37:32	2020-01-15 13:37:32
165	27	K007	22	2020-01-15 13:37:32	2020-01-15 13:37:32
166	27	K009	1	2020-01-15 13:37:32	2020-01-15 13:37:32
167	28	K001	18	2020-04-02 09:25:06	2020-04-02 09:25:06
168	28	K002	14	2020-04-02 09:25:06	2020-04-02 09:25:06
169	28	K003	14	2020-04-02 09:25:06	2020-04-02 09:25:06
170	28	K004	22	2020-04-02 09:25:06	2020-04-02 09:25:06
171	28	K005	15	2020-04-02 09:25:06	2020-04-02 09:25:06
172	28	K006	15	2020-04-02 09:25:06	2020-04-02 09:25:06
173	28	K007	25	2020-04-02 09:25:06	2020-04-02 09:25:06
174	28	K009	5	2020-04-02 09:25:06	2020-04-02 09:25:06
\.


--
-- Data for Name: fabricants; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.fabricants (CodeF, Nom, Pays, Ville) FROM stdin;
F001	GSB Paris	France	Lyon
F002	GSB Suisse	France	Lyon
F003	GSB Etats Unis	test	testt
\.


--
-- Data for Name: inventaires; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.inventaires (id, creator_id, created_at, updated_at) FROM stdin;
19	2	2020-09-13 19:07:26	2020-01-13 19:07:26
20	2	2020-10-13 19:07:26	2020-01-13 19:07:39
21	2	2020-11-13 19:07:26	2020-01-13 19:07:55
22	2	2020-12-13 19:07:26	2020-01-13 19:09:04
23	2	2020-01-13 19:10:49	2020-01-13 19:10:49
24	2	2020-01-13 19:11:17	2020-01-13 19:11:17
25	2	2020-01-15 07:44:09	2020-01-15 07:44:09
26	2	2020-01-15 08:00:10	2020-01-15 08:00:10
27	2	2020-01-15 13:37:32	2020-01-15 13:37:32
28	2	2020-04-02 09:25:06	2020-04-02 09:25:06
\.


--
-- Data for Name: kits; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.kits (CodeKit, prix, Annee, Duree, CodeF, Stock) FROM stdin;
K001	40	2019-05-01	4	F001	18
K002	10	2019-05-01	40	F001	14
K003	30	2019-05-01	24	F001	14
K004	25	2019-05-01	12	F001	22
K005	40	2019-05-01	4	F001	15
K006	15	2018-06-03	9	F001	15
K007	17	2017-06-03	19	F002	25
K009	123	2017-12-30	10	F002	5
\.


--
-- Data for Name: ligne_commandes; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.ligne_commandes (id, CodeKit, Qte, commande_id, created_at, updated_at) FROM stdin;
7	K001	8	3	2020-01-13 19:04:00	2020-01-13 19:04:00
8	K002	4	3	2020-01-13 19:04:00	2020-01-13 19:04:00
9	K003	3	3	2020-01-13 19:04:00	2020-01-13 19:04:00
10	K006	6	4	2020-01-13 19:13:43	2020-01-13 19:13:43
11	K007	3	4	2020-01-13 19:13:43	2020-01-13 19:13:43
12	K009	4	4	2020-01-13 19:13:43	2020-01-13 19:13:43
13	K001	6	5	2020-01-13 19:14:07	2020-01-13 19:14:07
14	K002	6	5	2020-01-13 19:14:07	2020-01-13 19:14:07
15	K003	4	5	2020-01-13 19:14:07	2020-01-13 19:14:07
16	K004	1	5	2020-01-13 19:14:07	2020-01-13 19:14:07
17	K005	1	5	2020-01-13 19:14:07	2020-01-13 19:14:07
18	K003	8	6	2020-01-14 17:43:34	2020-01-14 17:43:34
19	K001	1	7	2020-01-14 18:13:12	2020-01-14 18:13:12
20	K002	1	7	2020-01-14 18:13:12	2020-01-14 18:13:12
21	K003	1	7	2020-01-14 18:13:12	2020-01-14 18:13:12
22	K004	1	7	2020-01-14 18:13:12	2020-01-14 18:13:12
23	K001	2	8	2020-01-15 13:44:02	2020-01-15 13:44:02
24	K005	3	8	2020-01-15 13:44:02	2020-01-15 13:44:02
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2019_12_12_142407_create_inventaires_table	1
2	2019_12_12_145031_create_enregistrements_table	2
3	2019_12_18_132451_create_statuses_table	2
4	2019_12_18_135115_create_table_commande	2
5	2019_12_18_135800_create_ligne_commandes_table	2
6	2020_01_09_130953_create_users_table	3
7	2019_01_10_141415_create_roles_table	4
8	2019_01_10_141450_create_permissions_table	4
9	2019_12_11_130953_create_users_table	5
10	2020_01_10_133857_alter_table_commandes_add_user_id	5
11	2020_01_10_142049_create_permission_role_pivot_table	5
12	2020_01_10_142103_alter_table_users_add_role_id	5
13	2020_01_16_151857_alter_table_user_add_softdeletes	6
14	2020_02_16_171524_alter_inventaire_table_add_creator_id	6
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.permissions (id, libelle, slug, created_at, updated_at) FROM stdin;
1	Voir tous les kits	kits.view	2020-01-13 18:41:34	2020-01-13 18:41:34
2	Voir tous les fabricants	fabricants.view	2020-01-13 18:41:34	2020-01-13 18:41:34
3	Voir toutes les commandes	orders.view	2020-01-13 18:41:34	2020-01-13 18:41:34
4	Réaliser une commande	orders.create	2020-01-13 18:41:34	2020-01-13 18:41:34
5	Mettre à jour une commande	orders.update	2020-01-13 18:41:34	2020-01-13 18:41:34
6	Voir tous les utilisateurs	users.view	2020-01-13 18:41:34	2020-01-13 18:41:34
7	Créer des utilisateurs	users.create	2020-01-13 18:41:34	2020-01-13 18:41:34
8	Voir tous les inventaires	inventory.view	2020-01-13 18:41:34	2020-01-13 18:41:34
9	Modifier les permissions	permission.edit	2020-04-01 08:53:10	2020-04-01 08:53:10
\.


--
-- Data for Name: role_permission; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.role_permission (permission_id, role_id) FROM stdin;
1	1
1	2
1	3
2	1
2	2
2	3
3	2
3	3
4	2
4	3
5	2
5	3
6	3
7	3
8	1
8	2
8	3
9	3
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.roles (id, libelle, niveau, created_at, updated_at) FROM stdin;
1	Inventoriste	1	2020-01-13 18:41:34	2020-01-13 18:41:34
2	Opérateur d'approvisionnement	2	2020-01-13 18:41:34	2020-01-13 18:41:34
3	Responsable	3	2020-01-13 18:41:34	2020-01-13 18:41:34
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.statuses (id, libelle, created_at, updated_at) FROM stdin;
1	En attente	2019-12-18 18:22:57	2019-12-18 18:22:57
2	Validée	2019-12-18 18:22:57	2019-12-18 18:22:57
3	Annulée	2019-12-18 18:22:57	2019-12-18 18:22:57
4	En attente	2020-01-13 18:41:34	2020-01-13 18:41:34
5	Validée	2020-01-13 18:41:34	2020-01-13 18:41:34
6	Annulée	2020-01-13 18:41:34	2020-01-13 18:41:34
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: piman
--

COPY public.users (id, firstname, lastname, email, password, phone, created_at, updated_at, role_id, deleted_at) FROM stdin;
2	Victor	Durand	vic20016@gmail.com	$2y$10$x5JWXu/ushN/0Oowl/8keuuGb2RXebLKFfoBjfYaVlTom6bCP065W	0611286886	2020-01-13 18:41:39	2020-04-01 09:09:42	3	\N
3	Olivier	Torrequadra	o.torrequadra@supalta.com	$2y$10$TSA7kH5woHMkpk9XmpOgjOflCSbTXmkYKdkqaz5Q.iGThwcpWGI0.	0600000000	2020-01-14 18:07:14	2020-04-01 09:06:20	2	\N
4	Olivier	Torrequadra	o.torrequadra@leschartreux.net	$2y$10$hSYJE3Wd2utgP31uGfFqbehveUJR..r7FFF4QlOAag9J.UYcciNJC	0600000000	2020-01-14 18:07:27	2020-01-14 18:07:27	1	\N
5	Asser	Tion	asser@tion.com	$2y$10$5Ifrhvw53ef6ZYCr9hJqgu0sIBrorYMwX/.Lt4NTGEzPO2hfDgT3G	0611286886	2020-04-02 13:03:53	2020-04-02 13:03:53	1	\N
\.


--
-- Name: commandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.commandes_id_seq', 8, true);


--
-- Name: enregistrements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.enregistrements_id_seq', 174, true);


--
-- Name: inventaires_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.inventaires_id_seq', 28, true);


--
-- Name: ligne_commandes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.ligne_commandes_id_seq', 24, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.migrations_id_seq', 14, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.permissions_id_seq', 9, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.roles_id_seq', 3, true);


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.statuses_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: piman
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: commandes idx_16878_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT idx_16878_primary PRIMARY KEY (id);


--
-- Name: enregistrements idx_16884_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.enregistrements
    ADD CONSTRAINT idx_16884_primary PRIMARY KEY (id);


--
-- Name: fabricants idx_16888_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.fabricants
    ADD CONSTRAINT idx_16888_primary PRIMARY KEY (CodeF);


--
-- Name: inventaires idx_16899_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.inventaires
    ADD CONSTRAINT idx_16899_primary PRIMARY KEY (id);


--
-- Name: kits idx_16903_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.kits
    ADD CONSTRAINT idx_16903_primary PRIMARY KEY (CodeKit);


--
-- Name: ligne_commandes idx_16910_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.ligne_commandes
    ADD CONSTRAINT idx_16910_primary PRIMARY KEY (id);


--
-- Name: migrations idx_16916_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT idx_16916_primary PRIMARY KEY (id);


--
-- Name: permissions idx_16922_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT idx_16922_primary PRIMARY KEY (id);


--
-- Name: roles idx_16931_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT idx_16931_primary PRIMARY KEY (id);


--
-- Name: role_permission idx_16935_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT idx_16935_primary PRIMARY KEY (permission_id, role_id);


--
-- Name: statuses idx_16940_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT idx_16940_primary PRIMARY KEY (id);


--
-- Name: users idx_16946_primary; Type: CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT idx_16946_primary PRIMARY KEY (id);


--
-- Name: idx_16878_commandes_creator_id_index; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16878_commandes_creator_id_index ON public.commandes USING btree (creator_id);


--
-- Name: idx_16878_commandes_status_id_index; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16878_commandes_status_id_index ON public.commandes USING btree (status_id);


--
-- Name: idx_16884_enregistrements_inventaire_id_foreign; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16884_enregistrements_inventaire_id_foreign ON public.enregistrements USING btree (inventaire_id);


--
-- Name: idx_16899_inventaires_creator_id_index; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16899_inventaires_creator_id_index ON public.inventaires USING btree (creator_id);


--
-- Name: idx_16903_codef; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16903_codef ON public.kits USING btree (CodeF);


--
-- Name: idx_16910_ligne_commandes_commande_id_index; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16910_ligne_commandes_commande_id_index ON public.ligne_commandes USING btree (commande_id);


--
-- Name: idx_16935_role_permission_permission_id_index; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16935_role_permission_permission_id_index ON public.role_permission USING btree (permission_id);


--
-- Name: idx_16935_role_permission_role_id_index; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16935_role_permission_role_id_index ON public.role_permission USING btree (role_id);


--
-- Name: idx_16946_users_email_unique; Type: INDEX; Schema: public; Owner: piman
--

CREATE UNIQUE INDEX idx_16946_users_email_unique ON public.users USING btree (email);


--
-- Name: idx_16946_users_role_id_index; Type: INDEX; Schema: public; Owner: piman
--

CREATE INDEX idx_16946_users_role_id_index ON public.users USING btree (role_id);


--
-- Name: commandes commandes_creator_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_creator_id_foreign FOREIGN KEY (creator_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: commandes commandes_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.commandes
    ADD CONSTRAINT commandes_status_id_foreign FOREIGN KEY (status_id) REFERENCES public.statuses(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: enregistrements enregistrements_inventaire_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.enregistrements
    ADD CONSTRAINT enregistrements_inventaire_id_foreign FOREIGN KEY (inventaire_id) REFERENCES public.inventaires(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: inventaires inventaires_creator_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.inventaires
    ADD CONSTRAINT inventaires_creator_id_foreign FOREIGN KEY (creator_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: kits kits_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.kits
    ADD CONSTRAINT kits_ibfk_1 FOREIGN KEY (CodeF) REFERENCES public.fabricants(CodeF) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ligne_commandes ligne_commandes_commande_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.ligne_commandes
    ADD CONSTRAINT ligne_commandes_commande_id_foreign FOREIGN KEY (commande_id) REFERENCES public.commandes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: role_permission role_permission_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT role_permission_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: role_permission role_permission_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT role_permission_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: piman
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

