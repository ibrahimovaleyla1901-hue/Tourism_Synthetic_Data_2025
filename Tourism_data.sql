DROP TABLE IF EXISTS tourism_data;

CREATE TABLE incoming_tourism_data (
    month TEXT,
    incoming_managers INTEGER,
    packages_confirmed INTEGER,
    avg_pax INTEGER,
    avg_markup_usd_pp INTEGER,
    incoming_revenue_usd INTEGER
);

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'incoming_tourism_data'
ORDER BY ordinal_position;

INSERT INTO incoming_tourism_data (
    month,
    incoming_managers,
    packages_confirmed,
    avg_pax,
    avg_markup_usd_pp,
    incoming_revenue_usd
)
VALUES
('January', 6, 78, 4, 45, 14040),
('February', 6, 78, 4, 45, 14040),
('March', 6, 84, 4, 50, 16800),
('April', 6, 84, 4, 50, 16800),
('May', 6, 90, 4, 50, 18000),
('June', 6, 72, 4, 45, 12960),
('July', 6, 33, 4, 35, 4620),
('August', 6, 36, 4, 35, 5040),
('September', 6, 61, 5, 45, 13725),
('October', 6, 86, 8, 40, 11550),
('November', 6, 55, 6, 35, 16800),
('December', 6, 50, 6, 40, 12000)


CREATE TABLE outgoing_tourism_data (
    month TEXT,
    outgoing_managers INTEGER,
    packages_confirmed INTEGER,
    markup_usd_per_package INTEGER,
    outgoing_revenue_usd INTEGER
);
	
INSERT INTO outgoing_tourism_data (
    month,
    outgoing_managers,
    packages_confirmed,
    markup_usd_per_package,
    outgoing_revenue_usd
)
VALUES
('January', 2, 12, 60, 720),
('February', 2, 12, 60, 720),
('March', 2, 10, 60, 600),
('April', 2, 10, 60, 600),
('May', 2, 12, 60, 720),
('June', 2, 10, 60, 600),
('July', 2, 12, 60, 720),
('August', 2, 12, 60, 720),
('September', 1, 8, 60, 480),
('October', 1, 8, 60, 480),
('November', 1, 5, 55, 275),
('December', 1, 5, 55, 275)

CREATE TABLE customer_satisfaction (
    month TEXT,
    satisfied_pct INTEGER,
    unsatisfied_pct INTEGER,
    sample_guest_reviews TEXT,
    review_sentiment VARCHAR(10)
);

INSERT INTO customer_satisfaction (
    month,
	satisfied_pct,
	unsatisfied_pct,
	sample_guest_reviews,
	review_sentiment
)
VALUES
('January', 82,	18,	'Managers online 24/7, very helpful and friendly staff', 'Positive'),
('February', 83, 17, 'Professional service, guides were knowledgeable', 'Positive'),	
('March', 84, 16, 'Great operations, drivers polite and helpful', 'Positive'),
('April', 85, 15, 'Very smooth trip, excellent coordination', 'Positive'),
('May', 86, 14, 'High service quality but prices slightly high', 'Mixed'),
('June', 87, 13, 'Excellent support, always reachable', 'Positive'),
('July', 88, 12, 'Good service but driver behavior was rude in one case', 'Mixed'),
('August', 88, 12, 'Some late responses from managers during peak season', 'Negative'),
('September', 89, 11, 'Service improved, faster replies', 'Positive'),
('October', 90, 10, 'Professional handling of large groups', 'Positive'),
('November', 90, 10, 'Great service overall but prices higher than competitors', 'Mixed'),
('December', 91, 9, 'Very satisfied, friendly and hospitable team', 'Positive');


CREATE TABLE partner_details (
month VARCHAR(5),
    active_partners INTEGER,
    new_partners INTEGER,
    lost_partners INTEGER,
    partner_market VARCHAR(20),
    reason_for_partnership_gain TEXT,
    reason_for_partner_churn TEXT
);

INSERT INTO partner_details (
month,
    active_partners,
    new_partners,
    lost_partners,
    partner_market,
    reason_for_partnership_gain,
    reason_for_partner_churn
)
VALUES
('Jan',	18,	2,	0,	'India', 'Professional and reliable service', 'No Customer Churn has occurred'),
('Feb',	20,	2,	0,	'Pakistan',	'24/7 online communication', 'No Customer Churn has occurred'),
('Mar',	22,	2,	0,	'India', 'Strong destination knowledge', 'No Customer Churn has occurred'),
('Apr',	24,	2,	0,	'Turkey', 'Supportive managers and guides', 'No Customer Churn has occurred'),
('May',	26,	2,	0,	'Indian', 'Professional operations', 'No Customer Churn has occurred'),
('Jun',	28,	2,	0,	'Pakistan', 'Reliable incoming support', 'No Customer Churn has occurred'),
('Jul',	24,	1,	4,	'India', 'Continued cooperation', 'War impact and high pricing'),
('Aug',	22,	1,	3,	'Pakistan', 'Service quality', 'Late responses, war impact'),
('Sep',	24,	2,	1,	'Turkey', 'Operational improvement', 'High pricing'),
('Oct',	26,	2,	0,	'Israel', 'Professional and reliable service', 'No Customer Churn has occurred'),
('Nov',	25,	1,	1,	'Russia', 'Strong cooperation',	'Prices higher than competitors'),
('Dec',	26,	1,	0,	'Arabian', 'Good service quality', 'No Customer Churn has occurred');	


CREATE TABLE destinations (
    Destination VARCHAR(50) PRIMARY KEY,
    Year_Started SMALLINT,
    Primary_Sales_Period VARCHAR(20),
    Notes TEXT
);


INSERT INTO destinations (
Destination,
    Year_Started,
    Primary_Sales_Period,
    Notes
)
VALUES
('Azerbaijan', 2018, 'Year-round', 'Core destination'),
('Georgia',	2025, 'Year-round',	'Most summer confirmations'),
('Uzbekistan', 2025, 'Spring-Summer', 'Cultural tours'),
('Kazakhstan', 2025, 'Year-round', 'Emerging destination'),
('Russia', 2025, 'Autumn', 'Short city breaks'),
('Turkey', 2025, 'Year-round', 'High demand outbound');

SELECT * FROM incoming_tourism_data;

SELECT * FROM outgoing_tourism_data;

SELECT * FROM customer_satisfaction;

SELECT * FROM partner_details;

SELECT * FROM destinations;

--- Checking what we have

SELECT month, incoming_revenue_usd
FROM incoming_tourism_data
ORDER BY month;

SELECT 
    i.month,
    i.incoming_revenue_usd,
    o.outgoing_revenue_usd
FROM incoming_tourism_data i
JOIN outgoing_tourism_data o
ON i.month = o.month;

SELECT 
    month,
    packages_confirmed / incoming_managers AS packages_per_manager
FROM incoming_tourism_data;

