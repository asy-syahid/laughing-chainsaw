-- Seed data for testing and development
-- Note: In production, you would use real user IDs from Supabase Auth
-- For development, we'll create sample user records with placeholder IDs

-- Insert sample users (1 admin, 1 technician, multiple residents)
INSERT INTO users (id, email, full_name, role, phone, unit_number) VALUES
  ('11111111-1111-1111-1111-111111111111', 'admin@community.com', 'Sarah Johnson', 'admin', '+1-555-0101', NULL),
  ('22222222-2222-2222-2222-222222222222', 'tech@community.com', 'Mike Rodriguez', 'technician', '+1-555-0102', NULL),
  ('33333333-3333-3333-3333-333333333333', 'john.smith@email.com', 'John Smith', 'resident', '+1-555-0103', 'A101'),
  ('44444444-4444-4444-4444-444444444444', 'jane.doe@email.com', 'Jane Doe', 'resident', '+1-555-0104', 'A102'),
  ('55555555-5555-5555-5555-555555555555', 'bob.wilson@email.com', 'Bob Wilson', 'resident', '+1-555-0105', 'B201'),
  ('66666666-6666-6666-6666-666666666666', 'alice.brown@email.com', 'Alice Brown', 'resident', '+1-555-0106', 'B202'),
  ('77777777-7777-7777-7777-777777777777', 'charlie.davis@email.com', 'Charlie Davis', 'resident', '+1-555-0107', 'C301');

-- Insert request categories
INSERT INTO request_categories (id, name, description) VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Plumbing', 'Issues related to water, pipes, and drainage'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Electrical', 'Electrical system problems and repairs'),
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', 'HVAC', 'Heating, ventilation, and air conditioning'),
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', 'Appliance', 'Kitchen and laundry appliances'),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'Common Area', 'Shared spaces and facilities'),
  ('ffffffff-ffff-ffff-ffff-ffffffffffff', 'Pest Control', 'Pest management and extermination'),
  ('99999999-9999-9999-9999-999999999999', 'Other', 'Miscellaneous maintenance requests');

-- Insert sample maintenance requests
INSERT INTO maintenance_requests (id, user_id, category_id, title, description, status, priority, assigned_to, location, created_at) VALUES
  (
    uuid_generate_v4(),
    '33333333-3333-3333-3333-333333333333',
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    'Leaking Kitchen Faucet',
    'The kitchen faucet has been dripping constantly for the past week. It''s wasting water and the sound is annoying.',
    'in_progress',
    'medium',
    '22222222-2222-2222-2222-222222222222',
    'Unit A101 - Kitchen',
    NOW() - INTERVAL '3 days'
  ),
  (
    uuid_generate_v4(),
    '44444444-4444-4444-4444-444444444444',
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
    'Bedroom Light Not Working',
    'The main bedroom ceiling light stopped working. I tried changing the bulb but it still doesn''t turn on.',
    'pending',
    'low',
    NULL,
    'Unit A102 - Bedroom',
    NOW() - INTERVAL '1 day'
  ),
  (
    uuid_generate_v4(),
    '55555555-5555-5555-5555-555555555555',
    'cccccccc-cccc-cccc-cccc-cccccccccccc',
    'AC Not Cooling Properly',
    'The air conditioner is running but not cooling the apartment effectively. Temperature stays around 78°F even when set to 68°F.',
    'pending',
    'high',
    NULL,
    'Unit B201',
    NOW() - INTERVAL '6 hours'
  ),
  (
    uuid_generate_v4(),
    '66666666-6666-6666-6666-666666666666',
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
    'Pool Gate Not Closing',
    'The pool area gate is not closing properly. It''s a safety concern especially for children.',
    'completed',
    'high',
    '22222222-2222-2222-2222-222222222222',
    'Pool Area',
    NOW() - INTERVAL '7 days'
  ),
  (
    uuid_generate_v4(),
    '77777777-7777-7777-7777-777777777777',
    'dddddddd-dddd-dddd-dddd-dddddddddddd',
    'Dishwasher Making Loud Noise',
    'Dishwasher is working but making an unusual grinding noise during the wash cycle.',
    'pending',
    'medium',
    NULL,
    'Unit C301 - Kitchen',
    NOW() - INTERVAL '2 days'
  );

