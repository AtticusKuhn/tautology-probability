import Control.Monad (guard)
import qualified Data.Map as M
import Control.Arrow (first)
import Data.List (intercalate)

data Formula =
  Var Int
  | And Formula Formula
  | Or Formula Formula
  | Not Formula
  deriving (Show)



gen_formulas :: Int -> Int -> [Formula]
gen_formulas size vars = do
  guard (size > 0)
  guard (vars > 0)

  (do
    v <- [1..vars]
    return $ Var v)
    ++
   (do
    f1 <- gen_formulas (size - 1) vars
    return $ Not f1)
    ++
   (do
    split <- [1..size]
    fl <- gen_formulas (split - 1) vars
    fr <- gen_formulas (size - split) vars
    [And fr fl, Or fr fl])


is_tautology ::  Formula -> Bool
is_tautology formula = all fst (evaluate formula M.empty)


evaluate :: Formula -> M.Map Int Bool -> [(Bool, M.Map Int Bool)]
evaluate (Var i) m = do
  case M.lookup i m of
    Just v -> return (v, m)
    Nothing -> do
      b <- [True, False]
      return (b, M.insert i b m)
evaluate (And l r) m = do
  (b1, m1) <- evaluate l m
  (b2, m2) <- evaluate r m1
  return (b1 && b2, m2)
evaluate (Or l r) m = do
  (b1, m1) <- evaluate l m
  (b2, m2) <- evaluate r m1
  return (b1 || b2, m2)
evaluate (Not f) m =
  evaluate f m >>= (return . first not)


gen_tautology :: Int -> Int -> [Formula]
gen_tautology size vars = filter is_tautology (gen_formulas size vars)

count_tautology :: Int -> Int -> Int
count_tautology size = length . gen_tautology size

count_formula_2 :: Int -> Int -> Int
count_formula_2 size = length . gen_formulas size

summation :: (a -> Int) -> [a] -> Int
summation f = foldr (\e i -> f e  + i) 0

count_formula :: Int -> Int -> Int
count_formula 1 vars = vars
count_formula s v = if s <= 0 || v <= 0 then 0 else
  v + count_formula (s - 1) v + 2 * summation (\k -> (count_formula (k - 1) v) * (count_formula (s - k) v)) [1..s]

gen_stats :: Int -> Int -> (Int, Int)
gen_stats size vars = (count_tautology size vars, count_formula size vars)

gen_table :: [(Int, Int, Int, Int, Float)]
gen_table = do
  i <- [1..10]
  j <- [1..7]
  let (k, l) = gen_stats i j
  return (i, j, k, l, fromIntegral k /  fromIntegral l)


gen_table_2 :: [(Int, Int, Float)]
gen_table_2 = do
  i <- [1..8]
  j <- [1..8]
  let (k, l) = gen_stats i j
  return (i, j, fromIntegral k /  fromIntegral l)


main :: IO ()
main = do
  putStrLn $ intercalate "\n" $ map show $ gen_table
