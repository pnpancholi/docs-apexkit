# Updating your hosted database

This guide will help you update your hosted database. It is nornmal to find yourself in a position where you need to update the services you are using for your business or project. Maybe you are using Supabase and need to move to AWS because it is more cost-effective or the other way around because you find Supabase easier to work with. These kinds of migrations are often easier when working with ORM tools and "Code As Schema" tools. Since we are maintaining the source of truth with Drizzle, switching to another database solution is easy.

## Generating a Migration File (Optional)

You will need to create a migration file with `npm run db:gen` if you made any changes to your schema. Otherwise, just ignore this step. You have all the migration files that you need.

## Pushing Your Schema to the New Database

This kit is designed with modularity and freedom of choice in mind.

First, we will change the environment variable. Just get your new database URL and update it in the `.env` file. Note that it works with PostgreSQL only for now. Now just run `npm run db:migrate` and voila! You are good to go.

Note: You still need to perform a data migration to your new hosted solution.
