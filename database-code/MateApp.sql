
CREATE DATABASE `MateApp`;
USE `MateApp`;

/*User accounts*/
CREATE TABLE `user_account` (
  `id` int NOT NULL,
  `first_name` varchar(64),
  `last_name` varchar(64),
  `gender_id` int,
  `details` text,
  `nickname` varchar(64),
  `email` varchar(128) NOT NULL,
  `confirmation_code` text NOT NULL,
  `confirmation_time` timestamp,
  `popularity` decimal(5,2),
  primary key (id)
) ENGINE=InnoDB;



CREATE TABLE `interested_in_gender` (
  `id` int,
  `user_account_id` int,
  `gender_id` int,
  primary key (id)
) ENGINE=InnoDB;




CREATE TABLE `gender`(
  `id` int,
  `name` varchar(32),
  primary key (id)
) ENGINE=InnoDB;

CREATE TABLE `user_photo`(
  `id` int,
  `user_account_id` int,
  `link` text,
  `details` text NOT NULL,
  `time_added` timestamp,
  `active` bool, 
  primary key (id)
) ENGINE=InnoDB;



CREATE TABLE `interested_in_relation`(
  `id` int,
  `user_account_id` int,
  `relationship_type_id` int,
  primary key (id)
)ENGINE=InnoDB;




CREATE TABLE `relationship_type`(
  `id` int,
  `name` varchar(32),
  primary key (id)
) ENGINE=InnoDB;


/*Grades & blocks*/

CREATE TABLE `grade`(
  `id` int,
  `user_account_id_given` int,
  `user_account_id_received` int,
  `grade` int,
  primary key (id)
) ENGINE=InnoDB;




CREATE TABLE `block_user`(
  `id` int,
  `user_account_id` int,
  `user_account_id_blocked` int,
  primary key (id)
) ENGINE=InnoDB;



/*Conversations*/

CREATE TABLE `conversation`(
  `id` int,
  `user_account_id` int,
  `time_started` timestamp,
  `time_closed` timestamp NOT NULL,
  primary key (id)
) ENGINE=InnoDB;




CREATE TABLE `participant`(
  `id` int,
  `conversation_id` int,
  `user_account_id` int,
  `time_joined` timestamp,
  `time_left` timestamp NOT NULL,
  primary key (id)
) ENGINE=InnoDB;


CREATE TABLE `message`(
  `id` int,
  `participant_id` int,
  `message_text` text,
  `ts` timestamp,
  primary key (id)
)ENGINE=InnoDB;


ALTER TABLE `user_account` ADD FOREIGN KEY (gender_id) REFERENCES gender (id); 

ALTER TABLE `interested_in_gender` ADD FOREIGN KEY (user_account_id) REFERENCES user_account (id);

ALTER TABLE `user_photo` ADD FOREIGN KEY (user_account_id) REFERENCES user_account (id);

ALTER TABLE `interested_in_relation` ADD FOREIGN KEY (user_account_id) REFERENCES user_account (id);

ALTER TABLE `interested_in_relation` ADD FOREIGN KEY (relationship_type_id) REFERENCES relationship_type (id);

ALTER TABLE `grade` ADD FOREIGN KEY (user_account_id_given) REFERENCES user_account (id);

ALTER TABLE `grade` ADD FOREIGN KEY (user_account_id_received) REFERENCES user_account (id);

ALTER TABLE `block_user` ADD FOREIGN KEY (user_account_id) REFERENCES user_account (id);

ALTER TABLE `block_user` ADD FOREIGN KEY (user_account_id_blocked) REFERENCES user_account (id);

ALTER TABLE `conversation` ADD FOREIGN KEY (user_account_id) REFERENCES user_account (id);

ALTER TABLE `participant` ADD FOREIGN KEY (conversation_id) REFERENCES conversation (id);

ALTER TABLE `participant` ADD FOREIGN KEY (user_account_id) REFERENCES user_account (id);

ALTER TABLE `message` ADD FOREIGN KEY (participant_id) REFERENCES participant (id);

