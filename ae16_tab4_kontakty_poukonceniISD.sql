create or replace view ae16_tab4_kontakty as
select decode("NUMNUTS",'0000','9999',NUMNUTS ) NUMNUTS,"NAZEVNUMNUTS","POCETK","POCETKBEZEDITACI","prumKontNaPag","OSOBNI_ROZHOVOR","%_osobni_rozhovor","TELEFONICKY","%_telefonicky","PREPIS","%_prepis","NEKONTAKT","%_nekontakt","SCHUZKA_NA_JINDY","%_schuzka_na_jindy","ODMITNUTI","%_odmitnuti","NEZASTIZENI","%_nezastizeni","ODSTEHOVANI","%_odstehovani","EDITACE","prum_editace"

  from
(select * from CISELNIK_KRAJ_OKRES
where numnuts like '%00' ) cis
left join
(select nvl(substr(PK,0,2)||'00','0000') as kraj,
case when  substr(PK,0,2)||'00'='1100' then 'Hlavní mìsto Praha'
     when  substr(PK,0,2)||'00'='2100' then 'Støedoèeský kraj'
when  substr(PK,0,2)||'00'='3100' then 'Jihoèeský kraj'
when  substr(PK,0,2)||'00'='3200' then 'Plzeòský kraj'
when  substr(PK,0,2)||'00'='4100' then 'Karlovarský kraj'
when  substr(PK,0,2)||'00'='4200' then 'Ústecký kraj'
when  substr(PK,0,2)||'00'='5100' then 'Liberecký kraj'
when  substr(PK,0,2)||'00'='5200' then 'Královéhradecký kraj'
when  substr(PK,0,2)||'00'='5300' then 'Pardubický kraj'
when  substr(PK,0,2)||'00'='6100' then 'Kraj Vysoèina'
when  substr(PK,0,2)||'00'='6200' then 'Jihomoravský kraj'
 when  substr(PK,0,2)||'00'='7100' then 'Olomoucký kraj'
 when  substr(PK,0,2)||'00'='7200' then 'Zlínský kraj'
 when  substr(PK,0,2)||'00'='8100' then 'Moravskoslezský kraj'
  else 'ÈR' end as nazev_kraje,
 count(pk) as pocetK,
sum (case when id_akce not in (100,91,92,93) then 1 else 0 end) as pocetKbezEditaci,
case when count(distinct pk)= 0 then 0 else sum (case when id_akce not in (100,91,92,93) then 1 else 0 end)/count(distinct pk) end as "prumKontNaPag",
sum (case when id_akce=50 then 1 else 0 end) as osobni_rozhovor,
case when sum(case when id_akce not in (100,91,92,93)then 1 else 0 end)= 0 then 0 else sum(case when id_akce=50 then 1 else 0 end)/sum(case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_osobni_rozhovor",
sum (case when id_akce=13 then 1 else 0 end) as telefonicky,
case when sum(case when id_akce not in (100,91,92,93)then 1 else 0 end)= 0 then 0 else sum(case when id_akce=13 then 1 else 0 end)/ sum(case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_telefonicky",
sum (case when id_akce=14 then 1 else 0 end) as prepis,
case when sum(case when id_akce not in (100,91,92,93)then 1 else 0 end)= 0 then 0 else sum(case when id_akce=14 then 1 else 0 end)/ sum(case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_prepis",
sum (case when id_akce=60 and id_vyslsetr<>70 then 1 else 0 end) as nekontakt,
case when sum(case when id_akce not in (100,91,92,93) then 1 else 0 end)= 0 then 0 else sum(case when id_akce=60 and id_vyslsetr<>70 then 1 else 0 end)/ sum (case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_nekontakt",
sum (case when id_akce=60 and id_vyslsetr=70 then 1 else 0 end) as schuzka_na_jindy,
case when sum(case when id_akce not in (100,91,92,93) then 1 else 0 end)= 0 then 0 else sum(case when id_akce=60 and id_vyslsetr=70 then 1 else 0 end)/ sum (case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_schuzka_na_jindy",
sum (case when substr(id_akce,0,1)=2 then 1 else 0 end) as odmitnuti,
case when sum(case when id_akce not in (100,91,92,93) then 1 else 0 end)= 0 then 0 else sum(case when substr(id_akce,0,1)=2 then 1 else 0 end)/ sum (case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_odmitnuti",
sum (case when substr(id_akce,0,1)=3 then 1 else 0 end) as nezastizeni,
case when sum(case when id_akce not in (100,91,92,93) then 1 else 0 end)= 0 then 0 else sum(case when substr(id_akce,0,1)=3 then 1 else 0 end)/sum (case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_nezastizeni",
sum (case when id_akce=94 then 1 else 0 end) as odstehovani,
case when sum(case when id_akce not in (100,91,92,93) then 1 else 0 end)= 0 then 0 else sum(case when id_akce=94 then 1 else 0 end)/ sum (case when id_akce not in (100,91,92,93) then 1 else 0 end) end as "%_odstehovani",
sum (case when id_akce=100 then 1 else 0 end) as editace,
case when count(distinct pk) = 0 then 0 else sum(case when id_akce=100 then 1 else 0 end)/ count(distinct pk) end as "prum_editace"
 from
 (select * from (
select * from is163_kontakty
/*union
select * from is163_kontakty*/)
where pk in (select to_number(idokres||idpagina) from aes_monitoring_isd_final m)
)
 group by rollup(substr(PK,0,2)||'00')) t
 on (kraj = numnuts)
 order by decode("NUMNUTS",'0000','9999',NUMNUTS );
