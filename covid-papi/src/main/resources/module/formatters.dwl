%dw 2.0

import * from module::stringUtils

//To convert input object to Salesforce compatible object format

fun toSalesforceFormat(obj: Object): Object =

	obj mapObject(value, key) -> {

  		(addCustomSuffix(toPascalCase((key)))): value
}

//To change date format from dd/MM/yyyy to yyyy-MM-dd

fun dateFormat(str: String): Date = 
	
	(str as Date {format: "dd/MM/yyyy"}) as Date {format: "yyyy-MM-dd"}
	


