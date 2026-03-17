
MATCH (s:Solution {solution_id: 1})-[:FIXES]->(i:Issue)
WHERE i.status = 'in_progress'
SET i.status = 'pending'
WITH s
DETACH DELETE s;

MATCH (s:Solution)-[g:GIVES]-(o:Office)
WHERE g.finish_date IS NOT NULL AND g.finish_date.year = 2025
OPTIONAL MATCH (s)<-[r:RATES]-(c:Citizen)
WITH s, g, avg(r.rating) AS avgRating
WITH s, g, avgRating, duration.between(g.start_date, g.finish_date).days AS fixTimeInDays
WITH g.finish_date.month AS month, 
     count(s) AS totalSolutions, 
     avg(fixTimeInDays) AS avgFixTimeDays, 
     avg(avgRating) AS solutionAvgRating, 
     avg(s.cost) AS avgCost
RETURN month, 
       totalSolutions, 
       round(avgFixTimeDays * 100.0) / 100.0 AS avgFixTimeDays, 
       round(solutionAvgRating * 100.0) / 100.0 AS solutionAvgRating, 
       round(avgCost * 100.0) / 100.0 AS avgCost
ORDER BY month ASC;

MATCH (o:Office)-[g:GIVES]->(s:Solution)
WHERE g.finish_date IS NULL
RETURN o.name AS office, count(s) AS totalUnfinishedSolutions
ORDER BY totalUnfinishedSolutions DESC;

MATCH (s:Solution)
WHERE s.cost IS NOT NULL
WITH avg(s.cost) AS globalAvgCost

MATCH (sol:Solution)<-[r:RATES]-(c:Citizen)
WITH globalAvgCost, sol, avg(r.rating) AS avgRating, sol.cost AS cost
WHERE avgRating > 3 AND cost < globalAvgCost

RETURN sol.solution_id, 
       sol.description, 
       cost, 
       round(avgRating * 100.0) / 100.0 AS avgRating,
       round(globalAvgCost * 100.0) / 100.0 AS globalAverageCost
ORDER BY cost ASC, avgRating DESC;

MATCH (i:Issue)
WHERE i.status = 'pending'
  AND i.latitude > 13.98 AND i.latitude < 14.00
  AND i.longitude > 100.61 AND i.longitude < 100.63
RETURN count(i) AS issuesInArea;

MATCH (o:Office)-[g:GIVES]->(s:Solution)
WHERE g.start_date IS NOT NULL
MATCH (s)-[:FIXES]->(i:Issue)
WHERE i.report_date IS NOT NULL
WITH o, s, g, min(i.report_date) AS oldest_report_date
WITH o, duration.inDays(date(oldest_report_date), date(g.start_date)).days AS open_days
RETURN 
    o.name AS office_name,
    round(avg(open_days), 2) AS average_reaction_time_days, 
    count(o) AS total_solutions_analyzed
ORDER BY average_reaction_time_days ASC

MATCH (o:Office)-[:GIVES]->(s:Solution)<-[r:RATES]-(c:Citizen)
WHERE r.feedback_date IS NOT NULL 
  AND date(r.feedback_date) >= date() - duration('P3M')
WITH o, avg(r.rating) AS avg_rating, count(r) AS total_ratings
RETURN 
  o.name AS office_name,
  round(avg_rating, 2) AS average_rating_last_3_months,
  total_ratings
ORDER BY average_rating_last_3_months DESC

MATCH (o:Office)-[:GIVES]->(s:Solution)<-[r:RATES]-(:Citizen)
WHERE r.rating IS NOT NULL
WITH o, avg(r.rating) AS avg_rating, count(r) AS total_ratings
RETURN 
  o.name AS office_name,
  round(avg_rating, 2) AS average_rating,
  total_ratings
ORDER BY average_rating ASC
LIMIT 1

MATCH (o:Office), (i:Issue)
WHERE i.issue_id = 1 
  AND o.name = "Mueang Pathum Thani Public Health Office"
MERGE (s:Solution {solution_id: 26})
SET 
  s.description = "The health care team will go to that area to check and manage to solve the problem"
