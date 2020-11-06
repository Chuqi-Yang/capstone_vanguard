SELECT IP.LgcyInvestorId
      ,IR.FullName
      ,IP.IncWrntsCert
      ,IP.CalcBasisCode
      ,IP.EffectFromDate
      ,IP.EffectToDate
      ,IP.InvestorId
      ,IP.TotalAsts
      ,IP.TotalEqAsts
      ,IP.TotalFIAsts
      ,IP.InstrBought
      ,IP.InstrSold
      ,InstrHld
      ,IP.AggHldgsVal
      ,IP.AggEPS3YrAnnGR
      ,IP.AggSales3YrAnnGR
      ,IP.AggEPS5YrProjGR
      ,IP.AggGrossPrftMrgn
      ,IP.AggLTermD2E
      ,IP.AggLTermD2TotCap
      ,IP.AggNetInc
      ,IP.AggNetMrgn
      ,IP.AggOpPrftMrgn
      ,IP.AggPE12mFwd
      ,IP.AggPE12mTrl
      ,IP.AggDivPORatioPS
      ,IP.AggPE2GR
      ,IP.AggP2B
      ,IP.AggP2SalesPS
      ,IP.AggRev
      ,IP.AggROA
      ,IP.AggROE
      ,IP.AggDivYld
  FROM Own2InvPortStats IP
  LEFT JOIN Own2InvResume IR
  ON IP.LgcyInvestorId = IR.LgcyInvestorId
  WHERE IP.TotalAsts > 0