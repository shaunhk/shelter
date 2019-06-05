DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS requests;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  has_garden BOOLEAN,
  has_no_pets BOOLEAN,
  lives_with_others BOOLEAN,
  id SERIAL8 PRIMARY KEY
);

CREATE TABLE animals (
  name VARCHAR(255),
  species VARCHAR(255),
  admission_date VARCHAR(255),
  image VARCHAR(255),
  reserved BOOLEAN,
  available_for_adoption BOOLEAN,
  needs_garden BOOLEAN,
  needs_no_pets BOOLEAN,
  needs_company BOOLEAN,
  about_me TEXT,
  id SERIAL8 PRIMARY KEY
);

CREATE TABLE adoptions (
  animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE,
  id SERIAL8 PRIMARY KEY
);

CREATE TABLE requests (
  phone_number VARCHAR(255),
  email_address VARCHAR(255),
  decided BOOLEAN,
  animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE,
  id SERIAL8 PRIMARY KEY
);
