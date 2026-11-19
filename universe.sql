DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;

\c universe


CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT,
    has_life BOOLEAN,
    age_in_millions_of_years INT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id),
    is_spherical BOOLEAN,
    mass NUMERIC
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT REFERENCES star(star_id),
    distance_from_earth INT,
    has_water BOOLEAN
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT REFERENCES planet(planet_id),
    is_visible BOOLEAN,
    radius NUMERIC
);

CREATE TABLE planet_types (
    planet_types_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description TEXT
);


INSERT INTO galaxy (name, description, has_life, age_in_millions_of_years) VALUES
('Milky Way', 'Our home galaxy', true, 13600),
('Andromeda', 'Nearest major galaxy', false, 10000),
('Triangulum', 'Third largest in local group', false, 3000),
('Sombrero', 'Has a bright nucleus', false, 8000),
('Whirlpool', 'Interacting grand design spiral', false, 400),
('Pinwheel', 'Face-on spiral galaxy', false, 500);

INSERT INTO star (name, galaxy_id, is_spherical, mass) VALUES
('Sun', 1, true, 1.0),
('Sirius', 1, true, 2.02),
('Canopus', 1, true, 8.0),
('Arcturus', 1, true, 1.08),
('Vega', 1, true, 2.135),
('Rigel', 1, true, 21.0);

INSERT INTO planet (name, star_id, distance_from_earth, has_water) VALUES
('Mercury', 1, 91, false),
('Venus', 1, 41, false),
('Earth', 1, 0, true),
('Mars', 1, 78, true),
('Jupiter', 1, 628, false),
('Saturn', 1, 1275, false),
('Uranus', 1, 2723, false),
('Neptune', 1, 4351, false),
('Pluto', 1, 5000, false),
('Ceres', 1, 250, false),
('Eris', 1, 10000, false),
('Haumea', 1, 7000, false);

INSERT INTO moon (name, planet_id, is_visible, radius) VALUES
('Luna', 3, true, 1737.4),
('Phobos', 4, true, 11.2),
('Deimos', 4, true, 6.2),
('Io', 5, true, 1821.6),
('Europa', 5, true, 1560.8),
('Ganymede', 5, true, 2634.1),
('Callisto', 5, true, 2410.3),
('Mimas', 6, true, 198.2),
('Enceladus', 6, true, 252.1),
('Tethys', 6, true, 531.1),
('Dione', 6, true, 561.4),
('Rhea', 6, true, 763.8),
('Titan', 6, true, 2574.7),
('Iapetus', 6, true, 734.5),
('Miranda', 7, true, 235.8),
('Ariel', 7, true, 578.9),
('Umbriel', 7, true, 584.7),
('Titania', 7, true, 788.4),
('Oberon', 7, true, 761.4),
('Triton', 8, true, 1353.4);

INSERT INTO planet_types (name, description) VALUES
('Terrestrial', 'Solid surface'),
('Gas Giant', 'Mostly hydrogen and helium'),
('Ice Giant', 'Heavier elements than gas giants');
