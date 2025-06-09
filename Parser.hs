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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31
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
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,363) ([0,0,0,0,0,0,0,7680,0,0,1024,30720,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,0,0,0,0,0,8,0,0,128,30752,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,4352,0,0,0,1024,0,0,0,4096,0,0,0,16384,0,0,0,0,1,0,0,16384,132,30,0,0,16,0,0,0,0,0,0,0,0,0,0,0,0,57344,0,0,384,2,0,0,10240,0,0,0,0,0,0,0,16384,4,30,0,0,17,120,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,4096,40961,7,0,16384,4,30,0,0,17,122,0,0,0,128,0,0,784,1920,0,0,1088,7680,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,1,0,0,0,0,0,0,0,0,0,0,2048,33280,23,0,0,0,0,0,0,0,0,0,0,32768,0,0,6144,32,0,0,0,8,1,0,32768,1,0,0,0,0,0,0,0,512,0,0,0,2048,96,0,0,0,0,0,0,5632,496,0,0,4096,40961,7,0,16384,32772,30,0,32768,33,0,0,0,128,6,0,0,784,1920,0,0,2144,0,0,0,0,0,0,0,17408,57344,1,0,4096,32769,7,0,16384,4,30,0,0,17,120,0,0,0,0,0,0,512,64,0,0,0,0,0,0,0,8192,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,3584,0,0,160,0,0,0,640,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,1,0,0,0,0,0,0,256,0,0,0,272,1952,0,0,1088,7808,0,0,0,2,0,0,0,0,0,0,0,6146,0,0,24576,7945,0,0,0,17,120,0,0,68,480,0,0,272,1920,0,0,1088,7680,0,0,4352,30720,0,0,17408,57344,1,0,0,4,0,0,0,128,0,0,0,0,0,0,0,68,480,0,0,0,0,0,0,0,0,0,0,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,1,0,0,0,6,0,0,0,24,0,0,0,96,0,0,0,384,0,0,0,1536,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,32,24072,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parsePrograma","Programa","ListaFuncoes","Funcao","TipoRetorno","DeclParametros","Parametro","BlocoPrincipal","Declaracoes","Declaracao","Tipo","ListaID","Bloco","ListaCmd","Comando","Retorno","CmdSe","CmdEnquanto","CmdAtrib","CmdEscrita","CmdLeitura","ChamadaProc","ChamadaFuncao","ListaParametros","ExprL","ExprR","Expr","Term","Factor","'+'","'-'","'*'","'/='","'/'","'('","')'","'{'","'}'","'='","';'","'<='","'>='","'>'","'<'","'=='","'&&'","'||'","'!'","','","NUM","INT_LIT","ID","STRING_LIT","'int'","'float'","'string'","'void'","'read'","'while'","'print'","'if'","'else'","'return'","%eof"]
        bit_start = st * 66
        bit_end = (st + 1) * 66
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..65]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (39) = happyShift action_12
action_0 (56) = happyShift action_6
action_0 (57) = happyShift action_7
action_0 (58) = happyShift action_8
action_0 (59) = happyShift action_9
action_0 (4) = happyGoto action_10
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 (10) = happyGoto action_11
action_0 (13) = happyGoto action_5
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (56) = happyShift action_6
action_1 (57) = happyShift action_7
action_1 (58) = happyShift action_8
action_1 (59) = happyShift action_9
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 (7) = happyGoto action_4
action_1 (13) = happyGoto action_5
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (39) = happyShift action_12
action_2 (56) = happyShift action_6
action_2 (57) = happyShift action_7
action_2 (58) = happyShift action_8
action_2 (59) = happyShift action_9
action_2 (6) = happyGoto action_33
action_2 (7) = happyGoto action_4
action_2 (10) = happyGoto action_34
action_2 (13) = happyGoto action_5
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_4

action_4 (54) = happyShift action_32
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_8

action_6 _ = happyReduce_20

action_7 _ = happyReduce_21

action_8 _ = happyReduce_22

action_9 _ = happyReduce_9

action_10 (66) = happyAccept
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_2

action_12 (40) = happyReduce_29
action_12 (54) = happyShift action_26
action_12 (56) = happyShift action_6
action_12 (57) = happyShift action_7
action_12 (58) = happyShift action_8
action_12 (60) = happyShift action_27
action_12 (61) = happyShift action_28
action_12 (62) = happyShift action_29
action_12 (63) = happyShift action_30
action_12 (65) = happyShift action_31
action_12 (11) = happyGoto action_13
action_12 (12) = happyGoto action_14
action_12 (13) = happyGoto action_15
action_12 (16) = happyGoto action_16
action_12 (17) = happyGoto action_17
action_12 (18) = happyGoto action_18
action_12 (19) = happyGoto action_19
action_12 (20) = happyGoto action_20
action_12 (21) = happyGoto action_21
action_12 (22) = happyGoto action_22
action_12 (23) = happyGoto action_23
action_12 (24) = happyGoto action_24
action_12 (25) = happyGoto action_25
action_12 _ = happyReduce_29

action_13 (54) = happyShift action_26
action_13 (56) = happyShift action_6
action_13 (57) = happyShift action_7
action_13 (58) = happyShift action_8
action_13 (60) = happyShift action_27
action_13 (61) = happyShift action_28
action_13 (62) = happyShift action_29
action_13 (63) = happyShift action_30
action_13 (65) = happyShift action_31
action_13 (12) = happyGoto action_57
action_13 (13) = happyGoto action_15
action_13 (16) = happyGoto action_58
action_13 (17) = happyGoto action_17
action_13 (18) = happyGoto action_18
action_13 (19) = happyGoto action_19
action_13 (20) = happyGoto action_20
action_13 (21) = happyGoto action_21
action_13 (22) = happyGoto action_22
action_13 (23) = happyGoto action_23
action_13 (24) = happyGoto action_24
action_13 (25) = happyGoto action_25
action_13 _ = happyReduce_29

action_14 _ = happyReduce_17

action_15 (54) = happyShift action_56
action_15 (14) = happyGoto action_55
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (40) = happyShift action_54
action_16 (54) = happyShift action_26
action_16 (60) = happyShift action_27
action_16 (61) = happyShift action_28
action_16 (62) = happyShift action_29
action_16 (63) = happyShift action_30
action_16 (65) = happyShift action_31
action_16 (17) = happyGoto action_53
action_16 (18) = happyGoto action_18
action_16 (19) = happyGoto action_19
action_16 (20) = happyGoto action_20
action_16 (21) = happyGoto action_21
action_16 (22) = happyGoto action_22
action_16 (23) = happyGoto action_23
action_16 (24) = happyGoto action_24
action_16 (25) = happyGoto action_25
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_28

action_18 _ = happyReduce_36

action_19 _ = happyReduce_30

action_20 _ = happyReduce_33

action_21 _ = happyReduce_32

action_22 _ = happyReduce_31

action_23 _ = happyReduce_34

action_24 _ = happyReduce_35

action_25 (42) = happyShift action_52
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (37) = happyShift action_50
action_26 (41) = happyShift action_51
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (37) = happyShift action_49
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (37) = happyShift action_48
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (37) = happyShift action_47
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (37) = happyShift action_46
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (33) = happyShift action_39
action_31 (37) = happyShift action_40
action_31 (42) = happyShift action_41
action_31 (52) = happyShift action_42
action_31 (53) = happyShift action_43
action_31 (54) = happyShift action_44
action_31 (55) = happyShift action_45
action_31 (29) = happyGoto action_36
action_31 (30) = happyGoto action_37
action_31 (31) = happyGoto action_38
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (37) = happyShift action_35
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_3

action_34 _ = happyReduce_1

action_35 (38) = happyShift action_85
action_35 (56) = happyShift action_6
action_35 (57) = happyShift action_7
action_35 (58) = happyShift action_8
action_35 (8) = happyGoto action_82
action_35 (9) = happyGoto action_83
action_35 (13) = happyGoto action_84
action_35 _ = happyReduce_12

action_36 (32) = happyShift action_79
action_36 (33) = happyShift action_80
action_36 (42) = happyShift action_81
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (34) = happyShift action_77
action_37 (36) = happyShift action_78
action_37 _ = happyReduce_63

action_38 _ = happyReduce_66

action_39 (33) = happyShift action_39
action_39 (37) = happyShift action_40
action_39 (52) = happyShift action_42
action_39 (53) = happyShift action_43
action_39 (54) = happyShift action_44
action_39 (55) = happyShift action_45
action_39 (31) = happyGoto action_76
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (33) = happyShift action_39
action_40 (37) = happyShift action_40
action_40 (52) = happyShift action_42
action_40 (53) = happyShift action_43
action_40 (54) = happyShift action_44
action_40 (55) = happyShift action_45
action_40 (29) = happyGoto action_75
action_40 (30) = happyGoto action_37
action_40 (31) = happyGoto action_38
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_38

action_42 _ = happyReduce_67

action_43 _ = happyReduce_68

action_44 (37) = happyShift action_74
action_44 _ = happyReduce_69

action_45 _ = happyReduce_70

action_46 (33) = happyShift action_39
action_46 (37) = happyShift action_70
action_46 (50) = happyShift action_71
action_46 (52) = happyShift action_42
action_46 (53) = happyShift action_43
action_46 (54) = happyShift action_44
action_46 (55) = happyShift action_45
action_46 (27) = happyGoto action_73
action_46 (28) = happyGoto action_68
action_46 (29) = happyGoto action_69
action_46 (30) = happyGoto action_37
action_46 (31) = happyGoto action_38
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (33) = happyShift action_39
action_47 (37) = happyShift action_40
action_47 (52) = happyShift action_42
action_47 (53) = happyShift action_43
action_47 (54) = happyShift action_44
action_47 (55) = happyShift action_45
action_47 (29) = happyGoto action_72
action_47 (30) = happyGoto action_37
action_47 (31) = happyGoto action_38
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (33) = happyShift action_39
action_48 (37) = happyShift action_70
action_48 (50) = happyShift action_71
action_48 (52) = happyShift action_42
action_48 (53) = happyShift action_43
action_48 (54) = happyShift action_44
action_48 (55) = happyShift action_45
action_48 (27) = happyGoto action_67
action_48 (28) = happyGoto action_68
action_48 (29) = happyGoto action_69
action_48 (30) = happyGoto action_37
action_48 (31) = happyGoto action_38
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (54) = happyShift action_66
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (33) = happyShift action_39
action_50 (37) = happyShift action_40
action_50 (38) = happyShift action_65
action_50 (52) = happyShift action_42
action_50 (53) = happyShift action_43
action_50 (54) = happyShift action_44
action_50 (55) = happyShift action_45
action_50 (26) = happyGoto action_63
action_50 (29) = happyGoto action_64
action_50 (30) = happyGoto action_37
action_50 (31) = happyGoto action_38
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (33) = happyShift action_39
action_51 (37) = happyShift action_40
action_51 (52) = happyShift action_42
action_51 (53) = happyShift action_43
action_51 (54) = happyShift action_44
action_51 (55) = happyShift action_45
action_51 (29) = happyGoto action_62
action_51 (30) = happyGoto action_37
action_51 (31) = happyGoto action_38
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_45

action_53 _ = happyReduce_27

action_54 _ = happyReduce_15

action_55 (42) = happyShift action_60
action_55 (51) = happyShift action_61
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_23

action_57 _ = happyReduce_16

action_58 (40) = happyShift action_59
action_58 (54) = happyShift action_26
action_58 (60) = happyShift action_27
action_58 (61) = happyShift action_28
action_58 (62) = happyShift action_29
action_58 (63) = happyShift action_30
action_58 (65) = happyShift action_31
action_58 (17) = happyGoto action_53
action_58 (18) = happyGoto action_18
action_58 (19) = happyGoto action_19
action_58 (20) = happyGoto action_20
action_58 (21) = happyGoto action_21
action_58 (22) = happyGoto action_22
action_58 (23) = happyGoto action_23
action_58 (24) = happyGoto action_24
action_58 (25) = happyGoto action_25
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_14

action_60 _ = happyReduce_19

action_61 (54) = happyShift action_115
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (32) = happyShift action_79
action_62 (33) = happyShift action_80
action_62 (42) = happyShift action_114
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (38) = happyShift action_112
action_63 (51) = happyShift action_113
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (32) = happyShift action_79
action_64 (33) = happyShift action_80
action_64 _ = happyReduce_49

action_65 _ = happyReduce_47

action_66 (38) = happyShift action_111
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (38) = happyShift action_110
action_67 (48) = happyShift action_98
action_67 (49) = happyShift action_99
action_67 _ = happyFail (happyExpListPerState 67)

action_68 _ = happyReduce_53

action_69 (32) = happyShift action_79
action_69 (33) = happyShift action_80
action_69 (35) = happyShift action_104
action_69 (43) = happyShift action_105
action_69 (44) = happyShift action_106
action_69 (45) = happyShift action_107
action_69 (46) = happyShift action_108
action_69 (47) = happyShift action_109
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (33) = happyShift action_39
action_70 (37) = happyShift action_70
action_70 (50) = happyShift action_71
action_70 (52) = happyShift action_42
action_70 (53) = happyShift action_43
action_70 (54) = happyShift action_44
action_70 (55) = happyShift action_45
action_70 (27) = happyGoto action_102
action_70 (28) = happyGoto action_68
action_70 (29) = happyGoto action_103
action_70 (30) = happyGoto action_37
action_70 (31) = happyGoto action_38
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (33) = happyShift action_39
action_71 (37) = happyShift action_70
action_71 (50) = happyShift action_71
action_71 (52) = happyShift action_42
action_71 (53) = happyShift action_43
action_71 (54) = happyShift action_44
action_71 (55) = happyShift action_45
action_71 (27) = happyGoto action_101
action_71 (28) = happyGoto action_68
action_71 (29) = happyGoto action_69
action_71 (30) = happyGoto action_37
action_71 (31) = happyGoto action_38
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (32) = happyShift action_79
action_72 (33) = happyShift action_80
action_72 (38) = happyShift action_100
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (38) = happyShift action_97
action_73 (48) = happyShift action_98
action_73 (49) = happyShift action_99
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (33) = happyShift action_39
action_74 (37) = happyShift action_40
action_74 (38) = happyShift action_96
action_74 (52) = happyShift action_42
action_74 (53) = happyShift action_43
action_74 (54) = happyShift action_44
action_74 (55) = happyShift action_45
action_74 (26) = happyGoto action_95
action_74 (29) = happyGoto action_64
action_74 (30) = happyGoto action_37
action_74 (31) = happyGoto action_38
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (32) = happyShift action_79
action_75 (33) = happyShift action_80
action_75 (38) = happyShift action_94
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_72

action_77 (33) = happyShift action_39
action_77 (37) = happyShift action_40
action_77 (52) = happyShift action_42
action_77 (53) = happyShift action_43
action_77 (54) = happyShift action_44
action_77 (55) = happyShift action_45
action_77 (31) = happyGoto action_93
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (33) = happyShift action_39
action_78 (37) = happyShift action_40
action_78 (52) = happyShift action_42
action_78 (53) = happyShift action_43
action_78 (54) = happyShift action_44
action_78 (55) = happyShift action_45
action_78 (31) = happyGoto action_92
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (33) = happyShift action_39
action_79 (37) = happyShift action_40
action_79 (52) = happyShift action_42
action_79 (53) = happyShift action_43
action_79 (54) = happyShift action_44
action_79 (55) = happyShift action_45
action_79 (30) = happyGoto action_91
action_79 (31) = happyGoto action_38
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (33) = happyShift action_39
action_80 (37) = happyShift action_40
action_80 (52) = happyShift action_42
action_80 (53) = happyShift action_43
action_80 (54) = happyShift action_44
action_80 (55) = happyShift action_45
action_80 (30) = happyGoto action_90
action_80 (31) = happyGoto action_38
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_37

action_82 (38) = happyShift action_88
action_82 (51) = happyShift action_89
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_11

action_84 (54) = happyShift action_87
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (39) = happyShift action_12
action_85 (10) = happyGoto action_86
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_7

action_87 _ = happyReduce_13

action_88 (39) = happyShift action_12
action_88 (10) = happyGoto action_133
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (56) = happyShift action_6
action_89 (57) = happyShift action_7
action_89 (58) = happyShift action_8
action_89 (9) = happyGoto action_132
action_89 (13) = happyGoto action_84
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (34) = happyShift action_77
action_90 (36) = happyShift action_78
action_90 _ = happyReduce_62

action_91 (34) = happyShift action_77
action_91 (36) = happyShift action_78
action_91 _ = happyReduce_61

action_92 _ = happyReduce_65

action_93 _ = happyReduce_64

action_94 _ = happyReduce_71

action_95 (38) = happyShift action_131
action_95 (51) = happyShift action_113
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_74

action_97 (39) = happyShift action_119
action_97 (15) = happyGoto action_130
action_97 _ = happyFail (happyExpListPerState 97)

action_98 (33) = happyShift action_39
action_98 (37) = happyShift action_70
action_98 (50) = happyShift action_71
action_98 (52) = happyShift action_42
action_98 (53) = happyShift action_43
action_98 (54) = happyShift action_44
action_98 (55) = happyShift action_45
action_98 (27) = happyGoto action_129
action_98 (28) = happyGoto action_68
action_98 (29) = happyGoto action_69
action_98 (30) = happyGoto action_37
action_98 (31) = happyGoto action_38
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (33) = happyShift action_39
action_99 (37) = happyShift action_70
action_99 (50) = happyShift action_71
action_99 (52) = happyShift action_42
action_99 (53) = happyShift action_43
action_99 (54) = happyShift action_44
action_99 (55) = happyShift action_45
action_99 (27) = happyGoto action_128
action_99 (28) = happyGoto action_68
action_99 (29) = happyGoto action_69
action_99 (30) = happyGoto action_37
action_99 (31) = happyGoto action_38
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (42) = happyShift action_127
action_100 _ = happyFail (happyExpListPerState 100)

action_101 (48) = happyShift action_98
action_101 (49) = happyShift action_99
action_101 _ = happyReduce_52

action_102 (38) = happyShift action_126
action_102 (48) = happyShift action_98
action_102 (49) = happyShift action_99
action_102 _ = happyFail (happyExpListPerState 102)

action_103 (32) = happyShift action_79
action_103 (33) = happyShift action_80
action_103 (35) = happyShift action_104
action_103 (38) = happyShift action_94
action_103 (43) = happyShift action_105
action_103 (44) = happyShift action_106
action_103 (45) = happyShift action_107
action_103 (46) = happyShift action_108
action_103 (47) = happyShift action_109
action_103 _ = happyFail (happyExpListPerState 103)

action_104 (33) = happyShift action_39
action_104 (37) = happyShift action_40
action_104 (52) = happyShift action_42
action_104 (53) = happyShift action_43
action_104 (54) = happyShift action_44
action_104 (55) = happyShift action_45
action_104 (29) = happyGoto action_125
action_104 (30) = happyGoto action_37
action_104 (31) = happyGoto action_38
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (33) = happyShift action_39
action_105 (37) = happyShift action_40
action_105 (52) = happyShift action_42
action_105 (53) = happyShift action_43
action_105 (54) = happyShift action_44
action_105 (55) = happyShift action_45
action_105 (29) = happyGoto action_124
action_105 (30) = happyGoto action_37
action_105 (31) = happyGoto action_38
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (33) = happyShift action_39
action_106 (37) = happyShift action_40
action_106 (52) = happyShift action_42
action_106 (53) = happyShift action_43
action_106 (54) = happyShift action_44
action_106 (55) = happyShift action_45
action_106 (29) = happyGoto action_123
action_106 (30) = happyGoto action_37
action_106 (31) = happyGoto action_38
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (33) = happyShift action_39
action_107 (37) = happyShift action_40
action_107 (52) = happyShift action_42
action_107 (53) = happyShift action_43
action_107 (54) = happyShift action_44
action_107 (55) = happyShift action_45
action_107 (29) = happyGoto action_122
action_107 (30) = happyGoto action_37
action_107 (31) = happyGoto action_38
action_107 _ = happyFail (happyExpListPerState 107)

action_108 (33) = happyShift action_39
action_108 (37) = happyShift action_40
action_108 (52) = happyShift action_42
action_108 (53) = happyShift action_43
action_108 (54) = happyShift action_44
action_108 (55) = happyShift action_45
action_108 (29) = happyGoto action_121
action_108 (30) = happyGoto action_37
action_108 (31) = happyGoto action_38
action_108 _ = happyFail (happyExpListPerState 108)

action_109 (33) = happyShift action_39
action_109 (37) = happyShift action_40
action_109 (52) = happyShift action_42
action_109 (53) = happyShift action_43
action_109 (54) = happyShift action_44
action_109 (55) = happyShift action_45
action_109 (29) = happyGoto action_120
action_109 (30) = happyGoto action_37
action_109 (31) = happyGoto action_38
action_109 _ = happyFail (happyExpListPerState 109)

action_110 (39) = happyShift action_119
action_110 (15) = happyGoto action_118
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (42) = happyShift action_117
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_46

action_113 (33) = happyShift action_39
action_113 (37) = happyShift action_40
action_113 (52) = happyShift action_42
action_113 (53) = happyShift action_43
action_113 (54) = happyShift action_44
action_113 (55) = happyShift action_45
action_113 (29) = happyGoto action_116
action_113 (30) = happyGoto action_37
action_113 (31) = happyGoto action_38
action_113 _ = happyFail (happyExpListPerState 113)

action_114 _ = happyReduce_42

action_115 _ = happyReduce_24

action_116 (32) = happyShift action_79
action_116 (33) = happyShift action_80
action_116 _ = happyReduce_48

action_117 _ = happyReduce_44

action_118 _ = happyReduce_41

action_119 (40) = happyShift action_136
action_119 (54) = happyShift action_26
action_119 (60) = happyShift action_27
action_119 (61) = happyShift action_28
action_119 (62) = happyShift action_29
action_119 (63) = happyShift action_30
action_119 (65) = happyShift action_31
action_119 (16) = happyGoto action_135
action_119 (17) = happyGoto action_17
action_119 (18) = happyGoto action_18
action_119 (19) = happyGoto action_19
action_119 (20) = happyGoto action_20
action_119 (21) = happyGoto action_21
action_119 (22) = happyGoto action_22
action_119 (23) = happyGoto action_23
action_119 (24) = happyGoto action_24
action_119 (25) = happyGoto action_25
action_119 _ = happyFail (happyExpListPerState 119)

action_120 (32) = happyShift action_79
action_120 (33) = happyShift action_80
action_120 _ = happyReduce_55

action_121 (32) = happyShift action_79
action_121 (33) = happyShift action_80
action_121 _ = happyReduce_57

action_122 (32) = happyShift action_79
action_122 (33) = happyShift action_80
action_122 _ = happyReduce_56

action_123 (32) = happyShift action_79
action_123 (33) = happyShift action_80
action_123 _ = happyReduce_59

action_124 (32) = happyShift action_79
action_124 (33) = happyShift action_80
action_124 _ = happyReduce_58

action_125 (32) = happyShift action_79
action_125 (33) = happyShift action_80
action_125 _ = happyReduce_60

action_126 _ = happyReduce_54

action_127 _ = happyReduce_43

action_128 (48) = happyShift action_98
action_128 (49) = happyShift action_99
action_128 _ = happyReduce_50

action_129 (48) = happyShift action_98
action_129 (49) = happyShift action_99
action_129 _ = happyReduce_51

action_130 (64) = happyShift action_134
action_130 _ = happyReduce_40

action_131 _ = happyReduce_73

action_132 _ = happyReduce_10

action_133 _ = happyReduce_6

action_134 (39) = happyShift action_119
action_134 (15) = happyGoto action_138
action_134 _ = happyFail (happyExpListPerState 134)

action_135 (40) = happyShift action_137
action_135 (54) = happyShift action_26
action_135 (60) = happyShift action_27
action_135 (61) = happyShift action_28
action_135 (62) = happyShift action_29
action_135 (63) = happyShift action_30
action_135 (65) = happyShift action_31
action_135 (17) = happyGoto action_53
action_135 (18) = happyGoto action_18
action_135 (19) = happyGoto action_19
action_135 (20) = happyGoto action_20
action_135 (21) = happyGoto action_21
action_135 (22) = happyGoto action_22
action_135 (23) = happyGoto action_23
action_135 (24) = happyGoto action_24
action_135 (25) = happyGoto action_25
action_135 _ = happyFail (happyExpListPerState 135)

action_136 _ = happyReduce_26

action_137 _ = happyReduce_25

action_138 _ = happyReduce_39

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog happy_var_1 (fst happy_var_2) (snd happy_var_2)
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog [] (fst happy_var_1) (snd happy_var_1)
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  5 happyReduction_5
happyReduction_5  =  HappyAbsSyn5
		 ([]
	)

happyReduce_6 = happyReduce 6 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((happy_var_2 :->: ( (reverse happy_var_4), happy_var_1, (snd happy_var_6)) )
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 5 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn10  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_2)) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 ((happy_var_2 :->: ( [], happy_var_1, (snd happy_var_5)) )
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  7 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn7
		 (TVoid
	)

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_3 : happy_var_1
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_0  8 happyReduction_12
happyReduction_12  =  HappyAbsSyn8
		 ([]
	)

happyReduce_13 = happySpecReduce_2  9 happyReduction_13
happyReduction_13 (HappyTerminal (ID happy_var_2))
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn9
		 ((:#:) happy_var_2 (happy_var_1,0)
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 4 10 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	(HappyAbsSyn11  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 ((happy_var_2, happy_var_3)
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (([], happy_var_2 )
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  11 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_2 ++ happy_var_1
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_0  11 happyReduction_18
happyReduction_18  =  HappyAbsSyn11
		 ([]
	)

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (map (\idName -> (:#:) idName (happy_var_1,0) ) (reverse happy_var_2)
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  13 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn13
		 (TInt
	)

happyReduce_21 = happySpecReduce_1  13 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn13
		 (TDouble
	)

happyReduce_22 = happySpecReduce_1  13 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn13
		 (TString
	)

happyReduce_23 = happySpecReduce_1  14 happyReduction_23
happyReduction_23 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  14 happyReduction_24
happyReduction_24 (HappyTerminal (ID happy_var_3))
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_3 : happy_var_1
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  15 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  15 happyReduction_26
happyReduction_26 _
	_
	 =  HappyAbsSyn15
		 ([]
	)

happyReduce_27 = happySpecReduce_2  16 happyReduction_27
happyReduction_27 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_2 : happy_var_1
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  16 happyReduction_28
happyReduction_28 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 ([happy_var_1]
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_0  16 happyReduction_29
happyReduction_29  =  HappyAbsSyn16
		 ([]
	)

happyReduce_30 = happySpecReduce_1  17 happyReduction_30
happyReduction_30 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  17 happyReduction_31
happyReduction_31 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  17 happyReduction_32
happyReduction_32 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  17 happyReduction_33
happyReduction_33 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  17 happyReduction_34
happyReduction_34 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  17 happyReduction_35
happyReduction_35 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  18 happyReduction_37
happyReduction_37 _
	(HappyAbsSyn29  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (Ret (Just happy_var_2)
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  18 happyReduction_38
happyReduction_38 _
	_
	 =  HappyAbsSyn18
		 (Ret Nothing
	)

happyReduce_39 = happyReduce 7 19 happyReduction_39
happyReduction_39 ((HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (If happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_40 = happyReduce 5 19 happyReduction_40
happyReduction_40 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (If happy_var_3 happy_var_5 []
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 5 20 happyReduction_41
happyReduction_41 ((HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_42 = happyReduce 4 21 happyReduction_42
happyReduction_42 (_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (Atrib happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_43 = happyReduce 5 22 happyReduction_43
happyReduction_43 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (Imp happy_var_3
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 5 23 happyReduction_44
happyReduction_44 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (Leitura happy_var_3
	) `HappyStk` happyRest

happyReduce_45 = happySpecReduce_2  24 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (Proc (fst happy_var_1) (snd happy_var_1)
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happyReduce 4 25 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 ((happy_var_1,happy_var_3)
	) `HappyStk` happyRest

happyReduce_47 = happySpecReduce_3  25 happyReduction_47
happyReduction_47 _
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn25
		 ((happy_var_1,[])
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  26 happyReduction_48
happyReduction_48 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  26 happyReduction_49
happyReduction_49 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn26
		 ([happy_var_1]
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  27 happyReduction_50
happyReduction_50 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn27
		 (Or happy_var_1 happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  27 happyReduction_51
happyReduction_51 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn27
		 (And happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_2  27 happyReduction_52
happyReduction_52 (HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (Not happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  27 happyReduction_53
happyReduction_53 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (Rel happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  27 happyReduction_54
happyReduction_54 _
	(HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (happy_var_2
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  28 happyReduction_55
happyReduction_55 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (Req happy_var_1 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  28 happyReduction_56
happyReduction_56 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (Rgt happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  28 happyReduction_57
happyReduction_57 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (Rlt happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  28 happyReduction_58
happyReduction_58 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (Rle happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  28 happyReduction_59
happyReduction_59 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (Rge happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  28 happyReduction_60
happyReduction_60 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (Rdf happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  29 happyReduction_61
happyReduction_61 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn29
		 (Add happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  29 happyReduction_62
happyReduction_62 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn29
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_1  29 happyReduction_63
happyReduction_63 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn29
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  30 happyReduction_64
happyReduction_64 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  30 happyReduction_65
happyReduction_65 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (Div happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  30 happyReduction_66
happyReduction_66 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  31 happyReduction_67
happyReduction_67 (HappyTerminal (NUM happy_var_1))
	 =  HappyAbsSyn31
		 (Const (CDouble happy_var_1)
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  31 happyReduction_68
happyReduction_68 (HappyTerminal (INT_LIT happy_var_1))
	 =  HappyAbsSyn31
		 (Const (CInt happy_var_1)
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  31 happyReduction_69
happyReduction_69 (HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn31
		 (IdVar happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  31 happyReduction_70
happyReduction_70 (HappyTerminal (STRING_LIT happy_var_1))
	 =  HappyAbsSyn31
		 (Lit happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  31 happyReduction_71
happyReduction_71 _
	(HappyAbsSyn29  happy_var_2)
	_
	 =  HappyAbsSyn31
		 (happy_var_2
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_2  31 happyReduction_72
happyReduction_72 (HappyAbsSyn31  happy_var_2)
	_
	 =  HappyAbsSyn31
		 (Neg happy_var_2
	)
happyReduction_72 _ _  = notHappyAtAll 

happyReduce_73 = happyReduce 4 31 happyReduction_73
happyReduction_73 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn31
		 (Chamada happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_74 = happySpecReduce_3  31 happyReduction_74
happyReduction_74 _
	_
	(HappyTerminal (ID happy_var_1))
	 =  HappyAbsSyn31
		 (Chamada happy_var_1 []
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 66 66 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	ADD -> cont 32;
	SUB -> cont 33;
	MUL -> cont 34;
	RDF -> cont 35;
	DIV -> cont 36;
	LPAR -> cont 37;
	RPAR -> cont 38;
	LBRACE -> cont 39;
	RBRACE -> cont 40;
	EQ_ASSIGN -> cont 41;
	SEMI -> cont 42;
	RLE -> cont 43;
	RGE -> cont 44;
	RGT -> cont 45;
	RLT -> cont 46;
	REQ -> cont 47;
	AND -> cont 48;
	OR -> cont 49;
	NOT -> cont 50;
	COMMA -> cont 51;
	NUM happy_dollar_dollar -> cont 52;
	INT_LIT happy_dollar_dollar -> cont 53;
	ID happy_dollar_dollar -> cont 54;
	STRING_LIT happy_dollar_dollar -> cont 55;
	KW_INT -> cont 56;
	KW_FLOAT -> cont 57;
	KW_STRING -> cont 58;
	KW_VOID -> cont 59;
	KW_READ -> cont 60;
	KW_WHILE -> cont 61;
	KW_PRINT -> cont 62;
	KW_IF -> cont 63;
	KW_ELSE -> cont 64;
	KW_RETURN -> cont 65;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 66 tk tks = happyError' (tks, explist)
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
