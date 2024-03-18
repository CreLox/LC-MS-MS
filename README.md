## Column
The UHPLC column used for isolating steroids/secosteroids is [Waters ACQUITY UPLC HSS T3 Column](https://www.waters.com/nextgen/us/en/shop/columns/186003539-acquity-uplc-hss-t3-column-100a-18--m-21-mm-x-100-mm-1-pk.html) (100Å, 1.8 µm, 2.1 mm × 100 mm, Part# 186003539).

## Flow rate
When setting up an LC-MS/MS run, make sure that TSQ Altis (Figure 2) is correctly informed of the LC flow rate (Figure 1).

<p align="center">
  <img width="540" alt="image" src="https://raw.githubusercontent.com/CreLox/LC-MS-MS/main/assets/VanquishUHPLCFlowRate.png"><br>
  <b>Figure 1.</b> LC flow rate in Xcalibur Instrument Setup (pump settings).
</p>
<br>
<p align="center">
  <img width="360" alt="image" src="https://raw.githubusercontent.com/CreLox/LC-MS-MS/main/assets/TSQAltisFlowRate.png"><br>
  <b>Figure 2.</b> LC flow rate fed to TSQ Altis (ion source properties) in Xcalibur Instrument Setup (NOT in FreeStyle).
</p>

## Vanquish pump
When an LC-MS/MS sequence finishes running, the vanquish pump should be stopped manually: go to "Direct Control", click "Take Control" at the top, and uncheck the "Flow" box under the "Vanquish Pump" tab.

<p align="center">
  <img width="400" alt="image" src="https://raw.githubusercontent.com/CreLox/LC-MS-MS/main/assets/StopVanquishPumpAfterARun.png"><br>
  <b>Figure 3.</b> Stopping the vanquish pump.
</p>
