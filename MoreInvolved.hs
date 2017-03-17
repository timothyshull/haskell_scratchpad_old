import MyDrop
import Data.Typeable

--short circuit expression
newOr::Bool -> Bool -> Bool
newOr a b = if a then a else b

main :: IO()
main = do
    print(myDrop 2 "abcd")
    print(typeOf((2::Integer) <= 0 || null "abcd"))
    print((2::Integer) <= 0)
    print(typeOf(False || null "abcd"))
    print(null "abcd")
    print(False || False)
    print(typeOf(((2::Integer) - 1) <= 0 || null (tail "abcd")))
    print(newOr True False)
    print(typeOf newOr)
