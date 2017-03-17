import Data.Time
import System.Locale

main = do
    let rfc3339like = "%FT%T%z"

    t <- getZonedTime
    putStrLn $ formatTime defaultTimeLocale rfc3339like t

    print $ (parseTime defaultTimeLocale rfc3339like "2012-11-01T22:08:41+00:00" :: Maybe ZonedTime)

    putStrLn $ formatTime defaultTimeLocale "%-l:%M%p" t
    putStrLn $ formatTime defaultTimeLocale "%a %b %-e %X %Y" t
    putStrLn $ formatTime defaultTimeLocale "%FT%T.%q%z" t

    let form = "%-l %M %p"
    print $ (parseTime defaultTimeLocale form "8 41 PM" :: Maybe UTCTime)

    let ansic = "%a %b %-e %X %Y"
    print $ (parseTime defaultTimeLocale form "8:41PM" :: Maybe UTCTime)
