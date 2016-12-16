--------------------------------------------------------------------------------
--            Fjöldi dauðsfalla af völdum lögreglu á hverju phasei.
select (select count(time)
        from fatalpoliceshootings
        where time in (select time
                       from moons
                       where phase = 'Full Moon')) as "Full Moon",
        (select count(time)
        from fatalpoliceshootings
        where time in (select time
                       from moons
                       where phase = 'New Moon')) as "New Moon",
        (select count(time)
        from fatalpoliceshootings
        where time in (select time
                       from moons
                       where phase = 'First Quarter')) as "First Quarter",
        (select count(time)
        from fatalpoliceshootings
        where time in (select time
                       from moons
                       where phase = 'Last Quarter')) as "Last Quarter";

--------------------------------------------------------------------------------
--              Fjöldi glæpa á phasei raðað í stærðarröð
select offense, count(offense_id)
from crimes, offenses
where offenses.id = crimes.offense_id
and crimes.time in (select time
                    from moons
                    where phase like 'Full Moon')
group by offenses.offense
order by count(offense_id) desc;


select offense, count(offense_id)
from crimes, offenses
where offenses.id = crimes.offense_id
and crimes.time in (select time
                    from moons
                    where phase like 'New Moon')
group by offenses.offense
order by count(offense_id) desc;

select offense, count(offense_id)
from crimes, offenses
where offenses.id = crimes.offense_id
and crimes.time in (select time
                    from moons
                    where phase like 'First Quarter')
group by offenses.offense
order by count(offense_id) desc;

select offense, count(offense_id)
from crimes, offenses
where offenses.id = crimes.offense_id
and crimes.time in (select time
                    from moons
                    where phase like 'Last Quarter')
group by offenses.offense
order by count(offense_id) desc;


--------------------------------------------------------------------------------
--             Hversu margir glaepir voru framdir a phasei.
select (select count(offense_id)
from crimes
where time in (select time
               from moons
               where phase like 'New Moon')) as "New Moon",
(select count(offense_id)
from crimes
where time in (select time
               from moons
               where phase like 'Full Moon')) as "Full Moon",
(select count(offense_id)
from crimes
where time in (select time
               from moons
               where phase like 'First Quarter')) as "First Quarter",
(select count(offense_id)
from crimes
where time in (select time
               from moons
               where phase like 'Last Quarter')) as "Last Quarter";


--------------------------------------------------------------------------------
--              Mest framdi glæpurinn eftir öllum phaseum
select offense, count(offense_id)
from crimes, offenses
where offenses.id = crimes.offense_id
and crimes.time in (select time
                    from moons
                    where phase like 'Full Moon')
group by offenses.offense
order by count(offense_id) desc;



select count(offense_id)
from crimes
where crimes.offense_id = 1784456

select count(*) as fullmoon
from fatalpoliceshootings
where fatalpoliceshootings.time in (select time
                                    from moons
                                    where moons.phase = 'Full Moon')
select count(*) as Newmoon
from fatalpoliceshootings
where fatalpoliceshootings.time in (select time
                                    from moons
                                    where moons.phase = 'New Moon')

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--Eru fleiri simtol i 911 a fullu tungli?
select (select count(time)
        from emergencyCalls
        where emergencyCalls.time in (select time
                                       from moons
                                      where moons.phase = 'Full Moon')) as "Full Moon",
        (select count(time)
        from emergencyCalls
        where emergencyCalls.time in (select time
                                      from moons
                                      where moons.phase = 'New Moon')) as "New Moon",
        (select count(time)
        from emergencyCalls
        where emergencyCalls.time in (select time
                                      from moons
                                      where moons.phase = 'First Quarter')) as "First Quarter",
        (select count(time)
        from emergencyCalls
        where emergencyCalls.time in (select time
                                      from moons
                                      where moons.phase = 'Last Quarter')) as "Last Quarter";

--Eru fleiri glæpir framdir á fullu tungli?
select (select count(time)
        from crimes
        where crimes.time in (select time
                              from moons
                              where moons.phase = 'Full Moon')) as "Full Moon",
        (select count(time)
        from crimes
        where crimes.time in (select time
                              from moons
                              where moons.phase = 'New Moon')) as "New Moon",
        (select count(time)
        from crimes
        where crimes.time in (select time
                              from moons
                              where moons.phase = 'First Quarter')) as "First Quarter",
        (select count(time)
        from crimes
        where crimes.time in (select time
                              from moons
                              where moons.phase = 'Last Quarter')) as "Last Quarter";


