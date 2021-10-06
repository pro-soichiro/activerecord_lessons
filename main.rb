require 'active_support/all'
require 'active_record'
require 'pp'

Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

class User < ActiveRecord::Base
end

User.delete_all

User.create(name: "tanaka", age: 19)
User.create(name: "takashi", age: 25)
User.create(name: "hayashi", age: 31)
User.create(name: "mizutani", age: 28)
User.create(name: "otsuka", age: 35)



# pp User.select("id, name, age").find(3)
pp User.select("id, name, age").find_by_name("tanaka")

pp User.select("id, name, age").find_by_name!("kiriya")