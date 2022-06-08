# TerraRTiOS

It's finally here: The realtime streaming framework for iOS through Terra!!!!

## A Worthy Note

This packages uses Bluetooth Low Energy (BLE) and Bluetooth services. Thus only devices that support these can use the library! These will be requested as permissions upon initialisation of the package.

The package streams real time data through **Websockets** and is hosted by us! You can learn more about it here on our [docs](https://docs.tryterra.co/reference/using-the-websocket-api).

The data streamed to your websocket connection (as a developer) will follow the following format:

```json
{
  "op":5,
  "d":
    {
      "ts": <String> (In ISOFormat Date Form)
       "val": <Double>
    },
    "uid": <String> (user ID)
    "seq": <Int>,
    "t": <String> (Datatype name: Exactly the same as the name of `DataTypes` enum)
}
```

## Installation

You can use Swift Package Manager and add this github repo as a dependency to your project! You must then include this as a framework under 
`General -> Frameworks, Libraries, and Embedded Content`. 

You may now run `import TerraRTiOS`!

You will also need `Privacy - Bluetooth Always Usage Description` under your `info.plist` file. 

## Usage

The package is controlled mainly by a class called `TerraRT`

You may initialise as such:

```swift
terraRT = TerraRT(devId: <YOUR DEV ID>, xAPIKey: <YOUR XAPIKEY> , userId: <YOUR TERRA USER ID>, referenceId: <YOUR REFERENCE ID>
```

**Arguments**

- `devId`: String -> Your Terra Dev ID
- `xAPIKey`: String -> Your corresponding X-API-Key for that Dev ID
- `userId`: String -> An already authenticated user ID from Terra
- (OPTIONAL) `referenceId`: String -> A reference ID that you may use to identify a user from your end.

After the initialisation, you may now start initialising different connections!

This can be done as:

```swift
terraRT.initConnection(type: Connections)
```

**Arguments**

- `type`: Connections -> An Enum signifying the connection to make.

Certain type of connection will require a Bluetooth Connection (`Connections.BLE`). To initialise a bluetooth connection, you can run:

```swift
let terraBLEWidget: TerraBLEWidget = terraRT.startBluetoothScan(type: Connections, callback: @escaping (Bool) -> Void)
```

This will return a SwiftUI View! You can then display this to your user, and have them scan, and connect to a BLE Device! 

**Arguments**

- `type`: Connections -> An Enum signifying the connection to make.
- `callback`: @escaping (Bool) -> Void -> A callback that will be called with `true` if the connection is successful and `false` if the connection is unsuccessful.

### Data Streaming 🔥🔥

Data streaming is done by the function:

```swift
terraRT.startRealtime(type: Connections, dataType: DataTypes)
```
**Arguments**
- `type`: Connections -> An Enum signifying the connection to make.
- `dataType`: DataTypes -> An Enum signifying the datatype you wish to stream. Note if the data type is not supported by the `type` Connections, then it will simply return!

You may stop the streaming as follows:

```swift
terraRT.stopRealtime(type: Connections) 
```

And also disconnect from the connection as follows:

```swift
terraRT.disconnect(type: Connections)
```






