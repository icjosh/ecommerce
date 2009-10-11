atom_feed do |feed|
  feed.title("E-Commerce App Products")
  feed.updated(@products.first.created_at)

  @products.each do |product|
    feed.entry(product) do |entry|
      entry.title("#{product.title} - #{number_to_currency product.price}")
      entry.content(product.description)
      
    end
  end
end
