CREATE TABLE "person" (
	"id" serial primary key,
	"name" VARCHAR(50) NOT NULL
);

CREATE TABLE "social_security" (
	"id" serial primary key,
	"number" INT NOT NULL,
	"person_id" INT REFERENCES "person"
);

INSERT INTO "person" ("name") VALUES ('Bobby Donuts');


SELECT * FROM "person"
JOIN "social_security" ON "person".id = "social_security".person_id
WHERE "person"."id" = 1;

SELECT * FROM "person"
JOIN "social_security" ON "person".id = "social_security".person_id;

-- No one shows up if they don't have a match
SELECT * FROM "social_security"
JOIN "person" ON "person".id = "social_security".person_id;

-- One to Many
CREATE TABLE "cohorts" (
	"id" serial primary key,
	"name" VARCHAR(25),
	"start_date" DATE
);

CREATE TABLE "students" (
	"id" serial primary key,
	"name" VARCHAR(50),
	"cohort_id" INT REFERENCES "cohorts"
);

-- Insert multi-cohorts
INSERT INTO "cohorts" ("name", "start_date")
VALUES ('Isurus', '06/20/2019'),
('Enhydra', '02/27/2019'),
('Tyto', '11/11/2019');

-- Inserting multiple students
INSERT INTO "students" ("name", "cohort_id")
VALUES ('Luke', 1),
('James', 1),
('Shanice', 1),
('Macy', 1),
('Ellen', 1),
('Austin', 2),
('Konou', 2),
('Devon', 2),
('Isaac', 2);

-- Select all cohorts
SELECT * FROM "cohorts";

-- Select all students
SELECT * FROM "students";

-- Select all students in Isurus
SELECT * FROM "students"
JOIN "cohorts" ON "cohorts".id = "students".cohort_id
WHERE "cohorts".name = 'Isurus';

-- Select all students in a Cohort
SELECT * FROM "students"
JOIN "cohorts" ON "cohorts".id = "students".cohort_id;

-- How many students in Isurus
SELECT count(*) FROM "students"
JOIN "cohorts" ON "cohorts".id = "students".cohort_id
WHERE "cohorts".name = 'Isurus';

-- How many students
SELECT count(*) FROM "students";

-- Group Students by Cohort Name
SELECT "cohorts".name, count(*) FROM "students"
JOIN "cohorts" ON "cohorts".id = "students".cohort_id
GROUP BY "cohorts".name;

-- Sort us Please
SELECT * FROM "students"
JOIN "cohorts" ON "cohorts".id = "students".cohort_id
WHERE "cohorts"."name" = 'Isurus'
ORDER BY "students"."name" ASC;

SELECT * FROM "students"
JOIN "cohorts" ON "cohorts".id = "students".cohort_id
ORDER BY "cohorts"."name" ASC;



