import Control.Monad
import Data.Map (Map)
import qualified Data.Map as Map

main = do
    let nums = [2, 3, 4]
    putStrLn $ "sum: " ++ show (sum nums)

    mapM_ putStrLn ["index: " ++ show i | (i, num) <- zip [0..] nums, num == 3]

    let kvs = Map.fromList [("a", "apple"), ("b", "banana")]
    forM_ (Map.toList kvs) $ \(k, v) -> putStrLn $ k ++ " -> " ++ v

    mapM_ print $ zip [0..] "haskell"
