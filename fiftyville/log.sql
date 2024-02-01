-- Keep a log of any SQL queries you execute as you solve the mystery.
SELECT description FROM crime_scene_reports WHERE year=2021 AND month=7 AND day=28;
--time 10:15 three witnesses  bakery
SELECT name FROM people where id=(SELECT id FROM bakery_security_logs WHERE year = 2021 AND month=7 AND day=28 AND hour = 10 AND minute = 15);
--took place on July 28, 2021 and that it took place on Humphrey Street.
SELECT name, transcript FROM interviews WHERE year = 2021 AND month=7 AND day=28;
--within 10 minites after theft the theif get into a car look security footage

--eugene recognizes him  in the morning he was at Leggett street

--the theif called someone for minute   want to take flight tomorrrow purchused that day
SELECT atm_location,amount,id FROM atm_transactions WHERE year = 2021 AND month=7 AND day=28 AND atm_location ='Leggett Street';

SELECT caller,receiver FROM phone_calls WHERE year = 2021 AND month=7 AND day=28 AND duration=1;
SELECT caller,receiver,duration FROM phone_calls WHERE year = 2021 AND month=7 AND day=28 AND duration<1;

SELECT name FROM people JOIN bakery_security_logs ON bakery_security_logs.license_plate=people.license_plate
WHERE year=2021 AND month=7 AND day=28 AND hour=10 AND minute >=15 AND minute<=25 AND activity="exit";


-- suspects
-- +---------+
-- |  name   |
-- +---------+
-- | Vanessa |
-- | Bruce   |
-- | Barry   |
-- | Luca    |
-- | Sofia   |
-- | Iman    |
-- | Diana   |
-- | Kelsey  |
-- +---------+
SELECT * FROM bakery_security_logs WHERE year=2021 AND month=7 AND day=28 AND hour=10 AND minute BETWEEN 15 AND 25 AND activity="exit";
-- --------------+
-- | 260 | 2021 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
-- | 261 | 2021 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
-- | 262 | 2021 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
-- | 263 | 2021 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
-- | 264 | 2021 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
-- | 265 | 2021 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
-- | 266 | 2021 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
-- | 267 | 2021 | 7     | 28  | 10   | 23     | exit     | 0NTHK55

SELECT license_plate, passport_number FROM people WHERE license_plate in ('5P2BI95','94KL13X','6P58WS2','4328GD8','G412CB7','L93JTIZ','322W7JE','0NTHK55');

-- | license_plate | passport_number |
-- +---------------+-----------------+
-- | 5P2BI95       | 2963008352      |
-- | 6P58WS2       | 7526138472      |
-- | L93JTIZ       | 7049073643      |
-- | G412CB7       | 1695452385      |
-- | 4328GD8       | 8496433585      |
-- | 322W7JE       | 3592750733      |
-- | 0NTHK55       | 8294398571      |
-- | 94KL13X       | 5773159633


SELECT name FROM people JOIN bank_accounts ON bank_accounts.person_id=people.id
JOIN atm_transactions ON atm_transactions.account_number=bank_accounts.account_number
WHERE year = 2021 AND month=7 AND day=28 AND atm_location="Leggett Street" AND
transaction_type="withdraw";

-- common bruce, luca, iman, diana from line 21

SELECT passport_number FROM passengers,flights WHERE passengers.flight_id=flights.id AND passport_number in ('2963008352','7526138472','7049073643','1695452385','8496433585','3592750733','8294398571','5773159633') AND year=2021 AND month=7 AND day=29;


-- oooooooooooooh i hope this this the man :)))))))))
-- | 3592750733      |
-- | 1695452385      |
-- | 5773159633      |
-- | 8294398571      |
-- | 8496433585      |
-- +-----------------+

SELECT name FROM people WHERE passport_number in('3592750733','1695452385','5773159633','8294398571','8496433585');
--------+
-- | Sofia  |
-- | Luca   |
-- | Diana  |
-- | Kelsey |
-- | Bruce  |
-- +--------+

-- again common are Diana, Bruce, Luca

