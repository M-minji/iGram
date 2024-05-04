USE igramv1;

CREATE TABLE user (
      user_id BIGINT AUTO_INCREMENT PRIMARY KEY,
      user_name VARCHAR(10) NOT NULL,
      uid VARCHAR(20) NOT NULL UNIQUE,
      upw VARCHAR(20) NOT NULL,
      created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE board (
       board_id BIGINT AUTO_INCREMENT PRIMARY KEY,
       writer_id BIGINT NOT NULL,
       title VARCHAR(30) NOT NULL,
       contents VARCHAR(100) NOT NULL,
       created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
       updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
       FOREIGN KEY (writer_id) REFERENCES user (user_id)
);

CREATE TABLE comment (
         comment_id BIGINT AUTO_INCREMENT PRIMARY KEY,
         writer_id BIGINT NOT NULL,
         board_id BIGINT NOT NULL,
         contents VARCHAR(100) NOT NULL,
         created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
         updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,
         FOREIGN KEY (writer_id) REFERENCES user (user_id),
         FOREIGN KEY (board_id) REFERENCES board (board_id)
);