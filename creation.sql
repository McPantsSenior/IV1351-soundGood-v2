--Creation of all tables for the Soundgood Music School:

CREATE TABLE IF NOT EXISTS school (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    enrolled_students INT NOT NULL,
    max_studnets INT NOT NULL,
    sibling_discount FLOAT(10) NOT NULL,
    max_rented_instruments_per_student INT NOT NULL,
    max_lease_time_months INT
);

CREATE TABLE IF NOT EXISTS address (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    zip VARCHAR(5) NOT NULL,
    city VARCHAR(500) NOT NULL,
    street VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS phone_num (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    phone_num VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS email (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS contact_person (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email_id INT,
    phone_num_id INT,

    FOREIGN KEY (email_id) REFERENCES email (id),
    FOREIGN KEY (phone_num_id) REFERENCES phone_num (id)
);

CREATE TABLE IF NOT EXISTS genres (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS instrument (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    instrument_name VARCHAR(500) NOT NULL,
    instrument_brand VARCHAR(500),
    monthly_price FLOAT NOT NULL,
    total_stock INT NOT NULL
);

CREATE TABLE IF NOT EXISTS prices (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_price FLOAT(10) NOT NULL,
    instructor_payment FLOAT(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS skill_level (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    skill_level VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS instructor (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    personal_num VARCHAR(12) NOT NULL UNIQUE,
    first_name VARCHAR(500) NOT NULL,
    last_name VARCHAR(500) NOT NULL,
    teach_ensembles BOOLEAN NOT NULL,
    address_id INT NOT NULL,
    school_id INT NOT NULL,
    email_id INT NOT NULL,
    phone_num_id INT NOT NULL,

    FOREIGN KEY (address_id) REFERENCES address (id),
    FOREIGN KEY (school_id) REFERENCES school (id),
    FOREIGN KEY (email_id) REFERENCES email (id),
    FOREIGN KEY (phone_num_id) REFERENCES phone_num (id)
);

CREATE TABLE IF NOT EXISTS student (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    personal_num VARCHAR(12) NOT NULL UNIQUE,
    first_name VARCHAR(500) NOT NULL,
    last_name VARCHAR(500) NOT NULL,
    address_id INT NOT NULL,
    school_id INT NOT NULL,
    email_id INT NOT NULL,
    phone_num_id INT NOT NULL,
    contact_person_id INT,

    FOREIGN KEY (address_id) REFERENCES address (id),
    FOREIGN KEY (school_id) REFERENCES school (id),
    FOREIGN KEY (email_id) REFERENCES email (id),
    FOREIGN KEY (phone_num_id) REFERENCES phone_num (id),
    FOREIGN KEY (contact_person_id) REFERENCES contact_person (id)
);

CREATE TABLE IF NOT EXISTS student_instrument (
    instrument_id INT NOT NULL,
    student_id INT NOT NULL,
    skill_level_id INT NOT NULL,

    PRIMARY KEY (instrument_id, student_id),

    FOREIGN KEY (instrument_id) REFERENCES instrument (id),
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (skill_level_id) REFERENCES skill_level (id)
);

CREATE TABLE IF NOT EXISTS availability (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    instructor_id INT NOT NULL,
    instrument_id INT NOT NULL,
    skill_level_id INT NOT NULL,
    price_id INT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,

    FOREIGN KEY (instructor_id) REFERENCES instructor (id),
    FOREIGN KEY (instrument_id) REFERENCES instrument (id),
    FOREIGN KEY (skill_level_id) REFERENCES skill_level (id),
    FOREIGN KEY (price_id) REFERENCES prices (id)
);

CREATE TABLE IF NOT EXISTS booking (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INT NOT NULL,
    availability_id INT NOT NULL,
    time TIMESTAMP NOT NULL,

    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (availability_id) REFERENCES availability (id)
);

CREATE TABLE IF NOT EXISTS can_play_instrument (
    instrument_id INT NOT NULL,
    instructor_id INT NOT NULL,

    PRIMARY KEY (instrument_id, instructor_id),

    FOREIGN KEY (instrument_id) REFERENCES instrument (id) ON DELETE CASCADE,
    FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ensembles (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    instructor_id INT NOT NULL,
    genre_id INT NOT NULL,
    price_id INT NOT NULL,
    max_students INT NOT NULL,
    min_students INT NOT NULL,
    time TIMESTAMP NOT NULL,

    FOREIGN KEY (instructor_id) REFERENCES instructor (id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (price_id) REFERENCES prices (id)
);

CREATE TABLE IF NOT EXISTS group_lesson (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    instructor_id INT NOT NULL,
    skill_level_id INT NOT NULL,
    instrument_id INT NOT NULL,
    price_id INT NOT NULL,
    max_students INT NOT NULL,
    min_students INT NOT NULL,
    time TIMESTAMP NOT NULL,

    FOREIGN KEY (instructor_id) REFERENCES instructor (id),
    FOREIGN KEY (skill_level_id) REFERENCES skill_level (id),
    FOREIGN KEY (instrument_id) REFERENCES instrument (id),
    FOREIGN KEY (price_id) REFERENCES prices (id)
);

CREATE TABLE IF NOT EXISTS rent (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INT NOT NULL,
    instrument_id INT NOT NULL,
    leasing_time_start TIMESTAMP NOT NULL,
    leasing_time_end TIMESTAMP NOT NULL,
    home_delivery BOOLEAN NOT NULL,

    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (instrument_id) REFERENCES instrument (id)
);

CREATE TABLE IF NOT EXISTS siblings (
    student_id INT NOT NULL,
    sibling_id INT NOT NULL,

    PRIMARY KEY (student_id,sibling_id),

    FOREIGN KEY (student_id) REFERENCES student (id) ON DELETE CASCADE,
    FOREIGN KEY (sibling_id) REFERENCES student (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS student_ensembles (
    ensembles_id INT NOT NULL,
    student_id INT NOT NULL,
    instrument_id INT NOT NULL,

    PRIMARY KEY (ensembles_id,student_id),

    FOREIGN KEY (ensembles_id) REFERENCES ensembles (id),
    FOREIGN KEY (student_id) REFERENCES student (id),
    FOREIGN KEY (instrument_id) REFERENCES instrument (id)
);

CREATE TABLE IF NOT EXISTS student_group_lesson (
    group_lesson_id INT NOT NULL,
    student_id INT NOT NULL,

    PRIMARY KEY (group_lesson_id,student_id),

    FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id),
    FOREIGN KEY (student_id) REFERENCES student (id)
);