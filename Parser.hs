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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,166) ([0,16,0,0,1,0,0,0,0,0,0,0,0,0,0,16386,112,0,0,0,0,0,0,64,0,16384,0,0,1024,0,0,64,0,16384,4,15,17408,63488,0,0,1024,0,68,240,0,0,0,0,0,0,32864,0,0,40,0,0,0,0,17408,61440,0,1088,3840,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,24584,0,0,0,0,352,31,0,68,248,16384,32772,15,34304,0,0,1088,3840,0,68,240,0,128,0,0,0,0,2048,96,0,61590,1,16384,4,15,17408,61440,0,1088,3840,0,68,240,16384,4,15,17408,61440,0,4096,0,0,68,248,16384,32772,15,0,8,0,2144,0,0,0,0,16384,4,15,17408,61440,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,0,0,6,0,24576,0,0,1536,0,0,96,0,0,6,0,0,0,0,0,0,0,640,0,0,40,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parsePrograma","Programa","Bloco","ListaCmd","Comando","Inico","ExprL","ExprR","Expr","Term","Factor","'+'","'-'","'*'","'/='","'/'","'('","')'","'{'","'}'","'='","';'","'<='","'>='","'>'","'<'","'=='","'&&'","'||'","'!'","Num","IntLit","Id","StringLit","'int'","'float'","'string'","'void'","'read'","'while'","'print'","%eof"]
        bit_start = st * 44
        bit_end = (st + 1) * 44
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..43]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (21) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (21) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (22) = happyShift action_7
action_3 (35) = happyShift action_8
action_3 (41) = happyShift action_9
action_3 (42) = happyShift action_10
action_3 (43) = happyShift action_11
action_3 (6) = happyGoto action_5
action_3 (7) = happyGoto action_6
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (44) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (22) = happyShift action_17
action_5 (35) = happyShift action_8
action_5 (41) = happyShift action_9
action_5 (42) = happyShift action_10
action_5 (43) = happyShift action_11
action_5 (7) = happyGoto action_16
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_5

action_7 _ = happyReduce_3

action_8 (23) = happyShift action_15
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (19) = happyShift action_14
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (19) = happyShift action_13
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (19) = happyShift action_12
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (15) = happyShift action_21
action_12 (19) = happyShift action_22
action_12 (33) = happyShift action_23
action_12 (34) = happyShift action_24
action_12 (35) = happyShift action_25
action_12 (36) = happyShift action_26
action_12 (11) = happyGoto action_33
action_12 (12) = happyGoto action_19
action_12 (13) = happyGoto action_20
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (15) = happyShift action_21
action_13 (19) = happyShift action_31
action_13 (32) = happyShift action_32
action_13 (33) = happyShift action_23
action_13 (34) = happyShift action_24
action_13 (35) = happyShift action_25
action_13 (36) = happyShift action_26
action_13 (9) = happyGoto action_28
action_13 (10) = happyGoto action_29
action_13 (11) = happyGoto action_30
action_13 (12) = happyGoto action_19
action_13 (13) = happyGoto action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (35) = happyShift action_27
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (15) = happyShift action_21
action_15 (19) = happyShift action_22
action_15 (33) = happyShift action_23
action_15 (34) = happyShift action_24
action_15 (35) = happyShift action_25
action_15 (36) = happyShift action_26
action_15 (11) = happyGoto action_18
action_15 (12) = happyGoto action_19
action_15 (13) = happyGoto action_20
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_4

action_17 _ = happyReduce_2

action_18 (14) = happyShift action_34
action_18 (15) = happyShift action_35
action_18 (24) = happyShift action_54
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (16) = happyShift action_52
action_19 (18) = happyShift action_53
action_19 _ = happyReduce_26

action_20 _ = happyReduce_29

action_21 (15) = happyShift action_21
action_21 (19) = happyShift action_22
action_21 (33) = happyShift action_23
action_21 (34) = happyShift action_24
action_21 (35) = happyShift action_25
action_21 (36) = happyShift action_26
action_21 (13) = happyGoto action_51
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (15) = happyShift action_21
action_22 (19) = happyShift action_22
action_22 (33) = happyShift action_23
action_22 (34) = happyShift action_24
action_22 (35) = happyShift action_25
action_22 (36) = happyShift action_26
action_22 (11) = happyGoto action_50
action_22 (12) = happyGoto action_19
action_22 (13) = happyGoto action_20
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_30

action_24 _ = happyReduce_31

action_25 _ = happyReduce_32

action_26 _ = happyReduce_33

action_27 (20) = happyShift action_49
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (20) = happyShift action_46
action_28 (30) = happyShift action_47
action_28 (31) = happyShift action_48
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_16

action_30 (14) = happyShift action_34
action_30 (15) = happyShift action_35
action_30 (17) = happyShift action_40
action_30 (25) = happyShift action_41
action_30 (26) = happyShift action_42
action_30 (27) = happyShift action_43
action_30 (28) = happyShift action_44
action_30 (29) = happyShift action_45
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (15) = happyShift action_21
action_31 (19) = happyShift action_31
action_31 (32) = happyShift action_32
action_31 (33) = happyShift action_23
action_31 (34) = happyShift action_24
action_31 (35) = happyShift action_25
action_31 (36) = happyShift action_26
action_31 (9) = happyGoto action_38
action_31 (10) = happyGoto action_29
action_31 (11) = happyGoto action_39
action_31 (12) = happyGoto action_19
action_31 (13) = happyGoto action_20
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (15) = happyShift action_21
action_32 (19) = happyShift action_31
action_32 (32) = happyShift action_32
action_32 (33) = happyShift action_23
action_32 (34) = happyShift action_24
action_32 (35) = happyShift action_25
action_32 (36) = happyShift action_26
action_32 (9) = happyGoto action_37
action_32 (10) = happyGoto action_29
action_32 (11) = happyGoto action_30
action_32 (12) = happyGoto action_19
action_32 (13) = happyGoto action_20
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (14) = happyShift action_34
action_33 (15) = happyShift action_35
action_33 (20) = happyShift action_36
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (15) = happyShift action_21
action_34 (19) = happyShift action_22
action_34 (33) = happyShift action_23
action_34 (34) = happyShift action_24
action_34 (35) = happyShift action_25
action_34 (36) = happyShift action_26
action_34 (12) = happyGoto action_71
action_34 (13) = happyGoto action_20
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (15) = happyShift action_21
action_35 (19) = happyShift action_22
action_35 (33) = happyShift action_23
action_35 (34) = happyShift action_24
action_35 (35) = happyShift action_25
action_35 (36) = happyShift action_26
action_35 (12) = happyGoto action_70
action_35 (13) = happyGoto action_20
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (24) = happyShift action_69
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (30) = happyShift action_47
action_37 (31) = happyShift action_48
action_37 _ = happyReduce_15

action_38 (20) = happyShift action_68
action_38 (30) = happyShift action_47
action_38 (31) = happyShift action_48
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (14) = happyShift action_34
action_39 (15) = happyShift action_35
action_39 (17) = happyShift action_40
action_39 (20) = happyShift action_57
action_39 (25) = happyShift action_41
action_39 (26) = happyShift action_42
action_39 (27) = happyShift action_43
action_39 (28) = happyShift action_44
action_39 (29) = happyShift action_45
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (15) = happyShift action_21
action_40 (19) = happyShift action_22
action_40 (33) = happyShift action_23
action_40 (34) = happyShift action_24
action_40 (35) = happyShift action_25
action_40 (36) = happyShift action_26
action_40 (11) = happyGoto action_67
action_40 (12) = happyGoto action_19
action_40 (13) = happyGoto action_20
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (15) = happyShift action_21
action_41 (19) = happyShift action_22
action_41 (33) = happyShift action_23
action_41 (34) = happyShift action_24
action_41 (35) = happyShift action_25
action_41 (36) = happyShift action_26
action_41 (11) = happyGoto action_66
action_41 (12) = happyGoto action_19
action_41 (13) = happyGoto action_20
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (15) = happyShift action_21
action_42 (19) = happyShift action_22
action_42 (33) = happyShift action_23
action_42 (34) = happyShift action_24
action_42 (35) = happyShift action_25
action_42 (36) = happyShift action_26
action_42 (11) = happyGoto action_65
action_42 (12) = happyGoto action_19
action_42 (13) = happyGoto action_20
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (15) = happyShift action_21
action_43 (19) = happyShift action_22
action_43 (33) = happyShift action_23
action_43 (34) = happyShift action_24
action_43 (35) = happyShift action_25
action_43 (36) = happyShift action_26
action_43 (11) = happyGoto action_64
action_43 (12) = happyGoto action_19
action_43 (13) = happyGoto action_20
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (15) = happyShift action_21
action_44 (19) = happyShift action_22
action_44 (33) = happyShift action_23
action_44 (34) = happyShift action_24
action_44 (35) = happyShift action_25
action_44 (36) = happyShift action_26
action_44 (11) = happyGoto action_63
action_44 (12) = happyGoto action_19
action_44 (13) = happyGoto action_20
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (15) = happyShift action_21
action_45 (19) = happyShift action_22
action_45 (33) = happyShift action_23
action_45 (34) = happyShift action_24
action_45 (35) = happyShift action_25
action_45 (36) = happyShift action_26
action_45 (11) = happyGoto action_62
action_45 (12) = happyGoto action_19
action_45 (13) = happyGoto action_20
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (21) = happyShift action_3
action_46 (5) = happyGoto action_61
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (15) = happyShift action_21
action_47 (19) = happyShift action_31
action_47 (32) = happyShift action_32
action_47 (33) = happyShift action_23
action_47 (34) = happyShift action_24
action_47 (35) = happyShift action_25
action_47 (36) = happyShift action_26
action_47 (9) = happyGoto action_60
action_47 (10) = happyGoto action_29
action_47 (11) = happyGoto action_30
action_47 (12) = happyGoto action_19
action_47 (13) = happyGoto action_20
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (15) = happyShift action_21
action_48 (19) = happyShift action_31
action_48 (32) = happyShift action_32
action_48 (33) = happyShift action_23
action_48 (34) = happyShift action_24
action_48 (35) = happyShift action_25
action_48 (36) = happyShift action_26
action_48 (9) = happyGoto action_59
action_48 (10) = happyGoto action_29
action_48 (11) = happyGoto action_30
action_48 (12) = happyGoto action_19
action_48 (13) = happyGoto action_20
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (24) = happyShift action_58
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (14) = happyShift action_34
action_50 (15) = happyShift action_35
action_50 (20) = happyShift action_57
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_35

action_52 (15) = happyShift action_21
action_52 (19) = happyShift action_22
action_52 (33) = happyShift action_23
action_52 (34) = happyShift action_24
action_52 (35) = happyShift action_25
action_52 (36) = happyShift action_26
action_52 (13) = happyGoto action_56
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (15) = happyShift action_21
action_53 (19) = happyShift action_22
action_53 (33) = happyShift action_23
action_53 (34) = happyShift action_24
action_53 (35) = happyShift action_25
action_53 (36) = happyShift action_26
action_53 (13) = happyGoto action_55
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_8

action_55 _ = happyReduce_28

action_56 _ = happyReduce_27

action_57 _ = happyReduce_34

action_58 _ = happyReduce_9

action_59 (30) = happyShift action_47
action_59 (31) = happyShift action_48
action_59 _ = happyReduce_13

action_60 (30) = happyShift action_47
action_60 (31) = happyShift action_48
action_60 _ = happyReduce_14

action_61 _ = happyReduce_7

action_62 (14) = happyShift action_34
action_62 (15) = happyShift action_35
action_62 _ = happyReduce_18

action_63 (14) = happyShift action_34
action_63 (15) = happyShift action_35
action_63 _ = happyReduce_20

action_64 (14) = happyShift action_34
action_64 (15) = happyShift action_35
action_64 _ = happyReduce_19

action_65 (14) = happyShift action_34
action_65 (15) = happyShift action_35
action_65 _ = happyReduce_22

action_66 (14) = happyShift action_34
action_66 (15) = happyShift action_35
action_66 _ = happyReduce_21

action_67 (14) = happyShift action_34
action_67 (15) = happyShift action_35
action_67 _ = happyReduce_23

action_68 _ = happyReduce_17

action_69 _ = happyReduce_10

action_70 (16) = happyShift action_52
action_70 (18) = happyShift action_53
action_70 _ = happyReduce_25

action_71 (16) = happyShift action_52
action_71 (18) = happyShift action_53
action_71 _ = happyReduce_24

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 _
	_
	 =  HappyAbsSyn5
		 ([]
	)

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_2 : happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_0  6 happyReduction_6
happyReduction_6  =  HappyAbsSyn6
		 ([]
	)

happyReduce_7 = happyReduce 5 7 happyReduction_7
happyReduction_7 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 4 7 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Atrib happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 5 7 happyReduction_9
happyReduction_9 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Leitura happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 5 7 happyReduction_10
happyReduction_10 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Imp happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (Left happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (Right happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Or happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  9 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (And happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Not happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  9 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Rel happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  9 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  10 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Req happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  10 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rgt happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  10 happyReduction_20
happyReduction_20 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rlt happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rle happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  10 happyReduction_22
happyReduction_22 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rge happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rdf happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  11 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Add happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Div happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  13 happyReduction_30
happyReduction_30 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn13
		 (Const (CDouble happy_var_1)
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 (HappyTerminal (INT_LIT happy_var_1))
	 =  HappyAbsSyn13
		 (Const (CInt happy_var_1)
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  13 happyReduction_32
happyReduction_32 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn13
		 (IdVar happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  13 happyReduction_33
happyReduction_33 (HappyTerminal (STRING_LIT happy_var_1))
	 =  HappyAbsSyn13
		 (Lit happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  13 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  13 happyReduction_35
happyReduction_35 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Neg happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 44 44 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ADD -> cont 14;
	SUB -> cont 15;
	MUL -> cont 16;
	RDF -> cont 17;
	DIV -> cont 18;
	LPAR -> cont 19;
	RPAR -> cont 20;
	LBRACE -> cont 21;
	RBRACE -> cont 22;
	EQ_ASSIGN -> cont 23;
	SEMI -> cont 24;
	RLE -> cont 25;
	RGE -> cont 26;
	RGT -> cont 27;
	RLT -> cont 28;
	REQ -> cont 29;
	AND -> cont 30;
	OR -> cont 31;
	NOT -> cont 32;
	NUM happy_dollar_dollar -> cont 33;
	INT_LIT happy_dollar_dollar -> cont 34;
	ID happy_dollar_dollar -> cont 35;
	STRING_LIT happy_dollar_dollar -> cont 36;
	KW_INT -> cont 37;
	KW_FLOAT -> cont 38;
	KW_STRING -> cont 39;
	KW_VOID -> cont 40;
	KW_READ -> cont 41;
	KW_WHILE -> cont 42;
	KW_PRINT -> cont 43;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 44 tk tks = happyError' (tks, explist)
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
parsePrograma tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do
  putStr "Programa: "
  s <- getLine
  let resultado = parsePrograma (L.alexScanTokens s) :: Programa
  print resultado
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
