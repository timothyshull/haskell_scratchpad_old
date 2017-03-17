import Data.Time
import Control.Monad
import Control.Concurrent
import Control.Concurrent.STM

main = do
    requests <- atomically $ do
        req <- newTQueue
        mapM_ (writeTQueue req) [1..5]
        return req

    limitter <- atomically $ newEmptyTMVar
    forkIO . forever $ do
        atomically $ putTMVar limitter ()
        threadDelay (200 * 1000)

    let loop1 = do
        req <- atomically $ do
            r <- readTQueue requests
            readTMVar limitter
            return r
        now <- getCurrentTime
        putStrLn $ "request " ++ show req ++ " " ++ show now
        isEmpty <- atomically $ isEmptyTQueue requests
        if isEmpty
            then return ()
            else loop1
    loop1

    now <- getCurrentTime
    burstyLimitter <- atomically $ do
        limitter <- newTBQueue 3
        forM_ [0..2] $ \_ -> writeTBQueue limitter now
        return limitter

    forkIO . forever $ do
        now <- getCurrentTime
        atomically $ writeTBQueue burstyLimitter now
        threadDelay (200 * 1000)

    burstyRequests <- atomically $ do
        req <- newTQueue
        mapM_ (writeTQueue req) [1..5]
        return req

    let loop2 = do
        req <- atomically $ do
            r <- readTQueue burstyRequests
            readTBQueue burstyLimitter
            return r
        now <- getCurrentTime
        putStrLn $ "request " ++ show req ++ " " ++ show now
        isEmpty <- atomically $ isEmptyTQueue burstyRequests
        if isEmpty
            then return ()
            else loop2
    loop2
