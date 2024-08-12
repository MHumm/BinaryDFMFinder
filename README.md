# BinaryDFMFinder
This little tool BinaryDFMFinder can be used to find all
DFM files within a given directory or its subdirectories
which are still in binary format.

If somebody wants to create an automatic converter based on 
this feel free. I simply didn't need that function right now.
There is a CONVERT.EXE converter already available in the bin
folder of your Delphi installation. You may call that to perform 
the actual conversion.

How to call the tool?

* if you spcecify a path as command line parameter it will start 
  from this path and include all subdirectories
* if no start path is specified it will start from current 
  directory (as returned by Windows)
  
The tool has been written for Delphi 12.1 or higher, but should 
work on older versions as well, as long as System.IOUtils is present.
