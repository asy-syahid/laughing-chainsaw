This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Supabase Setup

This project uses Supabase for backend services including authentication, database, and real-time subscriptions.

### Prerequisites

- A Supabase account (sign up at [supabase.com](https://supabase.com))
- Node.js 18+ installed
- Supabase CLI (optional, for local development)

### Setting Up Your Supabase Project

1. **Create a new Supabase project:**
   - Go to [app.supabase.com](https://app.supabase.com)
   - Click "New Project"
   - Fill in your project details (name, database password, region)
   - Wait for the project to be provisioned (usually takes 1-2 minutes)

2. **Get your project credentials:**
   - Go to Project Settings > API
   - Copy the following values:
     - `Project URL` → This is your `NEXT_PUBLIC_SUPABASE_URL`
     - `anon public` key → This is your `NEXT_PUBLIC_SUPABASE_ANON_KEY`
     - `service_role` key → This is your `SUPABASE_SERVICE_ROLE_KEY` (keep this secret!)

3. **Create a `.env.local` file** in the project root:

```bash
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

> ⚠️ **Important:** Never commit the `.env.local` file or expose the `SUPABASE_SERVICE_ROLE_KEY` in client-side code. This key has admin privileges and should only be used in server-side code or scripts.

### Running Database Migrations

The project includes a complete database schema in `supabase/schema.sql` that defines all tables, relationships, and Row Level Security policies.

#### Option 1: Using Supabase Dashboard (Recommended for first-time setup)

1. Go to your Supabase project dashboard
2. Navigate to the SQL Editor
3. Click "New Query"
4. Copy the entire contents of `supabase/schema.sql`
5. Paste it into the SQL Editor
6. Click "Run" to execute the migration

#### Option 2: Using Supabase CLI

```bash
# Install Supabase CLI (if not already installed)
npm install -g supabase

# Login to Supabase
supabase login

# Link your project
supabase link --project-ref your-project-ref

# Run the migration
supabase db push
```

### Seeding the Database

After running the migrations, you can populate the database with sample data.

#### Option 1: Using the SQL seed file

1. Go to your Supabase project dashboard
2. Navigate to the SQL Editor
3. Click "New Query"
4. Copy the entire contents of `supabase/seed.sql`
5. Paste it into the SQL Editor
6. Click "Run" to execute the seed script

#### Option 2: Using the TypeScript seed script

```bash
npm run seed
```

This will create:
- **1 Admin user:** admin@community.com
- **1 Technician:** tech@community.com
- **5 Resident users:** Various email addresses with unit numbers
- **Sample maintenance requests** in different states (pending, in_progress, completed)
- **Sample payments** for HOA fees and special assessments
- **Community finance records** for the past 2 months
- **Suggestions** from residents in various statuses
- **Assets** including pool, gym equipment, vehicles
- **Announcements** with different priorities
- **Votes** on suggestions

### Database Schema Overview

The database includes the following main tables:

- **users**: User profiles with role-based access (admin, technician, resident)
- **maintenance_requests**: Maintenance and repair requests from residents
- **request_categories**: Categories for maintenance requests (Plumbing, Electrical, HVAC, etc.)
- **maintenance_request_status_history**: Audit trail for request status changes
- **payments**: HOA fees, special assessments, and other payments
- **community_finance**: Financial summaries and reports for the community
- **suggestions**: Resident suggestions for community improvements
- **assets**: Community assets and their maintenance schedules
- **announcements**: Community announcements and notices
- **votes**: Voting system for suggestions and other votable items

All tables include:
- Automatic timestamps (`created_at`, `updated_at`)
- Soft delete support (`deleted_at`)
- Row Level Security (RLS) policies based on user roles
- Foreign key relationships with cascade options
- Check constraints for data validation

### Row Level Security (RLS)

The database uses Row Level Security to ensure users can only access data they're authorized to see:

- **Residents** can:
  - View and update their own profile
  - Create and view their own maintenance requests
  - View their own payments
  - View community finance, announcements, and suggestions
  - Create suggestions and vote on them

- **Technicians** can:
  - Everything residents can do, plus:
  - View all maintenance requests
  - Update requests assigned to them
  - Manage community assets

- **Admins** can:
  - Full access to all tables
  - Manage users, payments, and community finance
  - Update any maintenance request
  - Manage announcements and assets

### Using Supabase in Your Code

#### Client-side usage (for client components):

```typescript
import { createClient } from '@/lib/supabase/client';

export default function ClientComponent() {
  const supabase = createClient();
  
  // Use the client...
  const { data, error } = await supabase
    .from('maintenance_requests')
    .select('*');
}
```

#### Server-side usage (for server components):

```typescript
import { createClient } from '@/lib/supabase/server';

export default async function ServerComponent() {
  const supabase = await createClient();
  
  // Use the client...
  const { data, error } = await supabase
    .from('maintenance_requests')
    .select('*');
}
```

## Deploying on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

### Environment Variables for Vercel

When deploying to Vercel, make sure to add the following environment variables:

1. Go to your Vercel project settings
2. Navigate to "Environment Variables"
3. Add the following variables:
   - `NEXT_PUBLIC_SUPABASE_URL` (available to browser)
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` (available to browser)
   - `SUPABASE_SERVICE_ROLE_KEY` (server-only, for seed scripts)

> 💡 **Tip:** Variables prefixed with `NEXT_PUBLIC_` are exposed to the browser. The `SUPABASE_SERVICE_ROLE_KEY` is NOT prefixed with `NEXT_PUBLIC_` because it should never be exposed to the browser.

Check out the [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

## Learn More

To learn more about the technologies used in this project:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial
- [Supabase Documentation](https://supabase.com/docs) - learn about Supabase features
- [Supabase Row Level Security](https://supabase.com/docs/guides/auth/row-level-security) - understand RLS policies

## Project Structure

```
├── app/                    # Next.js app directory
│   ├── layout.tsx         # Root layout
│   └── page.tsx           # Home page
├── lib/
│   └── supabase/          # Supabase client utilities
│       ├── client.ts      # Client-side Supabase client
│       └── server.ts      # Server-side Supabase client
├── supabase/
│   ├── schema.sql         # Database schema and migrations
│   └── seed.sql           # Sample data for development
├── scripts/
│   └── seed.ts            # TypeScript seed script
└── public/                # Static assets
```

## Development Tips

1. **Always use the appropriate client**: Use `lib/supabase/client.ts` for client components and `lib/supabase/server.ts` for server components.

2. **Test RLS policies**: Make sure to test your queries with different user roles to ensure RLS policies are working correctly.

3. **Use the Supabase Dashboard**: The Supabase dashboard provides excellent tools for viewing data, running SQL queries, and monitoring your database.

4. **Keep your service role key secret**: Never commit the service role key to version control or expose it in client-side code.

5. **Local development**: For local development, you can use Supabase CLI to run a local Supabase instance with `supabase start`.
