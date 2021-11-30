SET check_function_bodies = false;

/* Table 'rooms' */
CREATE TABLE rooms(
  id integer NOT NULL,
  room_name varchar,
  created_at timestamp,
  updated_at timestamp,
  PRIMARY KEY(id)
);

/* Table 'restrictions' */
CREATE TABLE restrictions(
  id integer NOT NULL,
  restriction_name varchar,
  created_at timestamp,
  updated_at timestamp,
  PRIMARY KEY(id)
);

/* Table 'reservations' */
CREATE TABLE reservations(
  id integer NOT NULL,
  first_name varchar,
  last_name varchar,
  email varchar,
  phone varchar,
  start_date date,
  end_date date,
  room_id integer NOT NULL,
  created_at timestamp,
  updated_at timestamp,
  PRIMARY KEY(id)
);

/* Table 'room_restrictions' */
CREATE TABLE room_restrictions(
  id integer NOT NULL,
  start_date date,
  end_date date,
  room_id integer NOT NULL,
  reservation_id integer NOT NULL,
  created_at timestamp,
  updated_at timestamp,
  restriction_id integer NOT NULL,
  PRIMARY KEY(id)
);

/* Table 'users' */
CREATE TABLE users(
  id integer NOT NULL,
  first_name varchar,
  last_name varchar,
  email varchar,
  "password" varchar,
  created_at timestamp,
  updated_at timestamp,
  access_level integer,
  PRIMARY KEY(id)
);

/* Relation 'rooms_reservations' */
ALTER TABLE reservations
  ADD CONSTRAINT rooms_reservations FOREIGN KEY (room_id) REFERENCES rooms (id);

/* Relation 'rooms_room_restrictions' */
ALTER TABLE room_restrictions
  ADD CONSTRAINT rooms_room_restrictions
    FOREIGN KEY (room_id) REFERENCES rooms (id);

/* Relation 'reservations_room_restrictions' */
ALTER TABLE room_restrictions
  ADD CONSTRAINT reservations_room_restrictions
    FOREIGN KEY (reservation_id) REFERENCES reservations (id);

/* Relation 'restrictions_room_restrictions' */
ALTER TABLE room_restrictions
  ADD CONSTRAINT restrictions_room_restrictions
    FOREIGN KEY (restriction_id) REFERENCES restrictions (id);
