%dw 2.0
output application/json skipNullOn = "everywhere"

type inDateFormat =  Date {format: "yyyy-MM-dd"}
type outDateFormat =  Date {format: "dd/MM/yyyy"}
---

{   
    "caseId": payload.Id,
    "source": payload.Source__c,
    "caseType": payload.CaseType__c,
    "firstName": payload.FirstName__c,
    "lastName": payload.LastName__c,
    "phone": payload.Phone__c,
    "email": payload.Email__c,
    "dateOfBirth": payload.DateOfBirth__c as inDateFormat as outDateFormat,
    "aadhaarId": payload.AadhaarId__c, 
    "nationalIdType": payload.NationalIdType__c,
    "address":{
          "streetAddress": payload.StreetAddress__c,
          "city": payload.City__c,
          "state": payload.State__c,
          "pincode": payload.Pincode__c,
          "country": payload.Country__c
    },
    ("firstDoseDate": payload.FirstDoseDate__c as inDateFormat as outDateFormat)if(!isEmpty(payload.FirstDoseDate__c)),
    ("secondDoseDate": payload.SecondDoseDate__c as inDateFormat as outDateFormat)if(!isEmpty(payload.SecondDoseDate__c)),
    "dose": payload.Dose__c,
    "createDate": payload.CreateDate__c as inDateFormat as outDateFormat,
    ("updateDate": payload.UpdateDate__c as inDateFormat as outDateFormat)if(!isEmpty(payload.UpdateDate__c))
 }
