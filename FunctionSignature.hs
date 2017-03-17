-- function signatures include multiple '->' operators because
-- a single function definition is actually the definition of many
-- functions

-- consider currying i.e. add 2 3 has the intermediate add 2 y = 2 + y
-- function application is left associatve and function type signatures
-- are right associative
add :: Integer -> Integer -> Integer
add x y =  x + y

main :: IO()
main = do
    let var1 = add 2 3
    print var1
