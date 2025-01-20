%dw 2.0
output application/json
---

{
    "Id": payload.items[0].payload.id
}