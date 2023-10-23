import 'package:fhir/r4.dart';
import '../../../../src.dart';

class FakePatientsRepository extends PatientsRepository {
  final _patientsState = InMemoryStore<Patients>(Patients());

  @override
  Future<void> getPatients() async {
    final oldList = _patientsState.value;
    for (final entry in fakePatientsBundle.entry ?? <BundleEntry>[]) {
      if (entry.resource is Patient) {
        oldList.addOrUpdatePatient(entry.resource as Patient);
      }
    }
    _patientsState.value = oldList;
  }

  @override
  Patients get list => _patientsState.value;

  @override
  Stream<Patients> patientsStateChanges() => _patientsState.stream;

  void dispose() => _patientsState.close();
}

final fakePatientsBundle = Bundle.fromJson({
  "resourceType": "Bundle",
  "id": "092df8b1-7a78-4cae-8c4b-d2c83714a03a",
  "meta": {"lastUpdated": "2023-09-25T18:22:10.260+00:00"},
  "type": "searchset",
  "total": 57,
  "link": [
    {
      "relation": "self",
      "url": "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient"
    },
    {
      "relation": "next",
      "url":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4?_getpages=8cdff81e-6b04-443f-aef4-33c5bec5885f&_getpagesoffset=10&_count=10&_bundletype=searchset"
    }
  ],
  "entry": [
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/e11679b1-0c34-4445-a332-a94627ced536",
      "resource": {
        "resourceType": "Patient",
        "id": "e11679b1-0c34-4445-a332-a94627ced536",
        "meta": {"lastUpdated": "2023-09-15T00:40:47.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>e11679b1-0c34-4445-a332-a94627ced536</td></tr><tr><td>Identifier:</td><td><div>100000Y</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Betty <b>WILLIAMS </b></td></tr><tr><td>Gender:</td><td>MALE</td></tr><tr><td>Birth Date:</td><td>15/03/1971</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City5311 </span><span>State5311 </span><span>Country5311 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "591f6438-2bb5-441c-882f-4c9b25fbbb0d",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100000Y"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "1aaa1172-1201-4fb3-af66-c2050d784a24",
            "family": "Williams",
            "given": ["Betty"]
          }
        ],
        "gender": "male",
        "birthDate": "1971-03-15",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "ef0fc5e6-fd36-4f21-acc3-ba8ac279c99b",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address15311"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City5311",
            "state": "State5311",
            "postalCode": "94773",
            "country": "Country5311"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/a068df42-d6c6-464a-884f-1f7a1cb0e615",
      "resource": {
        "resourceType": "Patient",
        "id": "a068df42-d6c6-464a-884f-1f7a1cb0e615",
        "meta": {"lastUpdated": "2023-09-15T00:39:04.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>a068df42-d6c6-464a-884f-1f7a1cb0e615</td></tr><tr><td>Identifier:</td><td><div>100001W</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Susan <b>LOPEZ </b></td></tr><tr><td>Gender:</td><td>OTHER</td></tr><tr><td>Birth Date:</td><td>15/05/1969</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City0384 </span><span>State0384 </span><span>Country0384 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "54c31f5d-5a49-44f8-9260-5c1e967f4594",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100001W"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "74231407-707a-49de-88b4-bae752672224",
            "family": "Lopez",
            "given": ["Susan"]
          }
        ],
        "gender": "other",
        "birthDate": "1969-05-15",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "2dd1bcdf-5e97-4f97-b96b-3c97c486b14b",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address10384"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City0384",
            "state": "State0384",
            "postalCode": "72032",
            "country": "Country0384"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/f7555d5e-d529-4e1a-bd20-578a4b5e1982",
      "resource": {
        "resourceType": "Patient",
        "id": "f7555d5e-d529-4e1a-bd20-578a4b5e1982",
        "meta": {"lastUpdated": "2023-09-15T00:37:03.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>f7555d5e-d529-4e1a-bd20-578a4b5e1982</td></tr><tr><td>Identifier:</td><td><div>100002U</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Barbara <b>MILLER </b></td></tr><tr><td>Gender:</td><td>FEMALE</td></tr><tr><td>Birth Date:</td><td>07/06/1935</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City2253 </span><span>State2253 </span><span>Country2253 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "ed7f00e7-0acc-43dd-b983-325008993b7b",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100002U"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "da54f126-cb15-48c8-894a-b845c9f458d2",
            "family": "Miller",
            "given": ["Barbara"]
          }
        ],
        "gender": "female",
        "birthDate": "1935-06-07",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "5578afda-76c5-41cd-9c0a-90495d5495e0",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address12253"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City2253",
            "state": "State2253",
            "postalCode": "85055",
            "country": "Country2253"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/a49ddb30-83c6-4b1c-bcd9-a61bf93d3a5a",
      "resource": {
        "resourceType": "Patient",
        "id": "a49ddb30-83c6-4b1c-bcd9-a61bf93d3a5a",
        "meta": {"lastUpdated": "2023-09-14T03:34:09.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>a49ddb30-83c6-4b1c-bcd9-a61bf93d3a5a</td></tr><tr><td>Identifier:</td><td><div>100003R</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Grace <b>GARCIA </b></td></tr><tr><td>Gender:</td><td>FEMALE</td></tr><tr><td>Birth Date:</td><td>26/01/1956</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City2976 </span><span>State2976 </span><span>Country2976 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "137b4f26-48b7-4d49-b959-c2ffd8d097bf",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100003R"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "a7df6c14-dcb5-48be-9c0b-fcbb2ecbb71f",
            "family": "Garcia",
            "given": ["Grace"]
          }
        ],
        "gender": "female",
        "birthDate": "1956-01-26",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "f6f13fad-4788-4951-bea6-5cbc50a88158",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address12976"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City2976",
            "state": "State2976",
            "postalCode": "67687",
            "country": "Country2976"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/0d28b23f-fd9b-4a27-87c3-ba078b452c7b",
      "resource": {
        "resourceType": "Patient",
        "id": "0d28b23f-fd9b-4a27-87c3-ba078b452c7b",
        "meta": {"lastUpdated": "2023-09-15T00:39:53.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>0d28b23f-fd9b-4a27-87c3-ba078b452c7b</td></tr><tr><td>Identifier:</td><td><div>100004N</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Mark <b>SMITH </b></td></tr><tr><td>Gender:</td><td>FEMALE</td></tr><tr><td>Birth Date:</td><td>13/06/2012</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City8718 </span><span>State8718 </span><span>Country8718 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "cc0a10b2-17b7-4a64-838e-2e8a905616a0",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100004N"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "b89013e6-5aae-427f-a108-d6dd630e6508",
            "family": "Smith",
            "given": ["Mark"]
          }
        ],
        "gender": "female",
        "birthDate": "2012-06-13",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "38d5eeb0-f451-4637-be0f-744b7ef864c5",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address18718"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City8718",
            "state": "State8718",
            "postalCode": "88827",
            "country": "Country8718"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/d589a5e6-f429-42db-85a9-47d8d49ad5b4",
      "resource": {
        "resourceType": "Patient",
        "id": "d589a5e6-f429-42db-85a9-47d8d49ad5b4",
        "meta": {"lastUpdated": "2023-09-15T00:41:26.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>d589a5e6-f429-42db-85a9-47d8d49ad5b4</td></tr><tr><td>Identifier:</td><td><div>100005L</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> James <b>MARTINEZ </b></td></tr><tr><td>Gender:</td><td>FEMALE</td></tr><tr><td>Birth Date:</td><td>10/04/1962</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City0737 </span><span>State0737 </span><span>Country0737 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "f79ab670-e170-4f0d-b7d3-2540606b5c5d",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100005L"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "f59c4583-48c9-4bc5-b18d-fdffc75accfa",
            "family": "Martinez",
            "given": ["James"]
          }
        ],
        "gender": "female",
        "birthDate": "1962-04-10",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "0ae90aa3-d931-4011-a9c9-b02307943783",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address10737"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City0737",
            "state": "State0737",
            "postalCode": "95293",
            "country": "Country0737"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/37521ac9-dd5d-4032-a8ae-a858eeab76b9",
      "resource": {
        "resourceType": "Patient",
        "id": "37521ac9-dd5d-4032-a8ae-a858eeab76b9",
        "meta": {"lastUpdated": "2023-09-12T16:50:25.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>37521ac9-dd5d-4032-a8ae-a858eeab76b9</td></tr><tr><td>Identifier:</td><td><div>100006J</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Michael <b>TURNER </b></td></tr><tr><td>Gender:</td><td>MALE</td></tr><tr><td>Birth Date:</td><td>12/04/1986</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City6372 </span><span>State6372 </span><span>Country6372 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "6fdcfb28-2957-40e7-a18a-7fe772885fc4",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100006J"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "1ad91ef2-78c8-418b-b894-f9dd070a43a8",
            "family": "Turner",
            "given": ["Michael"]
          }
        ],
        "gender": "male",
        "birthDate": "1986-04-12",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "b1bb344e-95b7-479f-8d21-e050e79e5b9a",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address16372"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City6372",
            "state": "State6372",
            "postalCode": "51659",
            "country": "Country6372"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/01814b9a-f75e-4422-850c-6d9ce83dc746",
      "resource": {
        "resourceType": "Patient",
        "id": "01814b9a-f75e-4422-850c-6d9ce83dc746",
        "meta": {"lastUpdated": "2023-09-12T16:50:25.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>01814b9a-f75e-4422-850c-6d9ce83dc746</td></tr><tr><td>Identifier:</td><td><div>100007G</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Kevin <b>BROWN </b></td></tr><tr><td>Gender:</td><td>MALE</td></tr><tr><td>Birth Date:</td><td>22/01/1967</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City3058 </span><span>State3058 </span><span>Country3058 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "8cbaacad-4d11-4fef-bb58-97924bb77ea6",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100007G"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "85778a93-b120-46af-825f-eafd316dc45c",
            "family": "Brown",
            "given": ["Kevin"]
          }
        ],
        "gender": "male",
        "birthDate": "1967-01-22",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "6869380c-c391-436e-be83-55ab0d6d572b",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address13058"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City3058",
            "state": "State3058",
            "postalCode": "17761",
            "country": "Country3058"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/21569fce-1cfb-43cc-bfb6-707ab43433a2",
      "resource": {
        "resourceType": "Patient",
        "id": "21569fce-1cfb-43cc-bfb6-707ab43433a2",
        "meta": {"lastUpdated": "2023-09-15T00:43:36.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>21569fce-1cfb-43cc-bfb6-707ab43433a2</td></tr><tr><td>Identifier:</td><td><div>100008E</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Joshua <b>JOHNSON </b></td></tr><tr><td>Gender:</td><td>FEMALE</td></tr><tr><td>Birth Date:</td><td>25/09/2018</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City6442 </span><span>State6442 </span><span>Country6442 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "648302e1-976e-4839-8053-3a378d89aded",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100008E"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "92dbb47d-e47b-478d-8573-40962bf1f19a",
            "family": "Johnson",
            "given": ["Joshua"]
          }
        ],
        "gender": "female",
        "birthDate": "2018-09-25",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "3c1416eb-d28b-4907-9e3d-ad51041f577c",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address16442"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City6442",
            "state": "State6442",
            "postalCode": "20839",
            "country": "Country6442"
          }
        ]
      }
    },
    {
      "fullUrl":
          "http://dursamrscit.services.brown.edu/openmrs/ws/fhir2/R4/Patient/aecc9664-7667-48e5-802b-20e013586939",
      "resource": {
        "resourceType": "Patient",
        "id": "aecc9664-7667-48e5-802b-20e013586939",
        "meta": {"lastUpdated": "2023-09-12T16:50:25.000+00:00"},
        "text": {
          "status": "generated",
          "div":
              "<div xmlns=\"http://www.w3.org/1999/xhtml\"><table class=\"hapiPropertyTable\"><tbody><tr><td>Id:</td><td>aecc9664-7667-48e5-802b-20e013586939</td></tr><tr><td>Identifier:</td><td><div>100009C</div></td></tr><tr><td>Active:</td><td>true</td></tr><tr><td>Name:</td><td> Emily <b>HILL </b></td></tr><tr><td>Gender:</td><td>FEMALE</td></tr><tr><td>Birth Date:</td><td>01/11/2000</td></tr><tr><td>Deceased:</td><td>false</td></tr><tr><td>Address:</td><td><span>City9711 </span><span>State9711 </span><span>Country9711 </span></td></tr></tbody></table></div>"
        },
        "identifier": [
          {
            "id": "22565154-db10-40c2-bdc6-80456335292b",
            "extension": [
              {
                "url":
                    "http://fhir.openmrs.org/ext/patient/identifier#location",
                "valueReference": {
                  "reference": "Location/736b08f9-94d6-4b50-ad58-6bc69b9cbfb8",
                  "type": "Location",
                  "display": "Ward 50"
                }
              }
            ],
            "use": "official",
            "type": {
              "coding": [
                {"code": "05a29f94-c0ed-11e2-94be-8c13b969e334"}
              ],
              "text": "OpenMRS ID"
            },
            "value": "100009C"
          }
        ],
        "active": true,
        "name": [
          {
            "id": "64d2cf02-60ce-4def-98ee-1e973db6da05",
            "family": "Hill",
            "given": ["Emily"]
          }
        ],
        "gender": "female",
        "birthDate": "2000-11-01",
        "deceasedBoolean": false,
        "address": [
          {
            "id": "a9d52e15-14d0-4418-a218-64d6e9beacf9",
            "extension": [
              {
                "url": "http://fhir.openmrs.org/ext/address",
                "extension": [
                  {
                    "url": "http://fhir.openmrs.org/ext/address#address1",
                    "valueString": "Address19711"
                  }
                ]
              }
            ],
            "use": "home",
            "city": "City9711",
            "state": "State9711",
            "postalCode": "37861",
            "country": "Country9711"
          }
        ]
      }
    }
  ]
});
