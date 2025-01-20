%dw 2.0

//IN - array of all casetypes or doses; OUT - array of specific casetype or dose 
fun filterByCaseOrDose(caseOrDoseType: String, caseOrDoseTypes: Array): Array =
    caseOrDoseTypes filter $ == caseOrDoseType

//Finds the count of specific case or dose 
fun CasesOrDosesTotal (specificCasesOrDoses: Array): String =
    (sizeOf(specificCasesOrDoses)) as String
