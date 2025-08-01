CREATE TABLE sensor_log (
    id INT NOT NULL AUTO_INCREMENT,
    nilai FLOAT,
    waktu DATE,
    PRIMARY KEY (id, waktu) -- wajib: kolom partisi harus termasuk dalam PRIMARY KEY
)
PARTITION BY RANGE (YEAR(waktu)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION pmax   VALUES LESS THAN MAXVALUE
);

INSERT INTO sensor_log (nilai, waktu) VALUES 
(10.5, '2021-03-01'),
(12.0, '2021-11-15'),
(15.2, '2022-05-10'),
(9.8,  '2023-01-01'),
(8.7,  '2024-06-01');

SELECT * FROM sensor_log WHERE YEAR(waktu) = 2022;

SHOW CREATE TABLE sensor_log;

SELECT * FROM sensor_log PARTITION (p2022);



