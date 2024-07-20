-- MySQL Script generated by MySQL Workbench
-- Sat Aug 26 20:04:18 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema urbankart
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema urbankart
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `urbankart` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `urbankart` ;

-- -----------------------------------------------------
-- Table `urbankart`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`categories` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `urbankart`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`products` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `exp_date` DATE NULL DEFAULT NULL,
  `image_path` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(20) NOT NULL,
  `price` DOUBLE NOT NULL,
  `stock` INT NULL DEFAULT NULL,
  `category_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id` ASC) VISIBLE,
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9`
    FOREIGN KEY (`category_id`)
    REFERENCES `urbankart`.`categories` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `urbankart`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(25) NULL DEFAULT NULL,
  `last_name` VARCHAR(25) NULL DEFAULT NULL,
  `mobile_number` VARCHAR(10) NOT NULL,
  `password` VARCHAR(300) NOT NULL,
  `role` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_6dotkott2kjsp8vw4d0m25fb7` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `urbankart`.`carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`carts` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `created` DATE NULL DEFAULT NULL,
  `total_items` INT NULL DEFAULT NULL,
  `total_price` DOUBLE NULL DEFAULT NULL,
  `updated` DATE NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKb5o626f86h46m4s7ms6ginnop` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop`
    FOREIGN KEY (`user_id`)
    REFERENCES `urbankart`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `urbankart`.`cart_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`cart_items` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL DEFAULT NULL,
  `total_price` DOUBLE NOT NULL,
  `cart_id` BIGINT NULL DEFAULT NULL,
  `product_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id` ASC) VISIBLE,
  INDEX `FK1re40cjegsfvw58xrkdp6bac6` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6`
    FOREIGN KEY (`product_id`)
    REFERENCES `urbankart`.`products` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c`
    FOREIGN KEY (`cart_id`)
    REFERENCES `urbankart`.`carts` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `urbankart`.`delivery_address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`delivery_address` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `adress_line1` VARCHAR(50) NOT NULL,
  `adress_line2` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  `zip_code` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `urbankart`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`orders` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `delivery_date` DATE NOT NULL,
  `order_date` DATE NOT NULL,
  `shipping_price` DOUBLE NULL DEFAULT NULL,
  `status` VARCHAR(255) NOT NULL,
  `total_price` DOUBLE NOT NULL,
  `address_id` BIGINT NULL DEFAULT NULL,
  `user_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKnxiucb4707442svu8ppyng5md` (`address_id` ASC) VISIBLE,
  INDEX `FK32ql8ubntj5uh44ph9659tiih` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih`
    FOREIGN KEY (`user_id`)
    REFERENCES `urbankart`.`users` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `FKnxiucb4707442svu8ppyng5md`
    FOREIGN KEY (`address_id`)
    REFERENCES `urbankart`.`delivery_address` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `urbankart`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `urbankart`.`order_details` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL DEFAULT NULL,
  `total_price` DOUBLE NULL DEFAULT NULL,
  `order_id` BIGINT NULL DEFAULT NULL,
  `product_id` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id` ASC) VISIBLE,
  INDEX `FK4q98utpd73imf4yhttm3w0eax` (`product_id` ASC) VISIBLE,
  CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax`
    FOREIGN KEY (`product_id`)
    REFERENCES `urbankart`.`products` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk`
    FOREIGN KEY (`order_id`)
    REFERENCES `urbankart`.`orders` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;