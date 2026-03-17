USE project_1;

INSERT Issue (citizen_id, category_id, office_id, location_id, description, current_status, 
reported_at, started_at, completed_at) values 
(1, 3, 4, 32, 'feowejwiew', 'pending', '2025-08-03', NULL, NULL);

SELECT 
    l.district,
    SUM(CASE WHEN i.category_id = 1 THEN 1 ELSE 0 END) AS Transportation,
    SUM(CASE WHEN i.category_id = 2 THEN 1 ELSE 0 END) AS Utilities,
    SUM(CASE WHEN i.category_id = 3 THEN 1 ELSE 0 END) AS Waste,
    SUM(CASE WHEN i.category_id = 4 THEN 1 ELSE 0 END) AS Crimes,
    SUM(CASE WHEN i.category_id = 5 THEN 1 ELSE 0 END) AS Health,
    SUM(CASE WHEN i.category_id = 6 THEN 1 ELSE 0 END) AS Accident,
    SUM(CASE WHEN i.category_id = 7 THEN 1 ELSE 0 END) AS Environment,
    SUM(CASE WHEN i.category_id = 8 THEN 1 ELSE 0 END) AS Disaster
FROM Issue i
JOIN Location l on l.location_id = i.location_id
JOIN Category c on c.category_id = i.category_id
GROUP BY l.district
ORDER BY l.district;

SELECT rating, COUNT(rating) AS total_rating
FROM Feedback 
GROUP BY  rating
ORDER BY rating ASC;

SELECT 
    i.issue_id,
    c.category_name,
    l.district,
    i.current_status,
    DATEDIFF(CURDATE(), i.reported_at) AS days_open
FROM Issue i
JOIN Location l ON i.location_id = l.location_id
JOIN Category c ON c.category_id = i.category_id
WHERE i.current_status != 'resolved'
ORDER BY days_open DESC
LIMIT 5;

SELECT o.office_name,
    	COUNT(CASE WHEN i.current_status = 'resolved' THEN 1 END) AS total_resolution
FROM Issue i
JOIN Office o ON i.office_id = o.office_id
GROUP BY o.office_name;

SELECT c.category_name,
       COUNT(i.issue_id) AS total_reports,
       ROUND(AVG(f.rating), 2) AS avg_rating,
       ROUND(AVG(TIMESTAMPDIFF(DAY, i.reported_at, i.completed_at)), 1) AS avg_resolution_days
FROM Issue i
JOIN Category c ON i.category_id = c.category_id
LEFT JOIN Feedback f ON i.issue_id = f.issue_id
GROUP BY c.category_name
HAVING COUNT(i.issue_id) > 5
ORDER BY total_reports DESC, avg_rating ASC;

SELECT o.office_name,
       COUNT(i.issue_id) AS total_resolved,
       ROUND(AVG(f.rating), 2) AS avg_rating,
       ROUND(AVG(TIMESTAMPDIFF(DAY, i.reported_at, i.completed_at)), 1) AS avg_resolution_days,
       (ROUND(AVG(f.rating), 2) * 100 / (1 + ROUND(AVG(TIMESTAMPDIFF(DAY, i.reported_at, i.completed_at)), 1))) AS performance_index
FROM Office o
JOIN Issue i ON o.office_id = i.office_id
LEFT JOIN Feedback f ON i.issue_id = f.issue_id
WHERE i.current_status = 'resolved'
GROUP BY o.office_name
ORDER BY performance_index DESC;

SELECT c.category_name,
       ROUND(AVG(TIMESTAMPDIFF(HOUR, i.reported_at, i.completed_at)), 1) AS avg_waiting_hours,
       MAX(TIMESTAMPDIFF(HOUR, i.reported_at, i.completed_at)) AS longest_wait,
       MIN(TIMESTAMPDIFF(HOUR, i.reported_at, i.completed_at)) AS shortest_wait
FROM Issue i
JOIN Category c ON i.category_id = c.category_id
WHERE i.completed_at IS NOT NULL
GROUP BY c.category_name
ORDER BY avg_waiting_hours DESC;

