use `nicholas.kunze77`;

CREATE TABLE `jobs_raw2` (
  `my_row_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` text,
  `company` text,
  `description` text,
  `onsite_remote` text,
  `salary` text,
  `location` text,
  `criteria` text,
  `posted_date` text,
  `link` text,
  PRIMARY KEY (`my_row_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4096 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE 'E:/Downloads/jobs/linkedin-jobs-usa.csv'
INTO TABLE jobs_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 lines;

create table company (
	id int NOT NULL auto_increment,
    cname VARCHAR(255),
    PRIMARY KEY(id)
);
create table job_title (
	id int NOT NULL auto_increment,
    title VARCHAR(255),
    PRIMARY KEY(id)
);
create table onsite_remote (
	id int NOT NULL auto_increment,
    val VARCHAR(255),
    PRIMARY KEY(id)
);
create table jobs (
	id int NOT NULL auto_increment,
    title int,
    cid int,
    orid int,
    descr text,
    salary VARCHAR(63),
    location VARCHAR(255),
    criteria VARCHAR(500),
    posted VARCHAR(255),
    link VARCHAR(500),
    PRIMARY KEY(ID),
	FOREIGN KEY (cid) REFERENCES company(id),
	FOREIGN KEY (title) REFERENCES job_title(id),
    FOREIGN KEY (orid) REFERENCES onsite_remote(id)
);

INSERT INTO company (cname)
SELECT DISTINCT company FROM jobs_raw;
select * from company;

INSERT INTO job_title (title)
SELECT DISTINCT title FROM jobs_raw;
select * from job_title;

INSERT INTO onsite_remote (val)
SELECT DISTINCT onsite_remote FROM jobs_raw;
select * from onsite_remote;

INSERT INTO jobs (title, cid, orid, descr, salary, location, criteria, posted, link)
SELECT t.id, c.id, o.id, 
	r.`description`, r.salary, r.location, r.criteria, r.posted_date, r.link
    FROM jobs_raw r, job_title t, company c, onsite_remote o
    WHERE r.title = t.title AND r.company = c.cname AND r.onsite_remote = o.val;

