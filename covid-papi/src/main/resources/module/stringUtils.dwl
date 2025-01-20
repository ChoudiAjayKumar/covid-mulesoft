%dw 2.0

import * from dw::core::Strings


//Converts string to pascal case

fun toPascalCase(str :String): String =
	upper(str[0]) ++ substring(str,1,sizeOf(str))
	
fun addCustomSuffix(str: String): String =
	str ++ "__c"	