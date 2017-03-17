import System.Process
import System.Directory
import System.IO

main :: IO (Maybe Handle, Maybe Handle, Maybe Handle, ProcessHandle)
main = do
    path <- findExecutable "ls"
    case path of
        Nothing -> error "ls doesn't exist"
        Just _  -> createProcess (proc "ls" ["-a", "-l", "-h"])
