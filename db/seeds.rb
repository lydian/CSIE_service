# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'active_record/fixtures'


ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "calendars")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "students")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "assignments")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "records")
ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/test/fixtures", "courses")