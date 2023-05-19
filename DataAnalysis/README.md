# Procedures
1. Extract data from .raw files into an open format

To extract data in ThermoFisher's proprietary binary .raw format, we use `MSConvertGUI` here to extract the data into an open format like .mzXML. Make sure that the `SRM as spectra` box is checked.

![MSConvertGUI](https://github.com/CreLox/LC-MS-MS/assets/18239347/7a85d5b2-a24d-49fc-9305-f5667bb8c2a3)

2. Use the `plotD7.m` code to plot the data. An SRM experiment (also known as a "transition") can be denoted as "parent ion $m/z$ → product ion $m/z$" (for example, "374.30 → 144.97" for our 7-DHC-d7 detection).
