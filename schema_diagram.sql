CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL
);


CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  admitted_at TIME NOT NULL,
  patient_id INT NOT NULL,
  status VARCHAR(255) NOT NULL,
  FOREIGN KEY (patient_id) 
    REFERENCES patients (id)
    ON DELETE CASCADE
);


-- sperate many to many relation by creating this table
CREATE TABLE medical_histories_treatments (
  medical_history_id INT NOT NULL,
  treatment_id INT NOT NULL,
  FOREIGN KEY (medical_history_id) 
    REFERENCES medical_histories (id)
    ON DELETE CASCADE,
  FOREIGN KEY (treatment_id) 
    REFERENCES treatments (id)
    ON DELETE CASCADE
);


-- create invoices table 
CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL NOT NULL,
  generated_at TIME NOT NULL,
  payed_at TIME NOT NULL,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) 
    REFERENCES medical_histories (id)
    ON DELETE CASCADE
);

CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL NOT NULL,
  quantity INT NOT NULL, 
  total_price DECIMAL NOT NULL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY (invoice_id) 
    REFERENCES invoices (id)
    ON DELETE CASCADE,
  FOREIGN KEY (treatment_id) 
    REFERENCES treatments (id)
    ON DELETE CASCADE
); 
