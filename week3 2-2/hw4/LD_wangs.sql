DROP DATABASE IF EXISTS midterm1;
CREATE DATABASE midterm1;
USE midterm1;

CREATE TABLE BlogPost(
	blogText VARCHAR(256),
    blogtitle VARCHAR(64),
    publicationDate DATE NOT NULL,
    blogPostIdentifier INT PRIMARY KEY
);

CREATE TABLE KeyWordPhrase(
	position INT PRIMARY KEY,
    occurrence INT NOT NULL
);

CREATE TABLE Author(
	authorName VARCHAR(64) NOT NULL,
    companyAffiliation VARCHAR(64) NOT NULL,
    emailAddress VARCHAR(64) PRIMARY KEY,
    postID INT,
    FOREIGN KEY (postID) REFERENCES BlogPost(blogPostIdentifier)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

CREATE TABLE Reader(
	readerName VARCHAR(64) NOT NULL,
    emailAddress VARCHAR(64) PRIMARY KEY,
    postID INT,
    FOREIGN KEY (postID) REFERENCES BlogPost(blogPostIdentifier)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

CREATE TABLE Comment(
	commentID INT PRIMARY KEY,
	blogPostComment VARCHAR(256) NOT NULL,
    publicationDate DATE NOT NULL,
    writer VARCHAR(64),
    FOREIGN KEY (writer) REFERENCES Reader(emailAddress)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

CREATE TABLE Topic(
	topicName VARCHAR(64) PRIMARY KEY,
    postID INT,
    isPolitical BOOL,
    keyWord INT,
    FOREIGN KEY (postID) REFERENCES BlogPost(blogPostIdentifier)
    ON UPDATE CASCADE
    ON DELETE SET NULL,
    FOREIGN KEY (keyWord) REFERENCES KeyWordPhrase(position)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

CREATE TABLE AuthorWriteBlog(
	authorID VARCHAR(64),
    blogID INT,
	PRIMARY KEY(authorID, blogID),
    FOREIGN KEY (authorID) REFERENCES Author(emailAddress)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (blogID) REFERENCES BlogPost(blogPostIdentifier)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE ReaderWriteComment(
	readerID VARCHAR(64),
    commentID INT,
    PRIMARY KEY(readerID, commentID),
    FOREIGN KEY (readerID) REFERENCES Reader(emailAddress)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (commentID) REFERENCES Comment(commentID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE BlogHasTopic(
	blogID INT,
    topicID VARCHAR(64),
    PRIMARY KEY(blogID, topicID),
    FOREIGN KEY (blogID) REFERENCES BlogPost(blogPostIdentifier)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (topicID) REFERENCES Topic(topicName)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE TopicHasKeyWord(
	topicID VARCHAR(64),
    keywordID INT,
    PRIMARY KEY(topicID, keywordID),
    FOREIGN KEY (topicID) REFERENCES Topic(topicName)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (keywordID) REFERENCES KeyWordPhrase(position)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE BlogHasComment(
	blogID INT,
    commentID INT,
    PRIMARY KEY(blogID, commentID),
    FOREIGN KEY (blogID) REFERENCES BlogPost(blogPostIdentifier)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (commentID) REFERENCES Comment(commentID)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE ReaderReadBlog(
	readerID VARCHAR(64),
    blogID INT,
    PRIMARY KEY(blogID, readerID),
    FOREIGN KEY (blogID) REFERENCES BlogPost(blogPostIdentifier)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (readerID) REFERENCES Reader(emailAddress)
    ON UPDATE CASCADE
    ON DELETE CASCADE
)






