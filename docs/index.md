---
icon: lucide/notebook
---

# Introduction

### What is ApexKit ?

**ApexKit is an opinionated Next.js starter kit designed to help builders ship their projects faster — without the usual headaches of vendor lock-in or endless decision-making about tools and libraries.**

When you're a solo developer or part of a small team validating an idea — whether for a hackathon, an incubator, or your own startup — time spent configuring authentication, email services, UI components, or database setups takes valuable time away from focusing on your core idea and unique features. These are repetitive tasks that slow you down when speed is everything.

But rapid prototyping shouldn’t come at the cost of performance, scalability, or future flexibility. Many "quick-start" solutions sacrifice performance, trap you in vendor ecosystems, or leave behind technical debt that becomes expensive — in both time and money — the moment your project gains traction. Suddenly, you’re stuck refactoring, migrating, or paying for subscriptions that don’t truly help you grow.

ApexKit gives you the best of both worlds: the velocity of indie hacking and the clean, scalable foundation that production apps (and serious businesses) need from day one.
<br>

#### What’s inside

* **Next.js 15** (App Router + React Server Components)
* **Drizzle ORM** : type-safe, SQL, and flexible enough to works with database solution of your choice.&#x20;
* **Tailwind CSS + DaisyUI** – beautiful and accessible UI out of the box
* **Better Auth** : Fine-tuned, vendor-agnostic authentication
* Full **TypeScript** support
* Production-ready patterns for **authentication** and **authorization**.
<br>

#### Ready to give it a try ? \[Get Started]



### Philosophy / Principles

This short “Philosophy” section is a bit more candid and conversational than the rest of the docs — think of it as the "why" behind the choices. The rest of the documentation stays clean, concise, and to the point, I promise.

Whether you’re an experienced developer checking for red flags or just getting started and curious about the reasoning, I hope it helps.

#### Opinionated

We won’t pretend otherwise: “best tool” is subjective. Some developers are perfectly happy (and productive) with MongoDB; others wouldn’t touch a non-relational database with a ten-foot pole. Some swear JavaScript has no place on the back-end; others run profitable, and secure businesses on it every day.

That same spectrum exists when choosing a starter kit. Being opinionated isn’t about arrogance—it’s about making deliberate, battle-tested choices for two practical reasons:

#### Safety Through Familiarity

Deep knowledge of a tool-set lets you anticipate its pitfalls and edge cases. A JavaScript developer who understands where Node.JS can be notorious for memory leaks is just as safe as a seasoned Rust engineer who knows the same about their language (yes, you can still leak memory in Rust). Strong opinions come from real-world experience. They act as guardrails that keep most projects secure and stable by default.

#### Speed That Actually Ships Products

It’s incredibly easy and fun to chase the next hot framework or CSS library. I did it constantly in college: one assignment in React, the next in Vue, then Angular, then Gatsby. Curiosity and experimentation are how we grow as developers.

But when you’re building something real — especially as a solo founder, small team, or side-project warrior with a day job—that mindset becomes expensive. Trying the shiny new thing might feel exciting, but it rarely helps you ship faster or sleep better at night.

I wouldn’t reach for an experimental stack when helping a friend launch a platform for independent journalists on nights and weekends. Tempting? Absolutely. Responsible? Not even close.

**Some opinions of this project, briefly:**&#x20;

1.  Drizzle ORM.&#x20;

    Getting really good with a lightweight, type-safe ORM like Drizzle is a far better long-term investment than tying your data layer to platform-specific SDKs (Supabase, Firebase, Clerk, etc.). Those SDKs often create hidden problems:

    * Painful refactoring when you outgrow or switch platforms
    * Forced rewrites after breaking changes
    * Vendor lock-in because migrating later costs more in time and opportunity than staying stuck

    With Drizzle, you own your schema and queries. You stay portable, type-safe, and in full control — no surprises when your project takes off.&#x20;
2.  TypeScript

    Many developers have a love-hate relationship with JavaScript’s type system. You can go fully untyped, use JSDoc, or embrace TypeScript in various ways. ApexKit chooses full TypeScript because it can be adopted progressively, catches entire classes of bugs at compile time, and dramatically reduces runtime crashes.

3. Better Auth

    Authentications and authorization are among the most crucial parts of any application. You need both and they need to be secure. With Better Auth, we get to roll a secure authentication system without being stuck with a vendor. We can own our data, set up backups that fit the business needs, and focus on building meaningful features. 

    And with ApexKit, you do not have to worry about setting it up from scratch. All you have to do is provide a database connection, and you have a working authentication with sign-up, sign-in, reset password, email verification, magic links and even your transaction emails. And you can always extend for OTPs and two-factor authentication easily with Better Auth.

4. Stability

    Apexkit is built for stability, and easy management. Refactoring doesn't need to break everything. Stability means being battle-tested and having the flexibility to evolve. Just like JavaScript, there are new UI frameworks being launched every day. But we use Tailwind CSS and DaisyUI to keep the project stable. You get a solid community, flexibility to build your own components with Tailwind, and speed of DaisyUI to get started quick. You get the stability of Better Auth's battle-tested auth system, flexibility of owning your data, and speed of Better Auth plugins to add more security features.

