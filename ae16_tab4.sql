create or replace view ae16_tab4 as
select nvl(substr(idokres,0,2)||'00','0000') as kraj,
case when  substr(idokres,0,2)||'00'='1100' then 'Hlavní mìsto Praha'
     when  substr(idokres,0,2)||'00'='2100' then 'Støedoèeský kraj'
when  substr(idokres,0,2)||'00'='3100' then 'Jihoèeský kraj'
when  substr(idokres,0,2)||'00'='3200' then 'Plzeòský kraj'
when  substr(idokres,0,2)||'00'='4100' then 'Karlovarský kraj'
when  substr(idokres,0,2)||'00'='4200' then 'Ústecký kraj'
when  substr(idokres,0,2)||'00'='5100' then 'Liberecký kraj'
when  substr(idokres,0,2)||'00'='5200' then 'Královéhradecký kraj'
when  substr(idokres,0,2)||'00'='5300' then 'Pardubický kraj'
when  substr(idokres,0,2)||'00'='6100' then 'Kraj Vysoèina'
when  substr(idokres,0,2)||'00'='6200' then 'Jihomoravský kraj'
 when  substr(idokres,0,2)||'00'='7100' then 'Olomoucký kraj'
 when  substr(idokres,0,2)||'00'='7200' then 'Zlínský kraj'
 when  substr(idokres,0,2)||'00'='8100' then 'Moravskoslezský kraj'
  else 'ÈR' end as nazev_kraje,
sum(case when idvysl is not null then 1 else 0 end) pocet_uk,
sum(case when (idvysl=11 and pocetaes>0 and setritmodul=1) then 1 else 0 end) pocet_vys,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and pocetaes>0 and setritmodul=1) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_vys_uk,
sum(case when (idvysl=2) then 1 else 0 end) pocet_vysAES3,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=2) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_vysAES3_uk,
sum(case when (idvysl=11 and setritmodul=3) then 1 else 0 end) pocet_vysAES4,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and setritmodul=3) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_vysAES4_uk,
sum(case when (idvysl=11 and setritmodul=4) or (idvysl=21)  then 1 else 0 end) odm_neochota,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and setritmodul=4) or (idvysl=21) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_odm_neochota,
sum (case when idvysl=22 then 1 else 0 end) as odm_neschop,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=22 then 1 else 0 end)/sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_odm_neschop",
sum (case when idvysl=23 then 1 else 0 end) as odm_jazyk,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=23 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_odm_jazyk",
sum (case when idvysl=24 then 1 else 0 end) as odm_jn,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=24 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_odm_jn",
sum (case when idvysl=31 then 1 else 0 end) as nezast_nezast,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=31 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_nezast_nezast",
sum (case when idvysl=32 then 1 else 0 end) as nezast_neot,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=32 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_nezast_neot",
sum (case when idvysl=33 then 1 else 0 end) as nezast_mimor,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=33 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_nezast_mimor",
sum (case when idvysl=34 then 1 else 0 end) as nezast_vypadek,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=34 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_nezast_vypadek",
sum (case when idvysl=41 then 1 else 0 end) as admin_prazdny_byt,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=41 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_prazdny_byt",
sum (case when idvysl=42 then 1 else 0 end) as admin_rekreace,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=42 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_rekreace",
sum (case when idvysl=43 then 1 else 0 end) as admin_objekt,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=43 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_objekt",
sum (case when idvysl=44 then 1 else 0 end) as admin_neexbyt,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=44 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_neexbyt",
sum (case when idvysl=45 then 1 else 0 end) as admin_neexdum,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=45 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_neexdum",
sum (case when idvysl=46 then 1 else 0 end) as admin_neexadr,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=46 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_neexadr",
sum (case when idvysl=51 then 1 else 0 end) as admin_odstehCR,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=51 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_odstehCR",
sum (case when idvysl=52 then 1 else 0 end) as admin_odstehKolketivni,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=52 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_odstehKolketivni",
sum (case when idvysl=53 then 1 else 0 end) as admin_odstehZahr,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=53 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_odstehZahr",
sum (case when idvysl=54 then 1 else 0 end) as admin_umrti,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=54 then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_umrti",
sum (case when idvysl=55 or (idvysl=11 and setritmodul is null) then 1 else 0 end) as admin_neexPanel,
case when sum(case when (idvysl is not null or idvysl<>1) then 1 else 0 end)= 0 then 0 else sum (case when idvysl=55 or (idvysl=11 and setritmodul is null) then 1 else 0 end)/sum (case when (idvysl is not null or idvysl<>1) then 1 else 0 end) end as "%_admin_neexPanel"
from  AES_MONITORING t where setreni='ISD'
group by  rollup(substr(idokres,0,2)||'00');
