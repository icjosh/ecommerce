namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    
    # TODO: add more models below
    [Product].each(&:delete_all)

    Product.populate(10..100) do |product|
      product.title = Populator.words(1..5).titleize
      product.description = Populator.sentences(2..10)
      product.price = [4.99, 19.95, 100]
      product.image_url = "/images/test.jpg"
      product.created_at = 2.years.ago..Time.now
    end
    
  end
end
