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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
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
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,276) ([0,512,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,49152,1,0,0,0,0,0,16,0,1024,49408,7,0,0,0,32768,8,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,8,0,0,128,0,0,2048,0,0,34816,49168,3,49152,256,0,0,80,0,0,0,0,0,34816,49152,3,32768,8,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2176,15616,0,34816,49152,3,32768,8,61,0,0,256,0,6272,15360,0,34816,49152,3,0,0,0,0,0,0,0,0,513,0,0,0,0,0,0,0,0,1024,49408,7,0,0,0,0,0,0,0,0,16,0,4108,0,0,4096,512,0,3072,0,0,0,256,0,0,256,0,0,4096,192,0,0,0,0,49152,15874,0,0,136,976,0,2176,15616,0,3072,1,0,0,49168,0,0,268,0,0,0,0,0,34816,49152,3,32768,8,60,0,136,960,0,2176,15360,0,0,0,0,0,5,0,0,80,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,2176,15616,0,34816,53248,3,0,256,0,0,0,0,0,4096,192,0,11264,993,0,32768,8,60,0,136,960,0,2176,15360,0,34816,49152,3,32768,8,60,0,136,960,0,8192,0,0,0,16,0,0,0,0,0,4096,0,0,2176,15360,0,0,0,0,0,0,0,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,192,0,0,3072,0,0,49152,0,0,0,12,0,0,192,0,0,3072,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,16384,4096,124,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parsePrograma","Programa","BlocoPrincipal","Declaracoes","Declaracao","Tipo","ListaId","Bloco","ListaCmd","Comando","ListaArgsExpr","ExprL","ExprR","Expr","Term","Factor","'+'","'-'","'*'","'/='","'/'","'('","')'","'{'","'}'","'='","';'","'<='","'>='","'>'","'<'","'=='","'&&'","'||'","'!'","','","Num","IntLit","Id","StringLit","'int'","'float'","'string'","'void'","'read'","'while'","'print'","'if'","'return'","%eof"]
        bit_start = st Prelude.* 52
        bit_end = (st Prelude.+ 1) Prelude.* 52
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..51]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (26) = happyShift action_3
action_0 (4) = happyGoto action_4
action_0 (5) = happyGoto action_2
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (26) = happyShift action_3
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (27) = happyReduce_17
action_3 (41) = happyShift action_10
action_3 (43) = happyShift action_11
action_3 (44) = happyShift action_12
action_3 (45) = happyShift action_13
action_3 (47) = happyShift action_14
action_3 (48) = happyShift action_15
action_3 (49) = happyShift action_16
action_3 (50) = happyShift action_17
action_3 (51) = happyShift action_18
action_3 (6) = happyGoto action_5
action_3 (7) = happyGoto action_6
action_3 (8) = happyGoto action_7
action_3 (11) = happyGoto action_8
action_3 (12) = happyGoto action_9
action_3 _ = happyReduce_17

action_4 (52) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (41) = happyShift action_10
action_5 (43) = happyShift action_11
action_5 (44) = happyShift action_12
action_5 (45) = happyShift action_13
action_5 (47) = happyShift action_14
action_5 (48) = happyShift action_15
action_5 (49) = happyShift action_16
action_5 (50) = happyShift action_17
action_5 (51) = happyShift action_18
action_5 (7) = happyGoto action_39
action_5 (8) = happyGoto action_7
action_5 (11) = happyGoto action_40
action_5 (12) = happyGoto action_9
action_5 _ = happyReduce_17

action_6 _ = happyReduce_5

action_7 (41) = happyShift action_38
action_7 (9) = happyGoto action_37
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (27) = happyShift action_36
action_8 (41) = happyShift action_10
action_8 (47) = happyShift action_14
action_8 (48) = happyShift action_15
action_8 (49) = happyShift action_16
action_8 (50) = happyShift action_17
action_8 (51) = happyShift action_18
action_8 (12) = happyGoto action_35
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_16

action_10 (24) = happyShift action_33
action_10 (28) = happyShift action_34
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_8

action_12 _ = happyReduce_9

action_13 _ = happyReduce_10

action_14 (24) = happyShift action_32
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (24) = happyShift action_31
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (24) = happyShift action_30
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (24) = happyShift action_29
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (20) = happyShift action_22
action_18 (24) = happyShift action_23
action_18 (29) = happyShift action_24
action_18 (39) = happyShift action_25
action_18 (40) = happyShift action_26
action_18 (41) = happyShift action_27
action_18 (42) = happyShift action_28
action_18 (16) = happyGoto action_19
action_18 (17) = happyGoto action_20
action_18 (18) = happyGoto action_21
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (19) = happyShift action_60
action_19 (20) = happyShift action_61
action_19 (29) = happyShift action_62
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (21) = happyShift action_58
action_20 (23) = happyShift action_59
action_20 _ = happyReduce_42

action_21 _ = happyReduce_45

action_22 (20) = happyShift action_22
action_22 (24) = happyShift action_23
action_22 (39) = happyShift action_25
action_22 (40) = happyShift action_26
action_22 (41) = happyShift action_27
action_22 (42) = happyShift action_28
action_22 (18) = happyGoto action_57
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (20) = happyShift action_22
action_23 (24) = happyShift action_23
action_23 (39) = happyShift action_25
action_23 (40) = happyShift action_26
action_23 (41) = happyShift action_27
action_23 (42) = happyShift action_28
action_23 (16) = happyGoto action_56
action_23 (17) = happyGoto action_20
action_23 (18) = happyGoto action_21
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_24

action_25 _ = happyReduce_46

action_26 _ = happyReduce_47

action_27 _ = happyReduce_48

action_28 _ = happyReduce_49

action_29 (20) = happyShift action_22
action_29 (24) = happyShift action_52
action_29 (37) = happyShift action_53
action_29 (39) = happyShift action_25
action_29 (40) = happyShift action_26
action_29 (41) = happyShift action_27
action_29 (42) = happyShift action_28
action_29 (14) = happyGoto action_55
action_29 (15) = happyGoto action_50
action_29 (16) = happyGoto action_51
action_29 (17) = happyGoto action_20
action_29 (18) = happyGoto action_21
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (20) = happyShift action_22
action_30 (24) = happyShift action_23
action_30 (39) = happyShift action_25
action_30 (40) = happyShift action_26
action_30 (41) = happyShift action_27
action_30 (42) = happyShift action_28
action_30 (16) = happyGoto action_54
action_30 (17) = happyGoto action_20
action_30 (18) = happyGoto action_21
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (20) = happyShift action_22
action_31 (24) = happyShift action_52
action_31 (37) = happyShift action_53
action_31 (39) = happyShift action_25
action_31 (40) = happyShift action_26
action_31 (41) = happyShift action_27
action_31 (42) = happyShift action_28
action_31 (14) = happyGoto action_49
action_31 (15) = happyGoto action_50
action_31 (16) = happyGoto action_51
action_31 (17) = happyGoto action_20
action_31 (18) = happyGoto action_21
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (41) = happyShift action_48
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (20) = happyShift action_22
action_33 (24) = happyShift action_23
action_33 (25) = happyShift action_47
action_33 (39) = happyShift action_25
action_33 (40) = happyShift action_26
action_33 (41) = happyShift action_27
action_33 (42) = happyShift action_28
action_33 (13) = happyGoto action_45
action_33 (16) = happyGoto action_46
action_33 (17) = happyGoto action_20
action_33 (18) = happyGoto action_21
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (20) = happyShift action_22
action_34 (24) = happyShift action_23
action_34 (39) = happyShift action_25
action_34 (40) = happyShift action_26
action_34 (41) = happyShift action_27
action_34 (42) = happyShift action_28
action_34 (16) = happyGoto action_44
action_34 (17) = happyGoto action_20
action_34 (18) = happyGoto action_21
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_15

action_36 _ = happyReduce_3

action_37 (29) = happyShift action_42
action_37 (38) = happyShift action_43
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_11

action_39 _ = happyReduce_4

action_40 (27) = happyShift action_41
action_40 (41) = happyShift action_10
action_40 (47) = happyShift action_14
action_40 (48) = happyShift action_15
action_40 (49) = happyShift action_16
action_40 (50) = happyShift action_17
action_40 (51) = happyShift action_18
action_40 (12) = happyGoto action_35
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_2

action_42 _ = happyReduce_7

action_43 (41) = happyShift action_87
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (19) = happyShift action_60
action_44 (20) = happyShift action_61
action_44 (29) = happyShift action_86
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (25) = happyShift action_84
action_45 (38) = happyShift action_85
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (19) = happyShift action_60
action_46 (20) = happyShift action_61
action_46 _ = happyReduce_27

action_47 (29) = happyShift action_83
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (25) = happyShift action_82
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (25) = happyShift action_81
action_49 (35) = happyShift action_69
action_49 (36) = happyShift action_70
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_32

action_51 (19) = happyShift action_60
action_51 (20) = happyShift action_61
action_51 (22) = happyShift action_75
action_51 (30) = happyShift action_76
action_51 (31) = happyShift action_77
action_51 (32) = happyShift action_78
action_51 (33) = happyShift action_79
action_51 (34) = happyShift action_80
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (20) = happyShift action_22
action_52 (24) = happyShift action_52
action_52 (37) = happyShift action_53
action_52 (39) = happyShift action_25
action_52 (40) = happyShift action_26
action_52 (41) = happyShift action_27
action_52 (42) = happyShift action_28
action_52 (14) = happyGoto action_73
action_52 (15) = happyGoto action_50
action_52 (16) = happyGoto action_74
action_52 (17) = happyGoto action_20
action_52 (18) = happyGoto action_21
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (20) = happyShift action_22
action_53 (24) = happyShift action_52
action_53 (37) = happyShift action_53
action_53 (39) = happyShift action_25
action_53 (40) = happyShift action_26
action_53 (41) = happyShift action_27
action_53 (42) = happyShift action_28
action_53 (14) = happyGoto action_72
action_53 (15) = happyGoto action_50
action_53 (16) = happyGoto action_51
action_53 (17) = happyGoto action_20
action_53 (18) = happyGoto action_21
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyShift action_60
action_54 (20) = happyShift action_61
action_54 (25) = happyShift action_71
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (25) = happyShift action_68
action_55 (35) = happyShift action_69
action_55 (36) = happyShift action_70
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (19) = happyShift action_60
action_56 (20) = happyShift action_61
action_56 (25) = happyShift action_67
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_51

action_58 (20) = happyShift action_22
action_58 (24) = happyShift action_23
action_58 (39) = happyShift action_25
action_58 (40) = happyShift action_26
action_58 (41) = happyShift action_27
action_58 (42) = happyShift action_28
action_58 (18) = happyGoto action_66
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (20) = happyShift action_22
action_59 (24) = happyShift action_23
action_59 (39) = happyShift action_25
action_59 (40) = happyShift action_26
action_59 (41) = happyShift action_27
action_59 (42) = happyShift action_28
action_59 (18) = happyGoto action_65
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (20) = happyShift action_22
action_60 (24) = happyShift action_23
action_60 (39) = happyShift action_25
action_60 (40) = happyShift action_26
action_60 (41) = happyShift action_27
action_60 (42) = happyShift action_28
action_60 (17) = happyGoto action_64
action_60 (18) = happyGoto action_21
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (20) = happyShift action_22
action_61 (24) = happyShift action_23
action_61 (39) = happyShift action_25
action_61 (40) = happyShift action_26
action_61 (41) = happyShift action_27
action_61 (42) = happyShift action_28
action_61 (17) = happyGoto action_63
action_61 (18) = happyGoto action_21
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_23

action_63 (21) = happyShift action_58
action_63 (23) = happyShift action_59
action_63 _ = happyReduce_41

action_64 (21) = happyShift action_58
action_64 (23) = happyShift action_59
action_64 _ = happyReduce_40

action_65 _ = happyReduce_44

action_66 _ = happyReduce_43

action_67 _ = happyReduce_50

action_68 (26) = happyShift action_92
action_68 (10) = happyGoto action_103
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (20) = happyShift action_22
action_69 (24) = happyShift action_52
action_69 (37) = happyShift action_53
action_69 (39) = happyShift action_25
action_69 (40) = happyShift action_26
action_69 (41) = happyShift action_27
action_69 (42) = happyShift action_28
action_69 (14) = happyGoto action_102
action_69 (15) = happyGoto action_50
action_69 (16) = happyGoto action_51
action_69 (17) = happyGoto action_20
action_69 (18) = happyGoto action_21
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (20) = happyShift action_22
action_70 (24) = happyShift action_52
action_70 (37) = happyShift action_53
action_70 (39) = happyShift action_25
action_70 (40) = happyShift action_26
action_70 (41) = happyShift action_27
action_70 (42) = happyShift action_28
action_70 (14) = happyGoto action_101
action_70 (15) = happyGoto action_50
action_70 (16) = happyGoto action_51
action_70 (17) = happyGoto action_20
action_70 (18) = happyGoto action_21
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (29) = happyShift action_100
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (35) = happyShift action_69
action_72 (36) = happyShift action_70
action_72 _ = happyReduce_31

action_73 (25) = happyShift action_99
action_73 (35) = happyShift action_69
action_73 (36) = happyShift action_70
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (19) = happyShift action_60
action_74 (20) = happyShift action_61
action_74 (22) = happyShift action_75
action_74 (25) = happyShift action_67
action_74 (30) = happyShift action_76
action_74 (31) = happyShift action_77
action_74 (32) = happyShift action_78
action_74 (33) = happyShift action_79
action_74 (34) = happyShift action_80
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (20) = happyShift action_22
action_75 (24) = happyShift action_23
action_75 (39) = happyShift action_25
action_75 (40) = happyShift action_26
action_75 (41) = happyShift action_27
action_75 (42) = happyShift action_28
action_75 (16) = happyGoto action_98
action_75 (17) = happyGoto action_20
action_75 (18) = happyGoto action_21
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (20) = happyShift action_22
action_76 (24) = happyShift action_23
action_76 (39) = happyShift action_25
action_76 (40) = happyShift action_26
action_76 (41) = happyShift action_27
action_76 (42) = happyShift action_28
action_76 (16) = happyGoto action_97
action_76 (17) = happyGoto action_20
action_76 (18) = happyGoto action_21
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (20) = happyShift action_22
action_77 (24) = happyShift action_23
action_77 (39) = happyShift action_25
action_77 (40) = happyShift action_26
action_77 (41) = happyShift action_27
action_77 (42) = happyShift action_28
action_77 (16) = happyGoto action_96
action_77 (17) = happyGoto action_20
action_77 (18) = happyGoto action_21
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (20) = happyShift action_22
action_78 (24) = happyShift action_23
action_78 (39) = happyShift action_25
action_78 (40) = happyShift action_26
action_78 (41) = happyShift action_27
action_78 (42) = happyShift action_28
action_78 (16) = happyGoto action_95
action_78 (17) = happyGoto action_20
action_78 (18) = happyGoto action_21
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (20) = happyShift action_22
action_79 (24) = happyShift action_23
action_79 (39) = happyShift action_25
action_79 (40) = happyShift action_26
action_79 (41) = happyShift action_27
action_79 (42) = happyShift action_28
action_79 (16) = happyGoto action_94
action_79 (17) = happyGoto action_20
action_79 (18) = happyGoto action_21
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (20) = happyShift action_22
action_80 (24) = happyShift action_23
action_80 (39) = happyShift action_25
action_80 (40) = happyShift action_26
action_80 (41) = happyShift action_27
action_80 (42) = happyShift action_28
action_80 (16) = happyGoto action_93
action_80 (17) = happyGoto action_20
action_80 (18) = happyGoto action_21
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (26) = happyShift action_92
action_81 (10) = happyGoto action_91
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (29) = happyShift action_90
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_26

action_84 (29) = happyShift action_89
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (20) = happyShift action_22
action_85 (24) = happyShift action_23
action_85 (39) = happyShift action_25
action_85 (40) = happyShift action_26
action_85 (41) = happyShift action_27
action_85 (42) = happyShift action_28
action_85 (16) = happyGoto action_88
action_85 (17) = happyGoto action_20
action_85 (18) = happyGoto action_21
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_19

action_87 _ = happyReduce_12

action_88 (19) = happyShift action_60
action_88 (20) = happyShift action_61
action_88 _ = happyReduce_28

action_89 _ = happyReduce_25

action_90 _ = happyReduce_20

action_91 _ = happyReduce_18

action_92 (27) = happyShift action_106
action_92 (41) = happyShift action_10
action_92 (47) = happyShift action_14
action_92 (48) = happyShift action_15
action_92 (49) = happyShift action_16
action_92 (50) = happyShift action_17
action_92 (51) = happyShift action_18
action_92 (11) = happyGoto action_105
action_92 (12) = happyGoto action_9
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (19) = happyShift action_60
action_93 (20) = happyShift action_61
action_93 _ = happyReduce_34

action_94 (19) = happyShift action_60
action_94 (20) = happyShift action_61
action_94 _ = happyReduce_36

action_95 (19) = happyShift action_60
action_95 (20) = happyShift action_61
action_95 _ = happyReduce_35

action_96 (19) = happyShift action_60
action_96 (20) = happyShift action_61
action_96 _ = happyReduce_38

action_97 (19) = happyShift action_60
action_97 (20) = happyShift action_61
action_97 _ = happyReduce_37

action_98 (19) = happyShift action_60
action_98 (20) = happyShift action_61
action_98 _ = happyReduce_39

action_99 _ = happyReduce_33

action_100 _ = happyReduce_21

action_101 (35) = happyShift action_69
action_101 (36) = happyShift action_70
action_101 _ = happyReduce_29

action_102 (35) = happyShift action_69
action_102 (36) = happyShift action_70
action_102 _ = happyReduce_30

action_103 (26) = happyShift action_92
action_103 (10) = happyGoto action_104
action_103 _ = happyFail (happyExpListPerState 103)

action_104 _ = happyReduce_22

action_105 (27) = happyShift action_107
action_105 (41) = happyShift action_10
action_105 (47) = happyShift action_14
action_105 (48) = happyShift action_15
action_105 (49) = happyShift action_16
action_105 (50) = happyShift action_17
action_105 (51) = happyShift action_18
action_105 (12) = happyGoto action_35
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_14

action_107 _ = happyReduce_13

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog (fst happy_var_1) (snd happy_var_1)
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happyReduce 4 5 happyReduction_2
happyReduction_2 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 ((happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (([], happy_var_2 )
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_2 ++ happy_var_1
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_0  6 happyReduction_6
happyReduction_6  =  HappyAbsSyn6
		 ([]
	)

happyReduce_7 = happySpecReduce_3  7 happyReduction_7
happyReduction_7 _
	(HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (map (\idName -> Variable idName happy_var_1) happy_var_2
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn8
		 (TInt
	)

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn8
		 (TDouble
	)

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn8
		 (TString
	)

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_3 : happy_var_1
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  10 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  10 happyReduction_14
happyReduction_14 _
	_
	 =  HappyAbsSyn10
		 ([]
	)

happyReduce_15 = happySpecReduce_2  11 happyReduction_15
happyReduction_15 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_2 : happy_var_1
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  11 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_0  11 happyReduction_17
happyReduction_17  =  HappyAbsSyn11
		 ([]
	)

happyReduce_18 = happyReduce 5 12 happyReduction_18
happyReduction_18 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_19 = happyReduce 4 12 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Atrib happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 5 12 happyReduction_20
happyReduction_20 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Leitura happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 5 12 happyReduction_21
happyReduction_21 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Imp happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 6 12 happyReduction_22
happyReduction_22 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	(HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (If happy_var_3 happy_var_5 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Ret (Just happy_var_2)
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  12 happyReduction_24
happyReduction_24 _
	_
	 =  HappyAbsSyn12
		 (Ret Nothing
	)

happyReduce_25 = happyReduce 5 12 happyReduction_25
happyReduction_25 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Proc happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 4 12 happyReduction_26
happyReduction_26 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (Proc happy_var_1 []
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_3 : happy_var_1
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Or happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (And happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  14 happyReduction_31
happyReduction_31 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Not happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  14 happyReduction_32
happyReduction_32 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (Rel happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  14 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  15 happyReduction_34
happyReduction_34 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Req happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  15 happyReduction_35
happyReduction_35 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Rgt happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  15 happyReduction_36
happyReduction_36 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Rlt happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Rle happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  15 happyReduction_38
happyReduction_38 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Rge happy_var_1 happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  15 happyReduction_39
happyReduction_39 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (Rdf happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  16 happyReduction_40
happyReduction_40 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Add happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  16 happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  16 happyReduction_42
happyReduction_42 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  17 happyReduction_43
happyReduction_43 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  17 happyReduction_44
happyReduction_44 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (Div happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  17 happyReduction_45
happyReduction_45 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  18 happyReduction_46
happyReduction_46 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn18
		 (Const (CDouble happy_var_1)
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  18 happyReduction_47
happyReduction_47 (HappyTerminal (INT_LIT happy_var_1))
	 =  HappyAbsSyn18
		 (Const (CInt happy_var_1)
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  18 happyReduction_48
happyReduction_48 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn18
		 (IdVar happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  18 happyReduction_49
happyReduction_49 (HappyTerminal (STRING_LIT happy_var_1))
	 =  HappyAbsSyn18
		 (Lit happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  18 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_2  18 happyReduction_51
happyReduction_51 (HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (Neg happy_var_2
	)
happyReduction_51 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 52 52 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ADD -> cont 19;
	SUB -> cont 20;
	MUL -> cont 21;
	RDF -> cont 22;
	DIV -> cont 23;
	LPAR -> cont 24;
	RPAR -> cont 25;
	LBRACE -> cont 26;
	RBRACE -> cont 27;
	EQ_ASSIGN -> cont 28;
	SEMI -> cont 29;
	RLE -> cont 30;
	RGE -> cont 31;
	RGT -> cont 32;
	RLT -> cont 33;
	REQ -> cont 34;
	AND -> cont 35;
	OR -> cont 36;
	NOT -> cont 37;
	COMMA -> cont 38;
	NUM happy_dollar_dollar -> cont 39;
	INT_LIT happy_dollar_dollar -> cont 40;
	ID happy_dollar_dollar -> cont 41;
	STRING_LIT happy_dollar_dollar -> cont 42;
	KW_INT -> cont 43;
	KW_FLOAT -> cont 44;
	KW_STRING -> cont 45;
	KW_VOID -> cont 46;
	KW_READ -> cont 47;
	KW_WHILE -> cont 48;
	KW_PRINT -> cont 49;
	KW_IF -> cont 50;
	KW_RETURN -> cont 51;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 52 tk tks = happyError' (tks, explist)
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