-- Insert sample payments
INSERT INTO payments (id, user_id, amount, payment_type, payment_method, status, due_date, paid_date, description) VALUES
  (
    uuid_generate_v4(),
    '33333333-3333-3333-3333-333333333333',
    450.00,
    'maintenance_fee',
    'bank_transfer',
    'completed',
    DATE_TRUNC('month', NOW()),
    DATE_TRUNC('month', NOW()) + INTERVAL '5 days',
    'Monthly HOA fee for December'
  ),
  (
    uuid_generate_v4(),
    '44444444-4444-4444-4444-444444444444',
    450.00,
    'maintenance_fee',
    'credit_card',
    'completed',
    DATE_TRUNC('month', NOW()),
    DATE_TRUNC('month', NOW()) + INTERVAL '3 days',
    'Monthly HOA fee for December'
  ),
  (
    uuid_generate_v4(),
    '55555555-5555-5555-5555-555555555555',
    450.00,
    'maintenance_fee',
    NULL,
    'pending',
    DATE_TRUNC('month', NOW()),
    NULL,
    'Monthly HOA fee for December'
  ),
  (
    uuid_generate_v4(),
    '66666666-6666-6666-6666-666666666666',
    450.00,
    'maintenance_fee',
    'bank_transfer',
    'completed',
    DATE_TRUNC('month', NOW()),
    DATE_TRUNC('month', NOW()) + INTERVAL '7 days',
    'Monthly HOA fee for December'
  ),
  (
    uuid_generate_v4(),
    '77777777-7777-7777-7777-777777777777',
    450.00,
    'maintenance_fee',
    NULL,
    'pending',
    DATE_TRUNC('month', NOW()),
    NULL,
    'Monthly HOA fee for December'
  ),
  (
    uuid_generate_v4(),
    '33333333-3333-3333-3333-333333333333',
    450.00,
    'maintenance_fee',
    'credit_card',
    'completed',
    DATE_TRUNC('month', NOW()) - INTERVAL '1 month',
    DATE_TRUNC('month', NOW()) - INTERVAL '25 days',
    'Monthly HOA fee for November'
  ),
  (
    uuid_generate_v4(),
    '55555555-5555-5555-5555-555555555555',
    200.00,
    'special_assessment',
    'check',
    'completed',
    DATE_TRUNC('month', NOW()) - INTERVAL '2 months',
    DATE_TRUNC('month', NOW()) - INTERVAL '50 days',
    'Pool renovation special assessment'
  );

-- Insert community finance records
INSERT INTO community_finance (id, period_start, period_end, total_income, total_expenses, category, description, created_by) VALUES
  (
    uuid_generate_v4(),
    DATE_TRUNC('month', NOW()) - INTERVAL '2 months',
    DATE_TRUNC('month', NOW()) - INTERVAL '2 months' + INTERVAL '1 month' - INTERVAL '1 day',
    15750.00,
    12300.00,
    'October Summary',
    'Income from HOA fees and parking permits. Expenses include landscaping, utilities, and routine maintenance.',
    '11111111-1111-1111-1111-111111111111'
  ),
  (
    uuid_generate_v4(),
    DATE_TRUNC('month', NOW()) - INTERVAL '1 month',
    DATE_TRUNC('month', NOW()) - INTERVAL '1 day',
    16200.00,
    13800.00,
    'November Summary',
    'Income from HOA fees. Higher expenses due to HVAC system maintenance and pool repairs.',
    '11111111-1111-1111-1111-111111111111'
  );

-- Insert suggestions
INSERT INTO suggestions (id, user_id, title, description, category, status, created_at) VALUES
  (
    uuid_generate_v4(),
    '33333333-3333-3333-3333-333333333333',
    'Install EV Charging Stations',
    'Many residents are now driving electric vehicles. Installing 2-3 EV charging stations in the parking area would be a valuable amenity.',
    'Amenities',
    'under_review',
    NOW() - INTERVAL '10 days'
  ),
  (
    uuid_generate_v4(),
    '44444444-4444-4444-4444-444444444444',
    'Upgrade Gym Equipment',
    'The gym equipment is getting old. Suggest replacing the treadmill and adding a rowing machine.',
    'Fitness',
    'accepted',
    NOW() - INTERVAL '15 days'
  ),
  (
    uuid_generate_v4(),
    '55555555-5555-5555-5555-555555555555',
    'Community Garden',
    'Would love to see a small community garden where residents can grow herbs and vegetables.',
    'Community',
    'open',
    NOW() - INTERVAL '5 days'
  ),
  (
    uuid_generate_v4(),
    '66666666-6666-6666-6666-666666666666',
    'Better Recycling Program',
    'We need more recycling bins and clearer guidelines on what can be recycled.',
    'Environmental',
    'implemented',
    NOW() - INTERVAL '30 days'
  );

