create or replace view ae16_tab1b as
select substr(novy_tazsoubor,0,2)||'00' numnuts,novy_tazsoubor,osobnicislo,idtaz, count(*) pocet_vyb,
sum(case when idvysl is not null then 1 else 0 end) pocet_uk,
case when count(*)=0  then 0 else sum(case when idvysl is not null then 1 else 0 end)/count(*) end p_uk,
sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end) pocet_uprvyb,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_uprvyb,
sum(case when (idvysl=11 and pocetaes>0 and setritmodul=1) then 1 else 0 end) pocet_vys,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and pocetaes>0 and setritmodul=1) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_vys_uk,
case when sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and pocetaes>0 and setritmodul=1) then 1 else 0 end)/sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end) end p_vys_uprvyb,
sum(case when (idvysl=2) then 1 else 0 end) pocet_vysAES3,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=2) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_vysAES3_uk,
case when sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end)=0 then 0 else sum(case when (idvysl=2) then 1 else 0 end)/sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end) end p_vysAES3_uprvyb,
sum(case when (idvysl=11 and setritmodul=3) then 1 else 0 end) pocet_vysAES4,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and setritmodul=3) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_vysAES4_uk,
case when sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and setritmodul=3) then 1 else 0 end)/sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end) end p_vysAES4_uprvyb,
sum(case when (idvysl=11 and setritmodul=4) then 1 else 0 end) pocet_vysAESodm,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and setritmodul=4) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_vysAESodm_uk,
case when sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end)=0 then 0 else sum(case when (idvysl=11 and setritmodul=4) then 1 else 0 end)/sum(case when (idvysl=2) or (idvysl=11 and setritmodul is not null) then 1 else 0 end) end p_vysAESodm_uprvyb,
sum(case when (idvysl>11) or (idvysl=11 and pocetaes=0) then 1 else 0 end) pocet_nevys,
case when sum(case when idvysl is not null then 1 else 0 end)=0 then 0 else sum(case when (idvysl>11) or (idvysl=11 and pocetaes=0) then 1 else 0 end)/sum(case when idvysl is not null then 1 else 0 end) end p_nevys,
sum(case when idvysl is null then 1 else 0 end) pocet_neuk,
case when count(*)=0  then 0 else sum(case when idvysl is null then 1 else 0 end)/count(*) end p_neuk,
sum(spravny_pocet_aes) pocet_aes,
sum(pocetaes) pocet_aes_uk,
case when sum(spravny_pocet_aes)=0  then 0 else sum(pocetaes)/sum(spravny_pocet_aes) end p_aes_uk,
sum(pocetaes_ano) pocet_aes_ano,
case when sum(pocetaes)=0 then 0 else sum(pocetaes_ano)/sum(pocetaes) end p_aes_ano,
sum(pocetaes_ne) pocet_aes_ne,
case when sum(pocetaes)=0 then 0 else sum(pocetaes_ne)/sum(pocetaes) end p_aes_ne,
sum(pocetaes_proxy) pocet_aes_proxy,
case when sum(pocetaes_ano)=0 then 0 else sum(pocetaes_proxy)/sum(pocetaes_ano) end p_aes_proxy,
sum(osobne) pocet_osobne,
case when sum(pocetaes_ano)=0 then 0 else sum(osobne)/sum(pocetaes_ano) end p_osobne,
sum(telefon) pocet_telefon,
case when sum(pocetaes_ano)=0 then 0 else sum(telefon)/sum(pocetaes_ano) end p_telefon,
sum(prepis) pocet_prepis,
case when sum(pocetaes_ano)=0 then 0 else sum(prepis)/sum(pocetaes_ano) end p_prepis,
sum(samovyplneni) pocet_samovyplneni,
case when sum(pocetaes_ano)=0 then 0 else sum(samovyplneni)/sum(pocetaes_ano) end p_samovyplneni,
sum(hledInformace) pocet_hledInformace,
case when sum(pocetaes_ano)=0 then 0 else sum(hledInformace)/sum(pocetaes_ano) end p_hledInformace,
sum(ucastFormVzd) pocet_ucastFormVzd,
case when sum(pocetaes_ano)=0 then 0 else sum(ucastFormVzd)/sum(pocetaes_ano) end p_ucastFormVzd,
sum(ucastNeformVzd) pocet_ucastNeformVzd,
case when sum(pocetaes_ano)=0 then 0 else sum(ucastNeformVzd)/sum(pocetaes_ano) end p_ucastNeformVzd,
case when sum(ucastNeformVzd)=0 then 0 else sum(pocetNefAkt)/sum(ucastNeformVzd)  end prum_NefAkt,
sum(pocetNefAkt) pocet_NefAkt,
sum(kurz) pocet_kurz,
case when sum(pocetNefAkt)=0 then 0 else sum(kurz)/sum(pocetNefAkt) end p_kurz,
sum(workshop) pocet_workshop,
case when sum(pocetNefAkt)=0 then 0 else sum(workshop)/sum(pocetNefAkt) end p_workshop,
sum(skoleni) pocet_skoleni,
case when sum(pocetNefAkt)=0 then 0 else sum(skoleni)/sum(pocetNefAkt) end p_skoleni,
sum(lekce) pocet_lekce,
case when sum(pocetNefAkt)=0 then 0 else sum(lekce)/sum(pocetNefAkt) end p_lekce,
sum(pracovni) pocet_pracovni,
case when sum(pocetNefAkt)=0 then 0 else sum(pracovni)/sum(pocetNefAkt) end p_pracovni,
sum(nepracovni) pocet_nepracovni,
case when sum(pocetNefAkt)=0 then 0 else sum(nepracovni)/sum(pocetNefAkt) end p_nepracovni,
sum(chtelVice) pocet_chtelVice,
case when sum(pocetaes_ano)=0 then 0 else sum(chtelVice)/sum(pocetaes_ano) end p_chtelVice,
sum(umiCizJaz) pocet_umiCizJaz,
case when sum(pocetaes_ano)=0 then 0 else sum(umiCizJaz)/sum(pocetaes_ano) end p_umiCizJaz,
case when sum(umiCizJaz)=0 then 0 else sum(pocetCizJaz)/sum(umiCizJaz) end prum_CizJaz

