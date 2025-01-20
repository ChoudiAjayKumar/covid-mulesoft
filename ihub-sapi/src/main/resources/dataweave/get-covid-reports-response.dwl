%dw 2.0
output application/json 
---

payload map (item) -> {
	"State__c": item.State__c,
	"CaseType__c": item.CaseType__c,
	"Dose__c": item.Dose__c
}