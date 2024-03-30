      ******************************************************************
      * Author: MOSTAPHA A
      * Purpose: Define a data structure for student records
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJECT01.
       AUTHOR. MOSTAPHA A.
       SECURITY. NON CONFIDENTIAL.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT-FILE-OUT
              ASSIGN TO "../STUDENTFILE.TXT"
                 ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.
      * Define the record written to the file
       FD STUDENT-FILE-OUT.
       01 STUDENT-RECORD-OUT.
           05 STUDENT-NUMBER PIC 9(7).
           05 STUDENT-NAME PIC X(40).
           05 TUITION-OWED PIC 9(5).

       WORKING-STORAGE SECTION.
      * Storage needed for input prompt
       01 CONTROL-FIELDS.
           05 NEW-REC-PROMPT PIC A(1).

       PROCEDURE DIVISION.
       100-CREATE-STUDENT-RECORDS.
           PERFORM 201-INITIALIZE-STUDENT-RECORDS.
           PERFORM 202-CREATE-STUDENT-RECORD
      * Loop until user enters N when they are done inputting records
               UNTIL NEW-REC-PROMPT EQUALS "N" OR "n".
           PERFORM 203-TERMINATE-STUDENT-RECORDS.
           STOP RUN.

      * Opens the file and prompts user
       201-INITIALIZE-STUDENT-RECORDS.
           PERFORM 301-OPEN-STUDENT-FILE.
           PERFORM 302-PROMPT-NEW-RECORD.

      * Prompts the user for student details
       202-CREATE-STUDENT-RECORD.
           PERFORM 303-PROMPT-STUDENT-DATA.
           PERFORM 304-WRITE-STUDENT-RECORD.
           PERFORM 302-PROMPT-NEW-RECORD.

      * Closes the outpit file
       203-TERMINATE-STUDENT-RECORDS.
           CLOSE STUDENT-FILE-OUT.

      * Open the output file for student records
       301-OPEN-STUDENT-FILE.
           OPEN OUTPUT STUDENT-FILE-OUT.

      * Ask user if they would like to add a new student record
       302-PROMPT-NEW-RECORD.
           DISPLAY "Add a new student record? (Y/N) "
           ACCEPT NEW-REC-PROMPT.

      * Prompts for the student information
       303-PROMPT-STUDENT-DATA.
           PERFORM 401-PROMPT-STUDENT-NUMBER.
           PERFORM 402-PROMPT-STUDENT-NAME.
           PERFORM 403-PROMPT-TUITION-OWED.

      * Writes the student data to the file
       304-WRITE-STUDENT-RECORD.
           WRITE STUDENT-RECORD-OUT.

      * Prompts and stores the student number
       401-PROMPT-STUDENT-NUMBER.
           DISPLAY "Enter Student number (#######)"
           ACCEPT STUDENT-NUMBER.

      * Prompts and stores the student name
       402-PROMPT-STUDENT-NAME.
           DISPLAY "Enter Student name (Last, First)"
           ACCEPT STUDENT-NAME.

      * Prompts and stores the tuition owed
       403-PROMPT-TUITION-OWED.
           DISPLAY "Enter tuition owed as a whole number (#####)"
           ACCEPT TUITION-OWED.


       END PROGRAM PROJECT01.