SELECT ct.citizen_id, ct.name, ct.surname,
       COUNT(i.issue_id) AS total_reports,
       ROUND(AVG(f.rating), 2) AS avg_rating_given,
       SUM(CASE WHEN i.current_status = 'resolved' THEN 1 ELSE 0 END) AS issues_resolved
FROM Citizen ct
JOIN Issue i ON ct.citizen_id = i.citizen_id
LEFT JOIN Feedback f ON i.issue_id = f.issue_id AND f.citizen_id = ct.citizen_id
GROUP BY ct.citizen_id, ct.name, ct.surname
ORDER BY total_reports DESC
LIMIT 10;

SELECT 
    o.office_name,
    c.category_name,
    COUNT(i.issue_id) AS total_issues_reported,
    SUM(CASE WHEN i.current_status = 'resolved' THEN 1 ELSE 0 END) AS resolved_issues,
    AVG(TIMESTAMPDIFF(DAY, i.reported_at, i.completed_at)) AS avg_resolution_days,
    AVG(f.rating) AS avg_citizen_rating,
    COUNT(DISTINCT ci.citizen_id) AS unique_reporters,
    GROUP_CONCAT(DISTINCT CONCAT('Issue#', i.issue_id, ': ', i.description) ORDER BY i.reported_at SEPARATOR '; ') AS recent_issues
FROM Issue i
JOIN Office o ON i.office_id = o.office_id
JOIN Category c ON i.category_id = c.category_id
LEFT JOIN Feedback f ON i.issue_id = f.issue_id
LEFT JOIN Citizen ci ON i.citizen_id = ci.citizen_id
WHERE i.reported_at >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY o.office_name, c.category_name
HAVING total_issues_reported > 0
ORDER BY resolved_issues DESC, avg_citizen_rating DESC, avg_resolution_days ASC;

SELECT o.office_name,
       AVG(TIMESTAMPDIFF(DAY, i.reported_at, i.started_at)) AS avg_days_to_start
FROM Issue i
JOIN Office o ON o.office_id = i.office_id
WHERE i.started_at IS NOT NULL
GROUP BY o.office_id
ORDER BY avg_days_to_start;

SELECT o.office_name,
       AVG(TIMESTAMPDIFF(DAY, i.reported_at, i.completed_at)) AS avg_days_to_resolve
FROM Issue i
JOIN Office o ON o.office_id = i.office_id
WHERE i.completed_at IS NOT NULL
GROUP BY o.office_id
ORDER BY avg_days_to_resolve;

SELECT DATE_FORMAT(i.completed_at, '%Y-%m') AS month,
       COUNT(*) AS issues_completed,
       AVG(TIMESTAMPDIFF(DAY, i.started_at, i.completed_at)) AS avg_resolution_days
FROM Issue i
WHERE i.completed_at IS NOT NULL
GROUP BY month
ORDER BY month DESC;

UPDATE Issue
SET current_status = 'in_progress'
WHERE issue_id = 123
AND current_status = 'pending';

DELETE FROM Issue
WHERE issue_id IN (
    SELECT issue_id
    FROM (
        SELECT issue_id
        FROM Issue
        WHERE current_status = 'resolved'
          AND completed_at < NOW() - INTERVAL 3 YEAR
    ) AS t
);

SELECT surname, email, phone_number, joined_at
FROM Citizen
WHERE surname LIKE 'A%'
ORDER BY joined_at DESC
LIMIT 5;

SELECT f.feedback_id, f.comment, f.rating, f.created_at, c.surname, c.email
FROM Feedback f
JOIN Citizen c ON f.citizen_id = c.citizen_id
ORDER BY f.created_at DESC
LIMIT 5;

SELECT media_id, url, caption, uploaded_at
FROM Media
ORDER BY uploaded_at ASC;

 SELECT media_id, issue_id, url, caption, uploaded_at
FROM Media
ORDER BY uploaded_at DESC
LIMIT 5;

SELECT
	o.office_name,
	COUNT(i.issue_id) AS pending_issues
FROM Issue i
JOIN Office o ON i.office_id = o.office_id
WHERE i.current_status = 'pending'
GROUP BY o.office_name
ORDER BY pending_issues DESC;





