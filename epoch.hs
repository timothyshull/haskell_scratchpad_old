import System.Locale
import Data.Time

main = do
    now <- getCurrentTime
    print now
    let secs  = read $ formatTime defaultTimeLocale "%s" now :: Integer
    let picos = read $ formatTime defaultTimeLocale "%s%q" now :: Integer
    let nanos = div picos 1000
    let millis = div picos 1000000000
    print secs
    print millis
    print nanos
    print (parseTime defaultTimeLocale "%s"   (show secs) ::  Maybe UTCTime)
