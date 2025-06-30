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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('user_1750814248690', 2, 5421);
INSERT INTO public.games VALUES ('user_1750812337864', 2, 138);
INSERT INTO public.games VALUES ('user_1750812337865', 5, 64);
INSERT INTO public.games VALUES ('user_1750814248691', 5, 1501);
INSERT INTO public.games VALUES ('user_1750812557023', 2, 745);
INSERT INTO public.games VALUES ('user_1750812557024', 5, 33);
INSERT INTO public.games VALUES ('user_1750814296201', 2, 120);
INSERT INTO public.games VALUES ('user_1750812728320', 2, 413);
INSERT INTO public.games VALUES ('user_1750814296202', 5, 34);
INSERT INTO public.games VALUES ('user_1750812728321', 5, 165);
INSERT INTO public.games VALUES ('user_1750812882736', 2, 593);
INSERT INTO public.games VALUES ('user_1750812882737', 5, 21);
INSERT INTO public.games VALUES ('user_1750814722508', 2, 59);
INSERT INTO public.games VALUES ('user_1750813102599', 2, 479);
INSERT INTO public.games VALUES ('user_1750814722509', 5, 117);
INSERT INTO public.games VALUES ('Alisson', 3, 11);
INSERT INTO public.games VALUES ('user_1750814925077', 2, 347);
INSERT INTO public.games VALUES ('user_1750813591956', 2, 297);
INSERT INTO public.games VALUES ('user_1750814925078', 5, 245);
INSERT INTO public.games VALUES ('user_1750813591957', 5, 332);
INSERT INTO public.games VALUES ('user_1750813102600', 6, 13);
INSERT INTO public.games VALUES ('user_1750813750172', 2, 311);
INSERT INTO public.games VALUES ('user_1750813750173', 5, 316);


--
-- PostgreSQL database dump complete
--

