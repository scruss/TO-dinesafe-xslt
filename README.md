# TO-dinesafe-xslt
Convert Toronto Open Data Dinesafe food safety reports to CSV using XSLT.

As part of the city's
[Open Data](http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=9e56e03bb8d1e310VgnVCM10000071d60f89RCRD
"Open Data") initiative, the
[Dinesafe](http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=b54a5f9cd70bb210VgnVCM1000003dd60f89RCRD&amp;vgnextchannel=1a66e03bb8d1e310VgnVCM10000071d60f89RCRD
"Dinesafe") data set is available as zipped XML here:
[Dinesafe Data](http://opendata.toronto.ca/public.health/dinesafe/dinesafe.zip
"Dinesafe Data"). It is updated regularly.

The XML format used isn't the easiest to work with, so three scripts are provided here:

* *dinesafetocsv.xsl* - converts the data into comma separated values,
  with text fields enclosed by quotes.
* *dinesafetopsv.xsl* - converts the data into pipe separated
  values. Easier to post-process with simple tools, as the text fields
  don't need to be quoted.
* *dinesafetopsv-address.xsl* - same as above, but adds derived fields **STREET_NUM** and **STREET_NAME** to ease geoding from the [Toronto One Address Repository](http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=91415f9cd70bb210VgnVCM1000003dd60f89RCRD&amp;vgnextchannel=75d6e03bb8d1e310VgnVCM10000071d60f89RCRD "Toronto One Address Repository").

## Usage

These should run in any XSlT 1.0 or 2.0 processor. It's a little slow,
as the processor has to read all ~100,000 records before it can output
anything.

If you're feeling particularly adventurous, you can download and convert the data in one pipeline:

    wget -q -O - http://opendata.toronto.ca/public.health/dinesafe/dinesafe.zip |\
     funzip |\
     xsltproc dinesafetocsv.xsl - > dinesafe.csv

## Author ##

Stewart C. Russell - scruss.com

## Licence ##

WTFPL. (Srsly)
