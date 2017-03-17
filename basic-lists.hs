--import System.IO
import Control.Monad
import System.Random
import Data.List

-- Haskell lists are singly linked lists
-- see https://wiki.haskell.org/How_to_work_on_lists

main :: IO()
main = do
    let testList1 = [1::Int, 2, 3, 4, 5, 6, 7]
    print testList1
    testList2 <- forM [1::Int .. 10] $ \_i -> randomRIO (1::Int, 50)
    print testList2
    print $ length testList2
    print $ reverse testList2
    print $ testList2 !! 8
    print $ filter (\x -> x `mod` 2 == 0) testList2
    print $ minimum testList2
    print $ maximum testList2
    print $ 23 : testList2
    print $ testList2 ++ [23]
    print $ testList2 ++ [43, 44, 45]
    let (ys, zs) = splitAt 5 testList2
    print $ ys ++ [23] ++ zs
    print $ drop 5 testList2
    print $ tail testList2
    print $ init testList2
    print $ splitAt 3 testList2
    let (as, bs) = splitAt 3 testList2
    print (as ++ (tail bs))
    print (as ++ (init bs))
    print (null testList2)
    print (any (\x -> x == 3) testList2)
    print (all (\x -> x > 0) testList2)
    print (map (\x -> x ^ 2) testList2)
    print (zip testList2 [0::Int .. ])
    print (sort testList2)
    print (3 `elem` testList2)


