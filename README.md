# dbt demo project

### Terminology
- **project**: Directory containing .yml/.sql/.md files.
- **model**: A dbt object that represents a SQL query. Models define how raw data is transformed into the final output.
- **source**: A dbt object that represents a raw data table or view. Sources are used to describe the structure of raw data in the warehouse.
- **snapshot**: A type of dbt model that represents a point-in-time view of a source table. Snapshots are useful for creating historical records of changes to data over time.
- **seed**: A dbt object that defines a table or view by specifying its raw SQL. Seeds are typically used for small, static datasets.
- **test**: A dbt feature that allows you to assert expectations about the data in your warehouse. Tests help ensure the quality and accuracy of your transformations.
- **run**: The process of executing dbt commands to build or update models. Running dbt typically involves executing commands like dbt run to apply transformations to the data.
- **compile**: The process of parsing and validating dbt code without actually running the transformations. This helps catch errors before running the code.
- **profiles.yml**: A configuration file used by dbt to connect to your data warehouse. It contains information about the connection, such as the database type, host, and credentials.
- **dbt_project.yml**: A configuration file for your project. It contains information about project such as name, materializations and paths.
- **materialization**: The process of building and storing the results of a dbt model. dbt supports different materialization strategies, such as tables, views, incremental models, ephemeral models and custom materialization.
- **jinja**: A templating language used in dbt to write dynamic and parameterized SQL code. Jinja allows you to incorporate logic and variables into your dbt models.
- **dependency graph (DAG)**: A visualization of the relationships between dbt models. The dependency graph shows the order in which models should be built to satisfy dependencies.
- **packages**:  Reusable sets of dbt code that can be shared across projects. Packages are a way to distribute and consume dbt code from the community.

### DBT commands:
- **dbt debug**: This command checks your dbt project setup. It verifies that your profiles.yml file is set up correctly, that dbt can connect to your data warehouse, and that all dependencies are installed
- **dbt deps**: This command is used to download and manage the dbt packages that your project depends on. It reads your packages.yml file and installs all the packages listed there.
- **dbt clean**: This command cleans up your dbt project by deleting the dbt_modules and target directories. It’s useful when you want to ensure that you’re working with the most recent versions of your dbt packages and models.
- **dbt seed**
This command loads CSV files into your data warehouse. It’s useful when you have small data files that you want to use in your transformations.
- **dbt run**
This command runs transformations in your dbt project. It uses the model SQL files in your project to transform your raw data into analysis-ready tables.
- **dbt snapshot**
This command is used to track changes in your data over time. It’s useful when you have slowly changing dimensions and you want to keep a history of changes.
- **dbt test**
This command runs tests in your dbt project. It’s used to ensure that your transformations are working as expected and that your data meets the defined quality standards.
- **dbt compile**
This command compiles your dbt project to check for errors. It doesn’t run the transformations, but it does generate the SQL that would be run, which can be useful for debugging.
- **dbt docs generate**
This command generates documentation for your dbt project. It reads your model, test, and schema files and creates a set of documentation that describes your project.
- **dbt docs serve**
This command serves your dbt project documentation locally, allowing you to view it in your web browser.


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices





## Setup

- clone repository to desired folder
- Set up python env: `python3.12 -m venv venv`
- go to env: `venv\Scripts\activate`
- install dbt `pip install dbt-core==1.9.4 dbt-snowflake==1.9.2`
- edit `profiles.yml`, check [dbt documentation](https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml#example-configuration) what is needed




### Issues to fix:

dbt-anti-patterns branch is riddled with multiple antipaterns, that need your attention. Find below the list of all issues. Be aware that changing or fixing the anti-patterns might have multiple implications, varying from the code breaking due to breaking links, to leaving databse full of "legacy" objects. 

Following the `development guide` here are the issues in sequential order:

- In `Directory Structure` the desired structure od dbt project is defines. Apply all the folder names as defined. Spoiler: <details><summary></summary>Rename the folder `int`</details>
- `Naming Convention` section defines what prefixes should be used for subfolders. Verify all files follow the naming convention. <details><summary></summary>Rename the file `raw_orders.sql` to `stg_orders.sql`. Change also the refeerence in `fact_orders.sql`</details>
- Field Ordering Standards section specify the order of the columns. Make sure all files follow this pattern. <details><summary></summary>`dim_customer.sql` has mixed up order.</details>
- Staging Layer Pattern section specifies to use sourcer() macro for raw tables <details><summary></summary>`stg_payments.sql` uses dirrect table reference instead of source() macro.</details>
- In `Dimension Design Patterns` it is specified how to correctly name surrogate keys in dimensions. Make sure all dimensions follow this naming convention. <details><summary></summary>Since change in fact table will need to be applied, make sure you call the dbt command with `--full-refresh` flag</details>
- `Testing sources` section specifies what should be tested in sources. Make sure to implement this correctly in the `_sources.yml`
- Extra: While not specifically defined in the development guide, this task is meant to highlight that DBT is case sensitive. Customers table in sources is the only one specified with lower case. Change it to upper case so it's specified the same way as all other tables. Notice how the pipeline breaks.  stg_customers uses this reference but it's not able to resolve it in source() macro.

### Extra tasks:
- change materialization of stg_orders to table.
- lets delete seed and remove stg_country_codes. What implication does it have in Data Warehouse?


### Requirements:
- dedicated database for workshop
- raw schema containing the data for the workshop
- role for each user: suggetsed dbt_<username>
- schema for each user: suggested dbt_workshop_<username>
- ownership on schema to role dbt_<username>
- read rights on schema raw 
- authentication set up for users
on each trainee laptop:
    - installed python 3.12 with dedicated virtual environment (venv)
    - installed packages: dbt-core==1.9.4 and dbt-snowflake==1.9.2