--Eru fleiri dauðsföll af völdum lögreglunnar á fullu tungli?
-- SAMA OG UPPI!---------------------------------------------
select (select count(time)
        from fatalpoliceshootings
        where fatalpoliceshootings.time in (select time
                                            from moons
                                            where moons.phase = 'Full Moon')) as "Full Moon",
        (select count(time)
        from fatalpoliceshootings
        where fatalpoliceshootings.time in (select time
                                            from moons
                                            where moons.phase = 'New Moon')) as "New Moon",
        (select count(time)
        from fatalpoliceshootings
        where fatalpoliceshootings.time in (select time
                                            from moons
                                            where moons.phase = 'First Quarter')) as "First Quarter",
        (select count(time)
        from fatalpoliceshootings
        where fatalpoliceshootings.time in (select time
                                            from moons
                                            where moons.phase = 'Last Quarter')) as "Last Quarter";


-- Eru fleiri sem deyja af völdum eiturlyfja á fullu tungli?
select (select count(sex)
        from drugdeaths
        where lower(sex) like 'male'
        and drugdeaths.time in (select time
                                from moons
                                where moons.phase = 'Full Moon')) as "Male Deaths on Full moon",
        (select count(sex)
        from drugdeaths
        where lower(sex) like 'female'
        and drugdeaths.time in (select time
                                from moons
                                where moons.phase = 'Full Moon')) as "Female Deaths on Full moon",
        (select count(sex)
        from drugdeaths
        where lower(sex) like 'male') as "Male Deaths overall",
        (select count(sex)
        from drugdeaths
        where lower(sex) like 'female') as "Female Deaths overall";


-- Hversu margir dóu af hvaða orsaki af völdum eiturlyfja
select count(cause), cause
from drugdeaths
where time in (select time
               from moons
               where moons.phase = 'Full Moon')
group by cause
order by count(cause) desc;


select count(cause), cause
from drugdeaths
where time in (select time
               from moons
               where moons.phase = 'New Moon')
group by cause
order by count(cause) desc;


select count(cause), cause
from drugdeaths
where time in (select time
               from moons
               where phase = 'First Quarter')
group by cause
order by count(cause) desc;


select count(cause), cause
from drugdeaths
where time in (select time
               from moons
               where phase = 'Last Quarter')
group by cause
order by count(cause) desc;



-- Hversu margir af hverjum kynþætti dóu af völdum eiturlyfja á hverju phasei.
select count(race), race
from drugdeaths
where time in (select time
                from moons
                where moons.phase = 'Full Moon')
group by race
order by count(race) desc;


select count(race), race
from drugdeaths
where race in (select race
               from moons
               where moons.phase = 'New Moon')
group by race
order by count(race) desc;


select count(race), race
from drugdeaths
where time in (select time
               from moons
               where phase = 'First Quarter')
group by race
order by count(race) desc;


select count(race), race
from drugdeaths
where time in (select time
               from moons
               where phase = 'Last Quarter')
group by race
order by count(race) desc;

-- Hversu margir deyja af völdum eiturlyja eftir hverju eiturlyfi.
select count(lower(cause)), lower(cause)
from drugdeaths
group by cause
order by count(cause) desc;


-- Hversu margir deyja af völdum eiturlyfja á hverju phasei.
select (select count(time)
        from drugdeaths
        where drugdeaths.time in (select time
                                  from moons
                                  where moons.phase = 'Full Moon')) as "Full Moon",
        (select count(time)
        from drugdeaths
        where drugdeaths.time in (select time
                                   from moons
                                   where moons.phase = 'New Moon')) as "New Moon",
        (select count(time)
        from drugdeaths
        where drugdeaths.time in (select time
                                   from moons
                                   where moons.phase = 'First Quarter')) as "First Quarter",
        (select count(time)
        from drugdeaths
        where drugdeaths.time in (select time
                                   from moons
                                   where moons.phase = 'Last Quarter')) as "Last Quarter";