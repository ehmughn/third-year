# Student Registration

## Overview
Simple registration and table display.

## Database Setup
Just run these in SQL:
```
CREATE DATABASE db_student_registration;
```
```
USE db_student_registration;
```

```
CREATE TABLE `db_student_registration`.`tbl_students` (`id` INT NULL AUTO_INCREMENT , `first_name` VARCHAR(100) NULL , `middle_name` VARCHAR(100) NOT NULL , `last_name` VARCHAR(100) NULL , `birthday` DATE NULL , `section` VARCHAR(10) NULL , `date_updated` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`id`)) ENGINE = InnoDB;
```

## Running the Project
Download the folder and Paste on ``xampp/htdocs``, Run ``xampp``, Type ``localhost/student-registration`` in any browser.
