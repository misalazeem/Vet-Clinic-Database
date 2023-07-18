CREATE TABLE
IF not exists public.patients
(
  id integer NOT NULL,
  name varchar
(40) NOT NULL,
  date_of_birth date,
  CONSTRAINT patients_pkey PRIMARY KEY
(id)
);

CREATE TABLE
if not exists public.medical_histories
(
  id integer NOT NULL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id integer NOT NULL,
  status varchar
(100),
  FOREIGN KEY
(patient_id) REFERENCES patients
(id)
);

CREATE TABLE
if not exists public.invoices
(
  id integer NOT NULL PRIMARY KEY,
  total_amount decimal NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_history_id integer NOT NULL,
  FOREIGN KEY
(medical_history_id) REFERENCES medical_histories
(id)
);