{-# LANGUAGE GADTs #-}
import Control.Monad
import Control.Concurrent
import Control.Concurrent.STM

main = do
    c1 <- atomically newTQueue
    c2 <- atomically newTQueue

    forkIO $ do
        threadDelay (1 * 1000000)
        atomically $ writeTQueue c1 "one"

    forkIO $ do
        threadDelay (2 * 1000000)
        atomically $ writeTQueue c2 "two"

    forM_ [0..1] $ \i ->
        select [ Case c1 $ \msg1 -> putStrLn $ "received " ++ msg1
               , Case c2 $ \msg2 -> putStrLn $ "received " ++ msg2
               ]

class Selectable f where
    tryRead :: f a -> STM (Maybe a)

instance Selectable TQueue where
    tryRead = tryReadTQueue

data Select a where
    Default :: IO a -> Select a
    Case    :: Selectable s => s b -> (b -> IO a) -> Select a

select :: [Select a] -> IO a
select [] = error "select: empty list"
select ((Default x):_) = x
select (x@(Case v f):xs)  = do
    var <- atomically $ tryRead v
    case var of
        Just b  -> f b
        Nothing -> select (xs ++ [x])
