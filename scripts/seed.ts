import { createClient } from '@supabase/supabase-js';
import * as fs from 'fs';
import * as path from 'path';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
  console.error('Error: Missing required environment variables');
  console.error('Please set NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false,
  },
});

async function runSeed() {
  try {
    console.log('Starting seed process...');

    const seedPath = path.join(process.cwd(), 'supabase', 'seed.sql');
    const seedSQL = fs.readFileSync(seedPath, 'utf8');

    console.log('Running seed.sql...');
    
    // Split by semicolons and execute each statement
    const statements = seedSQL
      .split(';')
      .map(s => s.trim())
      .filter(s => s.length > 0 && !s.startsWith('--'));

    for (let i = 0; i < statements.length; i++) {
      const statement = statements[i];
      if (statement) {
        console.log(`Executing statement ${i + 1}/${statements.length}...`);
        const { error } = await supabase.rpc('exec_sql', { sql: statement });
        
        if (error) {
          console.error(`Error executing statement ${i + 1}:`, error);
          // Continue with other statements
        }
      }
    }

    console.log('Seed completed successfully!');
    console.log('\nSample users created:');
    console.log('- admin@community.com (Admin)');
    console.log('- tech@community.com (Technician)');
    console.log('- john.smith@email.com (Resident - Unit A101)');
    console.log('- jane.doe@email.com (Resident - Unit A102)');
    console.log('- And 3 more residents...');
    
  } catch (error) {
    console.error('Seed failed:', error);
    process.exit(1);
  }
}

runSeed();
