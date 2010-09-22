CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `packets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_packets_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `survey_packets` (
  `survey_id` int(11) DEFAULT NULL,
  `packet_id` int(11) DEFAULT NULL,
  KEY `index_surveys_packets_on_survey_id_and_packet_id` (`survey_id`,`packet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `survey_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_taken_id` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `word_id` int(11) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_questions_on_survey_taken_id` (`survey_taken_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `survey_takens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `nr_correct` int(11) DEFAULT NULL,
  `nr_questions` int(11) DEFAULT NULL,
  `current_question` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_survey_takens_on_survey_id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_surveys_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `password_salt` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `original` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `packet_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20100911094020');

INSERT INTO schema_migrations (version) VALUES ('20100912150618');

INSERT INTO schema_migrations (version) VALUES ('20100912150855');

INSERT INTO schema_migrations (version) VALUES ('20100912151239');

INSERT INTO schema_migrations (version) VALUES ('20100920200448');

INSERT INTO schema_migrations (version) VALUES ('20100920200546');

INSERT INTO schema_migrations (version) VALUES ('20100920201337');

INSERT INTO schema_migrations (version) VALUES ('20100920202309');

INSERT INTO schema_migrations (version) VALUES ('20100921194023');