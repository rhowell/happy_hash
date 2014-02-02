# Happy Hash
Happy Hash makes all your hashes happier!  It will properly convert string keys into symbols.  Unlike Rails `deep_symbolize_keys`  it will traverse through Arrays, and find any hashes within.  

Happy_hash will add the `happy_hash` method to your hash objects.  By default it will underscore keys `KeyA` will become `:key_a`.  This can be overridden by passing `happy_hash(true)`.  This will cause `KeyA` to become `:KeyA`.

