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
happyExpList = Happy_Data_Array.listArray (0,231) ([0,16,0,0,8,0,0,0,0,0,0,0,0,0,0,0,16385,496,0,0,0,0,0,0,17408,0,0,512,0,0,256,0,0,128,0,0,64,0,0,1058,240,32768,513,0,0,5,0,0,0,0,8192,2,15,4096,32769,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1088,7808,0,544,3840,0,272,1952,0,0,256,0,196,480,0,34,240,0,0,0,0,0,0,24576,128,0,0,32772,0,6144,0,0,0,16,0,32768,0,0,16384,768,0,0,0,0,704,62,0,1088,7808,0,544,3904,0,536,0,0,256,12,0,134,0,0,0,0,0,17,120,32768,8,60,16384,4,30,8192,2,15,0,0,0,20480,0,0,10240,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,544,3904,0,272,1952,0,4096,0,0,0,0,0,64,3,32768,31781,0,32768,8,60,16384,4,30,8192,2,15,4096,32769,7,34816,49152,3,17408,57344,1,32768,0,0,0,2,0,0,0,0,32768,0,0,544,3840,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,49152,0,0,24576,0,0,12288,0,0,6144,0,0,3072,0,0,1536,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parsePrograma","Programa","Bloco","ListaCmd","Comando","ListaArgsExpr","ExprL","ExprR","Expr","Term","Factor","'+'","'-'","'*'","'/='","'/'","'('","')'","'{'","'}'","'='","';'","'<='","'>='","'>'","'<'","'=='","'&&'","'||'","'!'","','","Num","IntLit","Id","StringLit","'int'","'float'","'string'","'void'","'read'","'while'","'print'","'if'","'return'","%eof"]
        bit_start = st * 47
        bit_end = (st + 1) * 47
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..46]
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
action_3 (36) = happyShift action_8
action_3 (42) = happyShift action_9
action_3 (43) = happyShift action_10
action_3 (44) = happyShift action_11
action_3 (45) = happyShift action_12
action_3 (46) = happyShift action_13
action_3 (6) = happyGoto action_5
action_3 (7) = happyGoto action_6
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (47) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (22) = happyShift action_31
action_5 (36) = happyShift action_8
action_5 (42) = happyShift action_9
action_5 (43) = happyShift action_10
action_5 (44) = happyShift action_11
action_5 (45) = happyShift action_12
action_5 (46) = happyShift action_13
action_5 (7) = happyGoto action_30
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_5

action_7 _ = happyReduce_3

action_8 (19) = happyShift action_28
action_8 (23) = happyShift action_29
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (19) = happyShift action_27
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (19) = happyShift action_26
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (19) = happyShift action_25
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (19) = happyShift action_24
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (15) = happyShift action_17
action_13 (19) = happyShift action_18
action_13 (24) = happyShift action_19
action_13 (34) = happyShift action_20
action_13 (35) = happyShift action_21
action_13 (36) = happyShift action_22
action_13 (37) = happyShift action_23
action_13 (11) = happyGoto action_14
action_13 (12) = happyGoto action_15
action_13 (13) = happyGoto action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (14) = happyShift action_48
action_14 (15) = happyShift action_49
action_14 (24) = happyShift action_50
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (16) = happyShift action_46
action_15 (18) = happyShift action_47
action_15 _ = happyReduce_31

action_16 _ = happyReduce_34

action_17 (15) = happyShift action_17
action_17 (19) = happyShift action_18
action_17 (34) = happyShift action_20
action_17 (35) = happyShift action_21
action_17 (36) = happyShift action_22
action_17 (37) = happyShift action_23
action_17 (13) = happyGoto action_45
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (15) = happyShift action_17
action_18 (19) = happyShift action_18
action_18 (34) = happyShift action_20
action_18 (35) = happyShift action_21
action_18 (36) = happyShift action_22
action_18 (37) = happyShift action_23
action_18 (11) = happyGoto action_44
action_18 (12) = happyGoto action_15
action_18 (13) = happyGoto action_16
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_13

action_20 _ = happyReduce_35

action_21 _ = happyReduce_36

action_22 _ = happyReduce_37

action_23 _ = happyReduce_38

action_24 (15) = happyShift action_17
action_24 (19) = happyShift action_40
action_24 (32) = happyShift action_41
action_24 (34) = happyShift action_20
action_24 (35) = happyShift action_21
action_24 (36) = happyShift action_22
action_24 (37) = happyShift action_23
action_24 (9) = happyGoto action_43
action_24 (10) = happyGoto action_38
action_24 (11) = happyGoto action_39
action_24 (12) = happyGoto action_15
action_24 (13) = happyGoto action_16
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (15) = happyShift action_17
action_25 (19) = happyShift action_18
action_25 (34) = happyShift action_20
action_25 (35) = happyShift action_21
action_25 (36) = happyShift action_22
action_25 (37) = happyShift action_23
action_25 (11) = happyGoto action_42
action_25 (12) = happyGoto action_15
action_25 (13) = happyGoto action_16
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (15) = happyShift action_17
action_26 (19) = happyShift action_40
action_26 (32) = happyShift action_41
action_26 (34) = happyShift action_20
action_26 (35) = happyShift action_21
action_26 (36) = happyShift action_22
action_26 (37) = happyShift action_23
action_26 (9) = happyGoto action_37
action_26 (10) = happyGoto action_38
action_26 (11) = happyGoto action_39
action_26 (12) = happyGoto action_15
action_26 (13) = happyGoto action_16
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (36) = happyShift action_36
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (15) = happyShift action_17
action_28 (19) = happyShift action_18
action_28 (20) = happyShift action_35
action_28 (34) = happyShift action_20
action_28 (35) = happyShift action_21
action_28 (36) = happyShift action_22
action_28 (37) = happyShift action_23
action_28 (8) = happyGoto action_33
action_28 (11) = happyGoto action_34
action_28 (12) = happyGoto action_15
action_28 (13) = happyGoto action_16
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (15) = happyShift action_17
action_29 (19) = happyShift action_18
action_29 (34) = happyShift action_20
action_29 (35) = happyShift action_21
action_29 (36) = happyShift action_22
action_29 (37) = happyShift action_23
action_29 (11) = happyGoto action_32
action_29 (12) = happyGoto action_15
action_29 (13) = happyGoto action_16
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_4

action_31 _ = happyReduce_2

action_32 (14) = happyShift action_48
action_32 (15) = happyShift action_49
action_32 (24) = happyShift action_74
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (20) = happyShift action_72
action_33 (33) = happyShift action_73
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (14) = happyShift action_48
action_34 (15) = happyShift action_49
action_34 _ = happyReduce_16

action_35 (24) = happyShift action_71
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (20) = happyShift action_70
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (20) = happyShift action_69
action_37 (30) = happyShift action_57
action_37 (31) = happyShift action_58
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_21

action_39 (14) = happyShift action_48
action_39 (15) = happyShift action_49
action_39 (17) = happyShift action_63
action_39 (25) = happyShift action_64
action_39 (26) = happyShift action_65
action_39 (27) = happyShift action_66
action_39 (28) = happyShift action_67
action_39 (29) = happyShift action_68
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (15) = happyShift action_17
action_40 (19) = happyShift action_40
action_40 (32) = happyShift action_41
action_40 (34) = happyShift action_20
action_40 (35) = happyShift action_21
action_40 (36) = happyShift action_22
action_40 (37) = happyShift action_23
action_40 (9) = happyGoto action_61
action_40 (10) = happyGoto action_38
action_40 (11) = happyGoto action_62
action_40 (12) = happyGoto action_15
action_40 (13) = happyGoto action_16
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (15) = happyShift action_17
action_41 (19) = happyShift action_40
action_41 (32) = happyShift action_41
action_41 (34) = happyShift action_20
action_41 (35) = happyShift action_21
action_41 (36) = happyShift action_22
action_41 (37) = happyShift action_23
action_41 (9) = happyGoto action_60
action_41 (10) = happyGoto action_38
action_41 (11) = happyGoto action_39
action_41 (12) = happyGoto action_15
action_41 (13) = happyGoto action_16
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (14) = happyShift action_48
action_42 (15) = happyShift action_49
action_42 (20) = happyShift action_59
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (20) = happyShift action_56
action_43 (30) = happyShift action_57
action_43 (31) = happyShift action_58
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (14) = happyShift action_48
action_44 (15) = happyShift action_49
action_44 (20) = happyShift action_55
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_40

action_46 (15) = happyShift action_17
action_46 (19) = happyShift action_18
action_46 (34) = happyShift action_20
action_46 (35) = happyShift action_21
action_46 (36) = happyShift action_22
action_46 (37) = happyShift action_23
action_46 (13) = happyGoto action_54
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (15) = happyShift action_17
action_47 (19) = happyShift action_18
action_47 (34) = happyShift action_20
action_47 (35) = happyShift action_21
action_47 (36) = happyShift action_22
action_47 (37) = happyShift action_23
action_47 (13) = happyGoto action_53
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (15) = happyShift action_17
action_48 (19) = happyShift action_18
action_48 (34) = happyShift action_20
action_48 (35) = happyShift action_21
action_48 (36) = happyShift action_22
action_48 (37) = happyShift action_23
action_48 (12) = happyGoto action_52
action_48 (13) = happyGoto action_16
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (15) = happyShift action_17
action_49 (19) = happyShift action_18
action_49 (34) = happyShift action_20
action_49 (35) = happyShift action_21
action_49 (36) = happyShift action_22
action_49 (37) = happyShift action_23
action_49 (12) = happyGoto action_51
action_49 (13) = happyGoto action_16
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_12

action_51 (16) = happyShift action_46
action_51 (18) = happyShift action_47
action_51 _ = happyReduce_30

action_52 (16) = happyShift action_46
action_52 (18) = happyShift action_47
action_52 _ = happyReduce_29

action_53 _ = happyReduce_33

action_54 _ = happyReduce_32

action_55 _ = happyReduce_39

action_56 (21) = happyShift action_3
action_56 (5) = happyGoto action_89
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (15) = happyShift action_17
action_57 (19) = happyShift action_40
action_57 (32) = happyShift action_41
action_57 (34) = happyShift action_20
action_57 (35) = happyShift action_21
action_57 (36) = happyShift action_22
action_57 (37) = happyShift action_23
action_57 (9) = happyGoto action_88
action_57 (10) = happyGoto action_38
action_57 (11) = happyGoto action_39
action_57 (12) = happyGoto action_15
action_57 (13) = happyGoto action_16
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (15) = happyShift action_17
action_58 (19) = happyShift action_40
action_58 (32) = happyShift action_41
action_58 (34) = happyShift action_20
action_58 (35) = happyShift action_21
action_58 (36) = happyShift action_22
action_58 (37) = happyShift action_23
action_58 (9) = happyGoto action_87
action_58 (10) = happyGoto action_38
action_58 (11) = happyGoto action_39
action_58 (12) = happyGoto action_15
action_58 (13) = happyGoto action_16
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (24) = happyShift action_86
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (30) = happyShift action_57
action_60 (31) = happyShift action_58
action_60 _ = happyReduce_20

action_61 (20) = happyShift action_85
action_61 (30) = happyShift action_57
action_61 (31) = happyShift action_58
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (14) = happyShift action_48
action_62 (15) = happyShift action_49
action_62 (17) = happyShift action_63
action_62 (20) = happyShift action_55
action_62 (25) = happyShift action_64
action_62 (26) = happyShift action_65
action_62 (27) = happyShift action_66
action_62 (28) = happyShift action_67
action_62 (29) = happyShift action_68
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (15) = happyShift action_17
action_63 (19) = happyShift action_18
action_63 (34) = happyShift action_20
action_63 (35) = happyShift action_21
action_63 (36) = happyShift action_22
action_63 (37) = happyShift action_23
action_63 (11) = happyGoto action_84
action_63 (12) = happyGoto action_15
action_63 (13) = happyGoto action_16
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (15) = happyShift action_17
action_64 (19) = happyShift action_18
action_64 (34) = happyShift action_20
action_64 (35) = happyShift action_21
action_64 (36) = happyShift action_22
action_64 (37) = happyShift action_23
action_64 (11) = happyGoto action_83
action_64 (12) = happyGoto action_15
action_64 (13) = happyGoto action_16
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (15) = happyShift action_17
action_65 (19) = happyShift action_18
action_65 (34) = happyShift action_20
action_65 (35) = happyShift action_21
action_65 (36) = happyShift action_22
action_65 (37) = happyShift action_23
action_65 (11) = happyGoto action_82
action_65 (12) = happyGoto action_15
action_65 (13) = happyGoto action_16
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (15) = happyShift action_17
action_66 (19) = happyShift action_18
action_66 (34) = happyShift action_20
action_66 (35) = happyShift action_21
action_66 (36) = happyShift action_22
action_66 (37) = happyShift action_23
action_66 (11) = happyGoto action_81
action_66 (12) = happyGoto action_15
action_66 (13) = happyGoto action_16
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (15) = happyShift action_17
action_67 (19) = happyShift action_18
action_67 (34) = happyShift action_20
action_67 (35) = happyShift action_21
action_67 (36) = happyShift action_22
action_67 (37) = happyShift action_23
action_67 (11) = happyGoto action_80
action_67 (12) = happyGoto action_15
action_67 (13) = happyGoto action_16
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (15) = happyShift action_17
action_68 (19) = happyShift action_18
action_68 (34) = happyShift action_20
action_68 (35) = happyShift action_21
action_68 (36) = happyShift action_22
action_68 (37) = happyShift action_23
action_68 (11) = happyGoto action_79
action_68 (12) = happyGoto action_15
action_68 (13) = happyGoto action_16
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (21) = happyShift action_3
action_69 (5) = happyGoto action_78
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (24) = happyShift action_77
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_15

action_72 (24) = happyShift action_76
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (15) = happyShift action_17
action_73 (19) = happyShift action_18
action_73 (34) = happyShift action_20
action_73 (35) = happyShift action_21
action_73 (36) = happyShift action_22
action_73 (37) = happyShift action_23
action_73 (11) = happyGoto action_75
action_73 (12) = happyGoto action_15
action_73 (13) = happyGoto action_16
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_8

action_75 (14) = happyShift action_48
action_75 (15) = happyShift action_49
action_75 _ = happyReduce_17

action_76 _ = happyReduce_14

action_77 _ = happyReduce_9

action_78 _ = happyReduce_7

action_79 (14) = happyShift action_48
action_79 (15) = happyShift action_49
action_79 _ = happyReduce_23

action_80 (14) = happyShift action_48
action_80 (15) = happyShift action_49
action_80 _ = happyReduce_25

action_81 (14) = happyShift action_48
action_81 (15) = happyShift action_49
action_81 _ = happyReduce_24

action_82 (14) = happyShift action_48
action_82 (15) = happyShift action_49
action_82 _ = happyReduce_27

action_83 (14) = happyShift action_48
action_83 (15) = happyShift action_49
action_83 _ = happyReduce_26

action_84 (14) = happyShift action_48
action_84 (15) = happyShift action_49
action_84 _ = happyReduce_28

action_85 _ = happyReduce_22

action_86 _ = happyReduce_10

action_87 (30) = happyShift action_57
action_87 (31) = happyShift action_58
action_87 _ = happyReduce_18

action_88 (30) = happyShift action_57
action_88 (31) = happyShift action_58
action_88 _ = happyReduce_19

action_89 (21) = happyShift action_3
action_89 (5) = happyGoto action_90
action_89 _ = happyFail (happyExpListPerState 89)

action_90 _ = happyReduce_11

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

happyReduce_11 = happyReduce 6 7 happyReduction_11
happyReduction_11 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (If happy_var_3 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (Ret (Just happy_var_2)
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  7 happyReduction_13
happyReduction_13 _
	_
	 =  HappyAbsSyn7
		 (Ret Nothing
	)

happyReduce_14 = happyReduce 5 7 happyReduction_14
happyReduction_14 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Proc happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 4 7 happyReduction_15
happyReduction_15 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Proc happy_var_1 []
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_3 : happy_var_1
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  9 happyReduction_18
happyReduction_18 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Or happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (And happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  9 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Not happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  9 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (Rel happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  10 happyReduction_23
happyReduction_23 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Req happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rgt happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rlt happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  10 happyReduction_26
happyReduction_26 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rle happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rge happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  10 happyReduction_28
happyReduction_28 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Rdf happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Add happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  11 happyReduction_30
happyReduction_30 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  11 happyReduction_31
happyReduction_31 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  12 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  12 happyReduction_33
happyReduction_33 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (Div happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  12 happyReduction_34
happyReduction_34 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn13
		 (Const (CDouble happy_var_1)
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 (HappyTerminal (INT_LIT happy_var_1))
	 =  HappyAbsSyn13
		 (Const (CInt happy_var_1)
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn13
		 (IdVar happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  13 happyReduction_38
happyReduction_38 (HappyTerminal (STRING_LIT happy_var_1))
	 =  HappyAbsSyn13
		 (Lit happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  13 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  13 happyReduction_40
happyReduction_40 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Neg happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 47 47 notHappyAtAll (HappyState action) sts stk []

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
	COMMA -> cont 33;
	NUM happy_dollar_dollar -> cont 34;
	INT_LIT happy_dollar_dollar -> cont 35;
	ID happy_dollar_dollar -> cont 36;
	STRING_LIT happy_dollar_dollar -> cont 37;
	KW_INT -> cont 38;
	KW_FLOAT -> cont 39;
	KW_STRING -> cont 40;
	KW_VOID -> cont 41;
	KW_READ -> cont 42;
	KW_WHILE -> cont 43;
	KW_PRINT -> cont 44;
	KW_IF -> cont 45;
	KW_RETURN -> cont 46;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 47 tk tks = happyError' (tks, explist)
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
