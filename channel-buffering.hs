import Control.Concurrent.STM

main = do
    messages <- atomically $ do
        msg <- newTQueue
        writeTQueue msg "buffered"
        writeTQueue msg "queue"
        return msg

    putStrLn =<< (atomically . readTQueue) messages
    putStrLn =<< (atomically . readTQueue) messages
