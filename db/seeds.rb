require "csv"

# Destroy all the data from all the tables mentioned below
ProductSize.destroy_all
Product.destroy_all
Brand.destroy_all
ProductGender.destroy_all
Category.destroy_all
Size.destroy_all

# reset the id count to zero for all the tables mentioned below
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='brands';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='products';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='product_genders';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='categories';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='sizes';")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='product_sizes';")

# filepath for each csv files
brand_filepath = Rails.root.join("db/brand.csv")
category_filepath = Rails.root.join("db/category.csv")
product_gender_filepath = Rails.root.join("db/product_gender.csv")
product_filepath = Rails.root.join("db/product.csv")
size_filepath = Rails.root.join("db/size.csv")
product_size_filepath = Rails.root.join("db/product_size.csv")

# parse csv files to 2d array
brand_data = CSV.parse(File.read(brand_filepath), headers: true)
category_data = CSV.parse(File.read(category_filepath), headers: true)
product_gender_data = CSV.parse(File.read(product_gender_filepath), headers: true)
product_data = CSV.parse(File.read(product_filepath), headers: true)
size_data = CSV.parse(File.read(size_filepath), headers: true)
product_size_data = CSV.parse(File.read(product_size_filepath), headers: true)

# populate Brands table
brand_data.each do |b|
  brand_name = Brand.find_by(brand_name: b["brand_name"])

  unless brand_name&.valid?
    Brand.create(
      brand_name: b["brand_name"]
    )
  end
end

# populate Categories table
category_data.each do |c|
  category_name = Category.find_by(category_name: c["category_name"])

  unless category_name&.valid?
    Category.create(
      category_name: c["category_name"]
    )
  end
end

# populate Product_Genders table
product_gender_data.each do |pg|
  product_gender = ProductGender.find_by(product_gender: pg["product_gender"])

  unless product_gender&.valid?
    ProductGender.create(
      product_gender: pg["product_gender"]
    )
  end
end

# populate Products table
product_data.each do |pd|
  product = Product.find_by(product_name: pd["product_name"])

  unless product&.valid?
    Product.create(
      product_name: pd["product_name"],
      resell_price: pd["resell_price"],
      retail_price: pd["retail_price"],
      description: pd["description"],
      released_date: pd["released_date"],
      is_used: pd["is_used"],
      color: pd["color"],
      image_path: pd["image_path"],
      brand_id: pd["brand_id"],
      category_id: pd["category_id"],
      product_gender_id: pd["product_gender_id"]
    )
  end
end

size_data.each do |s|
  size = Size.find_by(size: s["size"])

  unless size&.valid?
    Size.create(
      size: s["size"],
    )
  end
end

product_size_data.each do |ps|
    ProductSize.create(
      product_id: ps["product_id"],
      size_id: ps["size_id"]
    )
end

puts Brand.count
puts Category.count
puts ProductGender.count
puts Product.count
puts Size.count
puts ProductSize.count