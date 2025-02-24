# Data Modeling Project

## Project Overview

This project focuses on building a well-structured **relational database** using **PostgreSQL** in **pgAdmin**. The primary goal is to create an optimized data model that efficiently stores, retrieves, and analyzes real estate transaction data. The project employs a **Star Schema** design, ensuring that queries run efficiently and the data is structured for analytical processing.

## Database Schema

The project follows a **Star Schema** with a central fact table (`transactions`) and multiple dimension tables. The schema is structured as follows:

### **Fact Table:**

- **transactions**: Contains sales transaction details such as property ID, agent ID, location ID, sale price, and transaction date.

### **Dimension Tables:**

- **date**: Stores details about the transaction date (year, month, quarter).
- **property**: Holds information about properties (property ID, name, type, year built).
- **agent**: Stores agent details (agent ID, agent name).
- **location**: Contains property location details (address, city, state, ZIP code).

## Data Modeling Process

1. **Schema Design:**

   - The **Star Schema** was chosen to improve query performance and simplify data analysis.
   - **Foreign keys** were set up in the fact table to reference the dimension tables.
   - The schema ensures **data integrity** and enforces **referential constraints**.

2. **Database Implementation:**

   - The schema was implemented using **PostgreSQL** in **pgAdmin**.
   - Tables were created with **primary keys** and **foreign keys** to maintain relationships.
   - `ON DELETE CASCADE` was used to ensure data consistency when deleting referenced records.

3. **Data Ingestion (Python):**

   - **Connecting to PostgreSQL:** The connection was established using the `psycopg2` library in Python.
   - **Table Creation:** SQL `CREATE TABLE` statements were executed through Python to set up the schema.
   - **Data Loading:**
     - Data from CSV files was read using `pandas` and inserted into tables using `cursor.executemany()`.
     - Transactions were loaded ensuring referential integrity with foreign key constraints.
   - **Error Handling:** Try-except blocks were used to manage connection errors and data inconsistencies.
   - **Commit & Close:** Data was committed to the database, and connections were closed after execution.
   
   
   ![image.png](attachment:image.png)

## Complex SQL Queries

Several **complex SQL queries** were executed in **pgAdmin** to extract meaningful insights from the database. Some of the queries included:



## Tools & Technologies Used

- **PostgreSQL**: Database management system.
- **pgAdmin**: GUI for managing PostgreSQL databases.
- **Python (psycopg2, pandas)**: For data ingestion and automation.
- **SQL**: For querying and analyzing data.

## Conclusion

This project demonstrates how to model real estate transaction data using a **Star Schema**, perform **efficient queries**, and gain insights using **complex SQL operations**. The structured design enables easy scalability and quick analytical reporting.

---

### Future Enhancements:

- **Indexing** for performance optimization.
- **Data validation** to handle missing or inconsistent records.
- **Visualization dashboards** for enhanced data interpretation.

---

**Author:** Oni Samuel Oluwapelumi\
**LinkedIn:** [Profile](https://www.linkedin.com/in/samuel-oni)\
**GitHub:** [Profile](https://github.com/oni-samuel)


