SELECT IA.LgcyInvestorId
      ,IR.FullName
      ,IA.InvestorId
      ,IA.AstAllocReg
      ,IA.EqAstAlloc
      ,IA.FIAstAlloc
      ,IA.CashAstAlloc
      ,IA.TotAstAlloc
  FROM Own2InvAstAlloc IA 
  LEFT JOIN Own2InvResume IR 
  ON IA.LgcyInvestorId = IR.LgcyInvestorId