[getCurrentRYSettingInfo]
SELECT predominant, depreciatecoreanditemseparately, computedepreciationbasedonschedule 
FROM bldgrysetting WHERE ry = $P{ry} 

[lookupActualUseByCode]
SELECT  
	bl.objid AS actualuseid, bl.code AS actualusecode, bl.name AS actualusename, 
	bl.fixrate, bl.rate, bl.ranges 
FROM machrysetting s, machassesslevel bl, rysetting_lgu rl  
WHERE s.objid = bl.machrysettingid 
  AND s.objid = rl.objid 
  AND rl.lguid LIKE $P{lguid} 
  AND s.ry = $P{ry} AND bl.code LIKE $P{code} 

[getForex]  
SELECT mf.objid, mf.forex 
FROM machrysetting s, machforex mf 
WHERE s.objid = mf.machrysettingid 
  AND s.ry = $P{ry}
  AND mf.iyear = $P{iyear}

  
[getRPTSetting]
SELECT * FROM rptsetting   

[getLatestRevisedLandFaas] 
SELECT objid, docstate, rputype, txntype, taxpayerid, ry   
FROM faaslist   
WHERE pin = $P{pin}  
  AND rputype = 'land' 
  AND docstate <> 'CANCELLED'  
  AND ry = $P{ry} 
  AND txntype = 'GR'  
  

[getActualUseByPrevId]
SELECT  
	bl.objid AS actualuseid, bl.code AS actualusecode, bl.name AS actualusename, 
	bl.fixrate, bl.rate, bl.ranges 
FROM machrysetting s, machassesslevel bl 
WHERE s.objid = bl.machrysettingid 
  AND bl.previd = $P{previd} 

[getForexByPrevId]  
SELECT mf.objid, mf.forex 
FROM machrysetting s, machforex mf 
WHERE s.objid = mf.machrysettingid 
  AND mf.previd = $P{previd} 

  
