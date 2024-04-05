USE SWIGGY;
SELECT * FROM SWIGGY;

#1 RESTAURANT HAVING RATE MORE THAN 4.5
SELECT COUNT(DISTINCT RESTAURANT_NAME)AS RESTAURANTS FROM SWIGGY WHERE RATING>4.5;


#2 HIGHEST NO. OF RESTAURANT IN CITY
SELECT  CITY ,COUNT(DISTINCT RESTAURANT_NAME) AS RESTAURANT FROM SWIGGY
GROUP BY CITY
ORDER BY RESTAURANT DESC
limit 1;

#3 NO. OF RESTAURANT HAVING PIZZA IN THERE NAME
SELECT COUNT( DISTINCT RESTAURANT_NAME) AS RESTAURANT FROM SWIGGY WHERE RESTAURANT_NAME LIKE '%PIZZA%';

#4 COMMON CUISINES AMONG RESTAURANT
SELECT CUISINE,COUNT(CUISINE)AS CUISINE_COUNT FROM SWIGGY
GROUP BY CUISINE
ORDER BY CUISINE_COUNT DESC
LIMIT 1;

 #5 AVG RATING OF RESTAURANT IN EACH CITY
  SELECT CITY,AVG(RATING) AS AVG_RATING FROM SWIGGY
 GROUP BY CITY;

#6 WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
SELECT DISTINCT RESTAURANT_NAME,MENU_CATEGORY,MAX(PRICE) AS HIGHEST_PRICE FROM SWIGGY WHERE MENU_CATEGORY='RECOMMENDED'
GROUP BY RESTAURANT_NAME,MENU_CATEGORY;

#7 FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE.
	SELECT DISTINCT RESTAURANT_NAME,cost_per_person FROM swiggy WHERE CUISINE!='INDIAN'
	ORDER BY cost_per_person DESC 
	LIMIT 5;

#8 FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL RESTAURANTS TOGETHER
select distinct restaurant_name ,avg(cost_per_person) as avg_cost from swiggy
group by restaurant_name having avg(cost_per_person)>
(select avg(cost_per_person) from swiggy)

#9 RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES
select s1.restaurant_name,s1.city,s2.city from swiggy s1 join swiggy s2
on s1.restaurant_name=s2.restaurant_name
where s1.city!= s2.city;
 
 #10 WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
select distinct restaurant_name,count(item) as no_of_items,menu_category from swiggy
where menu_category='main course'
group by  restaurant_name

#11 LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME.
select distinct restaurant_name from swiggy 
group by restaurant_name
having count(*)=sum(case when veg_or_nonveg='veg' then 1 else 0 end)
order by restaurant_name asc

#12 WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
select distinct restaurant_name,avg(price) as lowest_avg_price from swiggy
group by restaurant_name
order by lowest_avg_price asc
limit 1

#13 WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
select distinct restaurant_name,count( distinct menu_category) as categories from swiggy
group by restaurant_name
order by categories desc
limit 5

#14 WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
select distinct restaurant_name,(count(case when veg_or_nonveg='non-veg' then 1 end)*100 /count(*)) as non_veg_percent from swiggy
group by restaurant_name
order by non_veg_percent desc
limit 1


