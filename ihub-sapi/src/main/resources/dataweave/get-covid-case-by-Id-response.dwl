%dw 2.0
output application/json  skipNullOn = "everywhere"
---

{
	"Id": payload[0].Id,
	"Source__c": payload[0].Source__c,
	"CaseType__c": payload[0].CaseType__c,
	"FirstName__c": payload[0].FirstName__c,
	"LastName__c": payload[0].LastName__c,
	"Phone__c": payload[0].Phone__c,
	"Email__c": payload[0].Email__c,
	"DateOfBirth__c": payload[0].DateOfBirth__c,
	"AadhaarId__c": payload[0].AadhaarId__c,
	"NationalIdType__c": payload[0].NationalIdType__c,
	"StreetAddress__c": payload[0].StreetAddress__c,
	"City__c": payload[0].City__c,
	"State__c": payload[0].State__c,
	"Pincode__c": payload[0].Pincode__c,
	"Country__c": payload[0].Country__c,
	"FirstDoseDate__c": payload[0].FirstDoseDate__c,
	"SecondDoseDate__c": payload[0].SecondDoseDate__c,
	"Dose__c": payload[0].Dose__c,	
	"CreateDate__c": payload[0].CreateDate__c,
	"UpdateDate__c": payload[0].UpdateDate__c
}	