-- ============================================
-- GAMERANK
-- Esports Tournament and Player Ranking Management System
-- ============================================
CREATE DATABASE GameRank;

USE GameRank;

-- STEP 2: CREATE PLAYERS TABLE

CREATE TABLE Players (
player_id INT PRIMARY KEY AUTO_INCREMENT,
player_name VARCHAR(100) NOT NULL,
game_name VARCHAR(50) NOT NULL,
team_name VARCHAR(100),
country VARCHAR(50),
total_points INT DEFAULT 0
);

-- STEP 3: CREATE TEAMS TABLE

CREATE TABLE Teams (
team_id INT PRIMARY KEY AUTO_INCREMENT,
team_name VARCHAR(100) NOT NULL UNIQUE,
game_name VARCHAR(50),
country VARCHAR(50)
);

-- STEP 4: CREATE TOURNAMENTS TABLE

CREATE TABLE Tournaments (
tournament_id INT PRIMARY KEY AUTO_INCREMENT,
tournament_name VARCHAR(100) NOT NULL,
game_name VARCHAR(50) NOT NULL,
tournament_date DATE,
prize_pool DECIMAL(10,2),
status VARCHAR(20) DEFAULT 'Upcoming'
);

-- STEP 5: CREATE REGISTRATIONS TABLE

CREATE TABLE Registrations (
registration_id INT PRIMARY KEY AUTO_INCREMENT,
player_id INT NOT NULL,
tournament_id INT NOT NULL,
registration_date DATE,
FOREIGN KEY (player_id)
REFERENCES Players(player_id),
FOREIGN KEY (tournament_id)
REFERENCES Tournaments(tournament_id),
UNIQUE (player_id, tournament_id)
);

-- STEP 6: CREATE MATCH RESULTS TABLE

CREATE TABLE MatchResults (
result_id INT PRIMARY KEY AUTO_INCREMENT,
tournament_id INT NOT NULL,
player_id INT NOT NULL,
matches_played INT DEFAULT 0,
matches_won INT DEFAULT 0,
points_earned INT DEFAULT 0,
final_position INT,
FOREIGN KEY (tournament_id)
REFERENCES Tournaments(tournament_id),
FOREIGN KEY (player_id)
REFERENCES Players(player_id)
);

-- STEP 7: INSERT 20 PLAYERS

INSERT INTO Players
(player_name, game_name, team_name, country, total_points)
VALUES
('Aarav Sharma', 'BGMI', 'Team Alpha', 'India', 150),
('Rohan Verma', 'Valorant', 'Team Beta', 'India', 200),
('Priya Singh', 'BGMI', 'Team Alpha', 'India', 180),
('Rahul Kumar', 'Valorant', 'Team Gamma', 'India', 120),
('Ananya Patel', 'BGMI', 'Team Delta', 'India', 220),
('Vikram Singh', 'CS2', 'Team Omega', 'India', 175),
('Neha Gupta', 'Valorant', 'Team Beta', 'India', 240),
('Arjun Mehta', 'BGMI', 'Team Delta', 'India', 190),
('Sneha Reddy', 'CS2', 'Team Sigma', 'India', 210),
('Karan Malhotra', 'Valorant', 'Team Gamma', 'India', 160),
('Ishita Jain', 'BGMI', 'Team Alpha', 'India', 230),
('Aditya Rao', 'CS2', 'Team Omega', 'India', 140),
('Meera Nair', 'Valorant', 'Team Beta', 'India', 195),
('Kabir Das', 'BGMI', 'Team Delta', 'India', 205),
('Pooja Shah', 'CS2', 'Team Sigma', 'India', 185),
('Dev Kapoor', 'Valorant', 'Team Gamma', 'India', 250),
('Simran Kaur', 'BGMI', 'Team Alpha', 'India', 170),
('Yash Thakur', 'CS2', 'Team Omega', 'India', 225),
('Tanya Bose', 'Valorant', 'Team Beta', 'India', 155),
('Manav Joshi', 'BGMI', 'Team Delta', 'India', 215);

-- STEP 8: INSERT 10 TEAMS

