<img width="4032" height="1841" alt="Mermaid-preview" src="https://github.com/user-attachments/assets/a9e530cb-2e68-477f-aeee-a6c8854f7891" />
<img width="3991" height="2268" alt="Mermaid-preview (1)" src="https://github.com/user-attachments/assets/90cda6cc-b196-4335-9aba-089a21962b44" />
# SmartKiosk-AI-AI-Inventory-Demand-Assistant-for-Micro-Retailers

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


