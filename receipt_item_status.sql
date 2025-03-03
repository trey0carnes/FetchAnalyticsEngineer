/*
When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater?
*/

SELECT 
    rewardsReceiptStatus,
    SUM(purchasedItemCount) AS total_items_purchased,
    COUNT(*) AS receipt_count,
    SUM(purchasedItemCount) / COUNT(*) AS avg_items_per_receipt
FROM 
    receipts
WHERE 
    rewardsReceiptStatus IN ('ACCEPTED', 'REJECTED')
    AND purchasedItemCount IS NOT NULL
GROUP BY 
    rewardsReceiptStatus
ORDER BY 
    total_items_purchased DESC;
