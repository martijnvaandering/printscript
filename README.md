# printscript

Small printscript for automatic printing of PDF and other Ghostscript compatible formats

Make sure that [Ghostscript](ghostscript.com) is installed; use Chocolaty for instance <pre>choco install ghostscript</pre>

Then run ````print.ps1 -basePath c:\printingbla -interval 10```` to keep checking for input documents.

The script will generate a folder structure based on the availible printers; for instance:
<pre>

├───archived
└───printing
    ├───Fax
    ├───FilePrinter
    ├───Microsoft Print to PDF
    ├───Microsoft XPS Document Writer
    ├───OneNote (Desktop)
    ├───OneNote for Windows 10
    └───Printer Office
</pre>

Just place your PDF or XPS in the right folder and when printing is done the files are <b>moved</b> to the ````archived```` folder.


Happy hacking!