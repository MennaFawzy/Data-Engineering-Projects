-- 1. Customers
CREATE TABLE customers (
  customer_id VARCHAR(64),
  customer_unique_id VARCHAR(64),
  customer_zip_code_prefix VARCHAR(10),
  customer_city VARCHAR(100),
  customer_state VARCHAR(2)
);

-- 2. Geolocation
CREATE TABLE geolocation (
  geolocation_zip_code_prefix VARCHAR(10),
  geolocation_lat DOUBLE PRECISION,
  geolocation_lng DOUBLE PRECISION,
  geolocation_city VARCHAR(100),
  geolocation_state VARCHAR(2)
);

-- 3. Orders
CREATE TABLE orders (
  order_id VARCHAR(64),
  customer_id VARCHAR(64),
  order_status VARCHAR(32),
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
);

-- 4. Order Items
CREATE TABLE order_items (
  order_item_id VARCHAR(64),
  order_id VARCHAR(64),
  product_id VARCHAR(64),
  seller_id VARCHAR(64),
  shipping_limit_date TIMESTAMP,
  price NUMERIC(10,2),
  freight_value NUMERIC(10,2)
);

-- 5. Payments
CREATE TABLE order_payments (
  order_id VARCHAR(64),
  payment_sequential INTEGER,
  payment_type VARCHAR(32),
  payment_installments INTEGER,
  payment_value NUMERIC(10,2)
);

-- 6. Reviews
CREATE TABLE order_reviews (
  review_id VARCHAR(64),
  order_id VARCHAR(64),
  review_score INTEGER,
  review_comment_title TEXT,
  review_comment_message TEXT,
  review_creation_date TIMESTAMP,
  review_answer_timestamp TIMESTAMP
);

-- 7. Products
CREATE TABLE products (
  product_id VARCHAR(64),
  product_category_name VARCHAR(255),
  product_name_lenght INTEGER,
  product_description_lenght INTEGER,
  product_photos_qty INTEGER,
  product_weight_g INTEGER,
  product_length_cm INTEGER,
  product_height_cm INTEGER,
  product_width_cm INTEGER
);

-- 8. Sellers
CREATE TABLE sellers (
  seller_id VARCHAR(64),
  seller_zip_code_prefix VARCHAR(10),
  seller_city VARCHAR(100),
  seller_state VARCHAR(2)
);

-- 9. Category Translation
CREATE TABLE product_category_name_translation (
  product_category_name VARCHAR(255),
  product_category_name_english VARCHAR(255)
);

-- Load CSV data
COPY customers FROM '/data/olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;
COPY geolocation FROM '/data/olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;
COPY orders FROM '/data/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;
COPY order_items FROM '/data/olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;
COPY order_payments FROM '/data/olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;
COPY order_reviews FROM '/data/olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;
COPY products FROM '/data/olist_products_dataset.csv' DELIMITER ',' CSV HEADER;
COPY sellers FROM '/data/olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;
COPY product_category_name_translation FROM '/data/product_category_name_translation.csv' DELIMITER ',' CSV HEADER;
