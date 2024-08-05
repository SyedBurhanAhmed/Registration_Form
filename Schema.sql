Create database LACuserreg;

use LACuserreg;

create table LACuserreg(
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100),
    father_name VARCHAR(100),
    email VARCHAR(100),
    gender VARCHAR(10),
    phone VARCHAR(12),
    category VARCHAR(50),
    address VARCHAR(255),
    city VARCHAR(50),
    date_of_birth VARCHAR(10)
);
