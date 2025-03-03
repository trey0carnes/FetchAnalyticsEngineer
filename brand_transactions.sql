/*
Which brand has the most transactions among users who were created within the past 6 months?
*/

WITH recent_users AS (
    SELECT
        _id AS user_id
    FROM
        users
    WHERE
        createdDate > DATEADD(MONTH, -6, CURRENT_DATE())
)

SELECT
    b.name AS brand_name,
    COUNT(DISTINCT r._id) AS transaction_count
FROM
    receipts r
    JOIN recent_users u ON r.userId = u.user_id
    JOIN receipt_items ri ON ri.receipt_id = r._id
    JOIN brands b ON ri.barcode = b.barcode
GROUP BY
    b.name
ORDER BY
    transaction_count DESC
LIMIT 1;
