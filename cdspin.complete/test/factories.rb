Factory.define :artist do |a|
  a.first_name 'John'
  a.sequence(:last_name) {|n| "X#{n}" }
end

Factory.define :album do |a|
  a.sequence(:title) {|n| "Superfly vol #{n}"}
  a.release_date Date.today
end

