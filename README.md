# AuthSpeedTest
iOS/macOS app to measure the speed of the biometrics authentication.
It currently supports Face ID, Touch ID, and Apple Watch validation (macOS)


## How to use

To take a measure, follow the following instructions depending on the authentication system of your device. If the measurement ends successfully, its duration will be added to the list. If it failed, a "Failed" measure will be added to the list.

The last row of the list includes the average duration of a measurement, and the amount of failed tries.

If you want to delete a measurement from the list, slide the row and press the "Delete" button.

### Face ID
Please ensure you are facing the device, and you are not closing your eyes during the measure. Press the "Measure" button and wait for the measure to end.

If the measure fails, and an alert pops up, press "Cancel" so the measure can be marked as a fail.

### Touch ID (Mac & iOS)
Please put your finger on the sensor **before** pressing the "Measure" button. Then, press that button. If the measure fails, press "Cancel" to mark the measure as a fail.

Lift your finger from the sensor between two Touch ID measures. If you keep your finger on the sensor, the next measure couldn't be done.

## Results
I've taken measures with the following devices:

* iPhone Xr (Face ID)
* iPad Air 3 (Touch ID 2)
* MacBook Pro 13" (Touch ID 2)
* iPhone SE 2nd gen (Touch ID 2)
* iPad Pro 2021 11" (Face ID)

For 100 measures, here are the results:

| Device                  | Auth System | Last reset  | Average time | Fails |
|-------------------------|-------------|-------------|--------------|-------|
| iPhone Xr               | Face ID     | Nov 2018    | 0.41s        | 5     |
| MacBook Pro (13", 2019) | Touch ID 2  | Dec 2020    | 0.32s        | 2     |
| iPad Air 3              | Touch ID 2  | Oct 2019    | 0.21s        | 1     |
| iPhone SE (2020)        | Touch ID 2  | 13 Jan 2021 | 0.29s        | 2     |
| iPad Pro (11", 2021)    | Face ID     | 26 Mar 2022 | 0.52s        | 1     |


*(You are welcome to send me more tests results)*
