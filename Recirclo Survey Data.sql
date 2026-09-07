SELECT * FROM recirclo_survey_data 

/* Which waste disposal methods are most commonly used?*/

SELECT disposal_method, 
COUNT (*) AS disposal_count
FROM recirclo_survey_data
GROUP BY disposal_method
ORDER BY disposal_count DESC; 

/* The result from the query above indicates that Informal Collector (Aboki) is the most common method used in waste disposal.*/


/* What challenges do respondents face with waste disposal?*/

SELECT biggest_challenge, 
COUNT(*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY biggest_challenge
ORDER BY no_of_responders DESC;

/* From the query results, it can be deduced that the responders face different challenges in their waste disposal methods including,
delayed pickups, difficulty finding a reliable collector, poor customer service, high cost, amongst others.*/

/* Are people willing to pay for a waste collection service? If yes, how much?*/

SELECT payment_range,
COUNT(*) AS payment_count
FROM recirclo_survey_data
GROUP BY payment_range
ORDER BY payment_count DESC;

/* From the results, it indicates that people are willing to pay for a waste collection service mostly from the range of 500-1000, while some
considered the payment range of 1000-2000, and few considered any amount greater than 2000.*/ 

/* Is there a relationship between location and waste disposal practices? */

SELECT location, 
		disposal_method,
		COUNT(*) AS method_by_location
FROM recirclo_survey_data
GROUP BY location, disposal_method
ORDER BY location, method_by_location DESC;

/* With Lagos and Delta as the top two states having more numbers in collection methods, LAWMA and informal collector (Aboki) respectively as 
top methods. */

/* What percentage of respondents are willing to use a digital waste management platform? */

SELECT app_interest, 
COUNT (*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY app_interest; --19 responders indicate Yes to use a digital waste management platform.

SELECT
ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM recirclo_survey_data), 2) AS app_interest_percentage
FROM recirclo_survey_data
WHERE app_interest = 'Yes';
/* The percentage of responders willing to use a digital waste management system is 51% */

/* What factors influence people's willingness to use the app? */

SELECT disposal_method, app_interest,
COUNT(*) AS no_of_responders 
FROM recirclo_survey_data
GROUP BY disposal_method, app_interest 
ORDER BY disposal_method, no_of_responders DESC;
/* The first factor that could serve as an influence to people's interest in the app is the disposal method with three major options LAWMA, 
PSP Agent and informal collectors. There is a high interest of the app use from responders' who use LAWMA as a disposal method. */


/* Which areas have the greatest need for improved waste management services?*/
SELECT location,
COUNT (*) AS areas_to_improve
FROM recirclo_survey_data
WHERE biggest_challenge IS NOT NULL
GROUP BY location
ORDER BY areas_to_improve DESC;

/* Based on the query result, the top three areas with urgent need for improvement include Lagos, Delta, and Edo states. */

/*How frequently do responders dispose of their waste? */
SELECT collection_frequency,
COUNT(*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY collection_frequency
ORDER BY no_of_responders DESC;

/*From the results, more responders have an irregular means of disposing their waste.*/

/*Which features of a digital waste platform are most important to responders?*/
SELECT preferred_features,
COUNT(*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY preferred_features
ORDER BY no_of_responders DESC;
/*The results show that the 'book pickups' feature is most important to the responders.*/ 

/*Does app interest differ by location?*/
SELECT location, app_interest,
COUNT(*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY location, app_interest
ORDER BY location, no_of_responders DESC;
/*Based on the results, it shows that interest in the app differs by location, with Lagos and Delta states having the highest number of responders, interested in a waste management app.*/

/*Does willingness to subscribe to the app differ by disposal method?*/
SELECT disposal_method, payment_range,
COUNT(*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY disposal_method, payment_range
ORDER BY disposal_method, no_of_responders DESC;
/*The willingness to subscribe differs by disposal method, the highest interest in other means of disposal willing to pay between 500-1000.*/

/*Are people with missed pickups more likely to adopt the app?*/
SELECT missed_pickups, app_interest,
COUNT(*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY missed_pickups, app_interest
ORDER BY missed_pickups, no_of_responders DESC;
/*The results indicate that responders with missed pickups are more likely to adopt the app, with 16 responses as 'Yes'.*/

/*Which location reports the most waste collection challenges?*/
SELECT location, biggest_challenge,
COUNT(*) AS no_of_responders
FROM recirclo_survey_data
GROUP BY location, biggest_challenge
ORDER BY location, no_of_responders DESC;
/*Lagos records the highest waste collection challenge, with delayed pickups as a big challenge.*/

/*What is the estimated monthly revenue if all interested responders subscribe?*/
SELECT 
	SUM(
		CASE
		WHEN payment_range = '500-1000' THEN 1000
		WHEN payment_range = '1001-2000' THEN 2000
		WHEN payment_range = '2001-5000' THEN 5000
		WHEN payment_range = 'Above 5000' THEN 10000
		ELSE 0
	END
	) AS estimated_monthly_revenue
FROM recirclo_survey_data
WHERE app_interest = 'Yes';
/*The estimated monthly revenue is 7000*/


SELECT disposal_method,
SUM (responder_id) AS disposal_count
FROM recirclo_survey_data
GROUP BY disposal_method
ORDER BY disposal_count DESC; 


SELECT disposal_method, 
COUNT (collection_frequency) AS no_of_responders
FROM recirclo_survey_data
GROUP BY disposal_method
ORDER BY no_of_responders DESC;

