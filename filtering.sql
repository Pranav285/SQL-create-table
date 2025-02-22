CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (product, category, amount, sale_date) VALUES
('Laptop', 'Electronics', 1200.00, '2024-02-01'),
('Phone', 'Electronics', 800.00, '2024-02-02'),
('Tablet', 'Electronics', 500.00, '2024-02-03'),
('Chair', 'Furniture', 150.00, '2024-02-01'),
('Desk', 'Furniture', 300.00, '2024-02-02'),
('Sofa', 'Furniture', 700.00, '2024-02-03');
SELECT 
    category, 
    COUNT(*) AS total_sales, 
    SUM(amount) AS total_revenue, 
    AVG(amount) AS average_sale
FROM sales
WHERE amount > 100
GROUP BY category
HAVING SUM(amount) > 500
ORDER BY total_revenue DESC;
