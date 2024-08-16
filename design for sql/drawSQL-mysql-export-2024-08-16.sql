CREATE TABLE `Teams`(
    `team_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `team_name` VARCHAR(255) NULL,
    `league` VARCHAR(255) NOT NULL,
    `city` VARCHAR(255) NOT NULL,
    `logo_url` VARCHAR(255) NOT NULL,
    `sport_type` VARCHAR(255) NOT NULL
);
CREATE TABLE `Users`(
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `profile_pic_url` VARCHAR(255) NULL
);
ALTER TABLE
    `Users` ADD UNIQUE `users_username_unique`(`username`);
ALTER TABLE
    `Users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `Games`(
    `game_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `team_id` BIGINT NOT NULL,
    `opponent` VARCHAR(255) NOT NULL,
    `game_date` DATE NOT NULL,
    `home_or_away` ENUM('' home '', '' away '') NOT NULL,
    `result` ENUM('' win '', '' loss '', '' draw '', '' active '') NOT NULL,
    `score` INT NOT NULL
);
CREATE TABLE `User_Teams`(
    `user_team_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `team_id` BIGINT NOT NULL
);
ALTER TABLE
    `User_Teams` ADD CONSTRAINT `user_teams_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `Teams`(`team_id`);
ALTER TABLE
    `User_Teams` ADD CONSTRAINT `user_teams_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `Users`(`user_id`);
ALTER TABLE
    `Games` ADD CONSTRAINT `games_team_id_foreign` FOREIGN KEY(`team_id`) REFERENCES `Teams`(`team_id`);