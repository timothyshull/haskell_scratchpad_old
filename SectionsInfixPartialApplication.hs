import Data.Typeable
-- default (Integer)
-- can wrap a function name in backquotes (``) to make it an
-- infix operator

main :: IO()
main = do
    let var1 = ((1::Integer) +) 2
    print var1
    let var2 = map (* (3::Integer)) [24, 36]
    print var2
    let var3 = map (2^) [2, 5, 7, 9]
    print var3
    print(typeOf(`elem` ['a'..'z']))
    print((`elem` ['a'..'z']) 'f')
    print(all (`elem` ['a'..'z']) "Frobozz")