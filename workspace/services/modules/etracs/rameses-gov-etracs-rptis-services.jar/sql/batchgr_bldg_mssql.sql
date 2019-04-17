[insertRevisedBldgRpus]
insert into bldgrpu(
  objid,
  landrpuid,
  houseno,
  psic,
  permitno,
  permitdate,
  permitissuedby,
  bldgtype_objid,
  bldgkindbucc_objid,
  basevalue,
  dtcompleted,
  dtoccupied,
  floorcount,
  depreciation,
  depreciationvalue,
  totaladjustment,
  additionalinfo,
  bldgage,
  percentcompleted,
  bldgassesslevel_objid,
  assesslevel,
  condominium,
  bldgclass,
  predominant,
  effectiveage,
  condocerttitle,
  dtcertcompletion,
  dtcertoccupancy
)
select
  replace(br.objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as objid,
  (select objid from landrpu where objid = replace(br.landrpuid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry}))) as landrpuid,
  br.houseno,
  br.psic,
  br.permitno,
  br.permitdate,
  br.permitissuedby,
  br.bldgtype_objid,
  br.bldgkindbucc_objid,
  br.basevalue,
  br.dtcompleted,
  br.dtoccupied,
  br.floorcount,
  br.depreciation,
  br.depreciationvalue,
  br.totaladjustment,
  br.additionalinfo,
  br.bldgage,
  br.percentcompleted,
  br.bldgassesslevel_objid,
  br.assesslevel,
  br.condominium,
  br.bldgclass,
  br.predominant,
  br.effectiveage,
  br.condocerttitle,
  br.dtcertcompletion,
  br.dtcertoccupancy
from faas f 
  inner join realproperty rp on f.realpropertyid = rp.objid
  inner join rpu r on f.rpuid = r.objid 
  inner join bldgrpu br on f.rpuid = br.objid 
  inner join batchgr_items_forrevision xbi on f.objid = xbi.objid 
where rp.barangayid = $P{barangayid}
and f.state = 'current'
and r.rputype = 'bldg'
and r.ry < $P{newry} 




