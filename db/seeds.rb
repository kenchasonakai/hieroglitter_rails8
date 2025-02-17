user = User.new(email_address: "cleopatra@example.com", password_digest: "password") # cleopatra
user.image = File.open(Rails.root.join('app', 'assets', 'images', 'cleopatra.png'))
user.save

user = User.new(email_address: "world_giza_sphynx@example.com", password_digest: "password") # world_giza_sphynx
user.image = File.open(Rails.root.join('app', 'assets', 'images', 'world_giza_sphynx.png'))
user.save

user = User.new(email_address: "tut_ankh_amon@example.com", password_digest: "password") # Tut_Ankh_Amon_tsutankamen
user.image = File.open(Rails.root.join('app', 'assets', 'images', 'Tut_Ankh_Amon_tsutankamen.png'))
user.save

user = User.new(email_address: "cat_sphynx@example.com", password_digest: "password") # cat_sphynx
user.image = File.open(Rails.root.join('app', 'assets', 'images', 'cat_sphynx.png'))
user.save

user = User.new(email_address: "pyramid@example.com", password_digest: "password") # pyramid
user.image = File.open(Rails.root.join('app', 'assets', 'images', 'pyramid.png'))
user.save
