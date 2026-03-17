# SmartKiosk-AI-AI-Inventory-Demand-Assistant-for-Micro-RetailerS

A lightweight tool that helps kiosk owners update inventory using **Voice** or **USSD**, and receive **AI-powered reorder alerts** via SMS.

---

## 🚀 Overview

Micro-retailers often lose sales due to **stockouts**, poor tracking, and lack of digital tools.  
**SmartKiosk AI** solves this by allowing kiosk owners to:

- Report stock via **Voice** (in Swahili/English/local dialect)
- Update quantities via **USSD** (*no smartphone needed*)
- Receive **SMS alerts** when stock is running low
- Automatically store and analyze data in Firestore + BigQuery

---

## ✅ Key Features

- 🎤 **Voice Inventory Reporting**  
  Shopkeeper calls, speaks naturally → Gemini transcribes + extracts product & quantity.

- 📱 **USSD Inventory Updates**  
  Simple menu for low-end phones.

- 🔔 **Smart Reorder Alerts**  
  AI predicts stockout dates and sends proactive SMS reminders.

- ☁️ **Cloud-Native**  
  Firestore, BigQuery, Cloud Run, Vertex AI (Gemini 3 Flash).

---

## 🏗 System Architecture

```mermaid
flowchart LR
    A[Kiosk Owner] -->|Voice Call| B(Africa's Talking Voice)
    A -->|USSD *xxx#| C(Africa's Talking USSD)

    B -->|Audio URL| D[SmartKiosk API]
    C -->|USSD Payload| D

    D -->|Transcribe & Extract| E[Gemini 3 Flash]
    D -->|Save Data| F[Firestore]

    F <--> G[BigQuery Analytics]

    G -->|Low Stock Detected| H[Alert Engine]
    H -->|SMS Alert| I(Africa's Talking SMS)
    I --> A

🎤 Voice Flow (Detailed Sequence)
sequenceDiagram    participant User as Kiosk Owner    participant ATVoice as AT Voice    participant API as SmartKiosk API    participant Gemini as Gemini 3 Flash    participant DB as Firestore    User->>ATVoice: Dials toll-free & speaks stock levels    ATVoice->>API: Sends webhook (audio URL)    API->>Gemini: Transcribe audio    Gemini-->>API: Transcript text    API->>Gemini: Extract {product, quantity}    Gemini-->>API: Entities JSON    API->>DB: Upsert inventory documents    API-->>ATVoice: Voice response / hangupShow more linesFirestoreGemini 3 FlashSmartKiosk APIAT VoiceKiosk OwnerFirestoreGemini 3 FlashSmartKiosk APIAT VoiceKiosk Owner#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc {font-family:"trebuchet ms", verdana, arial, sans-seriffont-size:16px;fill:rgb(51, 51, 51);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-animation-slow {stroke-dashoffset:900animation-duration:50s;animation-timing-function:linear;animation-delay:0s;animation-iteration-count:infinite;animation-direction:normal;animation-fill-mode:none;animation-play-state:running;animation-name:dash;animation-timeline:auto;animation-range-start:normal;animation-range-end:normal;stroke-linecap:round;stroke-dasharray:9, 5;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-animation-fast {stroke-dashoffset:900animation-duration:20s;animation-timing-function:linear;animation-delay:0s;animation-iteration-count:infinite;animation-direction:normal;animation-fill-mode:none;animation-play-state:running;animation-name:dash;animation-timeline:auto;animation-range-start:normal;animation-range-end:normal;stroke-linecap:round;stroke-dasharray:9, 5;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .error-icon {fill:rgb(85, 34, 34)}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .error-text {fill:rgb(85, 34, 34)stroke:rgb(85, 34, 34);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-thickness-normal {stroke-width:1px}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-thickness-thick {stroke-width:3.5px}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-pattern-solid {stroke-dasharray:0}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-thickness-invisible {stroke-width:0fill:none;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-pattern-dashed {stroke-dasharray:3}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-pattern-dotted {stroke-dasharray:2}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .marker {fill:rgb(51, 51, 51)stroke:rgb(51, 51, 51);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .marker.cross {stroke:rgb(51, 51, 51)}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc svg {font-family:"trebuchet ms", verdana, arial, sans-seriffont-size:16px;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc p {margin-top:0pxmargin-right:0px;margin-bottom:0px;margin-left:0px;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc text.actor > tspan {fill:blackstroke:none;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor-line {stroke:rgb(218, 206, 243)}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .messageLine0 {stroke-width:1.5stroke-dasharray:none;stroke:rgb(51, 51, 51);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .messageLine1 {stroke-width:1.5stroke-dasharray:2, 2;stroke:rgb(51, 51, 51);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc #arrowhead path {fill:rgb(51, 51, 51)stroke:rgb(51, 51, 51);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .sequenceNumber {fill:white}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc #sequencenumber {fill:rgb(51, 51, 51)}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc #crosshead path {fill:rgb(51, 51, 51)stroke:rgb(51, 51, 51);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .messageText {fill:rgb(51, 51, 51)stroke:none;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .labelBox {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .labelText, #mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .labelText > tspan {fill:blackstroke:none;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .loopText, #mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .loopText > tspan {fill:blackstroke:none;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .loopLine {stroke-width:2pxstroke-dasharray:2, 2;stroke:rgb(218, 206, 243);fill:rgb(218, 206, 243);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .note {stroke:rgb(170, 170, 51)fill:rgb(255, 245, 173);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .noteText, #mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .noteText > tspan {fill:blackstroke:none;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .activation0 {fill:rgb(244, 244, 244)stroke:rgb(102, 102, 102);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .activation1 {fill:rgb(244, 244, 244)stroke:rgb(102, 102, 102);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .activation2 {fill:rgb(244, 244, 244)stroke:rgb(102, 102, 102);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actorPopupMenu {position:absolute}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actorPopupMenuPanel {position:absolutefill:rgb(236, 236, 255);box-shadow:rgba(0, 0, 0, 0.2) 0px 8px 16px 0px;filter:drop-shadow(rgba(0, 0, 0, 0.4) 3px 5px 2px);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor-man line {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor-man circle, #mermaid-6b31e409-0848-45b1-832b-9705df0a82cc line {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);stroke-width:2px;}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc :root {--mermaid-font-family:"trebuchet ms",verdana,arial,sans-serif}
#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;fill:#333;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .error-icon{fill:#552222;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .error-text{fill:#552222;stroke:#552222;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-thickness-normal{stroke-width:1px;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-thickness-thick{stroke-width:3.5px;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-pattern-solid{stroke-dasharray:0;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-thickness-invisible{stroke-width:0;fill:none;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-pattern-dashed{stroke-dasharray:3;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .edge-pattern-dotted{stroke-dasharray:2;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .marker{fill:#333333;stroke:#333333;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .marker.cross{stroke:#333333;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc svg{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc p{margin:0;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc text.actor>tspan{fill:black;stroke:none;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor-line{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .messageLine0{stroke-width:1.5;stroke-dasharray:none;stroke:#333;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .messageLine1{stroke-width:1.5;stroke-dasharray:2,2;stroke:#333;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc #arrowhead path{fill:#333;stroke:#333;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .sequenceNumber{fill:white;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc #sequencenumber{fill:#333;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc #crosshead path{fill:#333;stroke:#333;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .messageText{fill:#333;stroke:none;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .labelBox{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .labelText,#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .labelText>tspan{fill:black;stroke:none;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .loopText,#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .loopText>tspan{fill:black;stroke:none;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .loopLine{stroke-width:2px;stroke-dasharray:2,2;stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .note{stroke:#aaaa33;fill:#fff5ad;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .noteText,#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .noteText>tspan{fill:black;stroke:none;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .activation0{fill:#f4f4f4;stroke:#666;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .activation1{fill:#f4f4f4;stroke:#666;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .activation2{fill:#f4f4f4;stroke:#666;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actorPopupMenu{position:absolute;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actorPopupMenuPanel{position:absolute;fill:#ECECFF;box-shadow:0px 8px 16px 0px rgba(0,0,0,0.2);filter:drop-shadow(3px 5px 2px rgb(0 0 0 / 0.4));}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor-man line{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc .actor-man circle,#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc line{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;stroke-width:2px;}#mermaid-6b31e409-0848-45b1-832b-9705df0a82cc :root{--mermaid-font-family:"trebuchet ms",verdana,arial,sans-serif;}Dials toll-free & speaks stock levelsSends webhook (audio URL)Transcribe audioTranscript textExtract {product, quantity}Entities JSONUpsert inventory documentsVoice response / hangup

📱 USSD Flow 
sequenceDiagram    participant User as Kiosk Owner    participant ATUSSD as AT USSD    participant API as SmartKiosk API    participant DB as Firestore    User->>ATUSSD: Dials *xxx#    ATUSSD->>API: Session start (phone, sessionId)    API-->>ATUSSD: Menu (Select product)    User->>ATUSSD: Choice + Quantity    ATUSSD->>API: Payload    API->>DB: Update inventory    API-->>ATUSSD: ConfirmationShow more linesFirestoreSmartKiosk APIAT USSDKiosk OwnerFirestoreSmartKiosk APIAT USSDKiosk Owner#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 {font-family:"trebuchet ms", verdana, arial, sans-seriffont-size:16px;fill:rgb(51, 51, 51);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-animation-slow {stroke-dashoffset:900animation-duration:50s;animation-timing-function:linear;animation-delay:0s;animation-iteration-count:infinite;animation-direction:normal;animation-fill-mode:none;animation-play-state:running;animation-name:dash;animation-timeline:auto;animation-range-start:normal;animation-range-end:normal;stroke-linecap:round;stroke-dasharray:9, 5;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-animation-fast {stroke-dashoffset:900animation-duration:20s;animation-timing-function:linear;animation-delay:0s;animation-iteration-count:infinite;animation-direction:normal;animation-fill-mode:none;animation-play-state:running;animation-name:dash;animation-timeline:auto;animation-range-start:normal;animation-range-end:normal;stroke-linecap:round;stroke-dasharray:9, 5;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .error-icon {fill:rgb(85, 34, 34)}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .error-text {fill:rgb(85, 34, 34)stroke:rgb(85, 34, 34);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-thickness-normal {stroke-width:1px}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-thickness-thick {stroke-width:3.5px}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-pattern-solid {stroke-dasharray:0}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-thickness-invisible {stroke-width:0fill:none;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-pattern-dashed {stroke-dasharray:3}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-pattern-dotted {stroke-dasharray:2}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .marker {fill:rgb(51, 51, 51)stroke:rgb(51, 51, 51);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .marker.cross {stroke:rgb(51, 51, 51)}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 svg {font-family:"trebuchet ms", verdana, arial, sans-seriffont-size:16px;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 p {margin-top:0pxmargin-right:0px;margin-bottom:0px;margin-left:0px;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 text.actor > tspan {fill:blackstroke:none;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor-line {stroke:rgb(218, 206, 243)}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .messageLine0 {stroke-width:1.5stroke-dasharray:none;stroke:rgb(51, 51, 51);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .messageLine1 {stroke-width:1.5stroke-dasharray:2, 2;stroke:rgb(51, 51, 51);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 #arrowhead path {fill:rgb(51, 51, 51)stroke:rgb(51, 51, 51);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .sequenceNumber {fill:white}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 #sequencenumber {fill:rgb(51, 51, 51)}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 #crosshead path {fill:rgb(51, 51, 51)stroke:rgb(51, 51, 51);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .messageText {fill:rgb(51, 51, 51)stroke:none;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .labelBox {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .labelText, #mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .labelText > tspan {fill:blackstroke:none;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .loopText, #mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .loopText > tspan {fill:blackstroke:none;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .loopLine {stroke-width:2pxstroke-dasharray:2, 2;stroke:rgb(218, 206, 243);fill:rgb(218, 206, 243);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .note {stroke:rgb(170, 170, 51)fill:rgb(255, 245, 173);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .noteText, #mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .noteText > tspan {fill:blackstroke:none;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .activation0 {fill:rgb(244, 244, 244)stroke:rgb(102, 102, 102);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .activation1 {fill:rgb(244, 244, 244)stroke:rgb(102, 102, 102);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .activation2 {fill:rgb(244, 244, 244)stroke:rgb(102, 102, 102);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actorPopupMenu {position:absolute}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actorPopupMenuPanel {position:absolutefill:rgb(236, 236, 255);box-shadow:rgba(0, 0, 0, 0.2) 0px 8px 16px 0px;filter:drop-shadow(rgba(0, 0, 0, 0.4) 3px 5px 2px);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor-man line {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor-man circle, #mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 line {stroke:rgb(218, 206, 243)fill:rgb(236, 236, 255);stroke-width:2px;}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 :root {--mermaid-font-family:"trebuchet ms",verdana,arial,sans-serif}
#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;fill:#333;}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .error-icon{fill:#552222;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .error-text{fill:#552222;stroke:#552222;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-thickness-normal{stroke-width:1px;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-thickness-thick{stroke-width:3.5px;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-pattern-solid{stroke-dasharray:0;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-thickness-invisible{stroke-width:0;fill:none;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-pattern-dashed{stroke-dasharray:3;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .edge-pattern-dotted{stroke-dasharray:2;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .marker{fill:#333333;stroke:#333333;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .marker.cross{stroke:#333333;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 svg{font-family:"trebuchet ms",verdana,arial,sans-serif;font-size:16px;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 p{margin:0;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 text.actor>tspan{fill:black;stroke:none;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor-line{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .messageLine0{stroke-width:1.5;stroke-dasharray:none;stroke:#333;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .messageLine1{stroke-width:1.5;stroke-dasharray:2,2;stroke:#333;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 #arrowhead path{fill:#333;stroke:#333;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .sequenceNumber{fill:white;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 #sequencenumber{fill:#333;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 #crosshead path{fill:#333;stroke:#333;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .messageText{fill:#333;stroke:none;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .labelBox{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .labelText,#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .labelText>tspan{fill:black;stroke:none;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .loopText,#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .loopText>tspan{fill:black;stroke:none;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .loopLine{stroke-width:2px;stroke-dasharray:2,2;stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .note{stroke:#aaaa33;fill:#fff5ad;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .noteText,#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .noteText>tspan{fill:black;stroke:none;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .activation0{fill:#f4f4f4;stroke:#666;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .activation1{fill:#f4f4f4;stroke:#666;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .activation2{fill:#f4f4f4;stroke:#666;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actorPopupMenu{position:absolute;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actorPopupMenuPanel{position:absolute;fill:#ECECFF;box-shadow:0px 8px 16px 0px rgba(0,0,0,0.2);filter:drop-shadow(3px 5px 2px rgb(0 0 0 / 0.4));}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor-man line{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 .actor-man circle,#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 line{stroke:hsl(259.6261682243, 59.7765363128%, 87.9019607843%);fill:#ECECFF;stroke-width:2px;}#mermaid-77c9c841-d1d1-412e-93fb-53250e9294a3 :root{--mermaid-font-family:"trebuchet ms",verdana,arial,sans-serif;}Dials *xxxSession start (phone, sessionId)Menu (Select product)Choice + QuantityPayloadUpdate inventoryConfirmation

🧰 Tech Stack

Africa’s Talking: Voice, USSD, SMS
Google Cloud: Firestore, BigQuery, Cloud Run, Cloud Scheduler
Vertex AI: Gemini 3 Flash (transcription + extraction)
Backend: Python (FastAPI)
Infra: Docker, ngrok for dev

👩‍💻 Creator
Cheptoo Faith – Agentic AI Builder

