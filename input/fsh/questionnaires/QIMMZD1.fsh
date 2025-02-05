Instance:     QIMMZD1
InstanceOf:   sdc-questionnaire-extr-smap
Title:        "IMMZ.D1.Capture or update client history"
Description:  "Questionnaire for IMMZ.D1.Capture or update client history"
Usage: #definition

* version = "2025"
* status = #draft
* subjectType = #Patient
* language = #en
* contained[+] = IMMZ.D.DE232
* contained[+] = IMMZ.Z.VS
* contained[+] = IMMZ.Z.DE10

* insert Question(typeOfMeningococcalDose, Type of meningococcal dose, choice, true, false)
* item[=]
  * answerValueSet = Canonical(IMMZ.D.DE232)
  * code[+] = IMMZ.D#DE232
  * extension[+]
    * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
    * valueExpression
      * name = "Meningococcal"
      * language = #text/fhirpath
      * expression = "%resource.item.where(linkId='vaccineType').answer.value.memberOf('http://smart.who.int/immunizations/ValueSet/IMMZ.Z.DE10')"
* insert Question(ageInMonthsWhenClientReceivedFirstMeningococcalDose, Age in months when client received first meningococcal dose, decimal, true, false)
* item[=]
  * code[+] = IMMZ.D#DE236
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueDecimal = 0.0
  * extension[+]
    * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression"
    * valueExpression
      * name = "Meningococcal"
      * language = #text/fhirpath
      * expression = "%resource.item.where(linkId='vaccineType').answer.value.memberOf('http://smart.who.int/immunizations/ValueSet/IMMZ.Z.DE10')"
* insert Question(vaccineType, Vaccine type, choice, true, true)
* item[=]
  * answerValueSet = Canonical(IMMZ.Z.VS)
  * code[+] = IMMZ.D#DE19
  * code[+] = $LNC#39236-5 "Vaccine code (CPT [Current Procedural Terminology]) CPHS (Children's Preventative Health System)"
  * code[+] = $SCT#787859002 "Vaccine product (medicinal product)"
