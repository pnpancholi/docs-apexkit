# Magic Link

{% hint style="info" %}
Magic Links are enabled by default. This page exists to help you navigate how to modify things you you intend to.
{% endhint %}

**Magic Links** offer one of the smoothest sign-up and login experiences for your users. By removing the need for passwords, you reduce friction and improve security.



The best part? Magic Links are enabled by default. You don't have to spend hours on configuration—it is already set up to work out of the box. All you need is a [Resend](https://resend.com/) API key, and you’re ready to go.&#x20;

### 1. Requirement

To send emails, you simply need a Resend API key.

Add your key to your `.env` file: `EMAIL_API_KEY=your_api_key.`

### 2. Configuration

The logic for Magic Links is handled within the `Better-Auth` configuration located in your `auth.ts` file.

```typescript
// auth.ts (partial code)
// Authentication with magicLink
  plugins: [
    magicLink({
      sendMagicLink: async ({ email, token, url }, request) => {
        await emailProvider.send(email, magicLinkTemplate(url))
      },
      expiresIn: 300,
    }),
  ],

```

You can reflect your own branding without relying on external template builders. All email templates are stored locally in `EmailTemplates.ts`, giving you full control over the HTML and styling.

To modify the look and feel of your magic link emails, edit the `magicLinkTemplate` function:

```typescript
// EmailTemplates.ts (partial code)

export const magicLinkTemplate = (url: string): EmailTemplate => ({
  subject: "Sign into your using magic link",
  html: `
    <div style="font-family: sans-serif; max-width: 600px; margin: auto; padding: 20px;">
      <h2>Sign in to your account</h2>
      <p>Click the button below to sign in with your magic link:</p>
      <div style="text-align: center; margin: 30px 0;">
        <a href="${url}" style="background: #0066ff; color: white; padding: 12px 24px; text-decoration: none; border-radius: 6px; font-weight: bold;">
          Sign in
        </a>
      </div>
      <p style="color: #666; font-size: 14px;">Or copy and paste this link:</p>
      <p><a href="${url}" style="color: #0066ff;">${url}</a></p>
      <p style="color: #999; font-size: 12px;">This link expires in 5 minutes.</p>
    </div>
  `
})


```

You can edit this to reflect your branding without worrying about writing templates in some other platform and building dependency on it.

{% hint style="info" %}
Branding Tip: Update the `background` color and `font-family` in the template above to match your brand's style guide instantly.
{% endhint %}

### 3. Magic Link Handler

As you remember from the previous section that all of our authentication related functions are in a single actions/`auth.ts` file

```typescript
// actions/auth.ts
export async function sendMagicLink(_: any, formData: FormData): Promise<ActionResponse> {
  const email = formData.get("email") as string;

  try {
    const { error } = await authClient.signIn.magicLink({
      email,
      callbackURL: "/",
      newUserCallbackURL: "/",
      errorCallbackURL: "/",
    });
    if (error) {
      return { success: false, message: "Sorry, we don't recognise that email" };
    } else {
      return { success: true, message: "Magic link is on its way" };
    }
  } catch (error) {
    console.error("[sendMagicLink]: Unexpected error", error)
    return { success: false, message: "Something went wrong, Please try again later" }
  }
}
```

### 4. Usage (Frontend)

The sign-in page is already pre-wired to handle Magic Link requests. You can find the implementation in your login component. It uses the `authClient` to trigger the email delivery.<br>

```tsx
// sign-in/page.tsx (partial code)
            {/*-----------------------Magic Link--------------------------------*/}
            <form className="space-y-4">
              <input
                name="email"
                type="email"
                placeholder="Email"
                className="input input-bordered w-full"
                required
              />
              {/*--------------------------Error Handling and response for magic link*/}
              {magicLinkState && (
                <>
                  {magicLinkState?.success === false && (
                    <div className="alert alert-soft alert-error">
                      {magicLinkState.message}
                    </div>
                  )}
                  {magicLinkState.success === true && (
                    <div className="alert alert-soft alert-success">
                      {magicLinkState.message}
                    </div>
                  )}
                </>
              )}
              {/*--------------------------------------------------------------------*/}
              <button
                type="submit"
                className="btn btn-secondary my-2"
                formAction={magicLinkAction}
                disabled={magicLinkPending}
              >
                {magicLinkPending ? "Sending  Magic Link" : "Send Magic Link"}
              </button>
            </form>

```

**Key Benefits**

* Zero Setup: Already integrated with Better-Auth.
* No External Dependencies: Manage your template directly in your codebase.
* Secure by Design: Short lived token prevent unauthorized access.
