# Database Configuration

Apexkit is built with the Drizzle ORM. All of the database related files are stored inside src/db directory from schema to migrations. You can find all of this configuration inside the `drizzle.config.ts` file. 

```typescript
import { defineConfig } from "drizzle-kit";

export default defineConfig({
  out: "./src/db/migrations",
  schema: "./src/db/schema/",
  dialect: "postgresql",
  dbCredentials: {
    url: process.env.DATABASE_URL!,
    //forcing IPv4
    host: new URL(process.env.DATABASE_URL!).hostname,
  },
  verbose: true, // For debugging
});

```

## Schemas

You can see the authentication schema inside the `src/db/schema/auth.ts` file. This file consists of all the tables that we need for authentication. 

```typescript
// src/db/schema/auth.ts 
// User table
export const user = pgTable("user", {
  id: text("id").primaryKey(), //Better-Auth expects this.
  name: text("name").notNull(),
  email: text("email").notNull().unique(), // one account per email
  emailVerified: boolean("email_verified").default(false),
  image: text("image"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});

```

In addition to this, all of the migration files are inside the same `db` directory. These are created whenever you perform any changes in the DB schema using drizzle-kit as long as it's a valid. 

## Tying it all together.

To simplify database workflows, this kit comes with a couple of scripts. 

```json
{
    scripts": {
        "dev": "next dev",
        "build": "next build",
        "start": "next start",
        "db:gen": "drizzle-kit generate",
        "db:push": "drizzle-kit push",
        "db:migrate": "drizzle-kit migrate"
    },
}
```

1. Generate - Generates a migration file based on your newly created schema or a change to an existing one.
2. Migrates - Applies the generated migration file to your database after performing checks.
3. Push - Pushes the migration file into your database, omitting the SQL file changes. Ideally only performed during development.
