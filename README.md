# TerraRTiOS

It's finally here: The realtime streaming framework for iOS through Terra!!!!


## Quickstart

A demo app is given here for you to get started quickly!

https://github.com/tryterra/TerraRTiOS-Demo

## A Worthy Note

This packages uses Bluetooth Low Energy (BLE) and Bluetooth services. These will be requested as permissions upon initialisation of the package.

The package streams real time data through **Websockets** and is hosted by us! You can learn more about it here on our [docs](https://docs.tryterra.co/reference/using-the-websocket-api).

The data streamed to your websocket connection (as a developer) will follow the following format:

```json
{
  "op":5,
  "d":
    {
      "ts": <String> (In ISOFormat Date Form)
       "val": <Double>
       "d" <Array<Double>>
    },
    "uid": <String> (user ID)
    "seq": <Int>,
    "t": <String> (Datatype name: Exactly the same as the name of `DataTypes` enum)
}
```

`ts` is the timestamp of the record.

For each datatype, either `val` or `d` is populated.

Datatypes:
- HEART_RATE: `val` the BPM of each reading
- STEPS: `val` the amount of accumulated steps 
- DISTANCE: `val` the accumulated distance in meters
- FLOORS_CLIMBED: `val` the accumulated floors climbed
- STEPS_CADENCE: `val` the amount of steps per second taken by the user
- SPEED: `val` the speed in meter per second of the user
- ACCELERATION: `d` the acceleration data of the device. 
  - d[0] -> acceleration in x direction
  - d[1] -> acceleration in y direction
  - d[2] -> acceleration in z direction
  
- GYROSCOPE: `d` the rotation rate of the device.
  - d[0] -> the rotation rate in x axis
  - d[1] -> the rotation rate in y axis
  - d[2] -> the rotation rate in z axis

## Installation

You can use Swift Package Manager and add this github repo as a dependency to your project! You must then include this as a framework under 
`General -> Frameworks, Libraries, and Embedded Content`. 

You may now run `import TerraRTiOS`!

You will also need `Privacy - Bluetooth Always Usage Description` under your `info.plist` file. 
You will also need `Privacy - Motion Usage Description` under your `info.plist` file if you wish to use `Connections.APPLE` connection!

## Usage

The package is controlled mainly by a class called `TerraRT`

You may initialise as such:

```swift
terraRT = TerraRT()
```

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
terraRT.startRealtime(type: Connections, token: String, dataType: Set<DataTypes>)
```
**Arguments**
- `type`: Connections -> An Enum signifying the connection to make.
- `token`: String -> A user token for authentication to Websocket API. This can be generated [here](https://docs.tryterra.co/reference/generate-user-token)
- `dataType`: Set<DataTypes> -> An set of Enum signifying the datatypes you wish to stream. Note if the data type is not supported by the `type` Connections, then it will simply return!

You may stop the streaming as follows:

```swift
terraRT.stopRealtime(type: Connections) 
```

And also disconnect from the connection as follows:

```swift
terraRT.disconnect(type: Connections)
```








