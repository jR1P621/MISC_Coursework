-- PA5.hs   COMPLETED
-- Jon Rippe & Glenn G. Chappell
-- 2021-03-21
--
-- For CS F331 / CSCE A331 Spring 2021
-- Solutions to Assignment 5 Exercise B

module PA5 where


-- collatzCounts
collatzCounts :: [Integer]
collatzCounts = map collatz [1..] where
collatz n
    | n == 1      = 0
    | even n      = 1 + collatz (div n 2)
    | otherwise   = 1 + collatz ((3 * n) + 1)



-- findList
findList :: Eq a => [a] -> [a] -> Maybe Int
findList a bs = getIndex a bs (zip [0..] bs) where
    getIndex [] _ _ = Just 0    -- a is empty
    getIndex a [] _ = Nothing   -- out of bs to check
    getIndex a bs cs
        | a == take (length a) bs   = index
        | otherwise                 = getIndex a (tail bs) (tail cs) where
          index = Just $ fst (head cs)



-- operator ##
(##) :: Eq a => [a] -> [a] -> Int
[] ## _ = 0
_ ## [] = 0
(x:xs) ## (y:ys)
    | x == y      = 1 + (xs ## ys)
    | otherwise   = (xs ## ys)



-- filterAB
filterAB :: (a -> Bool) -> [a] -> [b] -> [b]
filterAB _ [] _ = []
filterAB _ _ [] = []
-- Get list of evaluated as zipped with bs, then take b if True.
filterAB pred as bs = [ b | (True, b) <- zip (map pred as) bs ]

-- Also works; Taken from flow.hs
-- filterAB pred (a:as) (b:bs)
--     | pred a         = b:rest
--     | otherwise      = rest where
--       rest = filterAB pred as bs



-- sumEvenOdd
sumEvenOdd :: Num a => [a] -> (a, a)
{-
  The assignment requires sumEvenOdd to be written using a fold.
  Something like this:

    sumEvenOdd xs = fold* ... xs where
        ...

  Above, "..." should be replaced by other code. The "fold*" must be
  one of the following: foldl, foldr, foldl1, foldr1.
-}

sumEvenOdd xs = foldl1 summify $ tuplify xs where
    --tuplify: turn list into list of tuples: [0, 1, 2, 3..] -> [(0, 1), (2, 3)..]
    tuplify [] = [(0,0)]
    tuplify [x] = [(x,0)]
    tuplify (x:y:xys) = (x,y):(tuplify xys)
    summify (a0,a1) (b0,b1) = (a0+b0,a1+b1)

