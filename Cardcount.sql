-- =========================================================
-- CardCount cleanup + Top 10 most played cards (high standard)
-- =========================================================

-- 1) Create and select database (safe + repeatable)
CREATE DATABASE IF NOT EXISTS CardCount;
USE CardCount;

-- 2) Preview cards that will be removed (audit step)
SELECT
  card_name,
  SUM(frequency) AS total_frequency
FROM cardfrequency
WHERE card_name IN ('Swamp','Mountain','Plains','Wastes','Island','Forest')
GROUP BY card_name
ORDER BY total_frequency DESC;

-- 3) Delete basic lands safely inside a transaction
START TRANSACTION;

SET @old_safe_updates := @@SQL_SAFE_UPDATES;
SET SQL_SAFE_UPDATES = 0;

DELETE FROM cardfrequency
WHERE card_name IN ('Swamp','Mountain','Plains','Wastes','Island','Forest');

SET SQL_SAFE_UPDATES = @old_safe_updates;

COMMIT;

-- 4) Verification: ensure basic lands are gone
SELECT COUNT(*) AS remaining_basic_lands
FROM cardfrequency
WHERE card_name IN ('Swamp','Mountain','Plains','Wastes','Island','Forest');

-- 5) Create or replace a live Top 10 view (always up-to-date)
CREATE OR REPLACE VIEW v_top_10_most_played_cards AS
SELECT
  card_name,
  SUM(frequency) AS total_frequency
FROM cardfrequency
GROUP BY card_name
ORDER BY total_frequency DESC
LIMIT 10;

-- 6) Read Top 10 results
SELECT * FROM v_top_10_most_played_cards;