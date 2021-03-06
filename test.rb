require 'mongo_mapper'
require 'logger'
require 'benchmark/ips'
require 'pp'
require 'ffaker'

# prepare MM
MongoMapper.database = 'testing'
MongoMapper.connection.instance_variable_set(:@logger, Logger.new($stdout))
MongoMapper.connection.logger.level = 1

# drop collections
MongoMapper.connection['testing']['authors'].drop()
MongoMapper.connection['testing']['books'].drop()

class Author
  include MongoMapper::Document
  many :books
end
class Book
  include MongoMapper::Document
  belongs_to :author
  key "stuff", String
end

# prepare test data
author = Author.create
1000.times do |n|
  if rand > 0.66
    author.books.create(stuff: Faker::Lorem.paragraphs(10).join)
  else
    Book.create(stuff: Faker::Lorem.paragraphs(10).join)
  end
end

puts "Indexes"
pp Book.collection.index_information

MongoMapper.connection.logger.level = 0
# show queries
puts "==> Query: author.books.present?"
author.books.present?
puts "==> Query: author.books.exists?"
author.books.exists?

MongoMapper.connection.logger.level = 1
# benchmarking
Benchmark.ips do |x|
  x.report('present?') { author.reload.books.present? }
  x.report('exists?') { author.reload.books.exists? }
  x.compare!
end

# add indexes
Book.ensure_index(:author_id)
puts "Indexes"
pp Book.collection.index_information

# benchmarking again
Benchmark.ips do |x|
  x.report('present?') { author.reload.books.present? }
  x.report('exists?') { author.reload.books.exists? }
  x.compare!
end
