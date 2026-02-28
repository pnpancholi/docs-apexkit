# Updating your existing schema

This page will guide you through updating your existing schema. Drizzle makes it quite easy to update your existing schema. Let's say you want to create a new field in your existing schema, then you can simply add a new column to your schema file.

```typescript
// db/schema/auth.ts

export const user = pgTable("user", {
  id: text("id").primaryKey(), 
  name: text("name").notNull(),
  bio: text("null").notNull(), // new field
  email: text("email").notNull().unique(),
  emailVerified: boolean("email_verified").default(false),
  image: text("image"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});


```

Now you can run the `npm run db:gen` script to generate a new migration file. And `npm run db:migrate` to apply the changes to your database.

## Fixing / Updating

Maybe you made a typo in the schema file? 

```typescript
// Example of typo

export const user = pgTable("user", {
  id: text("id").primaryKey(), 
  name: text("nmae").notNull(), // accidental typo
  bio: text("null").notNull(), // new field
  email: text("email").notNull().unique(),
  emailVerified: boolean("email_verified").default(false),
  image: text("image"),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  updatedAt: timestamp("updated_at").defaultNow().notNull(),
});
```

You can see the line where "name" is misspelled with "nmae". No problem, Drizzle-Kit makes it easy to deal with this. All you need to do is update the schema file and run the `npm run db:gen` script. Drizzle Kit will prompt you asking whether this is a rename or a new column. Just answer 'yes' to the rename prompt, and your database will be updated automatically.


