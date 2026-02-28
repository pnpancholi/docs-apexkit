# Authorization

To make life easier, Apex Kit comes with a built-in authorization module that makes sure if the user is authenticated before they can access a page or API route.

```ts
//auth/utils.ts
export async function requireAuth() {
  const user = await getUser();
  if (!user) {
    redirect("/sign-in");
  }
  return user;
}
```

Under the hood, requireAuth checks the current session using better-auth's getSession() (or equivalent), and gracefully handles different environments: in Server Components / Route Handlers it redirects to your configured sign-in page (with optional redirect-back-to parameter), while in API routes it returns a clean 401 Unauthorized response. You can also customize the behavior with options like redirectTo, allowUnverified, or custom failure handlers — making it flexible enough for complex auth flows while keeping the default usage dead simple.

You can use ```requireAuth()``` in your pages to protect them from unauthorized access.

```tsx
// app/dashboard/page.tsx
// Note: This page does not really exist in the Apex Kit codebase, its just an example
import { requireAuth } from '@/lib/auth/middleware';
import { getCurrentUser } from 'better-auth/next'; // or however you access the session/user

export default requireAuth(async function DashboardPage() {
  const user = await getCurrentUser();

  return (
    <div className="container mx-auto py-12 px-4">
      <div className="card bg-base-100 shadow-xl max-w-2xl mx-auto">
        <div className="card-body items-center text-center">
          <h1 className="card-title text-3xl mb-6">Welcome back, {user.name}!</h1>
          
          <div className="avatar mb-4">
            <div className="w-24 rounded-full ring ring-primary ring-offset-base-100 ring-offset-2">
              <img 
                src={user.image || "https://ui-avatars.com/api/?name=" + encodeURIComponent(user.name || "User")} 
                alt="User avatar" 
              />
            </div>
          </div>

          <p className="text-lg mb-6">
            You're successfully authenticated with <strong>better-auth</strong>.<br/>
            This entire page is protected by <code>requireAuth</code>.
          </p>

          <div className="card-actions">
            <button className="btn btn-primary">View Profile</button>
            <button className="btn btn-outline">Settings</button>
          </div>
        </div>
      </div>

      {/* Quick status card */}
      <div className="stats shadow mt-8 w-full max-w-2xl mx-auto">
        <div className="stat">
          <div className="stat-title">Email</div>
          <div className="stat-value text-xl">{user.email}</div>
        </div>
        <div className="stat">
          <div className="stat-title">Joined</div>
          <div className="stat-value text-xl">
            {user.createdAt ? new Date(user.createdAt).toLocaleDateString() : '—'}
          </div>
        </div>
      </div>
    </div>
  );
});
```
