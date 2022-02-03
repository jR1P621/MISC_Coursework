-- median.hs
-- Jon Rippe
-- 2021-19-03

-- For CSCE A311 - Spring 2021
-- Program prompts user for integers then return the median value.

module Main where

import System.IO
import Text.Read
import Data.List

main::IO()
main = do
    putStr "\nEnter a list of integers, one on each line.\nI will compute the median of the list.\n\n"
    myList <- getIntegerList
    if myList == []
    then do
        putStrLn "Empty list - no median\n"
        next <- repeatCheck
        return (next)
    else do
        putStr "Median is: "
        printf $ getMedian myList
        putStr "\n"
        next <- repeatCheck
        return (next)

--getMedian--
--Takes a list of orderable types and returns the median
getMedian::Ord a => [a] -> a
getMedian xs = (sort xs) !! div (length xs) 2

--printf--
--Takes a Just value and prints the value without the Just
printf::Show a => Maybe a -> IO()
printf (Just n) = print n

--repeatCheck--
--Queries user to repeat program
repeatCheck::IO()
repeatCheck = do
    putStr "Compute another median? [y/n] "
    hFlush stdout
    line <- getLine

    if line == "n"
    then do
        putStrLn "Bye!"
        return ()
    else
        if line == "y"
        then do
            next <- main
            return (next)
        else do
            next <- repeatCheck
            return (next)

    
--getIntegerList--
--Queries user to input integers.  Returns a list of Just Integers.
getIntegerList::IO[Maybe Integer]
getIntegerList = do
    putStr "Enter number (blank line to end): "
    hFlush stdout
    line <- getLine

    if line == ""
    then return []
    else do
        let n = readMaybe line :: Maybe Integer
        if n == Nothing
        then do
            putStrLn "That is not an integer."
            nextInput <- getIntegerList
            return (nextInput)
        else do
            nextInput <- getIntegerList
            return (n:nextInput)
