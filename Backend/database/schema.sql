-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydbmydb` DEFAULT CHARACTER SET utf8mb3 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `passwords` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`followers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`followers` (
  `idfollowers` INT NOT NULL AUTO_INCREMENT,
  `users_idusers` INT NOT NULL,
  PRIMARY KEY (`idfollowers`),
  INDEX `fk_followers_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_followers_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comments` (
  `idcomments` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `body` LONGTEXT NOT NULL,
  `users_idusers` INT NOT NULL,
  PRIMARY KEY (`idcomments`, `users_idusers`),
  INDEX `fk_comments_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`posts` (
  `idposts` INT NOT NULL AUTO_INCREMENT,
  `users_idusers` INT NOT NULL,
  `comments_idcomments` INT NOT NULL,
  `comments_users_idusers` INT NOT NULL,
  PRIMARY KEY (`idposts`, `users_idusers`, `comments_idcomments`, `comments_users_idusers`),
  INDEX `fk_posts_users_idx` (`users_idusers` ASC) VISIBLE,
  INDEX `fk_posts_comments1_idx` (`comments_idcomments` ASC, `comments_users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_posts_users`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_comments1`
    FOREIGN KEY (`comments_idcomments` , `comments_users_idusers`)
    REFERENCES `mydb`.`comments` (`idcomments` , `users_idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`following`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`following` (
  `idfollowing` INT NOT NULL AUTO_INCREMENT,
  `users_idusers` INT NOT NULL,
  PRIMARY KEY (`idfollowing`),
  INDEX `fk_following_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_following_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`likes` (
  `idlikes` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  `posts_idposts` INT NOT NULL,
  `posts_users_idusers` INT NOT NULL,
  `posts_comments_idcomments` INT NOT NULL,
  `posts_comments_users_idusers` INT NOT NULL,
  PRIMARY KEY (`idlikes`, `users_idusers`, `posts_idposts`, `posts_users_idusers`, `posts_comments_idcomments`, `posts_comments_users_idusers`),
  INDEX `fk_likes_users1_idx` (`users_idusers` ASC) VISIBLE,
  INDEX `fk_likes_posts1_idx` (`posts_idposts` ASC, `posts_users_idusers` ASC, `posts_comments_idcomments` ASC, `posts_comments_users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_posts1`
    FOREIGN KEY (`posts_idposts` , `posts_users_idusers` , `posts_comments_idcomments` , `posts_comments_users_idusers`)
    REFERENCES `mydb`.`posts` (`idposts` , `users_idusers` , `comments_idcomments` , `comments_users_idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
