-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 17-11-2015 a las 18:53:01
-- Versión del servidor: 5.5.46-0ubuntu0.14.04.2
-- Versión de PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `armadillo`
--
CREATE DATABASE IF NOT EXISTS `armadillo` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `armadillo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `id_album` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_status_id` bigint(20) NOT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `album_type` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_album`),
  KEY `album_owner` (`owner`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=141 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `api_login`
--

DROP TABLE IF EXISTS `api_login`;
CREATE TABLE IF NOT EXISTS `api_login` (
  `id_api_login` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(15) NOT NULL,
  `access_token` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_api_login`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=401 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) NOT NULL DEFAULT '',
  `to` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `recd` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=224 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
CREATE TABLE IF NOT EXISTS `chatroom` (
  `chatroom_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`chatroom_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=178 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id_contacts` bigint(20) NOT NULL AUTO_INCREMENT,
  `contact_owner_id` bigint(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `comp_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_contacts`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacts_grabbed`
--

DROP TABLE IF EXISTS `contacts_grabbed`;
CREATE TABLE IF NOT EXISTS `contacts_grabbed` (
  `id_contacts_grabbed` bigint(5) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL,
  `owner_email` varchar(100) NOT NULL,
  `contact_name` varchar(300) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_contacts_grabbed`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1496 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `follow_connection`
--

DROP TABLE IF EXISTS `follow_connection`;
CREATE TABLE IF NOT EXISTS `follow_connection` (
  `id_follow_connection` int(5) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) NOT NULL,
  `follower` bigint(20) NOT NULL,
  `owner_read` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_follow_connection`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friend_connection`
--

DROP TABLE IF EXISTS `friend_connection`;
CREATE TABLE IF NOT EXISTS `friend_connection` (
  `id_friend_connection` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) DEFAULT NULL,
  `friend` bigint(20) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_friend_connection`),
  KEY `friend_conection_owner` (`owner`),
  KEY `friend_conection_friend` (`friend`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
CREATE TABLE IF NOT EXISTS `friend_request` (
  `id_friend_request` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_friend_request`),
  KEY `friend_request_sender` (`sender`),
  KEY `friend_request_receiver` (`receiver`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message_pad`
--

DROP TABLE IF EXISTS `message_pad`;
CREATE TABLE IF NOT EXISTS `message_pad` (
  `id_message_pad` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` bigint(20) DEFAULT NULL,
  `receiver` bigint(20) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `privacy` tinyint(1) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  `read` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_message_pad`),
  KEY `message_pad_sender` (`sender`),
  KEY `message_pad_receiver` (`receiver`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `page_visits`
--

DROP TABLE IF EXISTS `page_visits`;
CREATE TABLE IF NOT EXISTS `page_visits` (
  `id_page_visits` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `page` varchar(45) DEFAULT NULL,
  `visited_user` bigint(20) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_page_visits`),
  KEY `id_user_visited` (`visited_user`),
  KEY `id_user_visitor` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5750 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id_photo` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) DEFAULT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `photo_album_id` (`album_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poke`
--

DROP TABLE IF EXISTS `poke`;
CREATE TABLE IF NOT EXISTS `poke` (
  `id_pokes` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id_pokes`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_comment`
--

DROP TABLE IF EXISTS `status_comment`;
CREATE TABLE IF NOT EXISTS `status_comment` (
  `id_status_comment` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id` bigint(20) DEFAULT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `comment_message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_status_comment`),
  KEY `status_comment_status_id` (`status_id`),
  KEY `status_comment_owner` (`owner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=297 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_likes`
--

DROP TABLE IF EXISTS `status_likes`;
CREATE TABLE IF NOT EXISTS `status_likes` (
  `id_status_likes` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` bigint(20) DEFAULT NULL,
  `owner` bigint(20) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_status_likes`),
  KEY `status_likes_status_id` (`status_id`),
  KEY `status_likes_owner_uid` (`owner`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=143 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_post`
--

DROP TABLE IF EXISTS `status_post`;
CREATE TABLE IF NOT EXISTS `status_post` (
  `id_status_post` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) DEFAULT NULL,
  `sender` bigint(20) NOT NULL,
  `status_message` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `video` varchar(45) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `like_count` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id_status_post`),
  KEY `status_post_owner` (`owner`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=317 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_users` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(45) DEFAULT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `email_active` tinyint(1) DEFAULT '1',
  `mobile_active` tinyint(1) DEFAULT '1',
  `admin_ban` tinyint(1) NOT NULL DEFAULT '0',
  `email_key` varchar(45) DEFAULT NULL,
  `mobile_key` varchar(5) DEFAULT NULL,
  `pwd_reset_key` varchar(50) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `register_ip` varchar(25) DEFAULT NULL,
  `privacy` tinyint(1) DEFAULT '0',
  `about` varchar(1000) DEFAULT NULL,
  `ping` timestamp NULL DEFAULT NULL,
  `chatroom_ping` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `referal` bigint(20) DEFAULT NULL,
  `access_token` varchar(45) DEFAULT NULL,
  `theme_type` tinyint(1) NOT NULL,
  `theme_bodybg` varchar(6) NOT NULL,
  `theme_contbg` varchar(6) NOT NULL,
  `theme_font` varchar(6) NOT NULL,
  `theme_link` varchar(6) NOT NULL,
  `theme_highlight` varchar(6) NOT NULL,
  `theme_imgtype` tinyint(1) NOT NULL,
  `theme_imgrepeat` varchar(10) NOT NULL,
  `theme_imgattachment` varchar(10) NOT NULL,
  `theme_imgposition` varchar(10) NOT NULL,
  `facebook_id` varchar(20) NOT NULL,
  `facebook_access_token` varchar(300) NOT NULL,
  `twitter_id` varchar(50) NOT NULL,
  `twitter_oauth_token` varchar(100) NOT NULL,
  `twitter_oauth_token_secret` varchar(100) NOT NULL,
  `openid_identity` varchar(500) NOT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `session_id_UNIQUE` (`session_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=151 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE IF NOT EXISTS `user_login` (
  `id_user_login` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user_login`),
  KEY `user_login_user` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1054 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_reserve`
--

DROP TABLE IF EXISTS `user_reserve`;
CREATE TABLE IF NOT EXISTS `user_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `web_login`
--

DROP TABLE IF EXISTS `web_login`;
CREATE TABLE IF NOT EXISTS `web_login` (
  `id_web_login` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(15) NOT NULL,
  `access_token` varchar(100) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `validity` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_web_login`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=203 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `world`
--

DROP TABLE IF EXISTS `world`;
CREATE TABLE IF NOT EXISTS `world` (
  `id_world` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` bigint(20) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_world`),
  KEY `world_item_id` (`item_id`),
  KEY `world_owner` (`owner`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `world_item`
--

DROP TABLE IF EXISTS `world_item`;
CREATE TABLE IF NOT EXISTS `world_item` (
  `id_world_item` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_world_item`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `friend_request`
--
ALTER TABLE `friend_request`
  ADD CONSTRAINT `friend_request_receiver` FOREIGN KEY (`receiver`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `friend_request_sender` FOREIGN KEY (`sender`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `message_pad`
--
ALTER TABLE `message_pad`
  ADD CONSTRAINT `message_pad_receiver` FOREIGN KEY (`receiver`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `message_pad_sender` FOREIGN KEY (`sender`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `page_visits`
--
ALTER TABLE `page_visits`
  ADD CONSTRAINT `id_user_visited` FOREIGN KEY (`visited_user`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_user_visitor` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `status_comment`
--
ALTER TABLE `status_comment`
  ADD CONSTRAINT `status_comment_owner` FOREIGN KEY (`owner`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `status_comment_status_id` FOREIGN KEY (`status_id`) REFERENCES `status_post` (`id_status_post`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `status_post`
--
ALTER TABLE `status_post`
  ADD CONSTRAINT `status_post_owner` FOREIGN KEY (`owner`) REFERENCES `users` (`id_users`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
