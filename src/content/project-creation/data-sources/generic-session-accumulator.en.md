---
title: "Generic Session Accumulator Adapter"
date: 2021-05-07T13:00:00
lastmod: 2021-05-07T13:00:00
weight: 10021
draft: false
keywords: ["generic", "session", "accumulator", "adapter"]
aliases:
  - /de/
---

Here we describe the protocol for Generic Session Accumulators. 
The *client* is your device, while the *server* is the Lexgate Platform.

### Session Start
Endpoint: `https://api.lexgate.ch/v1/source-adapters/{authentication-id}/start`
#### Request (client)
```json
{
    "token": "044A5DE3",
    "device_id": "SomeCustomizableDeviceId",
    "device_name": "Some customizable name",
    "installation_id": "SomeCustomizableInstallationId",
    "installation_name": "Some customizable installation name"
}
```

#### Response (server)
One of:
##### Session started successfully
Status Code: `200`
```json
{
    "id": "session-start-registered",
    "message": "",
    "session_id": "5e3d1be5-7a6f-449a-ba8f-a9e85137b6e6",
    "token_tag": "Appartment 3",
    "device_tag": "Platformside Device Tag"
}
```

##### Authorization Failed
Status Code: `401`
```json
{
    "id": "charger-token-combination-not-found",
    "message": "The given charger-token combination was not found"
}
```

##### Other responses
Other response codes (like 404 or 500) are not thrown by the endpoint and therefore most likely indicate some
misconfiguration.

### Session Update
Periodically send a SessionUpdate to the server, to keep track of the consumption. Also, if the Session was ended on
platform side, this will return 401, which means, the Session should be terminated on client-side, too.

#### Request (client)
Endpoint: `https://api.lexgate.ch/v1/source-adapters/{authentication-id}/update`
```json
{
    "session_id": "5e3d1be5-7a6f-449a-ba8f-a9e85137b6e6",
    "your_first_value": 123,
    "your_second_value": 100
}
```

#### Response (server)
One of:
##### Update Successful
Status Code: `200`
```json
{
    "id": "session-update-registered"
}
```

##### Session canceled
Indicates, that the session was canceled on server side.

Status Code: `401`
```json
{
    "id": "session-ended",
    "message": "The session was canceled."
}
```

##### Other responses
Other response codes (like 404 or 500) are not thrown by the endpoint and therefore most likely indicate some
misconfiguration.

### Session End
#### Request (client)
Endpoint: `https://api.lexgate.ch/v1/source-adapters/{authentication-id}/end`
```json
{
    "session_id": "5e3d1be5-7a6f-449a-ba8f-a9e85137b6e6",
    "your_first_value": 200,
    "your_second_value": 100
}
```

#### Response (server)
##### Session ended successfully
Status Code: `200`
```json
{
    "id": "session-end-registered",
    "message": "The session was ended."
}
```

##### Other responses
Other response codes (like 404 or 500) are not thrown by the endpoint and therefore most likely indicate some
misconfiguration.

You should retry to end a session until it was successful (`200`), to make sure no data is lost.