INSERT INTO Teams
(team_name, game_name, country)
VALUES
('Team Alpha', 'BGMI', 'India'),
('Team Beta', 'Valorant', 'India'),
('Team Gamma', 'Valorant', 'India'),
('Team Delta', 'BGMI', 'India'),
('Team Omega', 'CS2', 'India'),
('Team Sigma', 'CS2', 'India'),
('Team Phoenix', 'BGMI', 'India'),
('Team Titans', 'Valorant', 'India'),
('Team Warriors', 'CS2', 'India'),
('Team Legends', 'BGMI', 'India');

-- STEP 9: INSERT 10 TOURNAMENTS

INSERT INTO Tournaments
(tournament_name, game_name, tournament_date, prize_pool, status)
VALUES
('BGMI Championship', 'BGMI', '2026-11-15', 50000, 'Upcoming'),
('Valorant Masters', 'Valorant', '2026-12-01', 75000, 'Upcoming'),
('Winter Esports Cup', 'BGMI', '2026-10-10', 30000, 'Completed'),
('CS2 Pro League', 'CS2', '2026-11-20', 60000, 'Upcoming'),
('National Gaming Cup', 'BGMI', '2026-12-10', 45000, 'Upcoming'),
('Valorant Elite Cup', 'Valorant', '2026-12-15', 80000, 'Upcoming'),
('Summer Gaming League', 'CS2', '2026-09-15', 35000, 'Completed'),
('India Esports Open', 'BGMI', '2026-11-25', 55000, 'Upcoming'),
('Champions Arena', 'Valorant', '2026-10-05', 90000, 'Completed'),
('Pro Gamers Tournament', 'CS2', '2026-12-20', 70000, 'Upcoming');

-- STEP 10: INSERT 30 REGISTRATIONS

INSERT INTO Registrations
(player_id, tournament_id, registration_date)
VALUES
(1, 1, '2026-10-20'),
(2, 2, '2026-10-20'),
(3, 1, '2026-10-21'),
(4, 2, '2026-10-21'),
(5, 5, '2026-10-22'),
(6, 4, '2026-10-22'),
(7, 2, '2026-10-23'),
(8, 1, '2026-10-23'),
(9, 4, '2026-10-23'),
(10, 6, '2026-10-24'),
(11, 5, '2026-10-24'),
(12, 7, '2026-09-01'),
(13, 6, '2026-10-24'),
(14, 8, '2026-10-24'),
(15, 4, '2026-10-24'),
(16, 7, '2026-09-20'),
(17, 1, '2026-10-25'),
(18, 10, '2026-10-25'),
(19, 6, '2026-10-25'),
(20, 8, '2026-10-25'),
(1, 3, '2026-09-20'),
(3, 3, '2026-09-21'),
(6, 7, '2026-09-02'),
(9, 7, '2026-09-03'),
(12, 4, '2026-10-26'),
(15, 7, '2026-09-04'),
(2, 6, '2026-10-26'),
(7, 9, '2026-09-15'),
(11, 8, '2026-10-26'),
(18, 4, '2026-10-27');

-- STEP 11: INSERT 30 MATCH RESULTS

INSERT INTO MatchResults
(tournament_id, player_id, matches_played,
matches_won, points_earned, final_position)
VALUES
(3, 1, 5, 3, 100, 2),
(2, 2, 6, 4, 200, 1),
(3, 3, 5, 4, 150, 1),
(2, 4, 6, 2, 80, 3),
(5, 5, 4, 3, 120, 2),
(4, 6, 7, 5, 180, 1),
(2, 7, 6, 5, 220, 1),
(1, 8, 5, 3, 130, 3),
(4, 9, 7, 4, 160, 2),
(6, 10, 5, 3, 140, 3),
(5, 11, 4, 4, 190, 1),
(7, 12, 6, 2, 90, 4),
(6, 13, 5, 3, 170, 2),
(8, 14, 4, 3, 150, 2),
(4, 15, 7, 3, 110, 3),
(9, 16, 6, 5, 250, 1),
(1, 17, 5, 2, 100, 4),
(10, 18, 6, 4, 210, 1),
(6, 19, 5, 3, 135, 3),
(8, 20, 4, 2, 95, 4),
(3, 1, 5, 3, 110, 2),
(3, 3, 5, 4, 160, 1),
(7, 6, 6, 4, 175, 2),
(7, 9, 6, 5, 200, 1),
(4, 12, 7, 3, 125, 3),
(7, 15, 6, 2, 85, 4),
(6, 2, 5, 4, 190, 1),
(9, 7, 6, 4, 205, 2),
(8, 11, 4, 3, 145, 2),
(4, 18, 7, 5, 230, 1);

