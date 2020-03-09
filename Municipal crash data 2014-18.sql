--local and county road crashes last 5 years output
SELECT crashdata.CRN, 
crashdata.MAX_SEVERITY_LEVEL,
crashdata.ROAD_OWNER,
crashdata.ROUTE, 
crashdata.SEGMENT, 
crashdata.SPEED_LIMIT, 
crashdata.STREET_NAME, 
muni.Municipality,
crashdata.POLICE_AGCY, 
poliag.Police_Agency_Code,
poliag.Police_Agency_Name,
crashdata.CRASH_YEAR, 
crashdata.CRASH_MONTH,
crashdata.DAY_OF_WEEK, 
crashdata.HOUR_OF_DAY, 
crashdata.TIME_OF_DAY, 
crashdata.ILLUMINATION, 
crashdata.WEATHER, 
crashdata.ROAD_CONDITION, 
crashdata.COLLISION_TYPE, 
crashdata.WORK_ZONE_IND, 
crashdata.[INTERSECTION],
crashdata.INTERSECT_TYPE, 
crashdata.TCD_TYPE, 
crashdata.SCH_BUS_IND, 
crashdata.SCH_ZONE_IND, 
crashdata.TCD_FUNC_CD, 
crashdata.VEHICLE_COUNT, 
crashdata.COMM_VEH_COUNT, 
crashdata.AUTOMOBILE_COUNT, 
crashdata.MOTORCYCLE_COUNT, 
crashdata.BUS_COUNT, 
crashdata.SMALL_TRUCK_COUNT, 
crashdata.HEAVY_TRUCK_COUNT, 
crashdata.BICYCLE_COUNT, 
crashdata.PERSON_COUNT, 
crashdata.FATAL_COUNT, 
crashdata.MAJ_INJ_COUNT, 
crashdata.MOD_INJ_COUNT, 
crashdata.MIN_INJ_COUNT, 
crashdata.TOT_INJ_COUNT, 
crashdata.UNK_INJ_DEG_COUNT, 
crashdata.UNK_INJ_PER_COUNT, 
crashdata.UNBELTED_OCC_COUNT, 
crashdata.UNB_DEATH_COUNT, 
crashdata.UNB_MAJ_INJ_COUNT, 
crashdata.BELTED_DEATH_COUNT, 
crashdata.BELTED_MAJ_INJ_COUNT, 
crashdata.MCYCLE_DEATH_COUNT, 
crashdata.MCYCLE_MAJ_INJ_COUNT, 
crashdata.BICYCLE_DEATH_COUNT, 
crashdata.BICYCLE_MAJ_INJ_COUNT, 
crashdata.PED_COUNT, 
crashdata.PED_DEATH_COUNT, 
crashdata.PED_MAJ_INJ_COUNT,  
crashdata.DEC_LAT, 
crashdata.DEC_LONG, 
crashdata.DEER_RELATED,
crashdata.HIT_PARKED_VEHICLE, 
crashdata.SIGNALIZED_INT, 
crashdata.STOP_CONTROLLED_INT, 
crashdata.MOTORCYCLE, 
crashdata.BICYCLE, 
crashdata.PEDESTRIAN, 
crashdata.HVY_TRUCK_RELATED, 
crashdata.ALCOHOL_RELATED, 
crashdata.DRINKING_DRIVER, 
crashdata.UNDERAGE_DRNK_DRV, 
crashdata.UNLICENSED, 
crashdata.DISTRACTED, 
crashdata.CELL_PHONE, 
crashdata.RUNNING_RED_LT,
crashdata.RUNNING_STOP_SIGN, 
crashdata.TAILGATING, 
crashdata.CURVED_ROAD, 
crashdata.CURVE_DVR_ERROR,  
crashdata.SPEEDING_RELATED, 
crashdata.AGGRESSIVE_DRIVING, 
crashdata.FATIGUE_ASLEEP, 
crashdata.UNBELTED,
crashdata.HAZARDOUS_TRUCK,   
crashdata.ILLEGAL_DRUG_RELATED, 
crashdata.DRUGGED_DRIVER, 
crashdata.IMPAIRED_DRIVER,
crashdata.VEHICLE_TOWED,
crashdata.PSP_REPORTED
FROM DataWarehouse.Master.ALCO_PennDOT_Crashes_A as crashdata
left join DataWarehouse.Master.ALCO_PennDOT_MuniList as muni 
on crashdata.MUNICIPALITY = muni.Code 
left join DataWarehouse.Master.ALCO_PennDOT_PoliceAgencies as poliag
on crashdata.POLICE_AGCY = poliag.Police_Agency_Code 
where CRASH_YEAR BETWEEN 2014 AND 2018
AND  ROAD_OWNER in ('3', '4');

SELECT * from DataWarehouse.Master.ALCO_PennDOT_PoliceAgencies apdpa;

--test  
SELECT CRASH_YEAR ,count(distinct CRN)   from DataWarehouse.Master.ALCO_PennDOT_Crashes_A apdca 
where ROAD_OWNER in ('3', '4')
group by CRASH_YEAR;

SELECT CRASH_YEAR ,count(distinct CRN)   from DataWarehouse.Master.ALCO_PennDOT_Crashes_A apdca 
where ROAD_OWNER='3'
group by CRASH_YEAR;

--2018 crash data output for wprdc
SELECT * FROM DataWarehouse.Master.ALCO_PennDOT_Crashes_A apdca 
where CRASH_YEAR = '2018';

