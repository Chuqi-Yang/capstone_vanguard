
--		Return fund managers given their ultimate parent company's LGCYINVESTORID 


 select R.LGCYINVESTORID
        , R.investorID
        , R.fullname
        , R.InvTypeCode
        , CR.desc_
        , B.Orgid                as RDCOrgID
        , P.Startdate
        , P.Enddate
        , P.Value_               as ParentOrgID
        , B1.GEMPERMID           as ParentINVESTORID
        , R1.LGCYINVESTORID      as ParentLGCYINVESTORID
        , R1.fullname            as Parentfullname 
        , R1.InvTypeCode         as ParentInvTypeCode
        , CR1.desc_              as ParentInvTypedesc
 
 from OWN2INVRESUME R                    -- get InvestorID
 Left Join Own2Code CR                       
    on CR.code = R.invtypecode
    and CR.type_ = 1                     --invtypecode descrption
 
 JOIN RDCOrgInfo B                       -- get RDCOrgID
     ON B.GEMPERMID =R.INVESTORID
 
 Left JOIN RDCHistLNData P               -- get parent OrgID
     on B.orgID = P.entityID
     and P.item = 34659                  -- item 34659 to for UltimateParentPIParentPI
     and P.enddate is null               -- for current
​
 Left JOIN RDCOrgInfo B1                 -- get parent GEMPERMID
     on B1.OrgId = P.Value_
 
 Left JOIN OWN2INVRESUME R1              -- get parent LGCYINVESTORID
     ON B1.GEMPERMID =R1.INVESTORID
 Left JOIN Own2Code CR1                        
    on CR1.code = R1.invtypecode
    and CR1.type_ = 1                     --invtypecode descrption
​
--where R1.LGCYINVESTORID in (2004260)                    --given ultmate parent BlackRock Inc
Where R.LGCYINVESTORID in (select LGCYINVESTORID from OWN2INVRESUME where fullname like '%vanguard%' and invtypecode <400 and investorID is not null)  --given fund managers' LGCYINVESTORID 