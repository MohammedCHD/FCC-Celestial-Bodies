--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    discovered integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    description text NOT NULL,
    age_in_billion_years numeric,
    radius_in_light_years numeric NOT NULL,
    number_of_stars_in_million integer NOT NULL
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
    name character varying(40),
    radius_in_km numeric NOT NULL,
    age_in_billion_years numeric,
    gravity character varying(30),
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
    name character varying(40),
    is_spherical boolean,
    has_life boolean NOT NULL,
    distance_from_earth character varying(40),
    age_in_billion_years numeric,
    orbital_period_in_days integer,
    description text,
    amount_of_moons integer,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    age_in_billion_years numeric,
    description text,
    distance_to_earth character varying(40) NOT NULL,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 'Halleys comet or Comet Halley is a short period comet visible from Earth every 75-79 Years', 1758);
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 'Comet Hale-Bopp is a comet that was one of the most widely observed of the 20th century and one of the brightest seen for many decades', 1995);
INSERT INTO public.comet VALUES (3, 'Tempel 1', 'Tempel 1 is a periodic Jupiter-Family comet discovered by Wilhelm Tempel in 1867', 1867);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes our Solar System', 13.61, 52.850, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The Andromeda Galaxy is a barred spiral galaxy and the nearest large galaxy to the Milky Way', 10.01, 110, 1000);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'Messier 81 is a grand design spiral galaxy', 13.31, 90, 250);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'The Triangulum Galaxy is a spiral galaxy 2.73 million light years from Earth', NULL, 30.000, 40);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'The Sombrero Galaxy is a peculiar galaxy of unclear classification', 13.25, 25.000, 100);
INSERT INTO public.galaxy VALUES (7, 'Black Eye Galaxy', 'The Black Eye Galaxy is a relatively isolated spiral galaxy', 13.28, 26.481, 100);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1.737, 4.53, '1.62 m/s2', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.267, 4.503, '0.0057 m/s2', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 4.503, '0.003 m/s2', 4);
INSERT INTO public.moon VALUES (13, 'Ganymede', 2.634, 4.503, '1.428 m/s2', 5);
INSERT INTO public.moon VALUES (14, 'Europa', 1.560, 4.503, '1.315 m/s2', 5);
INSERT INTO public.moon VALUES (16, 'Io', 1.821, 4.503, '1.796 m/s2', 5);
INSERT INTO public.moon VALUES (22, 'Adrastea', 8.2, NULL, '0.007 m/s2', 5);
INSERT INTO public.moon VALUES (23, 'Elara', 43.0, NULL, '0.031 m/s2', 5);
INSERT INTO public.moon VALUES (24, 'Amalthea', 83.5, NULL, '0.02 m/s2', 5);
INSERT INTO public.moon VALUES (25, 'Himalia', 85.0, NULL, '0.062 m/s2', 5);
INSERT INTO public.moon VALUES (27, 'Crame', 23.0, NULL, '0.017 m/s2', 5);
INSERT INTO public.moon VALUES (28, 'Cyllene', 1.0, NULL, '0.001 m/s2', 5);
INSERT INTO public.moon VALUES (15, 'Titan', 2.574, 4.003, '1.352 m/s2', 6);
INSERT INTO public.moon VALUES (17, 'Enceladus', 252.1, 1.0, '0.113 m/s2', 6);
INSERT INTO public.moon VALUES (18, 'Mimas', 198.2, NULL, '0.064 m/s2', 6);
INSERT INTO public.moon VALUES (20, 'Lapetus', 734.5, 4.567, '0.223 m/s2', 6);
INSERT INTO public.moon VALUES (21, 'Dione', 561.4, 4.0, '0.232 m/s2', 6);
INSERT INTO public.moon VALUES (26, 'Hyperion', 135.0, NULL, '0.02 m/s2', 6);
INSERT INTO public.moon VALUES (29, 'Methone', 1.45, NULL, '0.00023 m/s2', 6);
INSERT INTO public.moon VALUES (19, 'Callisto', 2.410, 4.503, '1.236 m/s2', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', false, true, NULL, 4.543, 365, 'Earth is the third planet from the Sun and the only astronomical object known to harbor life', 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', true, false, '109.99 million km', 4.503, 88, 'Mercury is the smallest planet in our solar system and the closest to the Sun', 0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', true, false, '250.95 million km', 4.503, 225, 'Venus is the second planet from the Sun', 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, false, '136.7 million km', 4.603, 687, 'Mars is the Fourth Planet from the sun and the second-smallest planet in the solar system', 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, false, '597.31 million km', 4.603, 12, 'Jupiter is the fifth planet from the sun and the largest in the solar system', 79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, false, '1.3376 billion km', 4.503, 29, 'Saturn is the sixth planet from the sun and the second largest in the solar system', 82, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, false, '2.8697 billion km', 4.503, 84, 'Uranus is the seventh planet from the sun', 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, false, '4.3244 billion km', 4.503, 165, 'Neptune is the eighth planet from the sun and the farthest known solar planet', 14, 1);
INSERT INTO public.planet VALUES (12, 'Kepler-62F', NULL, false, '1.207 light years', 7.005, 267, 'Kepler-62F is a super earth exoplanet orbiting within the habitable zone of the star Kepler-62', NULL, 12);
INSERT INTO public.planet VALUES (11, 'Kepler-69C', NULL, false, '2.707 light years', 9.8, 242, 'Kepler-69C is a confirmed super Earth extrasolar planet orbiting the sunlike star Kepler-69', NULL, 13);
INSERT INTO public.planet VALUES (10, 'Kepler-22B', NULL, false, '587.1 light years', 4.0, 290, 'Kepler-22B is an exoplanet orbiting within the habitable zone of the sunlike star kepler-22', 0, 14);
INSERT INTO public.planet VALUES (9, 'Gliese 667 Cc', NULL, false, '22.18 light years', 2.0, 28, 'Gliese 667 Cc is an exoplanet orbiting the habitable zone of the red dwarf star Gliese 667 C', NULL, 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.603, 'The Sun is the star at the center of the Solar System', '149.6 Million km', 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 0.010, 'Betelgeuse is a red supergiant of spectral type M1-2 and one of the largest stars visible to the naked eye', '642.5 light years', 1);
INSERT INTO public.star VALUES (6, 'Antares', 0.011, 'Antares is the brighest star in the constellation of Scorpius', '554.5 light years', 1);
INSERT INTO public.star VALUES (7, 'Vega', 0.455, 'Vega is the brighest star in the northen constellation of Lyra', '25.05 light years', 1);
INSERT INTO public.star VALUES (8, 'Sirius', 0.230, 'Sirius is the brightest star in the night sky', '8.611 light years', 1);
INSERT INTO public.star VALUES (9, 'Fomalhaut', 0.440, 'Fomalhaut is the brightest star in the southern constellation of Piscis Austrinus', '25.11 light years', 1);
INSERT INTO public.star VALUES (12, 'Kepler-62', 7.005, 'Kepler-62 is a K-type main sequence star cooler and smaller than the sun', '1.200 light years', 1);
INSERT INTO public.star VALUES (13, 'Kepler-69', NULL, 'Kepler-69 is a G-type main sequence star similar to the Sun', '2.707 light years', 1);
INSERT INTO public.star VALUES (14, 'Kepler-22', 4.0, 'Kepler-22 is a sun-like star in the northen constellation of Cygnus', '619.7 light years', 1);
INSERT INTO public.star VALUES (15, 'Gliese 667 C', 2.0, 'Gliese 667 C is a sun-like star in the constellation of Scorpius', '23.0 light years', 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

