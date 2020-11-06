SELECT F.LgcyInvestorId
      ,F.LgcyFundId
      ,F.EffectFromDate
      ,F.InvestorID
      ,F.FundId
      ,F.EffectToDate
      ,F.IsPrimaryMgr
      ,F.InvestorName
      ,F.FullName
      ,F.InvTypeCode
      ,F.InvTypeDesc
      ,F.InvStyleCode
      ,F.InvStyleDesc
      ,F.InvOrientation
      ,F.LtstRepDate
      ,F.PriorRepDate
      ,F.IsActiveInv
      ,F.IsNLE
      ,F.IsNLEDate
FROM [dbo].[vw_Own2Funds] F
WHERE '2018-09-30' BETWEEN F.EffectFromDate AND ISNULL(F.EffectToDate, '2075-05-05')
    AND F.LgcyInvestorId IN
    (SELECT DISTINCT OM.LGCYINVESTORID
    
    FROM OWN2OWNERMAP OM
    LEFT JOIN  RDCINSTRINFO RR
        ON RR.GEMPERMID=OM.INSTRID     --OWN2 MAPPING

    LEFT JOIN OWN2INVRESUME IR
        ON OM.LGCYINVESTORID = IR.LGCYINVESTORID
        
    LEFT JOIN OWN2CHOLDDET P         -- RETURNS THE CONSOLIDATED HOLDINGS
        ON P.OWNERSHIPID=OM.OWNERSHIPID
        AND P.HOLDDATE >='2016-06-30'      --GIVEN MONTH END
        AND P.HOLDDATE <='2020-06-30'
        AND P.FILINGTYPECODE = 1 -- 13F   

    WHERE P.PCTSHOUTHLD IS NOT NULL AND P.PCTSHOUTHLD<>0)