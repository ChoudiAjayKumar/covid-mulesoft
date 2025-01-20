%dw 2.0
output application/json skipNullOn = "everywhere"

type inDateFormat =  Date {format: "dd/MM/yyyy"}
type outDateFormat =  Date {format: "yyyy-MM-dd"}
var dose = payload.dose default "0"

---

{
	"Id": payload.caseId,
	"Source__c": payload.source,
	"CaseType__c": payload.caseType,
	"FirstName__c": payload.firstName,
	"LastName__c": payload.lastName,
	"Phone__c": payload.phone,
	"Email__c": payload.email,
    ("DateOfBirth__c": payload.dateOfBirth as inDateFormat as outDateFormat)if(!isEmpty(payload.dateOfBirth)),
	"AadhaarId__c": payload.aadhaarId,
	"NationalIdType__c": payload.nationalIdType,
	"StreetAddress__c": payload.address.streetAddress,
	"City__c": payload.address.city,
	"State__c": payload.address.state,
	"Pincode__c": payload.address.pincode,
	"Country__c": payload.address.country,
	("FirstDoseDate__c": payload.firstDoseDate as inDateFormat as outDateFormat)if(!isEmpty(payload.firstDoseDate)),
	("SecondDoseDate__c": payload.secondDoseDate as inDateFormat as outDateFormat)if(!isEmpty(payload.secondDoseDate)),
	"Dose__c": dose
} 

