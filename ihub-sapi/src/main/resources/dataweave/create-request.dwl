%dw 2.0
output application/java
---

{
	"Source__c": payload.Source__c,
	"CaseType__c": payload.CaseType__c,
	"FirstName__c": payload.FirstName__c,
	"LastName__c": payload.LastName__c,
	"Phone__c": payload.Phone__c,
	"Email__c": payload.Email__c,
	"DateOfBirth__c": payload.DateOfBirth__c as Date,
	"AadhaarId__c": payload.AadhaarId__c,
	"NationalIdType__c": payload.NationalIdType__c,
	"StreetAddress__c": payload.StreetAddress__c,
	"City__c": payload.City__c,
	"State__c": payload.State__c,
	"Pincode__c": payload.Pincode__c,
	"Country__c": payload.Country__c,
	("FirstDoseDate__c": payload.FirstDoseDate__c as Date)if(!isEmpty(payload.FirstDoseDate__c)),
	"Dose__c": payload.Dose__c
}++
{
	"CreateDate__c": now() as Date
}