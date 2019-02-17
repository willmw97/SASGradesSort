/***********************************************
* Name: GradesProject.sas                          *
* Date: February 16, 2019                      *
*                                              *
* Purpose: Indexing Grades by creating new 
variables               						*
*                                              *
* Output: Catagorized Town's by certain Name's   *
***********************************************/

/** FOR CSV Files uploaded from Windows **/

FILENAME CSV "/folders/myfolders/Grades.csv" TERMSTR=CRLF;



/** Import the CSV file.  **/

PROC IMPORT DATAFILE=CSV
		    OUT=MARSHAL.Grades
		    DBMS=CSV
		    REPLACE;
RUN;

/** Print the results. **/

PROC PRINT DATA=MARSHAL.Grades; RUN;

/** Unassign the file reference.  **/

FILENAME CSV;

DATA Grades10;
SET MARSHAL.Grades;
ParenLocation = INDEX(ZipTownAreaCode, '(');
Town = strip(SUBSTR(ZipTownAreaCode, 6, ParenLocation - 7));
IF Town = 'Ada' THEN NotAda = 0;
else NotAda = 1;


RUN;

PROC PRINT DATA = Grades10;
VAR FirstName LastName ZipTownAreaCode ParenLocation Town NotAda;
RUN;


DATA Grades11;
SET MARSHAL.Grades;
ParenLocation = INDEX(ZipTownAreaCode, '(');
Town = STRIP(SUBSTR(ZipTownAreaCode, 6, ParenLocation - 7));

If Town = 'Ada' or Town = 'Adams' or Town = 'Adolph' then ATown = 1;
else ATown = 0;

RUN;

PROC PRINT DATA = Grades11;
VAR FirstName LastName ZipTownAreaCode ParenLocation Town ATown;
RUN;

DATA Grades12;
 SET Marshal.Grades;
 ParenLocation = INDEX(ZipTownAreaCode,'(');
 Town = SUBSTR(ZipTownAreaCode,7,ParenLocation-8);
 IF Town IN ('Ada','Adams', 'Adolph') THEN ATown=1;
 else = 0;
RUN;

PROC PRINT DATA = Grades12;
VAR FirstName LastName ZipTownAreaCode ParenLocation Town ATown;
RUN;

DATA Grades13;
SET MARSHAL.Grades;
ParenLocation = INDEX(ZipTownAreaCode, '(');
Town = STRIP(SUBSTR(ZipTownAreaCode, 7, ParenLocation - 8));

If Town =: 'A' then ATown = 1;
else ATown = 0;

RUN;

PROC PRINT DATA = Grades13;
VAR FirstName LastName ZipTownAreaCode ParenLocation Town ATown;
RUN;


