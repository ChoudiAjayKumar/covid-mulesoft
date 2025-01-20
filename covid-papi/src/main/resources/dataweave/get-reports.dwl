%dw 2.0
import * from module::businessLogic
output application/json

var caseTypes = ["POSITIVE", "RECOVERED", "DEATH"]
var doses = ["0", "1", "2"]


//Setting payload based on if stateQueryParam being sent or not
var inputs = if(vars.stateQueryParam != null) {
     
     "record": payload filter(item) ->  item.State__c == vars.stateQueryParam
}else{
    
    "groupStatewise": valuesOf(payload groupBy(item) -> item.State__c)
}
---
if(vars.stateQueryParam != null)
{
    "state": inputs.record[0].State__c,
    "totalPositive": CasesOrDosesTotal(filterByCaseOrDose(caseTypes[0],inputs.record.*CaseType__c)),
    "totalRecovered": CasesOrDosesTotal(filterByCaseOrDose(caseTypes[1],inputs.record.*CaseType__c)),
    "totalDeath": CasesOrDosesTotal(filterByCaseOrDose(caseTypes[2], inputs.record.*CaseType__c)),
    "totalUnvaccinated": CasesOrDosesTotal(filterByCaseOrDose(doses[0], inputs.record.*Dose__c)),
    "totalFirstDose": CasesOrDosesTotal(filterByCaseOrDose(doses[1], inputs.record.*Dose__c)),
    "totalSecondDose": CasesOrDosesTotal(filterByCaseOrDose(doses[2],inputs.record.*Dose__c))
}else
    inputs.groupStatewise map(key) -> {
        "state": key[0].State__c,
        "totalPositive": CasesOrDosesTotal(filterByCaseOrDose(caseTypes[0],key.*CaseType__c)),
        "totalRecovered": CasesOrDosesTotal(filterByCaseOrDose(caseTypes[1],key.*CaseType__c)),
        "totalDeath": CasesOrDosesTotal(filterByCaseOrDose(caseTypes[2], key.*CaseType__c)),
        "totalUnvaccinated": CasesOrDosesTotal(filterByCaseOrDose(doses[0], key.*Dose__c)),
        "totalFirstDose": CasesOrDosesTotal(filterByCaseOrDose(doses[1], key.*Dose__c)),
        "totalSecondDose": CasesOrDosesTotal(filterByCaseOrDose(doses[2],key.*Dose__c))
}        
