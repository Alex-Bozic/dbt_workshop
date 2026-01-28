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