-- STEP 12: DISPLAY ALL TABLES

SHOW TABLES;

-- STEP 13: DISPLAY ALL PLAYERS

SELECT * FROM Players;

-- STEP 14: DISPLAY ALL TEAMS

SELECT * FROM Teams;

-- STEP 15: DISPLAY ALL TOURNAMENTS

SELECT * FROM Tournaments;

-- STEP 16: DISPLAY ALL REGISTRATIONS

SELECT * FROM Registrations;

-- STEP 17: DISPLAY ALL MATCH RESULTS

SELECT * FROM MatchResults;

-- STEP 18: DISPLAY PLAYERS BY POINTS

SELECT player_name, game_name, total_points
FROM Players
ORDER BY total_points DESC;

-- STEP 19: DISPLAY PLAYERS WITH MORE THAN 180 POINTS

SELECT player_name, game_name, total_points
FROM Players
WHERE total_points > 180;

-- STEP 20: COUNT PLAYERS IN EACH GAME

SELECT game_name, COUNT(*) AS total_players
FROM Players
GROUP BY game_name;

-- STEP 21: COUNT REGISTRATIONS IN EACH TOURNAMENT

SELECT T.tournament_name,
COUNT(R.registration_id) AS total_registrations
FROM Tournaments T
LEFT JOIN Registrations R
ON T.tournament_id = R.tournament_id
GROUP BY T.tournament_id, T.tournament_name;

-- STEP 22: DISPLAY PLAYER TOURNAMENT REGISTRATIONS

SELECT P.player_name,
T.tournament_name,
R.registration_date
FROM Registrations R
JOIN Players P
ON R.player_id = P.player_id
JOIN Tournaments T
ON R.tournament_id = T.tournament_id;

-- STEP 23: DISPLAY MATCH RESULTS

SELECT P.player_name,
T.tournament_name,
M.matches_played,
M.matches_won,
M.points_earned,
M.final_position
FROM MatchResults M
JOIN Players P
ON M.player_id = P.player_id
JOIN Tournaments T
ON M.tournament_id = T.tournament_id;

-- STEP 24: FIND THE HIGHEST-SCORING PLAYER

SELECT player_name, game_name, total_points
FROM Players
ORDER BY total_points DESC
LIMIT 1;

-- STEP 25: FIND AVERAGE PLAYER POINTS

SELECT AVG(total_points) AS average_points
FROM Players;

-- STEP 26: FIND PLAYERS WITH ABOVE-AVERAGE POINTS

SELECT player_name, total_points
FROM Players
WHERE total_points > (
SELECT AVG(total_points)
FROM Players
);

-- STEP 27: CREATE PLAYER RANKINGS VIEW

CREATE VIEW PlayerRankings AS
SELECT player_id,
player_name,
game_name,
team_name,
total_points,
RANK() OVER (
PARTITION BY game_name
ORDER BY total_points DESC
) AS player_rank
FROM Players;

-- STEP 28: DISPLAY PLAYER RANKINGS

SELECT * FROM PlayerRankings;

-- STEP 29: CREATE INDEX

CREATE INDEX idx_game_points
ON Players(game_name, total_points);

-- STEP 30: VERIFY RECORD COUNTS

SELECT COUNT(*) AS total_players FROM Players;

SELECT COUNT(*) AS total_teams FROM Teams;

SELECT COUNT(*) AS total_tournaments FROM Tournaments;

SELECT COUNT(*) AS total_registrations FROM Registrations;

SELECT COUNT(*) AS total_match_results FROM MatchResults;
