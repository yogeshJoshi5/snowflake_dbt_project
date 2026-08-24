# snowflake_dbt_project

Snowflake Healthcare Analytics Pipeline using dbt
Built a data transformation pipeline using dbt and Snowflake.
Organized the project into standard dbt components including models, seeds, snapshots, tests, macros, and analyses.
Used a layered data architecture to transform raw patient/hospital data into cleaner, analytics-ready datasets.
Used dbt models to perform SQL-based transformations and manage dependencies using ref().
Defined and managed upstream datasets using dbt sources.
Implemented dbt seeds for small static/reference datasets.
Implemented dbt snapshots to track historical changes in patient records, following an SCD Type 2-style approach.
Added data quality validation using dbt tests.
Used Snowflake as the cloud data warehouse and dbt for transformation and data modeling.
Structured the project for maintainability by separating reusable logic, tests, models, snapshots, and analysis artifacts.
