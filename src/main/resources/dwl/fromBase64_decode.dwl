%dw 2.0
import * from dw::core::Binaries     
output application/xml
var v = fromBase64(payload.body.runReportResponse[0].reportBytes)
---
read(v, "application/xml")