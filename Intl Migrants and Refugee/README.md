# Intl Migrants and Refugee Analysis

## Overview
This project is an SQL exercise built around a United Nations migration dataset, combining
International Migrant Stock figures (UN Population Division) with refugee and asylum data
(UNHCR). The dataset covers 263 areas: a mix of individual countries, regional groupings,
continents, and a world total.
The goal was to audit the data for structural problems first, design a schema that accounts for those
problems, and then move on to analysis.

## Files
- [Undata.sql](https://github.com/setsoul001/Data-Analyst-Portfolio/blob/main/Intl%20Migrants%20and%20Refugee/Undata.sql) — SQL script containing queries for each analysis 
- [UN Migrants SQL Project Report.pdf](https://github.com/setsoul001/Data-Analyst-Portfolio/blob/main/Intl%20Migrants%20and%20Refugee/UN%20Migrants%20SQL%20Project%20Report.pdf) — Written interpretation of findings
- [International Migrants and Refugees.csv](https://github.com/setsoul001/Data-Analyst-Portfolio/blob/main/Intl%20Migrants%20and%20Refugee/SYB68_327_202511_International%20Migrants%20and%20Refugees.csv) — Raw dataset from UN data
- [Intl Migrants lookup.csv](https://github.com/setsoul001/Data-Analyst-Portfolio/blob/main/Intl%20Migrants%20and%20Refugee/Intl_Migrants_lookup.csv) — Country reference table

## Tools Used
- Power Query
- SQL (DB4S)
 

## Key Findings
- The United States holds more than three times the migrant stock of the next-highest 
country (Germany), and the top 10 is dominated by high-income destination economies in 
North America, Western Europe, and the Gulf.
- As a percentage of total population, small, high-income, labor-importing economies 
(Gulf states, financial hubs) consistently top their respective continents while the 
percentage figures for most large, populous countries remain in the low single digits.
- The most noteworthy country is the Holy See (Vatican City) in Europe where 100% of the population
are migrants. This reveals the fact that the Holy See has no permanent citizen.
- Asia, Europe, and Africa each carry refugee populations in the 8–12 million range,
dwarfing the Americas and Oceania.