from
/*slouèené tabulky*/
(select *  from
(select t.*,case when pocetaes_odhad is null then nvl(pocetaes,0) else pocetaes_odhad end spravny_pocet_aes from   aes_monitoring_isd_final t where setreni='ISD')
left join
(select idokres, idpagina, iddom, sum (case when aihleinfvzd=1 then 1 else 0 end) hledInformace from ae163_bdbm_informace_d
group by  idokres, idpagina, iddom)
using (idokres, idpagina, iddom)
left join
(select idokres, idpagina, iddom, sum (case when afucastfvz=1 then 1 else 0 end) ucastFormVzd from AE163_BDBM_FVZD_D
group by  idokres, idpagina, iddom)
using (idokres, idpagina, iddom)
left join
(select idokres, idpagina, iddom, sum (case when anpocnfvz>0 then 1 else 0 end) ucastNeformVzd,
 sum(nvl(anpocnfvz,0)) pocetNefAkt from AE163_BDBM_NEFVZD_D
group by  idokres, idpagina, iddom)
using (idokres, idpagina, iddom)
left join
(select idokres, idpagina, iddom,
 sum (case when anvsetypnfvz=1 then 1 else 0 end) kurz,
 sum (case when anvsetypnfvz=2 then 1 else 0 end) workshop,
 sum (case when anvsetypnfvz=3 then 1 else 0 end) skoleni,
 sum (case when anvsetypnfvz=4 then 1 else 0 end) lekce,
 sum (case when anvseduvnfvz=1 then 1 else 0 end) pracovni,
 sum (case when anvseduvnfvz=2 then 1 else 0 end) nepracovni  from AE163_BDBM_NEFVZD_TAB_D
group by  idokres, idpagina, iddom)
using (idokres, idpagina, iddom)
left join
(select idokres, idpagina, iddom,
sum(case when  nvl(aovzdvicucast,aovzdvicneucast)=1 then 1 else 0 end) chtelVice from AE163_BDBM_OBTIZE_D
group by  idokres, idpagina, iddom)
using (idokres, idpagina, iddom)
left join
(select idokres, idpagina, iddom,sum(ajpoccizjaz) pocetCizJaz,
sum(case when ajpoccizjaz>0 then 1 else 0 end) umiCizJaz from ae163_bdbm_infvzd_jaz_d
group by  idokres, idpagina, iddom)
using (idokres, idpagina, iddom)
)
group by substr(novy_tazsoubor,0,2),novy_tazsoubor,osobnicislo,idtaz
order by substr(novy_tazsoubor,0,2),novy_tazsoubor,osobnicislo,idtaz;
