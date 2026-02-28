# Email and Password

If you have performed all the tasks successfully in the previous section, you already have a working email and password authentication up and running with-in minutes. Your users can now do perform the following tasks :&#x20;

1. Create an account
2. Visit their profile page (if authenticated)
3. Update their email with a secure verification link
4. Update their profile information (if authenticated)
5. Reset password

<figure><img src="../.gitbook/assets/Screenshot 2026-01-07 at 14-47-32 The Next Start-Up.png" alt=""><figcaption></figcaption></figure>

***

### What's In The Package ?

1. Sign-Up form
2. Sign-In form
3. Profile page
4. Reset password page
5. Email provider configuration
6. Auth actions
   1. `signUp`
   2. `signInWithPassword`
   3. `sendMagicLink`
   4. `requestPasswordReset`
   5. `resetPassword`
   6. `updateEmail`
7. A `requireAuth`  middleware for authorization



### Pages

All of the pages are kept in their named directories respectively as per the NextJS requirements and industry standards. In order to keep things organized and clean, these pages only consist the `JSX` and minimal logic required. This is a purely opinionated choice to keep the code-base balanced between  single responsibility and readable in order to keep it maintainable. \
\
In addition to that, the Sign In, Sign Up, Reset Password, and Forgot Password pages are intentionally rendered client-side , respectively. This is because they are for the most part small forms that need interactivity to communicate with users about progress. Using `useActionState` really helps in keeping code clean

On the other hand, the Profile page is rendered on the server-side with an assumption that ideally your business needs will require you to add more things under profile . Rendering this will allow better loading times when you need to fetch a lot of data, provide snappy user experience like updating username , and serve as a hub to render other server or client side components as per your business need.\
\
An example for this would be.

1.  Updating username&#x20;

    1. Relies on server action
    2. Start editing the field, its intuitive&#x20;
    3. Snappy reflection as user see their name updated right away


2.  Updating Email

    1. A client-side rendered modal wrapped inside Profile page
    2. Is not supposed to be used often, multi-click action
    3. Needs client interactivity (response) since change email requires more filtering than username. In addition to some tiny behaviors like closing upon <kbd>Esc</kbd> key or backdrop click



### Actions

It can often get messy to have conditionally rendered JavaScript, CSS with HTTP requests and their error handling all in one file. And it can often lead to repeated code. A much cleaner approach would be to keep them separated. But an action file for each page which only contains one function can make navigation difficult and may still fail at keeping the code DRY.

ApexKit handles this my keep all authentication functions in a single `auth.ts`

It further uses a custom type that is used through authentication functions for standard error handling.&#x20;

```typescript
// actions/auth.ts
type ActionResponse = { success: boolean; message: string };
```

And we encourage you to use the same pattern for a maintainable code-base.

### Security

1. No duplicate emails , this works for both creating a new account and updating an email.
2. When a user updates their email, a new verification email is sent to that new email.
3. A regex filter for email to make sure its the correct format.
4. About password, there is only a simple password filter to make sure that its at least four characters. This is intentionally kept simple for manual testing but can be easily modified to meet your standards.&#x20;

{% hint style="warning" %}
Its a must that you ship your project with a better password filter when you are ready for production.
{% endhint %}
