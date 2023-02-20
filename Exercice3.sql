-- Party I
CREATE TABLE purchases (
  id SERIAL PRIMARY KEY NOT NULL,
  customer_id INTEGER REFERENCES customers(id),
  item_id INTEGER REFERENCES items(id),
  quantity_purchased INTEGER NOT NULL
);


INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
  (SELECT customer_id FROM customers WHERE first_name='Scott' AND last_name='Scott'),
  (SELECT item_id FROM items WHERE item_name='Fan'), 1
); 


INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
  (SELECT customer_id FROM customers WHERE first_name='Melanie' AND last_name='Johnson'),
  (SELECT item_id FROM items WHERE item_name='Large Desk'), 10
);


INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (
  (SELECT customer_id FROM customers WHERE first_name='Greg' AND last_name='Jones'),
  (SELECT item_id FROM items WHERE item_name='Small Desk'), 2
);


-- Part II


SELECT * FROM purchases;


SELECT purchases.id, customers.first_name, customers.last_name, items.item_name, purchases.quantity_purchased
FROM purchases
JOIN customers ON purchases.customer_id = customers.customer_id
JOIN items ON purchases.item_id = items.item_id;


SELECT purchases.id, customers.first_name, customers.last_name, items.item_name, purchases.quantity_purchased
FROM purchases
JOIN customers ON purchases.customer_id = customers.customer_id
JOIN items ON purchases.item_id = items.item_id
WHERE customers.customer_id = 5;


SELECT purchases.id, customers.first_name, customers.last_name, items.item_name, purchases.quantity_purchased
FROM purchases
JOIN customers ON purchases.customer_id = customers.customer_id
JOIN items ON purchases.item_id = items.item_id
WHERE items.item_name IN ('Small Desk', 'Large Desk')
GROUP BY purchases.id, customers.first_name, customers.last_name, items.item_name, purchases.quantity_purchased;


SELECT customers.first_name, customers.last_name, items.item_name
FROM purchases
JOIN customers ON purchases.customer_id = customers.customer_id
JOIN items ON purchases.item_id = items.item_id
GROUP BY customers.first_name, customers.last_name, items.item_name;


INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (1, NULL, 1);

/*
   Il n'est pas possible d'ajouter une ligne dans la table "purchases" qui fait référence à un client via son identifiant qui est une clé etrangere et qui est a comme contrainte NOT NULL.
*/