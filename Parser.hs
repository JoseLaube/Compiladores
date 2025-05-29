{-# OPTIONS_GHC -w #-}
module Parser where

import Token
import Ri
import qualified Lex as L
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,108) ([18432,384,288,49156,0,3072,0,0,8192,1025,1152,16,0,0,0,0,0,1536,0,0,7948,8192,1537,1152,24,0,0,0,31792,0,1544,58112,7,72,8193,1025,1152,16,16402,18432,256,288,32772,4100,4608,96,32840,12289,2,0,0,16402,18432,256,0,0,0,0,0,0,0,0,192,0,3,3072,0,48,49152,0,3072,0,48,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_calc","Inico","ExprRL","ExprL","ExprR","Expr","Term","Factor","'+'","'-'","'*'","'/'","'('","')'","'<='","'>='","'>'","'<'","'=='","'&&'","'||'","'!'","Num","%eof"]
        bit_start = st * 26
        bit_end = (st + 1) * 26
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..25]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (12) = happyShift action_5
action_0 (15) = happyShift action_13
action_0 (24) = happyShift action_14
action_0 (25) = happyShift action_7
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_9
action_0 (6) = happyGoto action_10
action_0 (7) = happyGoto action_11
action_0 (8) = happyGoto action_12
action_0 (9) = happyGoto action_3
action_0 (10) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (12) = happyShift action_5
action_1 (15) = happyShift action_6
action_1 (25) = happyShift action_7
action_1 (8) = happyGoto action_2
action_1 (9) = happyGoto action_3
action_1 (10) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (11) = happyShift action_20
action_2 (12) = happyShift action_21
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (13) = happyShift action_31
action_3 (14) = happyShift action_32
action_3 _ = happyReduce_17

action_4 _ = happyReduce_20

action_5 (12) = happyShift action_5
action_5 (15) = happyShift action_6
action_5 (25) = happyShift action_7
action_5 (10) = happyGoto action_30
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (12) = happyShift action_5
action_6 (15) = happyShift action_6
action_6 (25) = happyShift action_7
action_6 (8) = happyGoto action_29
action_6 (9) = happyGoto action_3
action_6 (10) = happyGoto action_4
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_21

action_8 (26) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_2

action_10 (22) = happyShift action_27
action_10 (23) = happyShift action_28
action_10 _ = happyReduce_4

action_11 (26) = happyReduce_8
action_11 _ = happyReduce_8

action_12 (11) = happyShift action_20
action_12 (12) = happyShift action_21
action_12 (17) = happyShift action_22
action_12 (18) = happyShift action_23
action_12 (19) = happyShift action_24
action_12 (20) = happyShift action_25
action_12 (21) = happyShift action_26
action_12 _ = happyReduce_1

action_13 (12) = happyShift action_5
action_13 (15) = happyShift action_13
action_13 (24) = happyShift action_14
action_13 (25) = happyShift action_7
action_13 (6) = happyGoto action_18
action_13 (7) = happyGoto action_16
action_13 (8) = happyGoto action_19
action_13 (9) = happyGoto action_3
action_13 (10) = happyGoto action_4
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (12) = happyShift action_5
action_14 (15) = happyShift action_13
action_14 (24) = happyShift action_14
action_14 (25) = happyShift action_7
action_14 (6) = happyGoto action_15
action_14 (7) = happyGoto action_16
action_14 (8) = happyGoto action_17
action_14 (9) = happyGoto action_3
action_14 (10) = happyGoto action_4
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (22) = happyShift action_27
action_15 (23) = happyShift action_28
action_15 _ = happyReduce_7

action_16 _ = happyReduce_8

action_17 (11) = happyShift action_20
action_17 (12) = happyShift action_21
action_17 (17) = happyShift action_22
action_17 (18) = happyShift action_23
action_17 (19) = happyShift action_24
action_17 (20) = happyShift action_25
action_17 (21) = happyShift action_26
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (16) = happyShift action_45
action_18 (22) = happyShift action_27
action_18 (23) = happyShift action_28
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (11) = happyShift action_20
action_19 (12) = happyShift action_21
action_19 (16) = happyShift action_35
action_19 (17) = happyShift action_22
action_19 (18) = happyShift action_23
action_19 (19) = happyShift action_24
action_19 (20) = happyShift action_25
action_19 (21) = happyShift action_26
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (12) = happyShift action_5
action_20 (15) = happyShift action_6
action_20 (25) = happyShift action_7
action_20 (9) = happyGoto action_44
action_20 (10) = happyGoto action_4
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (12) = happyShift action_5
action_21 (15) = happyShift action_6
action_21 (25) = happyShift action_7
action_21 (9) = happyGoto action_43
action_21 (10) = happyGoto action_4
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (12) = happyShift action_5
action_22 (15) = happyShift action_6
action_22 (25) = happyShift action_7
action_22 (8) = happyGoto action_42
action_22 (9) = happyGoto action_3
action_22 (10) = happyGoto action_4
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (12) = happyShift action_5
action_23 (15) = happyShift action_6
action_23 (25) = happyShift action_7
action_23 (8) = happyGoto action_41
action_23 (9) = happyGoto action_3
action_23 (10) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (12) = happyShift action_5
action_24 (15) = happyShift action_6
action_24 (25) = happyShift action_7
action_24 (8) = happyGoto action_40
action_24 (9) = happyGoto action_3
action_24 (10) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (12) = happyShift action_5
action_25 (15) = happyShift action_6
action_25 (25) = happyShift action_7
action_25 (8) = happyGoto action_39
action_25 (9) = happyGoto action_3
action_25 (10) = happyGoto action_4
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (12) = happyShift action_5
action_26 (15) = happyShift action_6
action_26 (25) = happyShift action_7
action_26 (8) = happyGoto action_38
action_26 (9) = happyGoto action_3
action_26 (10) = happyGoto action_4
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (12) = happyShift action_5
action_27 (15) = happyShift action_13
action_27 (24) = happyShift action_14
action_27 (25) = happyShift action_7
action_27 (6) = happyGoto action_37
action_27 (7) = happyGoto action_16
action_27 (8) = happyGoto action_17
action_27 (9) = happyGoto action_3
action_27 (10) = happyGoto action_4
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (12) = happyShift action_5
action_28 (15) = happyShift action_13
action_28 (24) = happyShift action_14
action_28 (25) = happyShift action_7
action_28 (6) = happyGoto action_36
action_28 (7) = happyGoto action_16
action_28 (8) = happyGoto action_17
action_28 (9) = happyGoto action_3
action_28 (10) = happyGoto action_4
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (11) = happyShift action_20
action_29 (12) = happyShift action_21
action_29 (16) = happyShift action_35
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_23

action_31 (12) = happyShift action_5
action_31 (15) = happyShift action_6
action_31 (25) = happyShift action_7
action_31 (10) = happyGoto action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (12) = happyShift action_5
action_32 (15) = happyShift action_6
action_32 (25) = happyShift action_7
action_32 (10) = happyGoto action_33
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_19

action_34 _ = happyReduce_18

action_35 _ = happyReduce_22

action_36 (22) = happyShift action_27
action_36 (23) = happyShift action_28
action_36 _ = happyReduce_5

action_37 (22) = happyShift action_27
action_37 (23) = happyShift action_28
action_37 _ = happyReduce_6

action_38 (11) = happyShift action_20
action_38 (12) = happyShift action_21
action_38 _ = happyReduce_10

action_39 (11) = happyShift action_20
action_39 (12) = happyShift action_21
action_39 _ = happyReduce_12

action_40 (11) = happyShift action_20
action_40 (12) = happyShift action_21
action_40 _ = happyReduce_11

action_41 (11) = happyShift action_20
action_41 (12) = happyShift action_21
action_41 _ = happyReduce_14

action_42 (11) = happyShift action_20
action_42 (12) = happyShift action_21
action_42 _ = happyReduce_13

action_43 (13) = happyShift action_31
action_43 (14) = happyShift action_32
action_43 _ = happyReduce_16

action_44 (13) = happyShift action_31
action_44 (14) = happyShift action_32
action_44 _ = happyReduce_15

action_45 _ = happyReduce_9

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn4
		 (Left happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Right happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  5 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn5
		 (Left happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Right happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Or happy_var_1 happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (And happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Not happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Rel happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  7 happyReduction_10
happyReduction_10 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Req happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Rgt happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Rlt happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Rle happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Rge happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Add happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  8 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  9 happyReduction_18
happyReduction_18 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Div happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  9 happyReduction_20
happyReduction_20 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn10
		 (Const happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  10 happyReduction_23
happyReduction_23 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Neg happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 26 26 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ADD -> cont 11;
	SUB -> cont 12;
	MUL -> cont 13;
	DIV -> cont 14;
	LPAR -> cont 15;
	RPAR -> cont 16;
	RLE -> cont 17;
	RGE -> cont 18;
	RGT -> cont 19;
	RLT -> cont 20;
	REQ -> cont 21;
	AND -> cont 22;
	OR -> cont 23;
	NOT -> cont 24;
	NUM happy_dollar_dollar -> cont 25;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 26 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
calc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

type CalcReturnType = Either Expr (Either ExprR ExprL)

main = do
  putStr "Expressão:"
  s <- getLine
  -- Adicionar uma anotação de tipo explícita para o resultado de 'calc'
  let result = calc (L.alexScanTokens s) :: CalcReturnType
  case result of
    Left arit_val -> do
      putStr "Resultado (Aritmético): "
      print arit_val
    Right either_rel_log -> case either_rel_log of
      Left rel_val -> do
        putStr "Resultado (Relacional): "
        print rel_val
      Right log_val -> do
        putStr "Resultado (Lógico): "
        print log_val
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
