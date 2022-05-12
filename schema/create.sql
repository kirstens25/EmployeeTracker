CREATE SCHEMA `employee_cms` ;

CREATE TABLE `employee_cms`.`departments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL,
  PRIMARY KEY (`id`));


ALTER TABLE `employee_cms`.`roles` 
ADD COLUMN `title` VARCHAR(30) NULL AFTER `id`,
ADD COLUMN `salary` DECIMAL NOT NULL AFTER `title`,
ADD COLUMN `department_id` INT UNSIGNED NULL AFTER `salary`,
CHANGE COLUMN `id` `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ;

ALTER TABLE `employee_cms`.`roles` 
ADD CONSTRAINT `department_id`
  FOREIGN KEY (`id`)
  REFERENCES `employee_cms`.`departments` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

CREATE TABLE `employee_cms`.`employees` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(30) NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `role_id` INT UNSIGNED NULL,
  `manager_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);

ALTER TABLE `employee_cms`.`employees` 
ADD INDEX `manager_id_idx` (`role_id` ASC) VISIBLE;

ALTER TABLE `employee_cms`.`employees` 
ADD CONSTRAINT `manager_id`
  FOREIGN KEY (`role_id`)
  REFERENCES `employee_cms`.`roles` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

  ALTER TABLE `employee_cms`.`employees` 
ADD INDEX `employee_id_idx` (`manager_id` ASC) VISIBLE;

ALTER TABLE `employee_cms`.`employees` 
ADD CONSTRAINT `employee_id`
  FOREIGN KEY (`manager_id`)
  REFERENCES `employee_cms`.`employees` (`id`)
  ON DELETE SET NULL
  ON UPDATE NO ACTION;
