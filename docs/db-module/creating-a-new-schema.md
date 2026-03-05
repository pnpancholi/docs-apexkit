# Creating a New Schema

ApexKit ships with **Better Auth** + **Drizzle ORM** wired up perfectly — auth tables are generated and managed separately so you can focus on building features like posts, profiles, comments, etc.

## Step-by-Step: Create a Posts Schema

1. **Define your table in a dedicated schema file**  
   We recommend keeping schema files together in a `src/db/schema:with` folder.

   ```ts
   // src/db/schema.ts  (or src/db/posts.ts)
   import { pgTable, text, timestamp, serial, boolean, integer } from "drizzle-orm/pg-core";
   import { relations } from "drizzle-orm";
   import { user } from "./auth-schema"; // ← optional: if you want to reference auth.user

   export const posts = pgTable("posts", {
     id: serial("id").primaryKey(),
     title: text("title").notNull(),
     slug: text("slug").unique().notNull(),
     content: text("content").notNull(),
     excerpt: text("excerpt"),
     published: boolean("published").default(false).notNull(),
     authorId: integer("author_id").references(() => user.id, { onDelete: "cascade" }), // ← links to Better Auth user
     createdAt: timestamp("created_at", { withTimezone: true }).defaultNow().notNull(),
     updatedAt: timestamp("updated_at", { withTimezone: true }).defaultNow().notNull(),
   });

   // Optional: Drizzle relations for nice joins/queries
   export const postsRelations = relations(posts, ({ one }) => ({
     author: one(user, {
       fields: [posts.authorId],
       references: [user.id],
     }),
   }));

2. Generate a migration file with `npx db:gen`

3. Apply the migration file to your database with `npx db:migrate`
