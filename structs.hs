data Person = Person { name :: String
                     , age :: Int
                     } deriving Show

main = do
    print $ Person "Bob" 20
    print $ Person {name = "Alice", age = 30}
    -- print $ Person {name = "Fred"}
    print $ Person {name = "Ann", age = 40}

    let s = Person {name = "Sean", age = 50}
    putStrLn $ name s
    print $ age s

    let s' = s {age = 51}
    print $ age s'
