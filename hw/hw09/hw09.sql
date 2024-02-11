CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name as dog_name, b.size as dog_size
    from dogs as a, sizes as b
      where a.height>b.min and a.height<=b.max;


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.name
    from dogs as a, parents as b, dogs as c
      where b.child=a.name and b.parent=c.name
        order by -c.height;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.dog_name as one, b.dog_name as another, a.dog_size as siz
    from size_of_dogs as a, size_of_dogs as b, parents as c, parents as d
      where a.dog_size=b.dog_size and c.parent=d.parent and c.child=a.dog_name and d.child=b.dog_name and a.dog_name<b.dog_name;


-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT 'The two siblings, ' || one || ' plus ' || another || ' have the same size: ' || siz
  from siblings;