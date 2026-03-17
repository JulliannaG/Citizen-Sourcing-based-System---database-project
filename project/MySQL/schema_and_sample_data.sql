CREATE DATABASE project_1
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE project_1;

SET NAMES utf8mb4;

CREATE TABLE `Citizen` (
  citizen_id    INT PRIMARY KEY AUTO_INCREMENT,
  name          VARCHAR(100)       NOT NULL,
  surname       VARCHAR(100)       NOT NULL,
  email         VARCHAR(150)       NOT NULL UNIQUE,
  phone_number  VARCHAR(20) NOT NULL,
  joined_at    DATETIME         NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into Citizen (name, surname, email, phone_number, joined_at) values 
('Maurise', 'Ianniello', 'mianniello0@umich.edu', '120-289-9353', '2022-01-09'),
('Josephine', 'Fosbraey', 'jfosbraey1@hexun.com', '696-627-0797', '2022-01-06'),
('Meier', 'Tottie', 'mtottie2@plala.or.jp', '618-346-7216', '2021-03-15'),
('Grange', 'Ned', 'nglasard0@opera.com', '206-230-6409', '2024-12-07'),
('Kellen', 'Flemming', 'fheyball1@yale.edu', '964-718-0271', '2020-04-28'),
('Zacherie', 'Parsifal', 'pvanderbrug3@opera.com', '848-273-2669', '2024-03-23'),
('Dedra', 'Sterling', 'shacksby4@dagondesign.com', '753-237-3935', '2025-02-13'),
('Mikol', 'Wainwright', 'wbaddiley5@pen.io', '944-559-3634', '2024-03-30'),
('Deirdre', 'Starla', 'spennini6@rakuten.co.jp', '389-282-0490', '2022-07-11'),
('Tomaso', 'Wolfy', 'wcripwell7@gov.uk', '579-325-7096', '2025-04-21'),
('Melody', 'Paulie', 'pnaton8@soundcloud.com', '774-845-9816', '2024-09-20'),
('Gladi', 'Karlen', 'kaiersa@mtv.com', '450-142-1532', '2022-01-14'),
('Rakel', 'Welsh', 'wchesona@nba.com', '669-440-4725', '2024-08-18'),
('Camilla', 'Tedd', 'twoolagerd@nasa.gov', '549-488-3864', '2022-03-11'),
('Ailis', 'Ab', 'amartonf@networkadvertising.org', '494-973-4470', '2020-12-16'),
('Egon', 'Richmond', 'rbluemang@soundcloud.com', '680-852-0161', '2020-01-14'),
('Riva', 'Alison', 'adurkinh@google.co.uk', '800-392-0756', '2021-01-27'),
('Roxane', 'Constantina', 'cbettleyi@slideshare.net', '561-993-5137', '2024-08-12'),
('Sarette', 'Kimmi', 'ksorleyj@adobe.com', '632-406-8014', '2020-12-22'),
('Ileana', 'Bradan', 'bbaguleyk@dion.ne.jp', '289-760-7376', '2024-09-30'),
('Sephira', 'Jobie', 'jchansonnaul@seattletimes.com', '588-330-0474', '2020-08-31'),
('Jessy', 'Flinn', 'fgentzschm@posterous.com', '641-524-7309', '2020-03-22'),
('Derrick', 'Timothea', 'tbuckneyn@foxnews.com', '281-231-8495', '2023-02-16'),
('Dulcie', 'Jehu', 'jparisho@biblegateway.com', '718-149-1115', '2025-07-15'),
('Devland', 'Carissa', 'ckobap@loc.gov', '339-596-2200', '2023-11-12'),
('Calvin', 'Edgar', 'eschimannq@google.fr', '920-513-7097', '2021-04-17'),
('Lynnelle', 'Terrie', 'tdraycottr@walmart.com', '889-904-8038', '2024-12-25'),
('Aylmer', 'Raoul', 'rlongstaffes@taobao.com', '799-313-9252', '2020-11-24'),
('Othilia', 'Emalee', 'eadshedet@qq.com', '271-596-6133', '2022-02-28'),
('Keven', 'Gene', 'gguerrazzi10@yandex.ru', '493-206-0689', '2020-09-07'),
('Nannie', 'Chlo', 'cgreated11@hostgator.com', '843-285-5996', '2023-08-30'),
('Brooks', 'Spencer', 'sjacqueme12@answers.com', '675-454-6810', '2023-04-01'),
('Ophelie', 'Malanie', 'myurtsev13@ask.com', '962-862-8268', '2022-10-15'),
('Fanchon', 'Elaine', 'ebecke14@oakley.com', '893-767-9118', '2024-05-27'),
('Alec', 'Rickie', 'rstokey15@usatoday.com', '767-845-1868', '2021-04-08'),
('Mollee', 'Vania', 'vspofford16@indiegogo.com', '336-419-4419', '2021-05-22');

CREATE TABLE `Category` (
  category_id    INT PRIMARY KEY AUTO_INCREMENT,
  category_name  VARCHAR(100)      NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into Category (category_name) values 
	('Transportations'),
	('Utilities'),
 ('Waste'),
    	('Crimes'),
    	('Health'),
    	('Accident'),
    	('Environment'),
  	('Disaster');

CREATE TABLE Office (
  office_id        INT PRIMARY KEY AUTO_INCREMENT,
  office_name      VARCHAR(150)     NOT NULL,
  phone_number     VARCHAR(20)   NOT NULL,
  e_mail           VARCHAR(150)	 NOT NULL,
  district         VARCHAR(100)	NOT NULL,
  subdistrict      VARCHAR(100)	NOT NULL,
  postalcode       VARCHAR(10)	NOT NULL,
  street           VARCHAR(150)	NOT NULL,
  building_number  VARCHAR(20)	NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into Office (office_name, phone_number, e_mail, district, subdistrict, postalcode, street, building_number) values
('Transportations Department', '111-111-1111', 'cmatthis7@wsj.com', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 10),
('Health Department', '111-111-1112', 'csatthis7@wsj.com', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 12),
('Utilities Department', '111-111-113', 'mkevlin1@themeforest.net', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 3),
('Waste Department', '111-111-114', 'ctinson0@wix.com', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 4),
('Crimes Department', '111-111-115', 'bchestnut2@gravatar.com', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 5),
('Accident Department', '111-111-116', 'hmunro3@webeden.co.uk', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 6),
('Environment Department', '111-111-117', 'kderges4@taobao.com', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 7),
('Disaster Department', '111-111-118', 'bmaynard5@discovery.com', 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Rd', 8);

CREATE TABLE Location (
  location_id     INT PRIMARY KEY AUTO_INCREMENT,
  latitude        DECIMAL(9,6)	NOT NULL,
  longitude       DECIMAL(10,7)	NOT NULL,
  district        VARCHAR(100),
  subdistrict     VARCHAR(100),
  postcode        VARCHAR(10),
  street          VARCHAR(150),
  building_number VARCHAR(20),
  CONSTRAINT ck_location_lat CHECK (latitude  IS NULL OR (latitude BETWEEN -90  AND 90)),
  CONSTRAINT ck_location_lon CHECK (longitude IS NULL OR (longitude BETWEEN -180 AND 180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Location (latitude, longitude, district, subdistrict, postcode, street, building_number) VALUES
(14.563054, 121.031497, 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Road', '10'),
(-43.260364, -65.358137, 'Khlong Luang District', 'Khlong Nueng', '12120', 'Phahonyothin Road', '12'),
(39.2699174, -9.1052924, 'Lam Luk Ka', 'Bueng Kham Phroi', '12150', 'Lam Luk Ka Road', '538'),
(-9.770221, 124.514063, 'Lat Lum Kaeo', 'Khu Bang Luang', '12140', 'Lam Luk Ka Road', '76'),
(27.730381, 112.006998, 'Khlong Luang', 'Khlong Sam', '12120', 'Wat Suk Chai Road', '510'),
(-0.532915, 166.944141, 'Mueang Pathum Thani', 'Bang Duea', '12000', 'Frontage Road', '619'),
(43.575754, 21.331050, 'Lat Lum Kaeo', 'Rahaeng', '12140', 'Pathum Thani-Bang Len Road', '721'),
(-7.528417, 107.734013, 'Nong Suea', 'Bueng Ba', '12170', 'Ratchaphruek Road', '63'),
(38.889471, -77.057855, 'Nong Suea', 'Noppharat', '12170', 'Vibhavadi Rangsit Road', '740'),
(30.542510, 119.977400, 'Thanyaburi', 'Rangsit', '12130', 'Motorway No. 5', NULL),
(15.165090, 120.657329, 'Sam Khok', 'Sam Khok', '12160', 'Phahon Yothin Road', '412'),
(50.499760, -120.802530, 'Nong Suea', 'Nong Sam Wang', '12170', 'Nimitmai Road', '903'),
(39.672589, 66.772463, 'Thanyaburi', 'Rangsit', '12130', 'Rangsit-Nakhon Nayok Road', '285'),
(49.615510, 101.992797, 'Mueang Pathum Thani', 'Bang Khayaeng', '12000', 'Highway No. 3214', NULL),
(9.137597, -75.212896, 'Lat Lum Kaeo', 'Khu Bang Luang', '12000', 'Kanchanaphisek Road', '552'),
(59.276517, 15.207783, 'Khlong Luang', 'Khlong Si', '12120', 'Nimit Mai Road', '870'),
(13.512832, 122.469532, 'Lam Luk Ka', 'Lat Sawai', '12150', 'Lam Luk Ka Road', '29'),
(44.638131, 41.938156, 'Mueang Pathum Thani', 'Bang Khayaeng', '12000', 'Vibhavadi Rangsit Road', '871'),
(12.534030, 5.783050, 'Mueang Pathum Thani', 'Bang Kadi', '12000', 'Vibhavadi Rangsit Road', '729'),
(-7.461263, 109.220798, 'Nong Suea', 'Sala Khru', '12170', 'Hathai Rat Road', '11'),
(-2.715840, 30.628610, 'Nong Suea', 'Bueng Bon', '12170', 'Rangsit-Nakhon Nayok Road', '215'),
(19.739176, -71.444737, 'Thanyaburi', 'Prachathipat', '12130', 'Pridi Banomyong Road', '362'),
(-20.674197, -40.499738, 'Thanyaburi', 'Bueng Nam Rak', '12110', 'Highway No. 346', NULL),
(6.605868, -0.711713, 'Sam Khok', 'Bang Toei', '12160', 'Nimit Mai Road', '92'),
(35.293048, 112.390857, 'Nong Suea', 'Noppharat', '12170', 'Ratchaphruek Road', '124'),
(0.207025, 32.540102, 'Khlong Luang', 'Khlong Sam', '12120', 'Nimit Mai Road', '934'),
(41.933917, 126.422806, 'Lam Luk Ka', 'Bueng Thong Lang', '12150', 'Lam Luk Ka Road', '83'),
(24.880990, 118.718990, 'Khlong Luang', 'Khlong Song', '12120', 'Vibhavadi Rangsit Road', '843'),
(14.559360, 121.041239, 'Thanyaburi', 'Lam Phak Kut', '12110', 'Pridi Banomyong Road', '672'),
(35.621960, 118.725698, 'Nong Suea', 'Bueng Ka Sam', '12170', 'Kanchanaphisek Road', '82'),
(30.456360, 119.117600, 'Mueang Pathum Thani', 'Lak Hok', '12130', 'Ratchaphruek Road', '743'),
(29.833390, 108.731120, 'Mueang Pathum Thani', 'Ban Mai', '12000', 'Pridi Banomyong Road', '377'),
(49.858670, 18.977085, 'Khlong Luang', 'Khlong Ha', '12120', 'Rangsit-Nakhon Nayok Road', '031'),
(24.410250, 117.416058, 'Lam Luk Ka', 'Phuet Udom', '12150', 'Lam Luk Ka Road', '903'),
(26.141850, 116.188400, 'Mueang Pathum Thani', 'Bang Kadi', '12000', 'Hathai Rat Road', '431'),
(36.834080, 10.040570, 'Lat Lum Kaeo', 'Na Mai', '12140', 'Lam Luk Ka Road', '830'),
(27.275370, 91.239777, 'Sam Khok', 'Chiang Rak Yai', '12160', 'Kanchanaphisek Road', '341');

CREATE TABLE `Issue` (
  issue_id        INT PRIMARY KEY AUTO_INCREMENT,
  citizen_id      INT                NOT NULL,  
  category_id     INT                NOT NULL,  
  office_id       INT                NOT NULL, 
  location_id     INT                NOT NULL, 
  description     TEXT,
  current_status  ENUM('pending', 'in_progress', 'resolved') NOT NULL DEFAULT 'pending',
  reported_at     DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP,
  started_at      DATETIME NULL,
  completed_at    DATETIME NULL,

  CONSTRAINT fk_issue_citizen   FOREIGN KEY (citizen_id)  REFERENCES Citizen(citizen_id),
  CONSTRAINT fk_issue_category  FOREIGN KEY (category_id) REFERENCES Category(category_id),
  CONSTRAINT fk_issue_office    FOREIGN KEY (office_id)   REFERENCES Office(office_id),
  CONSTRAINT fk_issue_location  FOREIGN KEY (location_id) REFERENCES Location(location_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DELIMITER //

CREATE TRIGGER trg_issue_completed_at
BEFORE UPDATE ON Issue
FOR EACH ROW
BEGIN
  IF NEW.current_status = 'resolved' AND (NEW.completed_at IS NULL) THEN
    SET NEW.completed_at = NOW();
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER trg_issue_started_at
BEFORE UPDATE ON Issue
FOR EACH ROW
BEGIN
  IF NEW.current_status = 'in_progress' AND (OLD.current_status = 'pending') AND NEW.started_at IS NULL THEN
    SET NEW.started_at = NOW();
  END IF;
END//

DELIMITER ;


INSERT INTO Issue (category_id, office_id, location_id, citizen_id, description, current_status, reported_at, started_at, completed_at) VALUES
(7, 1, 5,  1, 'Afewtu', 'resolved',    '2023-10-25', '2023-12-07', '2024-01-24'),
(1, 5, 36, 2, 'Wzgdje', 'in_progress', '2022-11-05', '2022-11-06', NULL),
(8, 7, 23, 3, 'Pcsxpm', 'resolved',    '2023-12-14', '2023-12-25', '2024-03-13'),
(2, 6, 3,  4, 'Tjlbji', 'pending',     '2020-04-07', '2020-06-06', '2020-09-01'),
(1, 2, 31, 5, 'Aewgft', 'resolved',    '2021-06-10', '2021-08-17', '2021-09-03'),
(7, 5, 14, 6, 'Duqsyw', 'pending',     '2025-06-03', NULL,          NULL),
(7, 4, 28, 7, 'Nhpsnw', 'in_progress', '2023-09-13', '2023-09-23', NULL),
(8, 3, 32, 8, 'Daycug', 'resolved',    '2024-12-23', '2024-12-31', '2025-04-25'),
(8, 2, 3,  9, 'Mdipfp', 'resolved',    '2021-04-22', '2021-06-12', '2021-08-27'),
(8, 2, 20, 10,'Ivwwuo', 'resolved',    '2022-10-03', '2022-12-11', '2023-02-07'),
(4, 5, 3,  11,'Nextgd', 'resolved',    '2021-01-08', '2021-03-09', '2021-03-24'),
(8, 7, 23, 12,'Vimdkc', 'resolved',    '2021-03-13', '2021-04-23', '2021-06-21'),
(8, 4, 11, 13,'Yhufjy', 'resolved',    '2023-06-04', '2023-06-29', '2023-10-05'),
(6, 7, 23, 14,'Hrnrhk', 'resolved',    '2022-05-14', '2022-06-18', '2022-10-09'),
(1, 8, 24, 15,'Wcdjqz', 'resolved',    '2023-02-21', '2023-04-01', '2023-05-17'),
(8, 3, 2,  16,'Eaonke', 'resolved',    '2024-07-20', '2024-09-19', '2024-11-11'),
(3, 3, 13, 17,'Ciakaz', 'in_progress', '2025-01-02', '2025-01-21', '2025-04-23'),
(8, 7, 29, 18,'Mlunsl', 'in_progress', '2023-02-27', '2023-04-14', NULL),
(1, 8, 2,  19,'Ewsbnb', 'resolved',    '2023-12-12', NULL,          NULL),
(6, 4, 28, 20,'Xrrpvd', 'in_progress', '2022-10-27', '2022-11-20', NULL),
(2, 1, 1,  21,'Gzdqif', 'pending',     '2024-03-08', '2024-03-10', '2024-07-11'),
(7, 1, 34, 22,'Vbqsau', 'resolved',    '2021-05-24', '2021-06-23', '2021-08-29'),
(6, 6, 29, 23,'Ypddbg', 'in_progress', '2022-03-14', '2022-05-06', NULL),
(2, 8, 30, 24,'Oqbjbk', 'resolved',    '2021-08-03', '2021-08-23', '2021-11-17'),
(7, 8, 20, 25,'Srarvr', 'pending',     '2020-10-21', NULL,          NULL),
(1, 6, 37, 26,'Cbedxg', 'resolved',    '2021-03-28', '2021-05-03', '2021-06-19'),
(5, 2, 24, 27,'Ljifkh', 'resolved',    '2020-07-16', '2020-07-30', '2020-11-17'),
(3, 5, 19, 28,'Iolfmz', 'in_progress', '2020-09-19', '2020-10-21', '2021-01-23'),
(5, 2, 10, 29,'Zhnbjg', 'pending',     '2023-01-26', '2023-03-14', '2023-06-21'),
(4, 3, 26, 30,'Vbjcal', 'pending',     '2023-12-28', NULL,          NULL),
(5, 1, 34, 31,'Orauzf', 'in_progress', '2024-08-23', '2024-11-02', NULL),
(1, 3, 14, 32,'Zugnre', 'pending',     '2025-07-29', '2025-09-30', '2025-11-23'),
(4, 4, 18, 33,'Gbafpb', 'in_progress', '2021-09-11', '2021-09-22', '2022-01-30'),
(4, 6, 34, 34,'Ojqnun', 'resolved',    '2022-07-20', '2022-08-03', '2022-11-19'),
(1, 2, 9,  35,'Lieqkp', 'pending',     '2022-06-17', NULL,          NULL),
(3, 6, 7,  36,'Rpyzbq', 'pending',     '2020-01-01', NULL,          NULL),
(6, 7, 26,  1,'Teclsj', 'resolved',    '2022-06-03', '2022-08-14', '2022-08-31'),
(7, 2, 37,  2,'Mljdgi', 'resolved',    '2024-11-16', '2024-12-18', '2025-03-20'),
(4, 4, 7,   3,'Vppdkx', 'in_progress', '2021-12-29', '2022-02-06', NULL),
(1, 1, 30,  4,'Wspolr', 'resolved',    '2022-08-09', '2022-09-11', '2022-12-24'),
(1, 4, 4,   5,'Ahtfwj', 'resolved',    '2023-11-13', '2023-12-19', '2024-04-03'),
(3, 1, 10,  6,'Qktebd', 'resolved',    '2022-10-07', '2022-11-28', '2023-01-04'),
(2, 5, 22,  7,'Lojmbc', 'resolved',    '2023-03-19', '2023-05-28', '2023-08-02'),
(1, 3, 11,  8,'Wqnnnv', 'in_progress', '2021-11-06', '2021-11-28', NULL),
(5, 5, 2,   9,'Elqcvc', 'resolved',    '2020-10-07', '2020-10-24', '2021-01-23'),
(6, 8, 37, 10,'Gtfjwy', 'resolved',    '2022-11-22', '2022-12-14', '2023-04-09'),
(7, 2, 20, 11,'Njselm', 'resolved',    '2020-03-16', '2020-05-19', '2020-07-04'),
(7, 8, 5,  12,'Rlxuza', 'resolved',    '2021-07-12', '2021-08-12', '2021-11-20'),
(8, 8, 32, 13,'Czkbqr', 'resolved',    '2022-04-10', '2022-05-05', '2022-08-09'),
(1, 7, 13, 14,'Buedjf', 'resolved',    '2020-10-02', '2020-11-05', '2021-02-13');


CREATE TABLE Feedback (
  feedback_id  INT PRIMARY KEY AUTO_INCREMENT,
  issue_id     INT                NOT NULL,
  citizen_id   INT                NOT NULL,
  comment      TEXT,
  rating       INT                NOT NULL,
  created_at   DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_feedback_issue   FOREIGN KEY (issue_id)   REFERENCES Issue(issue_id)   ON DELETE    CASCADE,
CONSTRAINT fk_feedback_citizen FOREIGN KEY (citizen_id) REFERENCES Citizen(citizen_id) ON DELETE CASCADE,
CONSTRAINT ck_feedback_rating  CHECK (rating BETWEEN 1 AND 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Feedback (feedback_id, issue_id, citizen_id, comment, rating, created_at) VALUES
(1, 4, 13, 'The road has been under construction for weeks, no visible progress.', 1, '2025-08-23'),
(2, 28, 33, 'Very quick response from the office, thank you!', 5, '2025-03-26'),
(3, 39, 21, 'Streetlights fixed within two days, great job.', 4, '2024-09-02'),
(4, 13, 28, 'The problem was solved but took longer than expected.', 4, '2025-04-17'),
(5, 44, 29, 'Garbage collection service is inconsistent, sometimes delayed.', 3, '2025-07-10'),
(6, 34, 29, 'Flooding issue addressed properly, good communication.', 5, '2024-10-24'),
(7, 32, 13, 'Still waiting for action, nothing has changed so far.', 1, '2025-03-10'),
(8, 45, 11, 'Hospital staff were kind and helpful during the emergency.', 3, '2025-02-05'),
(9, 16, 2, 'Broken traffic lights repaired quickly, very satisfied.', 5, '2024-11-29'),
(10, 16, 20, 'Took too long to resolve, unsafe for pedestrians.', 2, '2024-10-27'),
(11, 22, 30, 'The issue was fixed but I had to call several times.', 3, '2025-01-13'),
(12, 28, 33, 'Quick response and clear updates provided.', 1, '2024-12-27'),
(13, 28, 12, 'Clean-up handled well, no problems anymore.', 5, '2024-10-04'),
(14, 38, 8, 'Waste bins are still overflowing, not resolved.', 1, '2025-02-25'),
(15, 9, 35, 'The police arrived late, but they solved the situation.', 3, '2025-01-29'),
(16, 41, 34, 'Service was acceptable, but could be faster.', 3, '2025-01-20'),
(17, 17, 32, 'Appreciate the updates, though resolution was slow.', 2, '2025-03-28'),
(18, 44, 27, 'Good coordination between offices, well done.', 1, '2025-01-24'),
(19, 47, 12, 'Problem solved on the same day, excellent work!', 5, '2025-06-09'),
(20, 44, 25, 'Communication was poor, had to follow up multiple times.', 4, '2025-05-17');




CREATE TABLE `Media` (
  media_id     INT PRIMARY KEY AUTO_INCREMENT,
  issue_id     INT                NOT NULL,
  url          VARCHAR(255)       NOT NULL,
  caption      VARCHAR(255),
  uploaded_at  DATETIME           NOT NULL DEFAULT CURRENT_TIMESTAMP,

CONSTRAINT fk_media_issue FOREIGN KEY (issue_id) REFERENCES Issue(issue_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO Media (issue_id, url, caption, uploaded_at) VALUES
(1,  'https://imgs.example.com/transport/road-001.jpg',      'Pothole near school entrance #Transportations', '2024-01-15'),
(2,  'https://imgs.example.com/utilities/power-001.jpg',     'Fallen electric pole #Utilities',               '2024-03-03'),
(3,  'https://imgs.example.com/waste/bin-001.jpg',           'Overflowing garbage bins #Waste',               '2024-06-18'),
(4,  'https://imgs.example.com/crime/graffiti-001.jpg',      'Graffiti on community hall #Crimes',            '2024-08-27'),
(5,  'https://imgs.example.com/health/clinic-001.jpg',       'Broken wheelchair ramp #Health',                '2024-09-12'),
(6,  'https://imgs.example.com/accident/sign-001.jpg',       'Damaged stop sign #Accident',                   '2024-10-30'),
(7,  'https://imgs.example.com/env/tree-001.jpg',            'Fallen tree blocking road #Environment',        '2024-11-19'),
(8,  'https://imgs.example.com/disaster/flood-001.jpg',      'Street flooded after storm #Disaster',          '2024-12-05'),
(9,  'https://imgs.example.com/transport/busstop-001.jpg',   'Broken bench at bus stop #Transportations',     '2025-01-14'),
(10, 'https://imgs.example.com/utilities/water-001.jpg',     'Water pipe leakage #Utilities',                 '2025-02-02'),
(11, 'https://imgs.example.com/waste/dump-001.jpg',          'Illegal dumping in alley #Waste',               '2025-02-25'),
(12, 'https://imgs.example.com/crime/light-001.jpg',         'Streetlight not working #Crimes',               '2025-03-08'),
(13, 'https://imgs.example.com/health/park-001.jpg',         'Dirty public restroom #Health',                 '2025-03-21'),
(14, 'https://imgs.example.com/accident/crosswalk-001.jpg',  'Faded crosswalk lines #Accident',               '2025-04-02'),
(15, 'https://imgs.example.com/env/smoke-001.jpg',           'Smoke from burning waste #Environment',         '2025-04-15'),
(16, 'https://imgs.example.com/disaster/wind-001.jpg',       'Roof damaged by strong winds #Disaster',        '2025-05-06'),
(17, 'https://imgs.example.com/transport/bridge-001.jpg',    'Cracks in pedestrian bridge #Transportations',  '2025-05-20'),
(18, 'https://imgs.example.com/utilities/gas-001.jpg',       'Gas leak suspected #Utilities',                 '2025-06-01'),
(19, 'https://imgs.example.com/waste/container-001.jpg',     'Recycling container missing #Waste',            '2025-06-18'),
(20, 'https://imgs.example.com/crime/vandalism-001.jpg',     'Vandalized playground #Crimes',                 '2025-07-02');
