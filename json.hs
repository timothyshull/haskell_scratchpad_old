{-# LANGUAGE DeriveGeneric, OverloadedStrings #-}
import GHC.Generics
import Control.Lens
import Data.Aeson
import Data.Aeson.Lens
import qualified Data.Map as Map
import qualified Data.ByteString.Lazy.Char8 as BS

data Response1 = Response1 { page :: Int
                           , fruits :: [String]
                           } deriving (Show, Generic)
instance FromJSON Response1
instance ToJSON Response1

main = do
    BS.putStrLn $ encode True
    BS.putStrLn $ encode (1 :: Int)
    BS.putStrLn $ encode (2.34 :: Double)
    BS.putStrLn $ encode ("haskell" :: String)
    BS.putStrLn $ encode (["apple", "peach", "pear"] :: [String])
    BS.putStrLn $ encode $ Map.fromList ([("apple", 5), ("lettuce", 7)] :: [(String, Int)])
    BS.putStrLn $ encode $ Response1 {page = 1, fruits = ["apple", "peach", "pear"]}

    let byt = "{\"num\":6.13,\"strs\":[\"a\",\"b\"]}"
    let Just dat = decode byt :: Maybe Value
    print dat
    let Just num = dat ^? key "num"
    print num
    let Just str1 = dat ^? key "strs" . nth 0
    print str1

    let str = "{\"page\": 1, \"fruits\": [\"apple\", \"peach\"]}"
    let Just res = decode str :: Maybe Response1
    print res
    putStrLn $ (fruits res) !! 0
