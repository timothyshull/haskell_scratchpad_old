import Data.List
import Data.Function

main = do
    let fruits = ["peach", "banana", "kiwi"]
    print $ sortBy (compare `on` length) fruits
