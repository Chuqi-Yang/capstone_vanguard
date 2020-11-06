SELECT P.InstrId
      ,P.EffectFromDate
      ,P.EffectToDate
      ,EffectDate = '2020-06-30'
      ,P.PrcCloseAct
      ,SO.NumOfShOut
      ,SO.EffectFromDate SOEffectFromDate
      ,SO.EffectToDate SOEffectToDate
      ,SO.ShOutDate
      ,P.PrcCloseAct*SO.NumOfShOut MktCap
  FROM Own2InstrPrc P, Own2InstrShOut SO
  WHERE P.InstrId = SO.InstrId
    AND ('2020-03-31' BETWEEN P.EffectFromDate AND P.EffectToDate)
    AND SO.EffectFromDate <= '2020-03-31'
    AND SO.EffectToDate > '2020-03-31'
    AND (P.InstrId = '8590930331' OR P.InstrId = '21631143039')