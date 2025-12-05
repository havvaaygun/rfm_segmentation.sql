# RFM Segmentation SQL Project

This project demonstrates an end-to-end **Recency–Frequency–Monetary (RFM) customer segmentation** using SQL.

RFM is a widely used technique in:
- Banking & finance analytics  
- E-commerce customer scoring  
- Marketing & churn prediction  
- Business intelligence dashboards  

This SQL script:
- Cleans and aggregates transaction data  
- Computes Recency, Frequency, Monetary metrics  
- Uses PostgreSQL **window functions**  
- Assigns customers into segments (VIP, Loyal, Regular, At Risk)  

---

## 🔧 Technologies Used
- PostgreSQL  
- Window Functions  
- NTILE() segmentation  
- AGE() and EXTRACT() date functions  

---

## 📊 Output Example

| customer_id | recency | frequency | monetary | r_score | f_score | m_score | rfm_total | segment |
|-------------|---------|-----------|----------|---------|---------|---------|-----------|---------|
| 105 | 16 | 1 | 75.00 | 2 | 4 | 4 | 10 | VIP |
| 104 | 27 | 1 | 500.00 | 4 | 3 | 2 | 9 | Loyal |
| 103 | 21 | 2 | 470.00 | 3 | 2 | 3 | 8 | Loyal |

---

## 👩‍💻 Author
**Havva Aygün**  
