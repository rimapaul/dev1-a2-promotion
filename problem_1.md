# Problem 1 - Promotion

## TL;DR

Implement a program that reads in an order and applies a promotional discount to it.

## Background

There are many different types of promotions that merchants use to [help increase sales](https://www.shopify.ca/blog/15514000-14-ways-to-use-offers-coupons-discounts-and-deals-to-drive-revenue-and-customer-loyalty).

Some promotions apply to the whole order, for example, percentage discounts or dollar discounts.

* an order with a total of $50.00 and a 10% discount applied would only cost $45.00 (*)
* an order with a total of $50.00 and a $10 discount applied would only cost $40.00 (*)

Some promotions apply to just some items in an order:

* 20% off all hats (**)
* Buy one get one free (BOGO) for all shoes (**)

Some promotions only apply to orders over a certain value:

* $5 off for every $100 spent (**)
* free shipping for orders over $25 (N/A)

Promotions can also be limited by time and/or location:

* 15% off all products this weekend (Sept. 28-30, 2018) (**)
* $10 off all jeans at our Ottawa location (***)
* 30% off all t-shirts this Sunday only (Sept. 30th, 2018) (***)

Sometimes you can combine multiple promotions to get a really great deal. For this assignment we will be a little greedy and make things a little easier by taking the stance that all of our promotions are "not to be combined with any other offer."

## Specifications

Write, in a file called `promotion.rb` in your Assignment 2 repository, a program that asks a person to enter the filename of a file that contains an order. Your program should read in this file, line by line, and create an `Order` object that contains its data. The file reading should happen in an `OrderReader` class that you will create, using a method called `read(filename)`.

Each order will have the following format (each part of the product line is separated by a tab):

```
line 1:   Order #<order-number>
line 2:   <year>-<month>-<day>
line 3:   <store-address>
line 4:   <city>, <province>
line 5+:  <quantity>	x	<unit-price>	<product-name>	(<product-id>)
```

e.g.

```
Order #1
Order #1
2018-09-28
150 Elgin Street
Ottawa, Ontario
1	x	$5.00	Socks	(123)
3	x	$23.75	T-shirt	(777)
1	x	$9.99	Hat	(953)
1	x	$12.99	T-shirt	(905)
```

After reading the order, your program should output the details of the order to the console using the `Order`'s `to_s` method, then output a numbered list of discounts that can be applied to the order. Each of these types of discounts should be implemented as their own class that is a subclass of the provided [`Promotion`](promotion.rb) class.

The person will enter the number that corresponds to the type of discount they would like to apply. Your code should create a new object for the discount based on their selection.

You will prompt the person for any further details about the promotion that are needed to apply it, which will be based on the type of promotion they have selected. For example, if the person selects a percentage discount, you would prompt them to enter the percentage amount. If the person selected a product specific percentage discount, they would also be prompted to enter the product name.

You will then apply the promotion using its `discount(Order)` method, and output the discount amount to the screen.

If the person fails to enter a valid number for the promotion type, your program should re-prompt the user for a valid value again and again until the user complies.

## Requirements

1. Create an `Order` class that can hold all the details an order.

  > Hint: Create additional classes, as necessary, for parts of the order (e.g. `Product`, etc.)

  * Your order should not be editable after it is created.

  * Your `Order` class should have a `to_s` method that outputs to the format specified above

  * Your `Order` class should have a `total` method that gives the total price of the order.

  * Your `Order` class should have an `item_count(product_name)` method that returns how many items of that type are in the order.

  * Your `Order` class should have an `item_total(product_name)` method that returns the total price of all items that have that product name.

2. Create at least 5 types of `Promotion` sub-classes that can be used to create promotional discounts.

  * Draw a class diagram (data and behaviour) of the hierarchy of the `Promotion` classes you want to create and include it in your submission
  
  * At least one class should be a sub-class of a sub-class (i.e. a grand-child class of `Promotion`)

  > Hint: The example promotions are labelled with their level of difficulty - * (easiest), *** (hardest).

3. Read in the order file.

  * Prompt a person to enter a filename.

    * If the person enters an invalid value (i.e. the file doesn't exist in the same folder as the code is run from), re-prompt for a value.

    > Hint: An invalid file will throw an exception if it is not found.

  * Read in the order file, line by line by calling your `OrderReader` object's `read(filename)` method.

  > Hint: Put all the file reading code in a `OrderReader` class.

  * Create the smaller objects like `Product` as you parse the order file.

  > Hint: The `split` method can be used to split a string up into an array.

  > Hint: Your `Product` class should keep track of how many of that product were in the order.
  
  * Create the order object (it will be composed of your smaller objects).

4. Output the order to the screen.

  * Use the `to_s` method on the `Order` class.

5. Create the promotion.

  * Print a numbered list of promotion types.

  * Prompt the person to select a promotion using its associated number.

  * Prompt the user to enter the details needed create the promotion.

6. Apply the promotion to the order.

  * Use the promotion's `discount(order)` method to apply the promotion.

  * Output the discount amount to the screen.

7. Have fun! Be sure to share any helpful resources you find or any questions you have with everyone in the devdegree-2018 Slack channel.
