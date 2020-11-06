SELECT IE.LgcyInvestorID, IR.FullName, IE.CalcBasisCode, IE.EffectFromDate, IE.InvestorID, IE.EffectToDate, IE.EqAssetHoldVal
  FROM Own2InvEqAsset IE
  LEFT JOIN Own2InvResume IR
  ON IE.LgcyInvestorID = IR.LgcyInvestorID
  WHERE IE.EqAssetHoldVal > 0 AND IE.EffectFromDate > '2016-06-30' AND IE.LgcyInvestorID = '2004260'

  -- We could know the historical total equity assets of different investors from this table.