# Docker image for Data Science on weather data

Contains a [Deepnote](https://deepnote.com/) docker image containing the `wgrib2` utility for reading grib files. These can be converted to netcdf format, and then loaded in Python, for example by using:

```python
import pandas as pd
import xarray as xr
import subprocess

cmd = ('wgrib2', IN_FILE_NAME, '-netcdf', OUT_FILE_NAME)
process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout, stderr = process.communicate()
ds = xr.open_dataset(OUT_FILE_NAME)
df = ds.to_dataframe().reset_index()
```