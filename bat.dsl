# created by dean102
# works for:
#    Gigabyt Aero15W V7

# add method B1B2 
into method label B1B2 remove_entry;
into definitionblock code_regex . insert
begin
Method (B1B2, 2, NotSerialized)\n
{\n
Return(Or(Arg0, ShiftLeft(Arg1, 8)))\n
}\n
end;

# add method B1B3
into method label B1B3 remove_entry;
into definitionblock code_regex . insert 
begin
Method (B1B3, 3, NotSerialized)\n
{\n
    Store(Arg2, Local0)\n
    or(Arg1, ShiftLeft(Local0, 8), Local0)\n
    or(Arg0, ShiftLeft(Local0, 8), Local0)\n
    Return(Local0)\n
}\n
end;

#16-bit Registers
into device label EC code_regex B1DC,\s+16, replace_matched begin ZDC0,8,ZDC1,8, end;
into device label EC code_regex B1FC,\s+16, replace_matched begin ZFC0,8,ZFC1,8, end;
into device label EC code_regex B1RC,\s+16, replace_matched begin ZRC0,8,ZRC1,8, end;
into device label EC code_regex B1FV,\s+16, replace_matched begin ZFV0,8,ZFV1,8, end;
into device label EC code_regex B1DG,\s+16, replace_matched begin ZDG0,8,ZDG1,8, end;
into device label EC code_regex B1CR,\s+16, replace_matched begin ZCR0,8,ZCR1,8, end;

into device label EC code_regex XFN1,\s+16, replace_matched begin XFNX,8,XFNY,8, end;
into device label EC code_regex RPM1,\s+16, replace_matched begin RPMX,8,RPMY,8, end;
into device label EC code_regex RPM2,\s+16 replace_matched begin RMPX,8,RMPY,8 end;


# fix 16-bit Methods
into method label _BIF code_regex B1DC replaceall_matched begin B1B2(ZDC0,ZDC1) end;
into method label _BIF code_regex B1FC replaceall_matched begin B1B2(ZFC0,ZFC1) end;
into method label _BST code_regex B1FC replaceall_matched begin B1B2(ZFC0,ZFC1) end;
into method label _BST code_regex B1RC replaceall_matched begin B1B2(ZRC0,ZRC1) end;
into method label BATS code_regex B1RC replaceall_matched begin B1B2(ZRC0,ZRC1) end;
into method label _BST code_regex B1FV replaceall_matched begin B1B2(ZFV0,ZFV1) end;
into method label _BIF code_regex B1DG replaceall_matched begin B1B2(ZDG0,ZDG1) end;
into method label _BST code_regex B1CR replaceall_matched begin B1B2(ZCR0,ZCR1) end;

into method label WMBC code_regex \(\^\^LPCB\.EC\.XFN1 replaceall_matched begin (B1B2(^^LPCB.EC.XFNX,^^LPCB.EC.XFNY) end;
into method label WMBC code_regex \(\^\^LPCB\.EC\.RPM1 replaceall_matched begin (B1B2(^^LPCB.EC.RPMX,^^LPCB.EC.RPMY) end;
into method label WMBC code_regex \(\^\^LPCB\.EC\.RPM2 replaceall_matched begin (B1B2(^^LPCB.EC.RMPX,^^LPCB.EC.RMPY) end;

#24-bit Registers
into device label EC code_regex XFNW,\s+24, replace_matched begin FNW0,8,FNW1,8,FNW2,8, end;

# fix 24-bit Methods
into method label WMBD code_regex Store\s\(Arg2\,\s\^\^LPCB\.EC\.XFNW\) replaceall_matched begin Store(ShiftRight(Arg2,16),^^LPCB.EC.FNW2)\nStore(ShiftRight(Arg2,8),^^LPCB.EC.FNW1)\nStore(Arg2,^^LPCB.EC.FNW0) end;
into method label WMBD code_regex Return\s\(\^\^LPCB\.EC\.XFNW\) replaceall_matched begin Return(B1B3(^^LPCB.EC.FNW0,^^LPCB.EC.FNW1,^^LPCB.EC.FNW2)) end;

