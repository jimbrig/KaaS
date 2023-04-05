# ETL Pipeline Notes

![](https://i.imgur.com/N7AQRxE.png)

#### Instrument ETL processes

A key factor in the long-term success and continual improvement of our ETL processes is **instrumentation**.

For each task, we need to be able to “flick an on/off switch” to start collecting the performance and runtime metrics that will allow us to track the progress of tasks, troubleshoot failures quickly, and establish baselines by which to gauge recent performance compared to past performance.

If the duration of each ETL task is not monitored, then the team will inevitably fail to spot that an ETL job has suddenly, or gradually over time, increased in duration. Clearly, a variability in the data volume must be accounted for, but a measure such as ‘duration per 1000 records’ is something to watch over time to catch performance deterioration.

In addition, it’s important to track the delays between ETL steps, particularly if there are manual or manually-triggered processing steps in the ETL workflow. There is little point in performance-tuning an ETL transform step from 2 minutes down to 40 seconds if the following step is routinely not triggered until 3 or 4 hours have passed because the step is waiting for a member of the overworked team to inspect the output.

There are several possible ways to instrument ETL processes. In the *Resources* section, you will find articles describing to build instrumentation into SSIS packages, as well describing a tool called **DTLoggedExec**, a separate instrumentation tool for SSIS.

However, a general-purpose ETL instrumentation technique on the Windows platform may just require use of performance counters and PowerShell. This allows existing tools to monitor the progress and behavior of the ETL operation.

*Backlinks:*

````dataview
list from [[ETL Pipeline Notes]] AND -"Changelog"
````
