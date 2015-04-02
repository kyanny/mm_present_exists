```
kyanny@Kensukes-MacBook-Pro ~/tmp/mm_array_present (master) 2.2.1
$ ruby test.rb
Indexes
{"_id_"=>{"v"=>1, "key"=>{"_id"=>1}, "name"=>"_id_", "ns"=>"testing.books"}}
==> Query: author.books.present?
D, [2015-04-02T15:50:15.341858 #47225] DEBUG -- : MONGODB (5.2ms) testing['books'].find({:author_id=>BSON::ObjectId('551ce6a0421cdcb879000001')})
D, [2015-04-02T15:50:15.343335 #47225] DEBUG -- : MONGODB [DEBUG] cursor.refresh() for cursor 3755309239733
==> Query: author.books.exists?
D, [2015-04-02T15:50:15.360404 #47225] DEBUG -- : MONGODB (0.6ms) testing['books'].find({:author_id=>BSON::ObjectId('551ce6a0421cdcb879000001')}, {:_id=>1}).limit(-1)
Calculating -------------------------------------
            present?     4.000  i/100ms
             exists?   116.000  i/100ms
-------------------------------------------------
            present?     46.880  (± 6.4%) i/s -    236.000
             exists?      1.072k (±13.2%) i/s -      5.336k

Comparison:
             exists?:     1072.1 i/s
            present?:       46.9 i/s - 22.87x slower

Indexes
{"_id_"=>{"v"=>1, "key"=>{"_id"=>1}, "name"=>"_id_", "ns"=>"testing.books"},
 "author_id_1"=>
  {"v"=>1,
   "key"=>{"author_id"=>1},
   "name"=>"author_id_1",
   "ns"=>"testing.books"}}
Calculating -------------------------------------
            present?     4.000  i/100ms
             exists?   106.000  i/100ms
-------------------------------------------------
            present?     47.294  (± 8.5%) i/s -    236.000
             exists?      1.090k (± 7.2%) i/s -      5.512k

Comparison:
             exists?:     1089.7 i/s
            present?:       47.3 i/s - 23.04x slower
```
