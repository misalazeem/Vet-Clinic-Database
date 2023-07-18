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

CREATE TABLE if not exists public.treatments (
  id integer NOT NULL PRIMARY KEY,
  type VARCHAR(100),
  name VARCHAR(100)
);

CREATE TABLE if not exists public.treatments_histories (
  medical_history_id integer NOT NULL,
  treatment_id integer NOT NULL,
  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE public.invoice_items (
  id integer NOT NULL PRIMARY KEY,
  unit_price DECIMAL NOT NULL,
  quantity integer NOT NULL,
  total_price DECIMAL NOT NULL,
  invoice_id integer NOT NULL,
  treatment_id integer NOT NULL,
  FOREIGN KEY (invoice_id) REFERENCES invoices(id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE INDEX invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX invoice_items_treatment_id ON invoice_items(treatment_id);
CREATE INDEX treatments_histories_medical_history_id ON treatments_histories(medical_history_id);
CREATE INDEX treatments_histories_treatment_id ON treatments_histories(treatment_id);
CREATE INDEX invoices_medical_history_id ON invoices(medical_history_id);
CREATE INDEX medical_histories_patient_id ON medical_histories(patient_id);