[insertRevisedBldgStructures]
insert into bldgstructure(
  objid,
  bldgrpuid,
  structure_objid,
  material_objid,
  floor
)
select
  replace(bs.objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as objid,
  replace(bs.bldgrpuid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgrpuid,
  bs.structure_objid,
  bs.material_objid,
  bs.floor
from faas f 
  inner join realproperty rp on f.realpropertyid = rp.objid
  inner join rpu r on f.rpuid = r.objid 
  inner join bldgstructure bs on f.rpuid = bs.bldgrpuid 
  inner join batchgr_items_forrevision xbi on f.objid = xbi.objid 
where rp.barangayid = $P{barangayid}
and f.state = 'current'
and r.rputype = 'bldg'
and r.ry < $P{newry} 


[insertRevisedBldgStructuralTypes]
insert into bldgrpu_structuraltype(
  objid,
  bldgrpuid,
  bldgtype_objid,
  bldgkindbucc_objid,
  floorcount,
  basefloorarea,
  totalfloorarea,
  basevalue,
  unitvalue,
  classification_objid
)
select
  replace(bs.objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as objid,
  replace(bs.bldgrpuid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgrpuid,
  bs.bldgtype_objid,
  bs.bldgkindbucc_objid,
  bs.floorcount,
  bs.basefloorarea,
  bs.totalfloorarea,
  bs.basevalue,
  bs.unitvalue,
  bs.classification_objid
from faas f 
  inner join realproperty rp on f.realpropertyid = rp.objid
  inner join rpu r on f.rpuid = r.objid 
  inner join bldgrpu_structuraltype bs on f.rpuid = bs.bldgrpuid 
  inner join batchgr_items_forrevision xbi on f.objid = xbi.objid 
where rp.barangayid = $P{barangayid}
and f.state = 'current'
and r.rputype = 'bldg'
and r.ry < $P{newry} 



[insertRevisedBldgUses]
insert into bldguse(
  objid,
  bldgrpuid,
  structuraltype_objid,
  actualuse_objid,
  basevalue,
  area,
  basemarketvalue,
  depreciationvalue,
  adjustment,
  marketvalue,
  assesslevel,
  assessedvalue,
  addlinfo,
  taxable,
  adjfordepreciation
)
select
  replace(bu.objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as objid,
  replace(bu.bldgrpuid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgrpuid,
  replace(bu.structuraltype_objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgrpuid,
  bu.actualuse_objid,
  bu.basevalue,
  bu.area,
  bu.basemarketvalue,
  bu.depreciationvalue,
  bu.adjustment,
  bu.marketvalue,
  bu.assesslevel,
  bu.assessedvalue,
  bu.addlinfo,
  bu.taxable,
  bu.adjfordepreciation
from faas f 
  inner join realproperty rp on f.realpropertyid = rp.objid
  inner join rpu r on f.rpuid = r.objid 
  inner join bldguse bu on f.rpuid = bu.bldgrpuid 
  inner join batchgr_items_forrevision xbi on f.objid = xbi.objid 
where rp.barangayid = $P{barangayid}
and f.state = 'current'
and r.rputype = 'bldg'
and r.ry < $P{newry} 



[insertRevisedBldgFloors]
insert into bldgfloor(
  objid,
  bldguseid,
  bldgrpuid,
  floorno,
  area,
  storeyrate,
  basevalue,
  unitvalue,
  basemarketvalue,
  adjustment,
  marketvalue
)
select
  replace(bf.objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as objid,
  replace(bf.bldguseid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldguseid,
  replace(bf.bldgrpuid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgrpuid,
  bf.floorno,
  bf.area,
  bf.storeyrate,
  bf.basevalue,
  bf.unitvalue,
  bf.basemarketvalue,
  bf.adjustment,
  bf.marketvalue
from faas f 
  inner join realproperty rp on f.realpropertyid = rp.objid
  inner join rpu r on f.rpuid = r.objid 
  inner join bldgfloor bf on f.rpuid = bf.bldgrpuid 
  inner join batchgr_items_forrevision xbi on f.objid = xbi.objid 
where rp.barangayid = $P{barangayid}
and f.state = 'current'
and r.rputype = 'bldg'
and r.ry < $P{newry} 



[insertRevisedBldgAdditionalItems]
insert into bldgflooradditional(
  objid,
  bldgfloorid,
  bldgrpuid,
  additionalitem_objid,
  amount,
  expr,
  depreciate
)
select
  replace(bfa.objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as objid,
  replace(bfa.bldgfloorid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgfloorid,
  replace(bfa.bldgrpuid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgrpuid,
  bfa.additionalitem_objid,
  bfa.amount,
  bfa.expr,
  bfa.depreciate
from faas f 
  inner join realproperty rp on f.realpropertyid = rp.objid
  inner join rpu r on f.rpuid = r.objid 
  inner join bldgflooradditional bfa on f.rpuid = bfa.bldgrpuid 
  inner join batchgr_items_forrevision xbi on f.objid = xbi.objid 
where rp.barangayid = $P{barangayid}
and f.state = 'current'
and r.rputype = 'bldg'
and r.ry < $P{newry} 


[insertRevisedBldgAdditionalItemParams]
insert into bldgflooradditionalparam(
  objid,
  bldgflooradditionalid,
  bldgrpuid,
  param_objid,
  intvalue,
  decimalvalue
)
select
  replace(bfa.objid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as objid,
  replace(bfa.bldgflooradditionalid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgflooradditionalid,
  replace(bfa.bldgrpuid, '-'+convert(varchar(4),rp.ry), '') + ('-' + convert(varchar(4),$P{newry})) as bldgrpuid,
  bfa.param_objid,
  bfa.intvalue,
  bfa.decimalvalue
from faas f 
  inner join realproperty rp on f.realpropertyid = rp.objid
  inner join rpu r on f.rpuid = r.objid 
  inner join bldgflooradditionalparam bfa on f.rpuid = bfa.bldgrpuid 
  inner join batchgr_items_forrevision xbi on f.objid = xbi.objid 
where rp.barangayid = $P{barangayid}
and f.state = 'current'
and r.rputype = 'bldg'
and r.ry < $P{newry} 

