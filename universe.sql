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
-- Name: being; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.being (
    being_id integer NOT NULL,
    name character varying(30) NOT NULL,
    being_description character varying(100),
    being_type character varying(50)
);


ALTER TABLE public.being OWNER TO freecodecamp;

--
-- Name: beings_being_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.beings_being_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beings_being_id_seq OWNER TO freecodecamp;

--
-- Name: beings_being_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.beings_being_id_seq OWNED BY public.being.being_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_type character varying(50),
    description character varying(100),
    name character varying(30) NOT NULL,
    planet_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric(6,2),
    description text,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description character varying(100),
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    planet_type character varying(50),
    distance_from_earth integer,
    being_id integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    solitary_moon boolean
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
-- Name: being being_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being ALTER COLUMN being_id SET DEFAULT nextval('public.beings_being_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: being; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.being VALUES (1, 'larch', 'A tree', 'plant');
INSERT INTO public.being VALUES (2, 'rose', 'A small and delicte flower', 'plant');
INSERT INTO public.being VALUES (3, 'rat', 'small animal', 'animal');
INSERT INTO public.being VALUES (4, 'parrot', 'big bird with bright colors who can talk', 'bird');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'big', 'galaxy with hundreds of planets', 'Via Lactea', NULL);
INSERT INTO public.galaxy VALUES (2, 'small', 'A galaxy with a fistful of planets', 'Minor3', NULL);
INSERT INTO public.galaxy VALUES (3, 'big', 'Galaxy in development', 'Beerm', NULL);
INSERT INTO public.galaxy VALUES (4, 'weird', 'A galaxy who does not follow typical structure', 'Gax002', 4);
INSERT INTO public.galaxy VALUES (5, 'symmetrical', 'Has a triangular shape', 'Rombus', 11);
INSERT INTO public.galaxy VALUES (6, 'old', 'It is starting to collapse', 'Oldy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 43.55, 'Our moon', 1);
INSERT INTO public.moon VALUES (2, 'Enceladus', 435.67, 'Just an example', 2);
INSERT INTO public.moon VALUES (3, 'Moonty', 45.81, 'This is not a real moon', 2);
INSERT INTO public.moon VALUES (4, 'Fobos', 34.99, 'It is in Mars', 2);
INSERT INTO public.moon VALUES (5, 'Deimos', 378.20, 'It is in Mars', 2);
INSERT INTO public.moon VALUES (6, 'Io', 637.20, ' It is in Jupiter', 8);
INSERT INTO public.moon VALUES (7, 'Calisto', 666.60, 'Also in Jupiter', 11);
INSERT INTO public.moon VALUES (8, 'Ganimedes', 343.70, 'Another moon', 5);
INSERT INTO public.moon VALUES (9, 'Star33', 4637.30, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Bellamoon', 4738.33, 'Cant say nothing about it', 8);
INSERT INTO public.moon VALUES (11, 'Starx', 33.70, 'New star', 12);
INSERT INTO public.moon VALUES (12, 'Star93', 4337.30, 'Unknown', 4);
INSERT INTO public.moon VALUES (13, 'Lunatta', 8.53, 'If only it existed', 9);
INSERT INTO public.moon VALUES (14, 'Amaltea', 786.00, 'Nothing to say', 8);
INSERT INTO public.moon VALUES (15, 'Euporia', 37.30, 'Unknown', 10);
INSERT INTO public.moon VALUES (16, 'Lisitea', 3648.53, 'If only it existed', 7);
INSERT INTO public.moon VALUES (17, 'Adrastea', 34.99, 'Interesting', 7);
INSERT INTO public.moon VALUES (18, 'Caldona', 776.00, 'Nothing to say', 5);
INSERT INTO public.moon VALUES (19, 'Ortosia', 4736.20, 'Unknown', 7);
INSERT INTO public.moon VALUES (20, 'Trantor', 48.53, 'If only it existed', 4);
INSERT INTO public.moon VALUES (21, 'Adamantar', 343.90, 'Interesting', 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', 'our planet', true, true, 34423, 'old', 0, 1, 1);
INSERT INTO public.planet VALUES (2, 'mars', 'red planet', true, false, 354423, 'young', 32, NULL, 1);
INSERT INTO public.planet VALUES (3, 'venus', 'It is also in Via Lactea', true, false, 34736, 'big', 46374, NULL, 1);
INSERT INTO public.planet VALUES (4, 'jupiter', 'It is also in Va Lactea', true, false, 543534, 'big', 3545, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'It is also in ia Lactea, the same as Jupiter', true, true, 434, 'with rings', 2343, 3, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'It is smaller than the rest', true, false, 43434, 'no rings', 444, NULL, 1);
INSERT INTO public.planet VALUES (7, 'Raticulin', 'Just an invention', true, true, 73894, 'famous because someone invented it', 6786, 4, 2);
INSERT INTO public.planet VALUES (8, 'planet7', 'Just an invention again', false, true, 4387, NULL, 438972, 4, 3);
INSERT INTO public.planet VALUES (9, 'planet8', 'Nothing to say about it', false, false, 7675, NULL, 43872, NULL, 3);
INSERT INTO public.planet VALUES (10, 'planet9', 'So boring planet', false, true, 89789, NULL, 879, 2, 2);
INSERT INTO public.planet VALUES (11, 'planet11', 'Just finishing', false, false, 1111771, 'misterious planet', 89, NULL, 2);
INSERT INTO public.planet VALUES (12, 'planet12', 'who knows', false, true, 11771, 'misterious planet', 8387899, 4, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 3, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Orion', 2, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Polar star', 4, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Arcturus', 3, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Bellatrix', 3, NULL, NULL);


--
-- Name: beings_being_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.beings_being_id_seq', 4, true);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: being beings_being_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT beings_being_id_key UNIQUE (being_id);


--
-- Name: being beings_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.being
    ADD CONSTRAINT beings_pkey PRIMARY KEY (being_id);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


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
-- Name: galaxy galaxies_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: planet planets_being_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_being_id_fkey FOREIGN KEY (being_id) REFERENCES public.being(being_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

