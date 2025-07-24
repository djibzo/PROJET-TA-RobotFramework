BASE_URL=   "https://api.sandbox.ebay.com/"
HEADERS=    "{'Content-Type': 'application/json'}"
order_id=   "1234567890"
fulfillment_id="0987654321"
wrong_order_id=   "00000"
wrong_fulfillment_id="000000"
body={
  "lineItems": [
    {
      "lineItemId": "string",
      "quantity": "integer"
    }
  ],
  "shippedDate": "string",
  "shippingCarrierCode": "string",
  "trackingNumber": "string"
}