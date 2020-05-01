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

--
-- Name: fnaeg; Type: SCHEMA; Schema: -; Owner: piman
--

CREATE SCHEMA fnaeg;


ALTER SCHEMA fnaeg OWNER TO piman;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: commandes; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.commandes (
    id bigint NOT NULL,
    status_id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    creator_id bigint
);


ALTER TABLE fnaeg.commandes OWNER TO piman;

--
-- Name: commandes_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.commandes_id_seq OWNER TO piman;

--
-- Name: commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.commandes_id_seq OWNED BY fnaeg.commandes.id;


--
-- Name: enregistrements; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.enregistrements (
    id bigint NOT NULL,
    inventaire_id bigint NOT NULL,
    codekit character varying(30) NOT NULL,
    stock bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE fnaeg.enregistrements OWNER TO piman;

--
-- Name: enregistrements_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.enregistrements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.enregistrements_id_seq OWNER TO piman;

--
-- Name: enregistrements_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.enregistrements_id_seq OWNED BY fnaeg.enregistrements.id;


--
-- Name: fabricants; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.fabricants (
    codef character varying(30) NOT NULL,
    nom character varying(255) DEFAULT NULL::character varying,
    pays character varying(255) DEFAULT NULL::character varying,
    ville character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE fnaeg.fabricants OWNER TO piman;

--
-- Name: inventaires; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.inventaires (
    id bigint NOT NULL,
    creator_id bigint,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE fnaeg.inventaires OWNER TO piman;

--
-- Name: inventaires_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.inventaires_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.inventaires_id_seq OWNER TO piman;

--
-- Name: inventaires_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.inventaires_id_seq OWNED BY fnaeg.inventaires.id;


--
-- Name: kits; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.kits (
    codekit character varying(30) NOT NULL,
    prix double precision,
    annee date,
    duree bigint,
    codef character varying(30) DEFAULT NULL::character varying,
    stock bigint DEFAULT '0'::bigint
);


ALTER TABLE fnaeg.kits OWNER TO piman;

--
-- Name: ligne_commandes; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.ligne_commandes (
    id bigint NOT NULL,
    codekit character varying(30) NOT NULL,
    qte bigint NOT NULL,
    commande_id bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE fnaeg.ligne_commandes OWNER TO piman;

--
-- Name: ligne_commandes_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.ligne_commandes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.ligne_commandes_id_seq OWNER TO piman;

--
-- Name: ligne_commandes_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.ligne_commandes_id_seq OWNED BY fnaeg.ligne_commandes.id;


--
-- Name: migrations; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.migrations (
    id bigint NOT NULL,
    migration character varying(255) NOT NULL,
    batch bigint NOT NULL
);


ALTER TABLE fnaeg.migrations OWNER TO piman;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.migrations_id_seq OWNER TO piman;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.migrations_id_seq OWNED BY fnaeg.migrations.id;


--
-- Name: permissions; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.permissions (
    id bigint NOT NULL,
    libelle character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE fnaeg.permissions OWNER TO piman;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.permissions_id_seq OWNER TO piman;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.permissions_id_seq OWNED BY fnaeg.permissions.id;


--
-- Name: role_permission; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.role_permission (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE fnaeg.role_permission OWNER TO piman;

--
-- Name: roles; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.roles (
    id bigint NOT NULL,
    libelle character varying(255) NOT NULL,
    niveau bigint NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE fnaeg.roles OWNER TO piman;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.roles_id_seq OWNER TO piman;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.roles_id_seq OWNED BY fnaeg.roles.id;


--
-- Name: statuses; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.statuses (
    id bigint NOT NULL,
    libelle character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE fnaeg.statuses OWNER TO piman;

--
-- Name: statuses_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.statuses_id_seq OWNER TO piman;

--
-- Name: statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.statuses_id_seq OWNED BY fnaeg.statuses.id;


--
-- Name: users; Type: TABLE; Schema: fnaeg; Owner: piman
--

CREATE TABLE fnaeg.users (
    id bigint NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(191) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(255) DEFAULT NULL::character varying,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    role_id bigint,
    deleted_at timestamp with time zone
);


ALTER TABLE fnaeg.users OWNER TO piman;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: fnaeg; Owner: piman
--

CREATE SEQUENCE fnaeg.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fnaeg.users_id_seq OWNER TO piman;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: fnaeg; Owner: piman
--

ALTER SEQUENCE fnaeg.users_id_seq OWNED BY fnaeg.users.id;


--
-- Name: commandes id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.commandes ALTER COLUMN id SET DEFAULT nextval('fnaeg.commandes_id_seq'::regclass);


--
-- Name: enregistrements id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.enregistrements ALTER COLUMN id SET DEFAULT nextval('fnaeg.enregistrements_id_seq'::regclass);


--
-- Name: inventaires id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.inventaires ALTER COLUMN id SET DEFAULT nextval('fnaeg.inventaires_id_seq'::regclass);


--
-- Name: ligne_commandes id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.ligne_commandes ALTER COLUMN id SET DEFAULT nextval('fnaeg.ligne_commandes_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.migrations ALTER COLUMN id SET DEFAULT nextval('fnaeg.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.permissions ALTER COLUMN id SET DEFAULT nextval('fnaeg.permissions_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.roles ALTER COLUMN id SET DEFAULT nextval('fnaeg.roles_id_seq'::regclass);


--
-- Name: statuses id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.statuses ALTER COLUMN id SET DEFAULT nextval('fnaeg.statuses_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.users ALTER COLUMN id SET DEFAULT nextval('fnaeg.users_id_seq'::regclass);


--
-- Data for Name: commandes; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.commandes (id, status_id, created_at, updated_at, creator_id) FROM stdin;
3	2	2020-01-13 19:04:00+01	2020-01-13 19:04:04+01	2
4	2	2020-01-13 19:13:43+01	2020-03-29 13:38:50+02	2
5	2	2020-01-13 19:14:07+01	2020-01-14 17:54:48+01	2
6	2	2020-01-14 17:43:34+01	2020-01-14 17:43:46+01	2
7	1	2020-01-14 18:13:12+01	2020-01-14 18:13:12+01	2
8	2	2020-01-15 13:44:02+01	2020-01-15 13:44:12+01	3
\.


--
-- Data for Name: enregistrements; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.enregistrements (id, inventaire_id, codekit, stock, created_at, updated_at) FROM stdin;
113	19	K001	7	2020-01-13 19:07:26+01	2020-01-13 19:07:26+01
114	19	K002	2	2020-01-13 19:07:26+01	2020-01-13 19:07:26+01
115	19	K003	1	2020-01-13 19:07:26+01	2020-01-13 19:07:26+01
116	19	K004	12	2020-01-13 19:07:26+01	2020-01-13 19:07:26+01
117	19	K005	3	2020-01-13 19:07:26+01	2020-01-13 19:07:26+01
118	20	K001	2	2020-01-13 19:07:39+01	2020-01-13 19:07:39+01
119	20	K002	12	2020-01-13 19:07:39+01	2020-01-13 19:07:39+01
120	20	K003	9	2020-01-13 19:07:39+01	2020-01-13 19:07:39+01
121	20	K004	2	2020-01-13 19:07:39+01	2020-01-13 19:07:39+01
122	20	K005	3	2020-01-13 19:07:39+01	2020-01-13 19:07:39+01
123	21	K001	4	2020-01-13 19:07:55+01	2020-01-13 19:07:55+01
124	21	K002	18	2020-01-13 19:07:55+01	2020-01-13 19:07:55+01
125	21	K003	2	2020-01-13 19:07:55+01	2020-01-13 19:07:55+01
126	21	K004	17	2020-01-13 19:07:55+01	2020-01-13 19:07:55+01
127	21	K005	9	2020-01-13 19:07:55+01	2020-01-13 19:07:55+01
128	22	K001	4	2020-01-13 19:09:04+01	2020-01-13 19:09:04+01
129	22	K002	8	2020-01-13 19:09:04+01	2020-01-13 19:09:04+01
130	22	K003	2	2020-01-13 19:09:04+01	2020-01-13 19:09:04+01
131	22	K004	1	2020-01-13 19:09:04+01	2020-01-13 19:09:04+01
132	22	K005	9	2020-01-13 19:09:04+01	2020-01-13 19:09:04+01
133	23	K001	4	2020-01-13 19:10:49+01	2020-01-13 19:10:49+01
134	23	K002	8	2020-01-13 19:10:49+01	2020-01-13 19:10:49+01
135	23	K003	2	2020-01-13 19:10:49+01	2020-01-13 19:10:49+01
136	23	K004	1	2020-01-13 19:10:49+01	2020-01-13 19:10:49+01
137	23	K005	9	2020-01-13 19:10:49+01	2020-01-13 19:10:49+01
138	24	K001	4	2020-01-13 19:11:17+01	2020-01-13 19:11:17+01
139	24	K002	8	2020-01-13 19:11:17+01	2020-01-13 19:11:17+01
140	24	K003	2	2020-01-13 19:11:17+01	2020-01-13 19:11:17+01
141	24	K004	19	2020-01-13 19:11:17+01	2020-01-13 19:11:17+01
142	24	K005	11	2020-01-13 19:11:17+01	2020-01-13 19:11:17+01
143	25	K001	10	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
144	25	K002	14	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
145	25	K003	14	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
146	25	K004	22	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
147	25	K005	12	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
148	25	K006	9	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
149	25	K007	22	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
150	25	K009	0	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
151	26	K001	12	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
152	26	K002	16	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
153	26	K003	14	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
154	26	K004	22	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
155	26	K005	12	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
156	26	K006	9	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
157	26	K007	22	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
158	26	K009	1	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
159	27	K001	18	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
160	27	K002	2	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
161	27	K003	14	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
162	27	K004	22	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
163	27	K005	12	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
164	27	K006	9	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
165	27	K007	22	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
166	27	K009	1	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
167	28	K001	18	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
168	28	K002	14	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
169	28	K003	14	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
170	28	K004	22	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
171	28	K005	15	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
172	28	K006	15	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
173	28	K007	25	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
174	28	K009	5	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
\.


--
-- Data for Name: fabricants; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.fabricants (codef, nom, pays, ville) FROM stdin;
F001	GSB Paris	France	Lyon
F002	GSB Suisse	France	Lyon
F003	GSB Etats Unis	test	testt
\.


--
-- Data for Name: inventaires; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.inventaires (id, creator_id, created_at, updated_at) FROM stdin;
19	2	2020-09-13 19:07:26+02	2020-01-13 19:07:26+01
20	2	2020-10-13 19:07:26+02	2020-01-13 19:07:39+01
21	2	2020-11-13 19:07:26+01	2020-01-13 19:07:55+01
22	2	2020-12-13 19:07:26+01	2020-01-13 19:09:04+01
23	2	2020-01-13 19:10:49+01	2020-01-13 19:10:49+01
24	2	2020-01-13 19:11:17+01	2020-01-13 19:11:17+01
25	2	2020-01-15 07:44:09+01	2020-01-15 07:44:09+01
26	2	2020-01-15 08:00:10+01	2020-01-15 08:00:10+01
27	2	2020-01-15 13:37:32+01	2020-01-15 13:37:32+01
28	2	2020-04-02 09:25:06+02	2020-04-02 09:25:06+02
\.


--
-- Data for Name: kits; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.kits (codekit, prix, annee, duree, codef, stock) FROM stdin;
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
-- Data for Name: ligne_commandes; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.ligne_commandes (id, codekit, qte, commande_id, created_at, updated_at) FROM stdin;
7	K001	8	3	2020-01-13 19:04:00+01	2020-01-13 19:04:00+01
8	K002	4	3	2020-01-13 19:04:00+01	2020-01-13 19:04:00+01
9	K003	3	3	2020-01-13 19:04:00+01	2020-01-13 19:04:00+01
10	K006	6	4	2020-01-13 19:13:43+01	2020-01-13 19:13:43+01
11	K007	3	4	2020-01-13 19:13:43+01	2020-01-13 19:13:43+01
12	K009	4	4	2020-01-13 19:13:43+01	2020-01-13 19:13:43+01
13	K001	6	5	2020-01-13 19:14:07+01	2020-01-13 19:14:07+01
14	K002	6	5	2020-01-13 19:14:07+01	2020-01-13 19:14:07+01
15	K003	4	5	2020-01-13 19:14:07+01	2020-01-13 19:14:07+01
16	K004	1	5	2020-01-13 19:14:07+01	2020-01-13 19:14:07+01
17	K005	1	5	2020-01-13 19:14:07+01	2020-01-13 19:14:07+01
18	K003	8	6	2020-01-14 17:43:34+01	2020-01-14 17:43:34+01
19	K001	1	7	2020-01-14 18:13:12+01	2020-01-14 18:13:12+01
20	K002	1	7	2020-01-14 18:13:12+01	2020-01-14 18:13:12+01
21	K003	1	7	2020-01-14 18:13:12+01	2020-01-14 18:13:12+01
22	K004	1	7	2020-01-14 18:13:12+01	2020-01-14 18:13:12+01
23	K001	2	8	2020-01-15 13:44:02+01	2020-01-15 13:44:02+01
24	K005	3	8	2020-01-15 13:44:02+01	2020-01-15 13:44:02+01
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.migrations (id, migration, batch) FROM stdin;
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
-- Data for Name: permissions; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.permissions (id, libelle, slug, created_at, updated_at) FROM stdin;
1	Voir tous les kits	kits.view	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
2	Voir tous les fabricants	fabricants.view	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
3	Voir toutes les commandes	orders.view	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
4	Réaliser une commande	orders.create	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
5	Mettre à jour une commande	orders.update	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
6	Voir tous les utilisateurs	users.view	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
7	Créer des utilisateurs	users.create	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
8	Voir tous les inventaires	inventory.view	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
9	Modifier les permissions	permission.edit	2020-04-01 08:53:10+02	2020-04-01 08:53:10+02
\.


--
-- Data for Name: role_permission; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.role_permission (permission_id, role_id) FROM stdin;
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
-- Data for Name: roles; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.roles (id, libelle, niveau, created_at, updated_at) FROM stdin;
1	Inventoriste	1	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
2	Opérateur d'approvisionnement	2	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
3	Responsable	3	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
\.


--
-- Data for Name: statuses; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.statuses (id, libelle, created_at, updated_at) FROM stdin;
1	En attente	2019-12-18 18:22:57+01	2019-12-18 18:22:57+01
2	Validée	2019-12-18 18:22:57+01	2019-12-18 18:22:57+01
3	Annulée	2019-12-18 18:22:57+01	2019-12-18 18:22:57+01
4	En attente	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
5	Validée	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
6	Annulée	2020-01-13 18:41:34+01	2020-01-13 18:41:34+01
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: fnaeg; Owner: piman
--

COPY fnaeg.users (id, firstname, lastname, email, password, phone, created_at, updated_at, role_id, deleted_at) FROM stdin;
2	Victor	Durand	vic20016@gmail.com	$2y$10$x5JWXu/ushN/0Oowl/8keuuGb2RXebLKFfoBjfYaVlTom6bCP065W	0611286886	2020-01-13 18:41:39+01	2020-04-01 09:09:42+02	3	\N
3	Olivier	Torrequadra	o.torrequadra@supalta.com	$2y$10$TSA7kH5woHMkpk9XmpOgjOflCSbTXmkYKdkqaz5Q.iGThwcpWGI0.	0600000000	2020-01-14 18:07:14+01	2020-04-01 09:06:20+02	2	\N
4	Olivier	Torrequadra	o.torrequadra@leschartreux.net	$2y$10$hSYJE3Wd2utgP31uGfFqbehveUJR..r7FFF4QlOAag9J.UYcciNJC	0600000000	2020-01-14 18:07:27+01	2020-01-14 18:07:27+01	1	\N
5	Asser	Tion	asser@tion.com	$2y$10$5Ifrhvw53ef6ZYCr9hJqgu0sIBrorYMwX/.Lt4NTGEzPO2hfDgT3G	0611286886	2020-04-02 13:03:53+02	2020-04-02 13:03:53+02	1	\N
\.


--
-- Name: commandes_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.commandes_id_seq', 8, true);


--
-- Name: enregistrements_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.enregistrements_id_seq', 174, true);


--
-- Name: inventaires_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.inventaires_id_seq', 28, true);


--
-- Name: ligne_commandes_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.ligne_commandes_id_seq', 24, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.migrations_id_seq', 14, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.permissions_id_seq', 9, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.roles_id_seq', 3, true);


--
-- Name: statuses_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.statuses_id_seq', 6, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: fnaeg; Owner: piman
--

SELECT pg_catalog.setval('fnaeg.users_id_seq', 5, true);


--
-- Name: commandes idx_16388_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.commandes
    ADD CONSTRAINT idx_16388_primary PRIMARY KEY (id);


--
-- Name: enregistrements idx_16394_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.enregistrements
    ADD CONSTRAINT idx_16394_primary PRIMARY KEY (id);


--
-- Name: fabricants idx_16398_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.fabricants
    ADD CONSTRAINT idx_16398_primary PRIMARY KEY (codef);


--
-- Name: inventaires idx_16409_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.inventaires
    ADD CONSTRAINT idx_16409_primary PRIMARY KEY (id);


--
-- Name: kits idx_16413_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.kits
    ADD CONSTRAINT idx_16413_primary PRIMARY KEY (codekit);


--
-- Name: ligne_commandes idx_16420_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.ligne_commandes
    ADD CONSTRAINT idx_16420_primary PRIMARY KEY (id);


--
-- Name: migrations idx_16426_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.migrations
    ADD CONSTRAINT idx_16426_primary PRIMARY KEY (id);


--
-- Name: permissions idx_16432_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.permissions
    ADD CONSTRAINT idx_16432_primary PRIMARY KEY (id);


--
-- Name: roles idx_16441_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.roles
    ADD CONSTRAINT idx_16441_primary PRIMARY KEY (id);


--
-- Name: role_permission idx_16445_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.role_permission
    ADD CONSTRAINT idx_16445_primary PRIMARY KEY (permission_id, role_id);


--
-- Name: statuses idx_16450_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.statuses
    ADD CONSTRAINT idx_16450_primary PRIMARY KEY (id);


--
-- Name: users idx_16456_primary; Type: CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.users
    ADD CONSTRAINT idx_16456_primary PRIMARY KEY (id);


--
-- Name: idx_16388_commandes_creator_id_index; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16388_commandes_creator_id_index ON fnaeg.commandes USING btree (creator_id);


--
-- Name: idx_16388_commandes_status_id_index; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16388_commandes_status_id_index ON fnaeg.commandes USING btree (status_id);


--
-- Name: idx_16394_enregistrements_inventaire_id_foreign; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16394_enregistrements_inventaire_id_foreign ON fnaeg.enregistrements USING btree (inventaire_id);


--
-- Name: idx_16409_inventaires_creator_id_index; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16409_inventaires_creator_id_index ON fnaeg.inventaires USING btree (creator_id);


--
-- Name: idx_16413_codef; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16413_codef ON fnaeg.kits USING btree (codef);


--
-- Name: idx_16420_ligne_commandes_commande_id_index; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16420_ligne_commandes_commande_id_index ON fnaeg.ligne_commandes USING btree (commande_id);


--
-- Name: idx_16445_role_permission_permission_id_index; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16445_role_permission_permission_id_index ON fnaeg.role_permission USING btree (permission_id);


--
-- Name: idx_16445_role_permission_role_id_index; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16445_role_permission_role_id_index ON fnaeg.role_permission USING btree (role_id);


--
-- Name: idx_16456_users_email_unique; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE UNIQUE INDEX idx_16456_users_email_unique ON fnaeg.users USING btree (email);


--
-- Name: idx_16456_users_role_id_index; Type: INDEX; Schema: fnaeg; Owner: piman
--

CREATE INDEX idx_16456_users_role_id_index ON fnaeg.users USING btree (role_id);


--
-- Name: commandes commandes_creator_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.commandes
    ADD CONSTRAINT commandes_creator_id_foreign FOREIGN KEY (creator_id) REFERENCES fnaeg.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: commandes commandes_status_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.commandes
    ADD CONSTRAINT commandes_status_id_foreign FOREIGN KEY (status_id) REFERENCES fnaeg.statuses(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: enregistrements enregistrements_inventaire_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.enregistrements
    ADD CONSTRAINT enregistrements_inventaire_id_foreign FOREIGN KEY (inventaire_id) REFERENCES fnaeg.inventaires(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: inventaires inventaires_creator_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.inventaires
    ADD CONSTRAINT inventaires_creator_id_foreign FOREIGN KEY (creator_id) REFERENCES fnaeg.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: kits kits_ibfk_1; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.kits
    ADD CONSTRAINT kits_ibfk_1 FOREIGN KEY (codef) REFERENCES fnaeg.fabricants(codef) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: ligne_commandes ligne_commandes_commande_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.ligne_commandes
    ADD CONSTRAINT ligne_commandes_commande_id_foreign FOREIGN KEY (commande_id) REFERENCES fnaeg.commandes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: role_permission role_permission_permission_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.role_permission
    ADD CONSTRAINT role_permission_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES fnaeg.permissions(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: role_permission role_permission_role_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.role_permission
    ADD CONSTRAINT role_permission_role_id_foreign FOREIGN KEY (role_id) REFERENCES fnaeg.roles(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: fnaeg; Owner: piman
--

ALTER TABLE ONLY fnaeg.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES fnaeg.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

