--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: weather; Type: TABLE; Schema: public; Owner: solosphere
--

CREATE TABLE weather (
    id integer NOT NULL,
    date date NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL,
    rainfall numeric(4,3) DEFAULT 0
);


ALTER TABLE weather OWNER TO solosphere;

--
-- Name: temperatures_id_seq; Type: SEQUENCE; Schema: public; Owner: solosphere
--

CREATE SEQUENCE temperatures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE temperatures_id_seq OWNER TO solosphere;

--
-- Name: temperatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: solosphere
--

ALTER SEQUENCE temperatures_id_seq OWNED BY weather.id;


--
-- Name: weather id; Type: DEFAULT; Schema: public; Owner: solosphere
--

ALTER TABLE ONLY weather ALTER COLUMN id SET DEFAULT nextval('temperatures_id_seq'::regclass);


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: solosphere
--

INSERT INTO weather VALUES (7, '2016-03-07', 29, 32, 0.000);
INSERT INTO weather VALUES (8, '2016-03-08', 23, 31, 0.000);
INSERT INTO weather VALUES (9, '2016-03-09', 17, 28, 0.000);
INSERT INTO weather VALUES (1, '2016-03-01', 34, 43, 0.138);
INSERT INTO weather VALUES (2, '2016-03-02', 32, 44, 0.118);
INSERT INTO weather VALUES (3, '2016-03-03', 31, 47, 0.157);
INSERT INTO weather VALUES (4, '2016-03-04', 33, 42, 0.098);
INSERT INTO weather VALUES (5, '2016-03-05', 39, 46, 0.295);
INSERT INTO weather VALUES (6, '2016-03-06', 32, 43, 0.098);


--
-- Name: temperatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: solosphere
--

SELECT pg_catalog.setval('temperatures_id_seq', 9, true);


--
-- Name: weather temperatures_pkey; Type: CONSTRAINT; Schema: public; Owner: solosphere
--

ALTER TABLE ONLY weather
    ADD CONSTRAINT temperatures_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

