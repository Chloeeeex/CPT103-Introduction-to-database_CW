# Ocean Dew beverage company Database Design

**A relational database design for managing Ocean Dew's beverage production, nutrition information, ingredients, vending machine inventory, and staff details.**

## Table of Contents

* [Description](#description)
* [Database Design](#database-design)
    * [Task 1: Core Database Design](#task-1-core-database-design)
        * [ER Diagram](#er-diagram-task-1)
        * [Table Details](#table-details-task-1)
    * [Task 2: Database Extension](#task-2-database-extension)
        * [ER Diagram](#er-diagram-task-2)
        * [Table Details](#table-details-task-2)
* [Use Cases Test](#use-cases)
* [SQL Script](#sql-script)
* [Contributing](#contributing)
* [License](#license)

## Description

This project implements a relational database design to support the operations of Ocean Dew, a beverage company in the Lukewarm Kingdom. The database manages information related to:

* **Drinks:** Drink names, packaging designs, volumes, materials, and total calories.
* **Nutrition:** Nutritional facts per 100ml for each drink, including calories, saturated fat, cholesterol, etc. 
* **Ingredients:** Main ingredients used in each drink. 
* **Vending Machines:** Machine IDs, locations, and available drinks. 
* **Staff:** Staff teams responsible for replenishing and maintaining vending machines. 
* **Serial Information:** Unique production serial for each bottle/can, production date, expiry date, and sales status. 

The database is designed to minimize data redundancy and support future expansion with new drinks and packaging designs. 

## Database Design

### Task 1: Core Database Design

#### ER Diagram (Task 1)

<img width="1440" alt="截屏2022-11-27 下午7 00 37" src="https://github.com/user-attachments/assets/5b32a69b-1b01-44f8-a8ee-316792a4923c" />


#### Table Details (Task 1)

* **Nutrition:** Stores nutrition facts per 100ml for each drink. 
* **Basic_Information:** Stores basic information about each drink, including packaging design, volume, and material.
* **Drink_Ingredient:** Stores the ingredients for each drink. 
* **Serial_Information:** Stores information about each individual bottle/can, including serial number, production date, expiry date, and sales status.
* **Maintain_Information:** Stores information about which team maintains which vending machine. 
* **Team_Information:** Stores information about staff teams, including team name, phone number, and assigned truck. 


### Task 2: Database Extension

#### ER Diagram (Task 2)

<img width="1440" alt="Task 2" src="https://github.com/user-attachments/assets/079ef526-1160-44ab-970d-3f8099135eda" />


#### Table Details (Task 2)

* **Maintain_Information (Updated):** Updated to include the staff member responsible for maintaining each machine and the maintenance day. 
* **Staff_Information (New):** Stores information about individual staff members, including ID, name, department, telephone number, salary, and manager ID. 

## Use Cases
**Use cases to test the usability of the database**

* List all the machines the employee with ID "1847928" maintains and the name of the employee. 
* List all days when team staffs work.
* Retrieve the private telephone number of the staff who maintains the machine in the location "XJTLU.MA.101". 
* Find out all the IDs of the staff on maintaining teams. 
* Count the number of machines that each staff member maintains. 

## SQL Script

[Include the content of your `script.sql` file here or provide a link to it]

## Contributing

Contributions to this project are welcome. Please feel free to submit issues or pull requests.

## License

[Specify the license under which your project is distributed (e.g., MIT License)]
