-- Create keyspace (if needed)
CREATE KEYSPACE IF NOT EXISTS test_keyspace 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- Use keyspace
USE test_keyspace;

-- Create table for Kafka Sink
CREATE TABLE IF NOT EXISTS users_cassandra (
    id int PRIMARY KEY,
    name text,
    email text,
    created_at timestamp
);
