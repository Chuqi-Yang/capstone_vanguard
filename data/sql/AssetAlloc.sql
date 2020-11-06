SELECT [LgcyInvestorId]
      ,[AstAllocReg]
      ,[EqAstAlloc]
      ,[FIAstAlloc]
      ,[CashAstAlloc]
      ,[TotAstAlloc]
  FROM [dbo].[Own2InvAstAlloc]
  WHERE LgcyInvestorId IN
      (SELECT OM.LGCYINVESTORID
        FROM OWN2OWNERMAP OM
        LEFT JOIN  RDCINSTRINFO RR
        ON RR.GEMPERMID=OM.INSTRID     --OWN2 MAPPING
        
        LEFT JOIN OWN2CHOLDDET P         -- RETURNS THE CONSOLIDATED HOLDINGS
        ON P.OWNERSHIPID=OM.OWNERSHIPID
        AND P.HOLDDATE >='2016-06-30'      --GIVEN MONTH END
        AND P.HOLDDATE <='2020-06-30'
        AND P.FILINGTYPECODE = 1 -- 13F 
        
        WHERE  P.PCTSHOUTHLD IS NOT NULL AND P.PCTSHOUTHLD<>0)