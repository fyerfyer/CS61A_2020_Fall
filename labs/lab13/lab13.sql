.read data.sql


CREATE TABLE average_prices AS
  SELECT category, avg(MSRP) as average_price
    from products
      group by category;


CREATE TABLE lowest_prices AS
  SELECT store as min_store, item as min_item, min(price) as min_price
    from inventory
      group by item;


CREATE TABLE choose AS
  SELECT name as choice, min(MSRP/rating)
      from products
          group by category;

CREATE TABLE shopping_list AS
  SELECT choice, min_store
      from choose, lowest_prices
          where choice=min_item;


CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs)
    from stores, shopping_list
      where store=min_store;
