%dw 2.0
output application/xml skipNullOn="everywhere"
ns soap http://www.w3.org/2003/05/soap-envelope
ns pub http://xmlns.oracle.com/oxp/service/PublicReportService

---
soap#Envelope:{
    soap#Body:{
	pub#runReport: {
		pub#reportRequest: {
            pub#parameterNameValues:{
                pub#item:{
                    pub#name:"P_FROM_DATE",
                    pub#values:{
                        pub#item: attributes.queryParams.startDate as DateTime as String {format:"MM-dd-yyyy HH"}
                    }
                },
                 pub#item:{
                    pub#name:"P_TO_DATE",
                    pub#values:{
                        pub#item: attributes.queryParams.endDate as DateTime as String {format:"MM-dd-yyyy HH"}
                    }
                    },
                pub#item:{
                    pub#name:"P_EXTERNAL_SYSTEM",
                    pub#values:{
                        pub#item: if(attributes.queryParams.externalSystem == "EasyAccess") "ALL" else if(attributes.queryParams.externalSystem == "Maximo" or attributes.queryParams.externalSystem == "eBuilder") "Y" else ""
                    }
                    }			
		},
        pub#reportAbsolutePath: if(attributes.requestPath contains "purchaseOrders") "/Custom/Integrations/UChicago PO Extract Report.xdo" else "/Custom/Financials/Supplier/UChicago Supplier Audit Extract.xdo",
        pub#sizeOfDataChunkDownload: "-1"
        }
    	}	}
}