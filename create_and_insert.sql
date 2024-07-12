CREATE TABLE nasabah (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    alamat VARCHAR(100),
    email VARCHAR(50),
    tanggal_lahir DATE
)

CREATE TABLE akun (
    id SERIAL PRIMARY KEY,
    nasabah_id INT,
    nomor_akun VARCHAR(20) NOT NULL UNIQUE,
    username VARCHAR(15) NOT NULL UNIQUE,
    password VARCHAR(6) NOT NULL,
    saldo DECIMAL(15, 2),
    tgl_buka DATE,
    FOREIGN KEY (nasabah_id) REFERENCES nasabah (id)
)

CREATE TABLE transaksi (
    id SERIAL PRIMARY KEY,
    akun_id INT,
    jenis_transaksi VARCHAR(10),
    keterangan VARCHAR(255),
    tanggal DATE,
    jumlah DECIMAL(15, 2),
    FOREIGN KEY (akun_id) REFERENCES akun (id)
)

-- INSERT DATA INTO NASABAH
INSERT INTO nasabah (name, phone, alamat, email, tanggal_lahir)
VALUES ('Redha', 'Jl. Pahlawan No. 123', '085325224829', 'redha@gmail.com', '2001-04-13');

-- READ DATA NASABAH
SELECT * FROM nasabah;

-- UPDATE DATA NASABAH
UPDATE nasabah SET email = 'tataredha@gmail.com' WHERE id = 1;

-- DELETE DATA NASABAH
DELETE FROM nasabah WHERE id = 1;



-- INSERT DATA INTO AKUN
INSERT INTO akun (nasabah_id, nomor_akun, username, password, saldo, tgl_buka)
VALUES (1, '9912356122', 'mypersona', '123456', 100000, '2024-07-10');

-- READ DATA AKUN
SELECT * FROM akun;

-- UPDATE DATA AKUN
UPDATE akun SET saldo = 200000 WHERE id = 1;

-- DELETE DATA AKUN
DELETE FROM akun WHERE id = 1;



-- INSERT DATA INTO TRANSAKSI
INSERT INTO transaksi (akun_id, jenis_transaksi, keterangan, tanggal, jumlah)
VALUES (1, 'KREDIT', 'SETOR TUNAI SENILAI 100000', '2024-07-11', 10000);

-- READ DATA TRANSAKSI
SELECT * FROM transaksi;

-- UPDATE DATA TRANSAKSI
UPDATE transaksi SET keterangan = 'SETOR TUNAI BARU BANGET 100000' WHERE id = 1;

-- DELETE DATA TRANSAKSI
DELETE FROM transaksi WHERE id = 1;