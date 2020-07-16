DefinitionBlock ("", "SSDT", 2, "GBT   ", "BATT", 0x01072009)
{
    External (_SB_.PCI0.LPCB.EC, DeviceObj)
    External (_SB.PCI0.AMW0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC.BAT1, DeviceObj)
    External (_SB_.PCI0.LPCB.EC.FBFC, IntObj)
    External (_SB_.PCI0.LPCB.EC.B1ST, FieldUnitObj)
    External (\B1SC, FieldUnitObj)
    External (\B1SS, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.CRAF, FieldUnitObj)
    External (_SB_.SDSE, MethodObj)
    External (\_SB_.PCI0.AMW0.DBG8, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.WINK, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.MHDD, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.FNKY, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.BTKY, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.KBLL, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.MUTE, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.WNON, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.BTON, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.P2ON, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.PSON, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.S3UC, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.S4UC, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.TFAN, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.GFAN, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.FANB, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.FAN1, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.FAN2, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.USBC, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.ADJF, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.CDON, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.TENF, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.XFNR, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.NTEX, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.LCDO, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.CYC1, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.CYC2, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.TCPU, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.TGP1, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.TGP2, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.CCDM, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.LSTE, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.SCEN, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.LUXH, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.LUXL, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.PLMX, FieldUnitObj)
    External (\_SB_.PCI0.LPCB.EC__.FLVL, FieldUnitObj)

    External (\_SB.PCI0.LPCB.EC.XBIF, MethodObj)
    External (\_SB.PCI0.LPCB.EC.XBST, MethodObj)
    External (\_SB.PCI0.AMW0.XMBD, MethodObj)
    External (\_SB.PCI0.AMW0.XMBC, MethodObj)

    
    

    

    
    
    
    

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }
    Method (B1B3, 3, NotSerialized)
    {
        Store(Arg2, Local0)
        or(Arg1, ShiftLeft(Local0, 8), Local0)
        or(Arg0, ShiftLeft(Local0, 8), Local0)
        Return(Local0)
    }
    

    

    
    Scope (\_SB.PCI0.LPCB.EC.BAT1) 
    {
        
        Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
        {
            If (_OSI ("Darwin"))
            {
                Name (BPKG, Package (0x0D)
                {
                    One, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    One, 
                    0xFFFFFFFF, 
                    Zero, 
                    Zero, 
                    0x64, 
                    Zero, 
                    " ", 
                    " ", 
                    "LI-ION", 
                    "GIGABYTE"
                })
                Store ("Aero 15", Index (BPKG, 0x09))
                Store (B1B2(ZDC0,ZDC1), Index (BPKG, One))
                Store (B1B2(ZFC0,ZFC1), Index (BPKG, 0x02))
                Store (B1B2(ZDG0,ZDG1), Index (BPKG, 0x04))
                If (B1B2(ZFC0,ZFC1))
                {
                    Store (B1B2(ZFC0,ZFC1), FBFC) /* \_SB_.PCI0.LPCB.EC__.FBFC */
                    Store (Divide (B1B2(ZFC0,ZFC1), 0x0A, ), Index (BPKG, 0x05))
                    Store (Divide (B1B2(ZFC0,ZFC1), 0x19, ), Index (BPKG, 0x06))
                    Store (Divide (B1B2(ZFC0,ZFC1), 0x64, ), Index (BPKG, 0x07))
                }
        
                Return (BPKG) /* \_SB_.PCI0.LPCB.EC__.BAT1._BIF.BPKG */         
            }
            Else
            {
                Return (XBIF ())
            }

        }

        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
        {
            If (_OSI ("Darwin"))
            {
                Name (PKG1, Package (0x04)
                {
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF
                })
                Store (And (B1ST, 0x07), Index (PKG1, Zero))
                Store (B1B2(ZCR0,ZCR1), Index (PKG1, One))
                Store (B1B2(ZRC0,ZRC1), Index (PKG1, 0x02))
                Store (Divide (Multiply (B1B2(ZRC0,ZRC1), FBFC), B1B2(ZFC0,ZFC1), ), Index (PKG1, 0x02
                    ))
                Store (B1B2(ZFV0,ZFV1), Index (PKG1, 0x03))
                Return (PKG1) /* \_SB_.PCI0.LPCB.EC__.BAT1._BST.PKG1 */

            }
            Else
            {
                Return (XBST ())
            }

        } 
         
    }

    Scope (\_SB.PCI0.LPCB.EC)
    {
        OperationRegion (ECFX, EmbeddedControl, Zero, 0x0100)
        Field (ECFX, ByteAcc, Lock, Preserve)
        {
            Offset (0x10), 
            ZDC0,8,ZDC1,8, 
            ZFC0,8,ZFC1,8, 
            ZRC0,8,ZRC1,8, 
            ZFV0,8,ZFV1,8, 
            Offset (0x20),
            ZDG0,8,ZDG1,8, 
            ZCR0,8,ZCR1,8, 
            Offset (0xA0), 
            FNW0,8,FNW1,8,FNW2,8, 
            Offset (0xA4), 
            XFNX,8,XFNY,8, 
            Offset (0xFC), 
            RPMX,8,RPMY,8, 
            RMPX,8,RMPY,8
        }    

        
        
        

        Method (BATS, 0, NotSerialized)
        {
            if (_OSI ("DARWIN"))
            {
                Store (B1B2(ZRC0,ZRC1), B1SC) /* \B1SC */
                Store (B1ST, B1SS) /* \B1SS */
                Notify (BAT1, 0x80) // Status Change
                Notify (BAT1, 0x81) // Information Change
            }
            Else
            {
            }
        }

    }

    Scope (\_SB.PCI0.AMW0) 
    {
        Method (WMBD, 3, Serialized)
        {
            if (_OSI ("DARWIN"))
            {
            Switch (Arg1)
            {
                Case (0xFA)
                {
                    Store (Arg2, ^^LPCB.EC.CRAF) /* \_SB_.PCI0.LPCB.EC__.CRAF */
                }
                Case (0x77)
                {
                    SDSE (0xB3, Arg2)
                }
                Case (0xCB)
                {
                    Store (0xEA, DBG8) /* \_SB_.PCI0.AMW0.DBG8 */
                    Store (Arg2, ^^LPCB.EC.WINK) /* \_SB_.PCI0.LPCB.EC__.WINK */
                }
                Case (0x76)
                {
                    Store (Arg2, ^^LPCB.EC.MHDD) /* \_SB_.PCI0.LPCB.EC__.MHDD */
                    Return (^^LPCB.EC.MHDD) /* \_SB_.PCI0.LPCB.EC__.MHDD */
                }
                Case (0x79)
                {
                    Store (Arg2, ^^LPCB.EC.FNKY) /* \_SB_.PCI0.LPCB.EC__.FNKY */
                }
                Case (0x78)
                {
                    Store (Arg2, ^^LPCB.EC.BTKY) /* \_SB_.PCI0.LPCB.EC__.BTKY */
                }
                Case (0x74)
                {
                    SDSE (0x65, Arg2)
                }
                Case (0x73)
                {
                    SDSE (0x66, Arg2)
                }
                Case (0xF6)
                {
                    Store (Arg2, ^^LPCB.EC.KBLL) /* \_SB_.PCI0.LPCB.EC__.KBLL */
                    Return (^^LPCB.EC.KBLL) /* \_SB_.PCI0.LPCB.EC__.KBLL */
                }
                Case (0xC7)
                {
                    Store (0xE9, DBG8) /* \_SB_.PCI0.AMW0.DBG8 */
                    Store (Arg2, ^^LPCB.EC.MUTE) /* \_SB_.PCI0.LPCB.EC__.MUTE */
                }
                Case (0xC2)
                {
                    Store (0xE0, DBG8) /* \_SB_.PCI0.AMW0.DBG8 */
                    Store (Arg2, ^^LPCB.EC.WNON) /* \_SB_.PCI0.LPCB.EC__.WNON */
                    Return (^^LPCB.EC.WNON) /* \_SB_.PCI0.LPCB.EC__.WNON */
                }
                Case (0xC1)
                {
                    Store (Arg2, ^^LPCB.EC.BTON) /* \_SB_.PCI0.LPCB.EC__.BTON */
                    Return (^^LPCB.EC.BTON) /* \_SB_.PCI0.LPCB.EC__.BTON */
                }
                Case (0xC3)
                {
                    SDSE (0xE2, Arg2)
                    Return (^^LPCB.EC.P2ON) /* \_SB_.PCI0.LPCB.EC__.P2ON */
                }
                Case (0xC5)
                {
                    SDSE (0xE4, Arg2)
                    Return (^^LPCB.EC.CDON) /* \_SB_.PCI0.LPCB.EC__.CDON */
                }
                Case (0xCA)
                {
                    Store (Arg2, ^^LPCB.EC.PSON) /* \_SB_.PCI0.LPCB.EC__.PSON */
                    Return (^^LPCB.EC.PSON) /* \_SB_.PCI0.LPCB.EC__.PSON */
                }
                Case (0x7A)
                {
                    Store (Arg2, ^^LPCB.EC.S3UC) /* \_SB_.PCI0.LPCB.EC__.S3UC */
                }
                Case (0x7B)
                {
                    Store (Arg2, ^^LPCB.EC.S4UC) /* \_SB_.PCI0.LPCB.EC__.S4UC */
                }
                Case (0x7D)
                {
                    Store (0x94, DBG8) /* \_SB_.PCI0.AMW0.DBG8 */
                    Store (Arg2, ^^LPCB.EC.TFAN) /* \_SB_.PCI0.LPCB.EC__.TFAN */
                }
                Case (0x71)
                {
                    Store (Zero, ^^LPCB.EC.GFAN) /* \_SB_.PCI0.LPCB.EC__.GFAN */
                    Store (Arg2, ^^LPCB.EC.FANB) /* \_SB_.PCI0.LPCB.EC__.FANB */
                    Return (^^LPCB.EC.FANB) /* \_SB_.PCI0.LPCB.EC__.FANB */
                }
                Case (0x70)
                {
                    Store (Zero, ^^LPCB.EC.TFAN) /* \_SB_.PCI0.LPCB.EC__.TFAN */
                    Store (One, ^^LPCB.EC.GFAN) /* \_SB_.PCI0.LPCB.EC__.GFAN */
                    Store (Arg2, ^^LPCB.EC.FAN1) /* \_SB_.PCI0.LPCB.EC__.FAN1 */
                    Store (Arg2, ^^LPCB.EC.FAN2) /* \_SB_.PCI0.LPCB.EC__.FAN2 */
                    Return (^^LPCB.EC.FAN1) /* \_SB_.PCI0.LPCB.EC__.FAN1 */
                }
                Case (0xD0)
                {
                    SDSE (0xE7, Arg2)
                    Return (^^LPCB.EC.USBC) /* \_SB_.PCI0.LPCB.EC__.USBC */
                }
                Case (0xC4)
                {
                    SDSE (0x95, Arg2)
                }
                Case (0x6A)
                {
                    Store (Arg2, ^^LPCB.EC.ADJF) /* \_SB_.PCI0.LPCB.EC__.ADJF */
                    Return (^^LPCB.EC.ADJF) /* \_SB_.PCI0.LPCB.EC__.ADJF */
                }
                Case (0x6B)
                {
                    Store (Arg2, ^^LPCB.EC.FAN1) /* \_SB_.PCI0.LPCB.EC__.FAN1 */
                    Store (Arg2, ^^LPCB.EC.FAN2) /* \_SB_.PCI0.LPCB.EC__.FAN2 */
                    Return (^^LPCB.EC.FAN1) /* \_SB_.PCI0.LPCB.EC__.FAN1 */
                    Return (^^LPCB.EC.FAN2) /* \_SB_.PCI0.LPCB.EC__.FAN2 */
                }
                Case (0x68)
                {
                    Store (0x69, DBG8) /* \_SB_.PCI0.AMW0.DBG8 */
                    Store(ShiftRight(Arg2,16),^^LPCB.EC.FNW2)
                    Store(ShiftRight(Arg2,8),^^LPCB.EC.FNW1)
                    Store(Arg2,^^LPCB.EC.FNW0) /* \_SB_.PCI0.LPCB.EC__.XFNW */
                    Return(B1B3(^^LPCB.EC.FNW0,^^LPCB.EC.FNW1,^^LPCB.EC.FNW2)) /* \_SB_.PCI0.LPCB.EC__.XFNW */
                }
                Case (0x67)
                {
                    Store (Arg2, ^^LPCB.EC.TENF) /* \_SB_.PCI0.LPCB.EC__.TENF */
                    Return (^^LPCB.EC.TENF) /* \_SB_.PCI0.LPCB.EC__.TENF */
                }
                Case (0x66)
                {
                    Store (Arg2, ^^LPCB.EC.FLVL) /* \_SB_.PCI0.LPCB.EC__.FLVL */
                    Return (^^LPCB.EC.FLVL) /* \_SB_.PCI0.LPCB.EC__.FLVL */
                }
                Default
                {
                    Return (Arg2)
                }

            }
            }
            
            
            Else
            {
                Return (XMBD(Arg0, Arg1, Arg2))
            
            }

        }

        Method (WMBC, 3, Serialized)
        {
        If (_OSI ("DARWIN"))
        {
            If (LEqual (Arg1, 0x03))
            {
                Notify (AMW0, 0xD2) // Hardware-Specific
                Return (Arg1)
            }
            Else
            {
                Switch (Arg1)
                {
                    Case (0xFA)
                    {
                        Return (^^LPCB.EC.CRAF) /* \_SB_.PCI0.LPCB.EC__.CRAF */
                    }
                    Case (0xF9)
                    {
                        Return (^^LPCB.EC.PLMX) /* \_SB_.PCI0.LPCB.EC__.PLMX */
                    }
                    Case (0xF7)
                    {
                        Return (Add (^^LPCB.EC.LUXL, Multiply (^^LPCB.EC.LUXH, 0x0100)))
                    }
                    Case (0xF6)
                    {
                        Return (^^LPCB.EC.KBLL) /* \_SB_.PCI0.LPCB.EC__.KBLL */
                    }
                    Case (0xC2)
                    {
                        Return (^^LPCB.EC.WNON) /* \_SB_.PCI0.LPCB.EC__.WNON */
                    }
                    Case (0xC1)
                    {
                        Return (^^LPCB.EC.BTON) /* \_SB_.PCI0.LPCB.EC__.BTON */
                    }
                    Case (0xC3)
                    {
                        Return (^^LPCB.EC.P2ON) /* \_SB_.PCI0.LPCB.EC__.P2ON */
                    }
                    Case (0xC5)
                    {
                        Return (^^LPCB.EC.CDON) /* \_SB_.PCI0.LPCB.EC__.CDON */
                    }
                    Case (0xCA)
                    {
                        Return (^^LPCB.EC.PSON) /* \_SB_.PCI0.LPCB.EC__.PSON */
                    }
                    Case (0xD1)
                    {
                        Return (XOr (^^LPCB.EC.SCEN, One))
                    }
                    Case (0xD0)
                    {
                        Return (^^LPCB.EC.USBC) /* \_SB_.PCI0.LPCB.EC__.USBC */
                    }
                    Case (0xC7)
                    {
                        Return (^^LPCB.EC.MUTE) /* \_SB_.PCI0.LPCB.EC__.MUTE */
                    }
                    Case (0xEF)
                    {
                        Return (^^LPCB.EC.LSTE) /* \_SB_.PCI0.LPCB.EC__.LSTE */
                    }
                    Case (0xFB)
                    {
                        Return (^^LPCB.EC.CCDM) /* \_SB_.PCI0.LPCB.EC__.CCDM */
                    }
                    Case (0x7A)
                    {
                        Return (^^LPCB.EC.S3UC) /* \_SB_.PCI0.LPCB.EC__.S3UC */
                    }
                    Case (0x7B)
                    {
                        Return (^^LPCB.EC.S4UC) /* \_SB_.PCI0.LPCB.EC__.S4UC */
                    }
                    Case (0x76)
                    {
                        Return (^^LPCB.EC.MHDD) /* \_SB_.PCI0.LPCB.EC__.MHDD */
                    }
                    Case (0x7D)
                    {
                        Return (^^LPCB.EC.TFAN) /* \_SB_.PCI0.LPCB.EC__.TFAN */
                    }
                    Case (0xE1)
                    {
                        Return (^^LPCB.EC.TCPU) /* \_SB_.PCI0.LPCB.EC__.TCPU */
                    }
                    Case (0xE2)
                    {
                        Return (^^LPCB.EC.TGP1) /* \_SB_.PCI0.LPCB.EC__.TGP1 */
                    }
                    Case (0xE3)
                    {
                        Return (^^LPCB.EC.TGP2) /* \_SB_.PCI0.LPCB.EC__.TGP2 */
                    }
                    Case (0xE4)
                    {
                        Return (B1B2(^^LPCB.EC.RPMX,^^LPCB.EC.RPMY)) /* \_SB_.PCI0.LPCB.EC__.RPM1 */
                    }
                    Case (0xE5)
                    {
                        Return (B1B2(^^LPCB.EC.RMPX,^^LPCB.EC.RMPY)) /* \_SB_.PCI0.LPCB.EC__.RPM2 */
                    }
                    Case (0x71)
                    {
                        Return (^^LPCB.EC.FANB) /* \_SB_.PCI0.LPCB.EC__.FANB */
                    }
                    Case (0x70)
                    {
                        Return (^^LPCB.EC.FAN1) /* \_SB_.PCI0.LPCB.EC__.FAN1 */
                    }
                    Case (0x6F)
                    {
                        Return (^^LPCB.EC.FAN1) /* \_SB_.PCI0.LPCB.EC__.FAN1 */
                    }
                    Case (0x6E)
                    {
                        Return (^^LPCB.EC.CYC1) /* \_SB_.PCI0.LPCB.EC__.CYC1 */
                    }
                    Case (0x6D)
                    {
                        Return (^^LPCB.EC.CYC2) /* \_SB_.PCI0.LPCB.EC__.CYC2 */
                    }
                    Case (0xC4)
                    {
                        Return (^^LPCB.EC.LCDO) /* \_SB_.PCI0.LPCB.EC__.LCDO */
                    }
                    Case (0x6C)
                    {
                        Return (^^LPCB.EC.NTEX) /* \_SB_.PCI0.LPCB.EC__.NTEX */
                    }
                    Case (0x6A)
                    {
                        Return (^^LPCB.EC.ADJF) /* \_SB_.PCI0.LPCB.EC__.ADJF */
                    }
                    Case (0x6B)
                    {
                        Return (^^LPCB.EC.FAN1) /* \_SB_.PCI0.LPCB.EC__.FAN1 */
                    }
                    Case (0x68)
                    {
                        Store (Arg2, ^^LPCB.EC.XFNR) /* \_SB_.PCI0.LPCB.EC__.XFNR */
                        Sleep (0x64)
                        Return (B1B2(^^LPCB.EC.XFNX,^^LPCB.EC.XFNY)) /* \_SB_.PCI0.LPCB.EC__.XFN1 */
                    }
                    Case (0x67)
                    {
                        Return (^^LPCB.EC.TENF) /* \_SB_.PCI0.LPCB.EC__.TENF */
                    }
                    Default
                    {
                        Return (Arg2)
                    }

                }
            }
        }
        Else
        {
            Return (XMBC (Arg0, Arg1, Arg2))
        }
    }

    }
}