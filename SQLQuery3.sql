SELECT * FROM DBO.InsurancePolicy;
select sum(Number_of_Policies), sum(Total_Claim_Amount), Policy_Type, Marital_Status from DBO.InsurancePolicy 
INNER JOIN DBO.CustomerClaim
ON DBO.InsurancePolicy.Education=DBO.CustomerClaim.Education;
select State, Number_of_Policies as "POLICY REVENUE", Total_Claim_Amount as "CLAIMS REVENUE" from dbo.InsurancePolicy
INNER JOIN dbo.CustomerClaim
ON dbo.InsurancePolicy.Education=dbo.CustomerClaim.Education;

select sum(Number_of_Policies) as "Written Policies", sum(Total_Claim_Amount) as "Written Claims", Policy_Type from dbo.InsurancePolicy
Group by Policy_Type;
select distinct State, Employment_Status, Coverage, Sales_Channel from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.InsurancePolicy.Education=dbo.CustomerClaim.Education
where Employment_Status='Employed' and Sales_Channel='Agent'
order by State asc;
select distinct State, Employment_Status, Coverage, Income, Sales_Channel from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.InsurancePolicy.Education=dbo.CustomerClaim.Education
where Employment_Status='Employed' and Sales_Channel='Agent'
order by State asc;
select State, Coverage, Policy_Type, Policy, (sum(Total_Claim_Amount)/sum(Number_of_Policies)) as "Claim Settlement Ratio"
from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.CustomerClaim.Education=dbo.InsurancePolicy.Education
Group by State, Coverage, Policy_Type, Policy
Order by 3,4;

select State, Number_of_Policies as "POLICY REVENUE", Total_Claim_Amount as "CLAIMS REVENUE" from dbo.InsurancePolicy
JOIN dbo.CustomerClaim
ON dbo.InsurancePolicy.Education=dbo.CustomerClaim.Education where Employment_Status='Employed';

select State, Coverage, Employment_Status, Gender, Marital_Status,(Number_of_Policies)*(Monthly_Premium_Auto) as "Insurance Premium", 
Policy_Type from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.CustomerClaim.Education=dbo.InsurancePolicy.Education
Group by Employment_Status, State, Coverage, Gender, Marital_Status,Number_of_Policies, Monthly_Premium_Auto, Policy_Type
order by 1,7;

JOIN(select sum(Number_of_Policies) as "Written Policies", sum(Total_Claim_Amount) as "Written Claims", Policy_Type from dbo.InsurancePolicy
Group by Policy_Type);
select State, Employment_Status, Coverage, Income, Sales_Channel from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.InsurancePolicy.Education=dbo.CustomerClaim.Education
order by State;
create view InsuranceCoverage as 
select Distinct State, Coverage, Policy_Type, Marital_Status, sum(Number_of_Policies)as "Written Policies", sum(Total_Claim_Amount) as "Written Claims" from dbo.InsurancePolicy 
JOIN dbo.CustomerClaim
ON dbo.InsurancePolicy.Education=dbo.CustomerClaim.Education
Group by State, Coverage, Policy_Type, Marital_Status, Number_of_Policies, Total_Claim_Amount
--order by 2,3;
create view PremiumPackage as 
select Distinct State, Coverage, Employment_Status, Gender, Marital_Status,(Number_of_Policies)*(Monthly_Premium_Auto) as "Insurance Premium", 
Policy_Type from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.CustomerClaim.Education=dbo.InsurancePolicy.Education
Group by Employment_Status, State, Coverage, Gender, Marital_Status,Number_of_Policies, Monthly_Premium_Auto, Policy_Type
--order by 1,7;
create view ClaimSettlement as 
select State, Coverage, Policy_Type, Policy, (sum(Total_Claim_Amount)/sum(Number_of_Policies)) as "Claim Settlement Ratio"
from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.CustomerClaim.Education=dbo.InsurancePolicy.Education
Group by State, Coverage, Policy_Type, Policy
--Order by 3,4;

create view CustomerData as 
select Employment_Status, State, Coverage, Gender, Marital_Status,(Income/Monthly_Premium_Auto) as "Complementary Income",
Policy_Type from dbo.CustomerClaim
JOIN dbo.InsurancePolicy
ON dbo.CustomerClaim.Education=dbo.InsurancePolicy.Education
Group by Employment_Status, State, Coverage, Gender, Marital_Status, Income, Monthly_Premium_Auto, Policy_Type
--order by 1,2;
select * from ClaimSettlement;
select * from CustomerData;
select * from InsuranceCoverage;
select * from PremiumPackage;
