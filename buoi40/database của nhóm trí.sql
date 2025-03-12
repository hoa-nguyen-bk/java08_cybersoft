USE hotel;
CREATE TABLE roles ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    Name ENUM('admin', 'staff', 'customer') UNIQUE NOT NULL 

); 

 

CREATE TABLE users ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    Full_name VARCHAR(100) NOT NULL, 

    Email VARCHAR(255) UNIQUE NOT NULL, 

    Phone VARCHAR(20) UNIQUE, 

    Password VARCHAR(255) NOT NULL, 

    Role_id INT NOT NULL, 

    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 

); 

 

CREATE TABLE rooms ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    Room_number VARCHAR(10) UNIQUE NOT NULL, 

    Type ENUM('single', 'double', 'suite') NOT NULL, 

    Price DECIMAL(10,2) NOT NULL, 

    Status ENUM('available', 'booked', 'occupied', 'maintenance') DEFAULT 'available', 

    Description TEXT, 

    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 

); 

 

CREATE TABLE bookings ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    User_id INT NOT NULL, 

    Room_id INT NOT NULL, 

    Check_in DATE NOT NULL, -- ko phù hợp cho việc check_in checkout liên tục

    Check_out DATE NOT NULL, 

    Status ENUM('pending', 'confirmed', 'checked-in', 'checked-out', 'canceled') DEFAULT 'pending', 

    Total_price DECIMAL(10,2) NOT NULL, 

    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- cái này nó tự động tạo, đặt tên khác

); 

 

CREATE TABLE payments ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    Booking_id INT NOT NULL, 

    Amount DECIMAL(10,2) NOT NULL, 

    Payment_method ENUM('cash', 'credit_card', 'bank_transfer', 'zalopay') NOT NULL, 

    Status ENUM('pending', 'completed', 'failed') DEFAULT 'pending', 

    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 

); 

 

CREATE TABLE services ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    Name VARCHAR(100) NOT NULL, 

    Price DECIMAL(10,2) NOT NULL, 

    Description TEXT, 

    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 

); 

 

CREATE TABLE booking_services ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    Booking_id INT NOT NULL, -- nạp booking ghi cái phòng

    Service_id INT NOT NULL, 

    Quantity INT DEFAULT 1, 

    Total_price DECIMAL(10,2) NOT NULL, 

    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 

); 

 

CREATE TABLE reviews ( 

    Id INT AUTO_INCREMENT PRIMARY KEY, 

    User_id INT NOT NULL, 

    Room_id INT NOT NULL, 

    Rating INT CHECK (rating BETWEEN 1 AND 5), 

    Comment TEXT, 

    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 

); 

ALTER TABLE users  

ADD CONSTRAINT fk_users_role FOREIGN KEY (role_id) REFERENCES roles(id); 

 

ALTER TABLE bookings  

ADD CONSTRAINT fk_bookings_user FOREIGN KEY (user_id) REFERENCES users(id), 

ADD CONSTRAINT fk_bookings_room FOREIGN KEY (room_id) REFERENCES rooms(id); 

 

ALTER TABLE payments  

ADD CONSTRAINT fk_payments_booking FOREIGN KEY (booking_id) REFERENCES bookings(id); 

 

ALTER TABLE booking_services  

ADD CONSTRAINT fk_booking_services_booking FOREIGN KEY (booking_id) REFERENCES bookings(id), 

ADD CONSTRAINT fk_booking_services_service FOREIGN KEY (service_id) REFERENCES services(id); 

 

ALTER TABLE reviews  

ADD CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES users(id), 

ADD CONSTRAINT fk_reviews_room FOREIGN KEY (room_id) REFERENCES rooms(id); 