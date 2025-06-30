--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_billions_of_years numeric(4,2),
    distance_from_earth numeric(4,2),
    has_life boolean,
    galaxy_type integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_billions_of_years numeric(4,2),
    has_life boolean,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_billions_of_years numeric(4,2),
    distance_from_earth numeric(4,2),
    has_life boolean,
    natural_satellite_number integer,
    planet_type integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    distance_from_earth numeric(4,2),
    is_manned boolean
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_billions_of_years numeric(4,2),
    distance_from_earth numeric(4,2),
    natural_satellite_number integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'A nossa galaxya mãe', 13.60, 0.00, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Safar', 'Irmã do mal da Zacar', 50.00, 30.50, true, 2);
INSERT INTO public.galaxy VALUES (3, 'Zacar', 'Pulsante do mal', 20.00, 24.70, true, 3);
INSERT INTO public.galaxy VALUES (4, 'Andomon', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Raptar', 'Zona de caça', 20.00, 10.50, true, 2);
INSERT INTO public.galaxy VALUES (6, 'Zihari', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Lua', NULL, NULL, NULL, NULL, 13);
INSERT INTO public.moon VALUES (2, 'Sora', NULL, NULL, NULL, NULL, 15);
INSERT INTO public.moon VALUES (3, 'Luna', NULL, NULL, NULL, NULL, 26);
INSERT INTO public.moon VALUES (4, 'Vaba', NULL, NULL, NULL, NULL, 14);
INSERT INTO public.moon VALUES (5, 'Ferm', NULL, NULL, NULL, NULL, 16);
INSERT INTO public.moon VALUES (6, 'Tamur', NULL, NULL, NULL, NULL, 24);
INSERT INTO public.moon VALUES (7, 'tui', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES (8, 'tamoe', NULL, NULL, NULL, NULL, 17);
INSERT INTO public.moon VALUES (9, 'Zonamar', NULL, NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES (10, 'Goir', NULL, NULL, NULL, NULL, 20);
INSERT INTO public.moon VALUES (11, 'Zeca', NULL, NULL, NULL, NULL, 21);
INSERT INTO public.moon VALUES (12, 'Manor', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.moon VALUES (13, 'Caxz', NULL, NULL, NULL, NULL, 25);
INSERT INTO public.moon VALUES (14, 'Bolonor', NULL, NULL, NULL, NULL, 21);
INSERT INTO public.moon VALUES (15, 'Paanor', NULL, NULL, NULL, NULL, 25);
INSERT INTO public.moon VALUES (16, 'Rombui', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES (17, 'Cavao', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.moon VALUES (18, 'Baraonor', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES (19, 'Paua', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.moon VALUES (20, 'Decavuoir', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES (21, 'Zacavore', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES (22, 'Camlorr', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.moon VALUES (23, 'Decanalor', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES (24, 'Daequior', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.moon VALUES (25, 'Morghoth', NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES (26, 'zalquiro', NULL, NULL, NULL, NULL, 23);
INSERT INTO public.moon VALUES (27, 'Xazacav', NULL, NULL, NULL, NULL, 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Terra', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (14, 'NovaBin', NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (15, 'rRopwr', NULL, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (16, 'Big diamond', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (17, 'Just pain', NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (18, 'Cope bain', NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (19, 'Mercúrio', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (20, 'Marte', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (21, 'Venus', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (22, 'Júpiter', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (23, 'Saturno', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (24, 'Urano', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (25, 'Netuno', NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (26, 'Big Plutoon', NULL, NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Explorer Oblivion', NULL, NULL, false);
INSERT INTO public.spacecraft VALUES (2, 'Tudreal Bin', NULL, NULL, true);
INSERT INTO public.spacecraft VALUES (3, 'Big Destroyer', NULL, NULL, true);
INSERT INTO public.spacecraft VALUES (4, 'God of War', NULL, NULL, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Sagar', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Mahor', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (4, 'Bolonor', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (5, 'Carmesin', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (6, 'Demon Sun', NULL, NULL, NULL, NULL, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 26, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


--
-- Name: spacecraft spacecraft_spacecraft_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_spacecraft_id_key UNIQUE (spacecraft_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