-- Insert assets
INSERT INTO assets (id, name, description, asset_type, purchase_date, purchase_price, current_value, location, condition, last_maintenance_date, next_maintenance_date, created_by) VALUES
  (
    uuid_generate_v4(),
    'Community Pool',
    'Main swimming pool with heating system',
    'building',
    '2015-05-01',
    45000.00,
    35000.00,
    'Pool Area',
    'good',
    NOW() - INTERVAL '45 days',
    NOW() + INTERVAL '90 days',
    '11111111-1111-1111-1111-111111111111'
  ),
  (
    uuid_generate_v4(),
    'Lawn Mower',
    'Commercial riding lawn mower for landscaping',
    'equipment',
    '2020-03-15',
    5500.00,
    3800.00,
    'Maintenance Shed',
    'good',
    NOW() - INTERVAL '30 days',
    NOW() + INTERVAL '60 days',
    '11111111-1111-1111-1111-111111111111'
  ),
  (
    uuid_generate_v4(),
    'Maintenance Truck',
    'Ford F-150 for maintenance staff',
    'vehicle',
    '2019-08-20',
    32000.00,
    24000.00,
    'Parking Lot',
    'good',
    NOW() - INTERVAL '20 days',
    NOW() + INTERVAL '70 days',
    '11111111-1111-1111-1111-111111111111'
  ),
  (
    uuid_generate_v4(),
    'HVAC System - Building A',
    'Central air conditioning and heating system',
    'equipment',
    '2018-06-10',
    28000.00,
    20000.00,
    'Building A Rooftop',
    'fair',
    NOW() - INTERVAL '60 days',
    NOW() + INTERVAL '30 days',
    '11111111-1111-1111-1111-111111111111'
  ),
  (
    uuid_generate_v4(),
    'Gym Equipment Set',
    'Complete gym equipment including treadmills, weights, and machines',
    'equipment',
    '2017-01-15',
    15000.00,
    8000.00,
    'Community Gym',
    'fair',
    NOW() - INTERVAL '90 days',
    NOW() + INTERVAL '30 days',
    '11111111-1111-1111-1111-111111111111'
  );

-- Insert announcements
INSERT INTO announcements (id, title, content, author_id, priority, category, published_at, expires_at, created_at) VALUES
  (
    uuid_generate_v4(),
    'Pool Maintenance Schedule',
    'The community pool will be closed for routine maintenance on December 20-21. We apologize for any inconvenience. The pool will reopen on December 22 at 8 AM.',
    '11111111-1111-1111-1111-111111111111',
    'high',
    'Maintenance',
    NOW() - INTERVAL '2 days',
    NOW() + INTERVAL '10 days',
    NOW() - INTERVAL '2 days'
  ),
  (
    uuid_generate_v4(),
    'Holiday Decoration Contest',
    'Get into the holiday spirit! We''re hosting a door decoration contest. Winners will receive a $50 gift card. Judging will take place on December 23. All residents are welcome to participate!',
    '11111111-1111-1111-1111-111111111111',
    'normal',
    'Events',
    NOW() - INTERVAL '5 days',
    NOW() + INTERVAL '8 days',
    NOW() - INTERVAL '5 days'
  ),
  (
    uuid_generate_v4(),
    'Parking Lot Resurfacing',
    'The parking lot resurfacing project will begin on January 5. Temporary parking arrangements will be available in the overflow lot. The project is expected to take 2 weeks. Thank you for your patience.',
    '11111111-1111-1111-1111-111111111111',
    'urgent',
    'Important',
    NOW() - INTERVAL '1 day',
    NOW() + INTERVAL '20 days',
    NOW() - INTERVAL '1 day'
  ),
  (
    uuid_generate_v4(),
    'New Recycling Guidelines',
    'Following resident suggestions, we''ve updated our recycling program. New bins have been installed near each building. Please see the attached guidelines for what can be recycled. Let''s work together to make our community more sustainable!',
    '11111111-1111-1111-1111-111111111111',
    'normal',
    'Community',
    NOW() - INTERVAL '7 days',
    NOW() + INTERVAL '30 days',
    NOW() - INTERVAL '7 days'
  );

-- Insert votes for suggestions
INSERT INTO votes (user_id, votable_type, votable_id, vote_value) 
SELECT 
  u.id,
  'suggestion',
  s.id,
  CASE WHEN random() > 0.3 THEN 1 ELSE -1 END
FROM users u
CROSS JOIN suggestions s
WHERE u.role = 'resident' 
  AND random() > 0.4
LIMIT 15;

-- Insert maintenance request status history
INSERT INTO maintenance_request_status_history (request_id, status, changed_by, notes, created_at)
SELECT 
  mr.id,
  'pending',
  mr.user_id,
  'Request submitted',
  mr.created_at
FROM maintenance_requests mr;

INSERT INTO maintenance_request_status_history (request_id, status, changed_by, notes, created_at)
SELECT 
  mr.id,
  'in_progress',
  mr.assigned_to,
  'Assigned to technician and work started',
  mr.created_at + INTERVAL '1 day'
FROM maintenance_requests mr
WHERE mr.status = 'in_progress';

INSERT INTO maintenance_request_status_history (request_id, status, changed_by, notes, created_at)
SELECT 
  mr.id,
  'completed',
  mr.assigned_to,
  'Work completed successfully',
  mr.created_at + INTERVAL '5 days'
FROM maintenance_requests mr
WHERE mr.status = 'completed';
