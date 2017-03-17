{-# LANGUAGE OverloadedStrings #-}
import Numeric (showHex)
import qualified Data.ByteString as BS
import qualified Crypto.Hash.SHA1 as SHA1

main = do
    let s = "sha1 this string"
    let bs = SHA1.hash s

    print s
    putStrLn $ concatMap (flip showHex "") $ BS.unpack bs
