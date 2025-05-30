{-# OPTIONS_GHC -w #-}
module Parser where

import Token
import Ri
import qualified Lex as L
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,106) ([9216,192,72,6145,0,192,0,0,1152,16,8201,0,0,0,0,96,0,12288,124,576,32780,6148,0,0,1987,16384,48,8076,36864,512,288,16388,2050,1152,16,8201,4608,64,32804,18432,384,144,12291,2,0,32768,4100,2304,32,0,0,0,0,0,0,0,24576,0,192,32768,1,768,0,6,12288,0,96,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_calc","Inico","ExprL","ExprR","Expr","Term","Factor","'+'","'-'","'*'","'/'","'('","')'","'<='","'>='","'>'","'<'","'=='","'&&'","'||'","'!'","Num","%eof"]
        bit_start = st Prelude.* 25
        bit_end = (st Prelude.+ 1) Prelude.* 25
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..24]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (11) = happyShift action_5
action_0 (14) = happyShift action_12
action_0 (23) = happyShift action_13
action_0 (24) = happyShift action_7
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_9
action_0 (6) = happyGoto action_10
action_0 (7) = happyGoto action_11
action_0 (8) = happyGoto action_3
action_0 (9) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (11) = happyShift action_5
action_1 (14) = happyShift action_6
action_1 (24) = happyShift action_7
action_1 (7) = happyGoto action_2
action_1 (8) = happyGoto action_3
action_1 (9) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (10) = happyShift action_18
action_2 (11) = happyShift action_19
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (12) = happyShift action_29
action_3 (13) = happyShift action_30
action_3 _ = happyReduce_15

action_4 _ = happyReduce_18

action_5 (11) = happyShift action_5
action_5 (14) = happyShift action_6
action_5 (24) = happyShift action_7
action_5 (9) = happyGoto action_28
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (11) = happyShift action_5
action_6 (14) = happyShift action_6
action_6 (24) = happyShift action_7
action_6 (7) = happyGoto action_27
action_6 (8) = happyGoto action_3
action_6 (9) = happyGoto action_4
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_19

action_8 (25) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (21) = happyShift action_25
action_9 (22) = happyShift action_26
action_9 _ = happyReduce_2

action_10 _ = happyReduce_6

action_11 (10) = happyShift action_18
action_11 (11) = happyShift action_19
action_11 (16) = happyShift action_20
action_11 (17) = happyShift action_21
action_11 (18) = happyShift action_22
action_11 (19) = happyShift action_23
action_11 (20) = happyShift action_24
action_11 _ = happyReduce_1

action_12 (11) = happyShift action_5
action_12 (14) = happyShift action_12
action_12 (23) = happyShift action_13
action_12 (24) = happyShift action_7
action_12 (5) = happyGoto action_16
action_12 (6) = happyGoto action_10
action_12 (7) = happyGoto action_17
action_12 (8) = happyGoto action_3
action_12 (9) = happyGoto action_4
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (11) = happyShift action_5
action_13 (14) = happyShift action_12
action_13 (23) = happyShift action_13
action_13 (24) = happyShift action_7
action_13 (5) = happyGoto action_14
action_13 (6) = happyGoto action_10
action_13 (7) = happyGoto action_15
action_13 (8) = happyGoto action_3
action_13 (9) = happyGoto action_4
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (21) = happyShift action_25
action_14 (22) = happyShift action_26
action_14 _ = happyReduce_5

action_15 (10) = happyShift action_18
action_15 (11) = happyShift action_19
action_15 (16) = happyShift action_20
action_15 (17) = happyShift action_21
action_15 (18) = happyShift action_22
action_15 (19) = happyShift action_23
action_15 (20) = happyShift action_24
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (15) = happyShift action_43
action_16 (21) = happyShift action_25
action_16 (22) = happyShift action_26
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_18
action_17 (11) = happyShift action_19
action_17 (15) = happyShift action_33
action_17 (16) = happyShift action_20
action_17 (17) = happyShift action_21
action_17 (18) = happyShift action_22
action_17 (19) = happyShift action_23
action_17 (20) = happyShift action_24
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (11) = happyShift action_5
action_18 (14) = happyShift action_6
action_18 (24) = happyShift action_7
action_18 (8) = happyGoto action_42
action_18 (9) = happyGoto action_4
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (11) = happyShift action_5
action_19 (14) = happyShift action_6
action_19 (24) = happyShift action_7
action_19 (8) = happyGoto action_41
action_19 (9) = happyGoto action_4
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (11) = happyShift action_5
action_20 (14) = happyShift action_6
action_20 (24) = happyShift action_7
action_20 (7) = happyGoto action_40
action_20 (8) = happyGoto action_3
action_20 (9) = happyGoto action_4
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (11) = happyShift action_5
action_21 (14) = happyShift action_6
action_21 (24) = happyShift action_7
action_21 (7) = happyGoto action_39
action_21 (8) = happyGoto action_3
action_21 (9) = happyGoto action_4
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (11) = happyShift action_5
action_22 (14) = happyShift action_6
action_22 (24) = happyShift action_7
action_22 (7) = happyGoto action_38
action_22 (8) = happyGoto action_3
action_22 (9) = happyGoto action_4
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (11) = happyShift action_5
action_23 (14) = happyShift action_6
action_23 (24) = happyShift action_7
action_23 (7) = happyGoto action_37
action_23 (8) = happyGoto action_3
action_23 (9) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (11) = happyShift action_5
action_24 (14) = happyShift action_6
action_24 (24) = happyShift action_7
action_24 (7) = happyGoto action_36
action_24 (8) = happyGoto action_3
action_24 (9) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (11) = happyShift action_5
action_25 (14) = happyShift action_12
action_25 (23) = happyShift action_13
action_25 (24) = happyShift action_7
action_25 (5) = happyGoto action_35
action_25 (6) = happyGoto action_10
action_25 (7) = happyGoto action_15
action_25 (8) = happyGoto action_3
action_25 (9) = happyGoto action_4
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (11) = happyShift action_5
action_26 (14) = happyShift action_12
action_26 (23) = happyShift action_13
action_26 (24) = happyShift action_7
action_26 (5) = happyGoto action_34
action_26 (6) = happyGoto action_10
action_26 (7) = happyGoto action_15
action_26 (8) = happyGoto action_3
action_26 (9) = happyGoto action_4
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (10) = happyShift action_18
action_27 (11) = happyShift action_19
action_27 (15) = happyShift action_33
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_21

action_29 (11) = happyShift action_5
action_29 (14) = happyShift action_6
action_29 (24) = happyShift action_7
action_29 (9) = happyGoto action_32
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (11) = happyShift action_5
action_30 (14) = happyShift action_6
action_30 (24) = happyShift action_7
action_30 (9) = happyGoto action_31
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_17

action_32 _ = happyReduce_16

action_33 _ = happyReduce_20

action_34 (21) = happyShift action_25
action_34 (22) = happyShift action_26
action_34 _ = happyReduce_3

action_35 (21) = happyShift action_25
action_35 (22) = happyShift action_26
action_35 _ = happyReduce_4

action_36 (10) = happyShift action_18
action_36 (11) = happyShift action_19
action_36 _ = happyReduce_8

action_37 (10) = happyShift action_18
action_37 (11) = happyShift action_19
action_37 _ = happyReduce_10

action_38 (10) = happyShift action_18
action_38 (11) = happyShift action_19
action_38 _ = happyReduce_9

action_39 (10) = happyShift action_18
action_39 (11) = happyShift action_19
action_39 _ = happyReduce_12

action_40 (10) = happyShift action_18
action_40 (11) = happyShift action_19
action_40 _ = happyReduce_11

action_41 (12) = happyShift action_29
action_41 (13) = happyShift action_30
action_41 _ = happyReduce_14

action_42 (12) = happyShift action_29
action_42 (13) = happyShift action_30
action_42 _ = happyReduce_13

action_43 _ = happyReduce_7

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn7  happy_var_1)
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

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (Or happy_var_1 happy_var_3
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_3  5 happyReduction_4
happyReduction_4 (HappyAbsSyn5  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (And happy_var_1 happy_var_3
	)
happyReduction_4 _ _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  5 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Not happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  5 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (Rel happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  5 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Req happy_var_1 happy_var_3
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Rgt happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Rlt happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Rle happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (Rge happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Add happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  7 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Div happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  8 happyReduction_18
happyReduction_18 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn9
		 (Const happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  9 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Neg happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 25 25 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ADD -> cont 10;
	SUB -> cont 11;
	MUL -> cont 12;
	DIV -> cont 13;
	LPAR -> cont 14;
	RPAR -> cont 15;
	RLE -> cont 16;
	RGE -> cont 17;
	RGT -> cont 18;
	RLT -> cont 19;
	REQ -> cont 20;
	AND -> cont 21;
	OR -> cont 22;
	NOT -> cont 23;
	NUM happy_dollar_dollar -> cont 24;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 25 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
calc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do putStr "Expressão:"
          s <- getLine
          case calc (L.alexScanTokens s) of
          	Left v -> print v
          	Right v -> print v
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































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
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
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
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
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





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

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
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
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