MERGE (o)-[g:GIVES {start_date: date()}]->(s)
MERGE (s)-[f:FIXES]->(i)
RETURN o, g, f, i, s
MATCH (i:Issue)
WHERE i.issue_id = 1
SET i.status = 'pending', i.status = 'in_progress'
RETURN i

MATCH (c:Citizen)-[r:RATES]->(s:Solution)
Where c.first_name = 'Nipa'AND c.thai_id = "1100701234600"
DELETE r

:param {solution_id: 1}
MATCH (o:Office)-[g:GIVES]->(s:Solution)-[:FIXES]->(i:Issue)
WHERE s.solution_id = $solution_id AND i.status = 'in_progress'
SET g.finish_date = date()
SET i.status = 'resolved'
RETURN s.solution_id AS solutionId,
       s.description AS solutionDescription,
       i.issue_id AS issueId,
       i.note AS issueNote,
       i.status AS newStatus,
       g.finish_date AS finishDate

MATCH (o:Office)-[g:GIVES]->(s:Solution)
WHERE g.finish_date IS NULL
RETURN s.solution_id AS SolutionID, 
       s.description AS Description, 
       g.start_date AS StartDate
ORDER BY g.start_date ASC
LIMIT 5

MATCH (o:Office)-[g:GIVES]->(s:Solution)
WHERE g.finish_date IS NOT NULL 
      AND g.finish_date.year = date().year
WITH o.name AS OfficeName, count(s) AS FinishedSolutions
WITH max(FinishedSolutions) AS maxCount
MATCH (o:Office)-[g:GIVES]->(s:Solution)
WHERE g.finish_date IS NOT NULL 
      AND g.finish_date.year = date().year
WITH o.name AS OfficeName, count(s) AS FinishedSolutions, maxCount
WHERE FinishedSolutions = maxCount
RETURN OfficeName, FinishedSolutions

MATCH (c:Citizen)-[r:RATES]->(s:Solution)
WITH s, avg(r.rating) AS AverageRating
WHERE AverageRating < 2.5
RETURN s.solution_id AS SolutionID, 
       s.description AS Description, 
       AverageRating

MATCH (s:Solution)
WHERE s.cost > 20000
RETURN s.solution_id AS SolutionID, 
       s.description AS Description, 
       s.cost AS Cost

MATCH (c:Citizen {thai_id: '1100701234580'})
CREATE (i:Issue 
{ issue_id: 51, 
category: 'Crimes', 
note: 'Suspicious activity at night market in Khlong Luang', media: 'https://example.com/images/new_report.jpg', 
longitude: 100.6301, 
latitude: 14.0351, status: 'pending', report_date: date() })
CREATE (c)-[r:REPORTS]->(i) 
RETURN c, r, i

MATCH (s:Solution)<-[:RATES]-(c:Citizen)
WITH s, COUNT(c) AS feedback_count
ORDER BY feedback_count DESC
LIMIT 1
RETURN s, feedback_count;

MATCH (c:Citizen)-[r:RATES]->(s:Solution)
WITH date(r.feedback_date) AS dt, c
RETURN dt.year AS year, dt.month AS month, COUNT(DISTINCT c) AS citizens_who_rated
ORDER BY year, month;

MATCH (c:Citizen)
OPTIONAL MATCH (c)-[:REPORTS]->(i:Issue) 
WHERE i.report_date.year = 2025 WITH c, COUNT(i) AS issuesReported
OPTIONAL MATCH (c)-[f:RATES]->(s:Solution) 
WHERE f.feedback_date.year = 2025 
WITH c, issuesReported, COUNT(f) AS feedbackGiven 
RETURN c.first_name + ' ' + c.last_name AS citizen, 	issuesReported, 	feedbackGiven, 	(issuesReported + feedbackGiven) 
AS totalActivity 
ORDER BY totalActivity DESC LIMIT 10;

MATCH (o:Office)-[g:GIVES]->(s:Solution)
WHERE g.finish_date IS NOT NULL AND s.cost IS NOT NULL
WITH o.name AS office,
 	g.finish_date AS finishDate,
 	s.cost AS cost
WITH office,
 	date(finishDate).year AS year,
 	date(finishDate).month AS month,
 	SUM(cost) AS totalCost
RETURN office, year, month, totalCost
ORDER BY office, year, month;


