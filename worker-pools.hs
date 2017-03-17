import Control.Monad
import Control.Concurrent
import Control.Concurrent.STM

worker :: Int -> TQueue Int -> TQueue Int -> MVar () -> IO ()
worker n jobs results lock = forever $ do
    j <- atomically $ readTQueue jobs
    withMVar lock $ \_ -> do
        putStrLn $ "worker " ++ show n ++ " processing job " ++ show j
    threadDelay (1 * 1000000)
    atomically $ writeTQueue results (2 * j)

main = do
    jobs <- atomically $ newTQueue
    results <- atomically $ newTQueue
    lock <- newMVar ()

    forM_ [1..3] $ \w -> do
        forkIO $ worker w jobs results lock

    forM_ [1..9] $ atomically . writeTQueue jobs
    forM_ [1..9] $ \_ -> atomically $ readTQueue results
