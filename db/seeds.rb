class Seed

  def self.begin
    seed = Seed.new
    seed.generate_products
  end

  def generate_products
    Product.destroy_all
    20.times do |i|
      Product.create!(name: Faker::Lorem.word, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop, in_stock: rand(10..100), image: File.new("app/assets/images/image#{i}.jpg"))
    end
  end
end

Seed.begin

p "Created #{Product.count} products"
