-- RFM SEGMENTATION ANALYSIS (PostgreSQL)
-- Author: Havva Aygün

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1, 101, '2024-01-10', 250.00),
(2, 102, '2024-01-12', 120.00),
(3, 101, '2024-02-05', 180.00),
(4, 103, '2024-02-14', 350.00),
(5, 101, '2024-03-01', 90.00),
(6, 102, '2024-03-02', 210.00),
(7, 104, '2024-03-09', 500.00),
(8, 103, '2024-03-15', 120.00),
(9, 105, '2024-03-20', 75.00),
(10, 102, '2024-03-25', 310.00);

WITH summary AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order,
        COUNT(order_id) AS frequency,
        SUM(order_amount) AS monetary
    FROM orders
    GROUP BY 1
),
rfm AS (
    SELECT
        customer_id,
        EXTRACT(DAY FROM AGE(CURRENT_DATE, last_order)) AS recency,
        frequency,
        monetary,
        NTILE(4) OVER (ORDER BY EXTRACT(DAY FROM AGE(CURRENT_DATE, last_order))) AS r_score,
        NTILE(4) OVER (ORDER BY frequency DESC) AS f_score,
        NTILE(4) OVER (ORDER BY monetary DESC) AS m_score
    FROM summary
)
SELECT *,
       (r_score + f_score + m_score) AS rfm_total,
       CASE
           WHEN (r_score + f_score + m_score) >= 10 THEN 'VIP'
           WHEN (r_score + f_score + m_score) BETWEEN 7 AND 9 THEN 'Loyal'
           WHEN (r_score + f_score + m_score) BETWEEN 4 AND 6 THEN 'Regular'
           ELSE 'At Risk'
       END AS segment
FROM rfm
ORDER BY rfm_total DESC;