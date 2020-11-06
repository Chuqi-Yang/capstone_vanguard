SELECT ICR.LgcyInvestorId
      ,ICR.LgcyPersonId
      ,ICR.ContRole
      ,ICR.ContRank
      ,ICP.FirstName
      ,ICP.LastName
      ,ICP.Gender
      ,ICS.SpecCat
      ,ICS.SpecCode
  FROM Own2InvContReln ICR
  LEFT JOIN Own2InvContProf ICP
  ON ICR.LgcyPersonId = ICP.LgcyPersonId
  LEFT JOIN Own2InvContSpec ICS
  ON ICR.LgcyPersonId = ICS.LgcyPersonId
  WHERE ICS.SpecCat != 2 
    AND ICR.LgcyInvestorId IN 
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