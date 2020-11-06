Select R.LgcyInvestorId, IR.FullName, R.LgcyPersonId, P.FirstName, P.LastName, R.ContRole,R.ContRank
From Own2InvContReln R
Left join Own2InvContProf P
ON  R.LgcyPersonId =  P.LgcyPersonId
LEFT JOIN Own2InvResume IR
ON R.LgcyInvestorId = IR.LgcyInvestorId
Where R.LgcyPersonId = '36'