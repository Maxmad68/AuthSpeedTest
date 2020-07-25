# AuthSpeedTest
iOS/macOS app to measure the speed of the biometrics authentication.
It currently supports FaceID, TouchID, and Apple Watch validation (macOS)


## How to use

To take a measure, follow the following instructions depending on the authentication system of your device. If the measurement ends successfully, its duration will be added to the list. If it failed, a "Failed" measure will be added to the list.

The last row of the list includes the average duration of a measurement, and the amount of failed tries.

If you want to delete a measurement from the list, slide the row and press the "Delete" button.

### FaceID
Please ensure you are facing the device, and you are not closing your eyes during the measure. Press the "Measure" button and wait for the measure to end.

If the measure fails, and an alert pops up, press "Cancel" so the measure can be marked as a fail.

### TouchID (Mac & iOS)
Please put your finger on the sensor **before** pressing the "Measure" button. Then, press that button. If the measure fails, press "Cancel" to mark the measure as a fail.

Lift your finger from the sensor between two TouchID measures. If you keep your finger on the sensor, the next measure couldn't be done.

## Results
I've taken measures with the following devices:

* iPhone Xr (FaceID)
* iPad Air 3 (TouchID 2)
* MacBook Pro 13" (TouchID 2)

For 100 measures, here are the results:

| Device      | Auth systm | Average time | Fails |
|-------------|------------|--------------|-------|
| iPhone Xr   | FaceID     | 0.557s       | 5     |
| MacBook Pro | TouchID 2  | 0.483s       | 2     |
| iPad Air 3  | TouchID 2  | 0.315s       | 1     |

*(You are welcome to send me more tests results)*
