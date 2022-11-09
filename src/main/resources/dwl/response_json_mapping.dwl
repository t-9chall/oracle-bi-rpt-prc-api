%dw 2.0
output application/json
---
payload map(item,index)->{
    VALUE: item."SEGMENT_VALUE" default "",
    PARENT: item."PARENT_VALUE" default "",
    DESCRIPTION: (item."DESCRIPTION" default "") replace  /[\"]/ with " ",
    ENABLED_FLAG: item."ENABLED_FLAG" default "",
    ADDITIONAL_DETAILS_1: item."ADDITIONAL_DETAILS_1" default "",
    ADDITIONAL_DETAILS_2: item."ADDITIONAL_DETAILS_2" default "",
    LAST_UPDATE_DATE: item."LAST_UPDATE_DATE" default "",
    CATEGORY: item."CATEGORY" default ""
}