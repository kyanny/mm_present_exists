```
kyanny@Kensukes-MacBook-Pro ~/tmp/mm_array_present (master) 2.2.1
$ ruby test.rb
Indexes
{"_id_"=>{"v"=>1, "key"=>{"_id"=>1}, "name"=>"_id_", "ns"=>"testing.books"}}
==> Query: author.books.present?
D, [2015-04-02T14:12:00.979543 #44266] DEBUG -- : MONGODB (4.7ms) testing['books'].find({:author_id=>BSON::ObjectId('551ccf99421cdcacea000001')})
D, [2015-04-02T14:12:00.980953 #44266] DEBUG -- : MONGODB [DEBUG] cursor.refresh() for cursor 3737977236351
==> Query: author.books.exists?
D, [2015-04-02T14:12:00.996559 #44266] DEBUG -- : MONGODB (0.5ms) testing['books'].find({:author_id=>BSON::ObjectId('551ccf99421cdcacea000001')}, {:_id=>1}).limit(-1)
Calculating -------------------------------------
            present?    19.067k i/100ms
             exists?   190.000  i/100ms
-------------------------------------------------
            present?    723.054k (± 6.5%) i/s -      3.604M
             exists?      1.922k (± 7.9%) i/s -      9.690k

Comparison:
            present?:   723053.5 i/s
             exists?:     1921.7 i/s - 376.27x slower

Indexes
{"_id_"=>{"v"=>1, "key"=>{"_id"=>1}, "name"=>"_id_", "ns"=>"testing.books"},
 "author_id_1"=>
  {"v"=>1,
   "key"=>{"author_id"=>1},
   "name"=>"author_id_1",
   "ns"=>"testing.books"}}
Calculating -------------------------------------
            present?    19.105k i/100ms
             exists?   174.000  i/100ms
-------------------------------------------------
            present?    717.115k (± 6.2%) i/s -      3.573M
             exists?      1.835k (± 7.9%) i/s -      9.222k

Comparison:
            present?:   717115.0 i/s
             exists?:     1834.9 i/s - 390.82x slower
```
