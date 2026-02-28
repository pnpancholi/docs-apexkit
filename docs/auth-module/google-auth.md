# Google Authentication

In addition to email and password, ApexKit comes with Google authentication baked-in. Spending ~20 minutes is all you need to configure it. 

## Setting It Up

1. Grab yourself a [Google Cloud Platform](https://cloud.google.com/) account
2. Create a new project in google cloud console.
3. Copy your Client ID and Client Secret from the credentials page.
4. Paste them into your environmanr variables ```GOOGLE_CLIENT_ID```and  ```GOOGLE_CLIENT_SECRET```

That's all you need to get Google authentication up and running. Now, your users can sign in using their Google account.

## Page

In the ```sign-in``` page, you can see a button to sign in with Google.

[Google Authentication Page](../assets/sc-google-page.png)

## Action

For the logic/action, we continue using our appraoching of keeping actions together for consistency. So, you can find the function inside ```actions/auth```
```typescript


export async function signInWithGoogle() {
  try {
    const data = await authClient.signIn.social({ provider: "google", callbackURL: "/profile" })
    console.log("social login", data)

  } catch (error) {
    console.error("[signInWithGoogle]: Unexpected error", error)
    return { success: false, message: "Something went wrong, Please try again later" }
  }
}
```

You can futher modify this if you desire to but this is all that you need to do in order to get Google authentication up and running with ApexKit.
