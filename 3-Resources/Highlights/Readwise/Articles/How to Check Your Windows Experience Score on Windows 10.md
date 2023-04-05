# How to Check Your Windows Experience Score on Windows 10

## Metadata

* Author: 
* Full Title: How to Check Your Windows Experience Score on Windows 10
* Category: #Type/Highlight/Article
* URL: https://www.makeuseof.com/tag/check-windows-experience-score-windows-10/

## Highlights

* Run WinSAT to Generate Windows Experience Index
  The Windows System Assessment Tool (WinSAT) remains tucked away in Windows 10. You can use WinSAT to generate a Windows Experience Index for your processor, graphics card, memory speed, and more.
  The following process generates a Windows Experience Index then exports it to an XML file.
  Type command in your Start Menu search bar, right-click the Best Match and select Run as Administrator.
  When the Command Prompt opens, input the following command: winsat formal
  Wait for the process to complete. When it finishes, you can find the XML file in C:\Windows\Performance\WinSAT\DataStore.
  Look for a set of files containing the date you are running the test on. Open the XML file that looks like “\[date of test\] Formal.Assessment (Recent).WinSAT.xml”.
  When prompted, select your internet browser to view the XML file. Your browser will make the XML data readable.
  The Windows Experience Index is close to the top of the file.
* The Windows Experience Index was never a fantastic way to judge your system performance. It has a single severe limitation. Your Windows Experience Index value comes from your lowest performing piece of hardware. In my case, my disk speeds bring my overall score down, despite receiving high scores for CPU, Direct 3D, Graphics, and Memory.
  A single low score can alert you to a bottleneck in your system. My system score drops because I have multiple drives, some of which are old, lumbering hard drives.
  Overall, the Windows Experience Index isn’t the best way to figure out your system performance, or where you could improve it, either. Here are two alternatives to the Windows Experience Index that give you the information you need.
* SiSoftware Sandra (System ANaylzer, Diagnostic, and Reporting Assistant) is a system benchmarking tool you can use to test your hardware against other users. Sandra has an online reference database that you can use to compare individual aspects of your system, like your processor or internet connection, then compare against other systems to figure out if a system upgrade is worthwhile.
* Another useful option is UserBenchmark. UserBenchmark runs a suite of benchmarking tools on your system, then opens the results in your default internet browser. You can then compare your results with the thousands of other UserBenchmark users, figuring out how your system ranks in comparison.
