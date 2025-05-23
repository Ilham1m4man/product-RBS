# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Product.Repo.insert!(%Product.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Product.Repo
alias Product.RBSProducts
alias Faker.Commerce

for _ <- 1..10 do
  Repo.insert!(%RBSProducts.RBSProduct{name: Commerce.product_name, price_idr: trunc(Commerce.price) * 1000})
end