SELECT * FROM phone_calls WHERE year = 2021 AND month=7 AND day=28 AND duration <= 60;
-- +-----+----------------+----------------+------+-------+-----+----------+
-- | id  |     caller     |    receiver    | year | month | day | duration |
-- +-----+----------------+----------------+------+-------+-----+----------+
-- | 221 | (130) 555-0289 | (996) 555-8899 | 2021 | 7     | 28  | 51       |
-- | 224 | (499) 555-9472 | (892) 555-8872 | 2021 | 7     | 28  | 36       |
-- | 233 | (367) 555-5533 | (375) 555-8161 | 2021 | 7     | 28  | 45       |
-- | 234 | (609) 555-5876 | (389) 555-5198 | 2021 | 7     | 28  | 60       |
-- | 251 | (499) 555-9472 | (717) 555-1342 | 2021 | 7     | 28  | 50       |
-- | 254 | (286) 555-6063 | (676) 555-6554 | 2021 | 7     | 28  | 43       |
-- | 255 | (770) 555-1861 | (725) 555-3243 | 2021 | 7     | 28  | 49       |
-- | 261 | (031) 555-6622 | (910) 555-3251 | 2021 | 7     | 28  | 38       |
-- | 279 | (826) 555-1652 | (066) 555-9701 | 2021 | 7     | 28  | 55       |
-- | 281 | (338) 555-6650 | (704) 555-2131 | 2021 | 7     | 28  | 54       |
-- +-----+----------------+----------------+------+-------+-----+----------+
SELECT name,phone_number FROM people WHERE name IN ('Diana','Bruce','Luca');

-- +-------+----------------+
-- | name  |  phone_number  |
-- +-------+----------------+
-- | Luca  | (389) 555-5198 |
-- | Diana | (770) 555-1861 |
-- | Bruce | (367) 555-5533 |
-- +-------+----------------+

SELECT name FROM people JOIN phone_calls ON phone_calls.caller=people.phone_number where name IN ('Diana','Bruce','Luca') AND  year = 2021 AND month=7 AND day=28 AND duration <= 60;
-- | name  |
-- +-------+
-- | Bruce |
-- | Diana |
-- +-------+

SELECT passport_number, name FROM people where name IN('Bruce','Diana');

-- +-----------------+-------+
-- | passport_number | name  |
-- +-----------------+-------+
-- | 3592750733      | Diana |
-- | 5773159633      | Bruce |
-- +-----------------+-------+

SELECT * from passengers JOIN flights on passengers.flight_id=flights.id WHERE year = 2021 AND month=7 AND day=29 AND passport_number IN('3592750733','5773159633') ORDER BY hour, minute;
-- | flight_id | passport_number | seat | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
-- +-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+
-- | 36        | 5773159633      | 4A   | 36 | 8                 | 4                      | 2021 | 7     | 29  | 8    | 20     |
-- | 18        | 3592750733      | 4C   | 18 | 8                 | 6                      | 2021 | 7     | 29  | 16   | 0      |
-- +-----------+-----------------+------+----+-------------------+------------------------+------+-------+-----+------+--------+

-- Therefore it is Bruce
SELECT phone_number FROM people WHERE name='Bruce';
-- +----------------+
-- |  phone_number  |
-- +----------------+
-- | (367) 555-5533 |
-- +----------------+

SELECT receiver FROM phone_calls WHERE caller='(367) 555-5533' AND year = 2021 AND month=7 AND day=28 AND duration <= 60;
-- |    receiver    |
-- +----------------+
-- | (375) 555-8161 |
SELECT name FROM people WHERE phone_number='(375) 555-8161';
-- +-------+
-- | name  |
-- +-------+
-- | Robin |
-- +-------+

-- from line 132 flight id is 4

SELECT full_name from airports,flights WHERE origin_airport_id=airports.id AND destination_airport_id=4;
SELECT * FROM airports;
SELECT city FROM airports WHERE id=4;
--

-- +---------------+
-- |     city      |
-- +---------------+
-- | New York City |

-- therefor the city is NEW york city horrraaaaaaaaaaaaaaaaaaaaaaaaaaayyyyyyyyyyyyy I am SHERLOK HOLMS hahahaha