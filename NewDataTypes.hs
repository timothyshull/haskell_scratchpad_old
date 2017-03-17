import Data.Typeable

-- Int String [String] -> components of the data type
-- components are fields (data members)
-- Book is the value constructor -> used to create a value
-- of type book info
-- Usually type constructors use the same name as the type
data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)


main :: IO()
main = do
    print("Here")
    let myInfo = Book 9780135072455 "Algebra of Programming"
                 ["Richard Bird", "Oege de Moor"]
    print(typeOf(myInfo))
    print(typeOf(Book))

