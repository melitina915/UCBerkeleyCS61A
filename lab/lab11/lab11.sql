.read data.sql


CREATE TABLE bluedog AS
  SELECT color, pet FROM students
  WHERE color = 'blue' AND pet = 'dog';

CREATE TABLE bluedog_songs AS
  SELECT color, pet, song FROM students
  WHERE color = 'blue' AND pet = 'dog';


CREATE TABLE smallest_int_having AS
  SELECT time, smallest FROM students group
  by smallest HAVING COUNT(*) = 1;


CREATE TABLE matchmaker AS
  select a.pet, a.song, a.color as color1, b.color as color2
  from students as a, students as b
  where a.pet = b.pet and a.song = b.song and a.time < b.time;
