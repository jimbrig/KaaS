# Delete These Windows Files and Folders to Free Up Disk Space

## Metadata

* Author: 
* Full Title: Delete These Windows Files and Folders to Free Up Disk Space
* Category: #Type/Highlight/Article
* URL: https://www.makeuseof.com/tag/delete-windows-files-folders/

## Highlights

* The Best Way to Clean Windows Folders: Disk Cleanup
* choose Clean up system files to gain administrator permissions
* What to Delete From Disk Cleanup
  This isn’t a full guide to the Disk Cleanup tool, so we’re not going to look at every option it offers. However, the following several options are low-hanging fruit (make sure to select Clean up system files to see them all):
  Windows Update Cleanup: This erases old copies of Windows Update files. These are safe to delete in most cases, but you should keep them for troubleshooting if you run into update-related issues.
  Windows upgrade log files: Similarly, these are data files that Windows Update keeps to help you dig into problems around it. You can erase these if you haven’t had errors related to Windows update.
  Language resource files: If you’ve previously downloaded another language or keyboard layout that you don’t use, this will let you easily erase it.
  Recycle Bin: While you can empty the Recycle Bin through its window, you can also do it easily here.
  Temporary files: As their name suggests, temporary files aren’t used for anything in the long-term, so you can erase them without worry.
* Location: C:\hiberfil.sys
* Location: C:\Windows\Temp
* Aside from cleaning via Disk Cleanup. you can visit this folder and delete its contents by pressing Ctrl + A to select everything and then hit Delete. Windows might give you an error about a couple of items when you do this—just ignore those and clear everything else.
* Recycle Bin
  Location: shell:RecycleBinFolder
  Technically, the Recycle Bin isn’t really a folder. And while it might be obvious to some, we’re including this in case some readers aren’t aware.
  Whenever you delete a file on your system, Windows sends it to the Recycle Bin. This is a special place where deleted files are kept until you permanently delete or restore them. If you don’t remember to empty the bin regularly, there could be several gigabytes of old data still in there.
  You can access the Recycle Bin through the shortcut on your desktop. If you don’t have one, type shell:RecycleBinFolder into the File Explorer’s navigation bar. Once here, you’ll see everything you’ve deleted recently.
  You can right-click on individual items and choose Delete to permanently erase them or Restore to send the file back to its original location. On the Ribbon above, you’ll see buttons to Empty Recycle Bin and Restore all items.
* Windows.old Folder
  Location: C:\Windows.old
  Whenever you upgrade your version of Windows, the system keeps a copy of your old files called Windows.old. This folder essentially holds everything that made up your old installation, kept around in case something didn’t transfer correctly.
* Downloaded Program Files
  Location: C:\Windows\Downloaded Program Files
  This folder’s name is a bit confusing. It actually holds files used by Internet Explorer’s ActiveX controls and Java applets, so that if you use the same feature on a website you don’t have to download it twice.
  In effect, this folder is useless. ActiveX is an extremely outdated technology that’s full of security holes, and Java is rarely used in today’s web. ActiveX is exclusive to Internet Explorer and you’ll probably only encounter it on ancient corporate websites now.
  Most home users don’t use IE anymore, let alone ActiveX. Your Downloaded Program Files folder might already be empty, but feel free to clean out its contents if it’s not.
* LiveKernelReports
  Location: C:\Windows\LiveKernelReports
  The LiveKernelReports folder is another directory which likely comes up when you’re scanning for large files on your computer. This folder is home to dump files, which are ongoing information logs that Windows keeps. If your computer runs into an issue, you can analyze the contents of these files to start troubleshooting your problem.
  Any huge files ending with the DMP file extension in this folder are safe to delete. Like the above locations, we recommend using Disk Cleanup instead of deleting the file yourself.
  When Windows crashes or you have other major computer problems, don’t delete these dump files right away. You can use a program like WhoCrashed to get more info from them.
