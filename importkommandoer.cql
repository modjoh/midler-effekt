//GEOGRAFI
CREATE CONSTRAINT ON (l:Lokasjon) ASSERT l.lokid IS UNIQUE;
CREATE CONSTRAINT ON (b:Bane) ASSERT b.navn IS UNIQUE;
CREATE CONSTRAINT ON (bs:Banestrekning) ASSERT bs.bsid IS UNIQUE;
CREATE CONSTRAINT ON (bsj:Bansejef) ASSERT bsj.navn IS UNIQUE;
CREATE CONSTRAINT ON (omr:Område) ASSERT omr.navn IS UNIQUE;

USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/delstrekninger.csv" AS line FIELDTERMINATOR ";"
CREATE (l:Lokasjon {navn: line.Delstrekning, status: line.LOKSTATUS, frakm: toFloat(line.LOKFRAKM), tilkm: toFloat(line.LOKTILKM),stasjonsmidt: toFloat(line.Stasjonsmidt), lokid: line.`Delstrekning Id`})
SET l.stasjon = CASE line.STASJON WHEN "SANN" THEN true ELSE false END ,l:Geografi

MERGE (bs:Banestrekning{bsid:line.`Banestrekning Id`})
ON CREATE SET bs.navn = line.Banestrekning, bs.frakm = toFloat(line.`Fra Km`), bs.tilkm = toFloat(line.`Til Km`), bs.status = line.Status, bs.prioritet= toInt(line.Prioritet),bs:Geografi

MERGE (bsj:Banesjef{navn:line.Banesjef})
ON CREATE SET bsj:Organisasjon

MERGE (omr:Område{navn:line.Område})
ON CREATE SET omr:Organisasjon

MERGE (b:Bane {navn: line.Bane})
ON CREATE SET b.baneid = line.`Bane Id`, b.frakm = toFloat(line.BANEFRAKM), b.tilkm = toFloat(line.BANETILKM),b:Geografi

MERGE (l)-[:DEL_AV]->(bs)
MERGE (bs)-[:DEL_AV]->(b)
MERGE (bs)-[:DEL_AV]->(bsj)
MERGE (bsj)-[:DEL_AV]->(omr);

// GI TOPOLOGI
MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Alnabanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Arendalsbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Askerbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Bergensbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Bratsbergbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Brevikbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Dovrebanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Drammenbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Flåmsbana"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Gardermobanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Gjøvikbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Godssporet Alnabru-Loenga"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Hardangerbana"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Hovedbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Kongsvingerbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Meråkerbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Nordlandsbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Ofotbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Randsfjordbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Raumabanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Roa-Hønefossbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Rørosbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Solørbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Sørlandsbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Tinnosbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Valdresbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Vestfoldbanen"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Østfoldbanen vestre linje"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

MATCH(l:Lokasjon) -[r:DEL_AV*]->(b:Bane {navn:"Østfoldbanen østre linje"})
WITH l
ORDER BY l.frakm
WITH COLLECT(l) AS lokasjoner
FOREACH(i in RANGE(0, length(lokasjoner)-2) |
FOREACH(li in [lokasjoner[i]] |
FOREACH(li2 in [lokasjoner[i+1]] |
CREATE UNIQUE (li)-[:NESTE_LOKASJON]->(li2))))

//DETALJERT TOPOLOGI
MATCH (l1:Lokasjon{navn:"Filipstad stasjon (delstr.) stasjon"})
MATCH (l2:Lokasjon{navn:"Skøyen stasjon"})
CREATE UNIQUE (l2)-[:NESTE_LOKASJON]->(l1)



//PROSJEKTER
CREATE CONSTRAINT ON (p:Prosjekt) ASSERT p.pid IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/hovedprosjekter.csv" AS line FIELDTERMINATOR ";"
MATCH(b:Bane {navn:line.BANE})
MERGE (p:Prosjekt:Aktiv {pid: line.PID})
ON CREATE SET p.frakm=toFloat(line.PFROM), p.tilkm= toFloat(line.PTO),p.kostnadsestimat = toFloat(line.PCOST), p.anleggstype = line.CAT, p.prisår=line.PRICEYEAR, p.mengde=toFloat(line.QUANT), p.enhet=line.UNIT 
MERGE (p)-[:UTFRØRES_PÅ]->(b);
//DELPROSJEKTER
CREATE CONSTRAINT ON (dp:Delprosjekt) ASSERT dp.dpid IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/prosjekter.csv" AS line FIELDTERMINATOR ";"
MATCH(p:Prosjekt {pid:line.PID})
MATCH(bs:Banestrekning {bsid: line.BSID})
MERGE (dp:Delprosjekt:Aktiv {dpid: line.SPID})
ON CREATE SET dp.frakm=toFloat(line.SPFROM), dp.tilkm= toFloat(line.SPTO),dp.kostnadsestimat = toFloat(line.COST), dp.anleggstype = line.CAT, dp.prisår=line.PRICEYEAR, dp.mengde=toFloat(line.QUANT), dp.enhet=line.UNIT 
MERGE (dp)-[:DEL_AV_PROSJEKT]->(p)
MERGE (dp)-[:UTFØRES_PÅ]->(bs);
//OBJEKTER
CREATE CONSTRAINT ON (ob:Objekt) ASSERT ob.obid IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/objekter.csv" AS line FIELDTERMINATOR ";"
MATCH(l:Lokasjon {lokid: line.LOKID})
MERGE (ob:Objekt {obid: line.OBID})
ON CREATE SET ob.frakm=toFloat(line.FROM), ob.tilkm= toFloat(line.TO),ob.kostnadsestimat = toFloat(line.COST), ob.anleggstype = line.CAT, ob.lengde=toFloat(line.LENGTH), ob.bygget = toInt(line.BUILT), ob.utløpsår = toInt(line.REPLYEAR)
MERGE (ob)-[:LIGGER_PÅ_STREKNING]->(l);

LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/objekter.csv" AS line FIELDTERMINATOR ";"
MATCH (dp:Delprosjekt{dpid:line.SPID})
MATCH (ob:Objekt{obid:line.OBID})
MERGE (ob)-[:DEL_AV_PROSJEKT]->(dp);

//PROSJEKTSTREKNINGER
CREATE CONSTRAINT ON (ps:Prosjektstrekning) ASSERT ps.navn IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/STREKNINGER-BSID.csv" AS line FIELDTERMINATOR ";"
MATCH(b:Banestrekning {bsid:line.BSID})
MERGE(ps:Prosjektstrekning {navn:line.Strekning})
MERGE(ps)<-[:DEL_AV]-(b)

//Budsjett
CREATE CONSTRAINT ON (ps:Prosjektår) ASSERT ps.navn IS UNIQUE;
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/prosjektår.csv" AS line FIELDTERMINATOR ";"
CREATE(p:Prosjektår {navn:toInt(line.Prosjektår)});

LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/strekning-budsjett2016.csv" AS line FIELDTERMINATOR ";"
MATCH(s:Prosjektstrekning{navn:line.Prosjektstrekning})
MATCH(p:Prosjektår{navn:2016})
CREATE UNIQUE (s)-[r:BUDSJETT_I_ÅR]->(p)
SET r.anleggstype = line.Anleggstype, r.beløp = toFloat(line.`2016`)

//TIOS-STASJONER
CREATE CONSTRAINT ON (ts:TIOSStasjon) ASSERT ts.navn IS UNIQUE;
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/TIOSStasjon-lokasjon.csv" AS line
MERGE(ts:TIOSStasjon {navn:line.navn})
ON CREATE SET ts.km = toFloat(line.km)
MERGE(l:Lokasjon{lokid:line.lokid})
CREATE UNIQUE (ts)-[:LIGGER_PÅ]->(l);

//FORSINKELSESDATA

CREATE CONSTRAINT ON (t:Tog) ASSERT t.tognr IS UNIQUE;
CREATE CONSTRAINT ON (h:Hendelse) ASSERT h.Id IS UNIQUE;
CREATE CONSTRAINT ON (a:Avvik) ASSERT a.Id IS UNIQUE;
//TOGNR
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/forsinkelser_årsak_1_10-14.csv" AS line FIELDTERMINATOR ";"
WITH line WHERE line.Tognr IS NOT NULL
MERGE(t:Tog {tognr: toInt(line.Tognr)});

//HLID 
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/forsinkelser_årsak_1_10-14.csv" AS line FIELDTERMINATOR ";"
WITH line WHERE line.`HL-ID` IS NOT NULL
MERGE(h:Hendelse{Id: toInt(line.`HL-ID`)})
ON CREATE SET h.beskrivelse = line.`HL-beskrivelse`;

//FORSINKELSER
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/forsinkelser_årsak_1_10-14.csv" AS line FIELDTERMINATOR ";"
WITH line WHERE line.Innstilt = "USANN" 
MATCH(ts:TIOSStasjon {navn:line.Stasjon})
MATCH(tog:Tog {tognr:toInt(line.Tognr)})
MERGE(a:Avvik{Id: toInt(line.id)}) 
ON CREATE SET a:Forsinkelse, a.verdi = toFloat(line.Forsinkelse), a.kommentar = line.Kommentar, a.dato = line.Dato
CREATE(a)-[:REGISTRERT_PÅ_STASJON]->(ts)
CREATE(a)-[:RAMMET_TOG]->(tog);

//INNSTILLINGER
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/forsinkelser_årsak_1_10-14.csv" AS line FIELDTERMINATOR ";"
WITH line WHERE line.Innstilt = "SANN"
MATCH(ts:TIOSStasjon {navn:line.Stasjon})
MATCH(tog:Tog {tognr:toInt(line.Tognr)})
MERGE(a:Avvik{Id: toInt(line.id)}) 
ON CREATE SET a:Innstilling, a.kommentar = line.Kommentar, a.dato=line.Dato
CREATE(a)-[:REGISTRERT_PÅ_STASJON]->(ts)
CREATE(a)-[:RAMMET_TOG]->(tog);

//KNYTTE AVVIK TIL HLID
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/forsinkelser_årsak_1_10-14.csv" AS line FIELDTERMINATOR ";"
WITH line WHERE line.`HL-ID` IS NOT NULL
MATCH(a:Avvik{Id:toInt(line.id)})
MATCH(h:Hendelse{Id:toInt(line.`HL-ID`)})
CREATE (a)-[:KONSEKVENS_AV]->(h);

//KNYTTE AVVIK TIL FORÅRSAKENDE
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///Users/MODJOH/Desktop/PRIFO/Neo4j/csv/forsinkelser_årsak_1_10-14.csv" AS line FIELDTERMINATOR ";"
WITH line WHERE line.Forårsakende IS NOT NULL
MATCH(a:Avvik{Id:toInt(line.id)})
MATCH(tog:Tog {tognr:toInt(line.Forårsakende)})
CREATE (a)-[:FORÅRSAKET_AV_TOG]->(tog);


