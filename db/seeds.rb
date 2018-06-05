# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Product.delete_all
# . . .
  Product.create!(title: 'T-shirt',
    description:
    %{<p>
    Ruby is the fastest growing and most
    </p>},
    image_url: 'sample_image.jpg',
    price: 10.89,
    permalink: 'perma1wqeqweqw')

  Product.create!(title: 'Shirt',
    description:
    %{<p>
        Ruby is the fastest growing and most
    </p>},
    image_url: 'sample_image.jpg',
    price: 20.45,
    permalink: 'perma3')

  Product.create!(title: 'Jeans',
    description:
    %{<p>
        Ruby is the fastest growing and most
    </p>},
    image_url: 'sample_image.jpg',
    price: 78.09,
    permalink: 'perma2')

  Product.create!(title: 'Shoes',
    description:
    %{<p>
        Ruby is the fastest growing and most
    </p>},
    image_url: 'sample_image.jpg',
    price: 78.09,
    permalink: 'perma16')

  Product.create!(title: 'Socks',
    description:
    %{<p>
    Ruby is the fastest growing and most
    </p>},
    image_url: 'sample_image.jpg',
    price: 78.09,
    permalink: 'perma17')

  Product.create!(title: 'Apple',
    description:
    %{<p>
        Ruby is the fastest growing and most
    </p>},
    image_url: 'sample_image.jpg',
    price: 78.09,
    permalink: 'perma1111')

  Product.create!(title: 'Banana',
    description:
    %{<p>
        Ruby is the fastest growing and most
    </p>},
    image_url: 'sample_image.jpg',
    price: 78.09,
    permalink: 'perma11322')
