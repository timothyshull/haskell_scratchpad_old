import Data.Typeable
import MyDrop

isOdd :: Int -> Bool
isOdd n = mod n 2 == 1

--myDrop :: (Ord t, Num t) => t -> [a] -> [a]
--myDrop :: Integer -> [a] -> [a]
--myDrop n xs = if n <= 0 || null xs
--               then xs
--               else myDrop (n - 1) (tail xs)

main :: IO()
main = do
    let var1 = isOdd 3
    let var2 = isOdd (2 + 1)
    print var1
    print var2
    let var3 = myDrop 2 "abcd"
    print var3
    let var4 = typeOf var3
    print var4
