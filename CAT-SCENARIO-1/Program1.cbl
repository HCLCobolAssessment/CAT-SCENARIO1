000100 IDENTIFICATION DIVISION.                                         00010025
000200                                                                  00020026
000300 PROGRAM-ID.                    PROGRAM2.                         00030027
000400 AUTHOR.                        HCL     .                         00040026
000500 DATE-WRITTEN.                  FEB 2019.                         00050027
000600                                                                  00060026
000700******************************************************************00070026
002300                                                                  00230001
002400 ENVIRONMENT DIVISION.                                            00240001
002500                                                                  00250001
002600***************************************************************** 00260001
002700**                                                                00270001
002800**   CONFIGURATION SECTION                                        00280001
002900**                                                                00290001
003000******************************************************************00300001
003100                                                                  00310001
003200 CONFIGURATION SECTION.                                           00320001
003300                                                                  00330001
003400 SPECIAL-NAMES.                                                   00340026
003500      DECIMAL-POINT IS COMMA.                                     00350026
003600                                                                  00360026
003700******************************************************************00370026
003800**                                                                00380026
003900**   INPUT-OUTPUT SECTION                                         00390026
004000**                                                                00400026
004100******************************************************************00410026
004200                                                                  00420026
004300 INPUT-OUTPUT SECTION.                                            00430026
004400                                                                  00440026
004500 FILE-CONTROL.                                                    00450026
004600******************************************************************00460026
004700**                                                                00470026
004800**   DATA DIVISION                                                00480026
004900**                                                                00490026
005000******************************************************************00500026
005100                                                                  00510026
005200 DATA DIVISION.                                                   00520026
005300                                                                  00530026
005400******************************************************************00540026
005500**                                                                00550026
005600**   FILE SECTION                                                 00560026
005700**                                                                00570026
005800******************************************************************00580026
005900                                                                  00590026
006000 FILE SECTION.                                                    00600026
006100                                                                  00610026
006200******************************************************************00620026
006300**                                                                00630026
006400**  WORKING-STORAGE SECTION                                       00640026
006500**                                                                00650026
006600******************************************************************00660026
006700                                                                  00670026
006800 WORKING-STORAGE SECTION.                                         00680026
006900                                                                  00690026
007000 01 I             PIC 9(2).                                       00700026
007100 01 COND-X        PIC X(1) VALUE 'N' .                            00710026
007200 01 TotalCount    PIC 99 VALUE ZEROS.                             00720026
007300 01 MaleCount     PIC 99 VALUE ZEROS.                             00730026
007400 01 FemaleCount   PIC 99 VALUE ZEROS.                             00740026
007500 01 WS-SALARY-X  PIC X(4).                                        00750026
007600 01 WS-INPUTFILE-1 .                                              00760026
007700      03  NAME-A PIC X(10).                                       00770026
007800      03  SEX    PIC X(1).                                        00780026
007900      03  DOJ    PIC X(10).                                       00790026
008000      03  SALARY PIC X(4).                                        00800026
008100 01 WS-RECORDS .                                                  00810026
008200      03 FILLER  PIC X(25) VALUE 'JANES     M19960123  5000'.     00820026
008300      03 FILLER  PIC X(25) VALUE 'JERRY     F19980501  3000'.     00830026
008400      03 FILLER  PIC X(25) VALUE 'HARRY     M20001002  6000'.     00840026
008500      03 FILLER  PIC X(25) VALUE 'SMITA     F20020110  8000'.     00850026
008600      03 FILLER  PIC X(25) VALUE 'JAMES     M20040122  3500'.     00860026
008700      03 FILLER  PIC X(25) VALUE 'ANGELINA  F19960123  5600'.     00870026
008800      03 FILLER  PIC X(25) VALUE 'PETER     M19980501  4300'.     00880026
008900      03 FILLER  PIC X(25) VALUE 'JOANNA    F19960123  7600'.     00890026
009000      03 FILLER  PIC X(25) VALUE 'MAGGIE    F20001002  3400'.     00900026
009010      03 FILLER  PIC X(25) VALUE 'SUIZE     F20001002  6700'.     00901026
009020 01 FILLER REDEFINES WS-RECORDS.                                  00902026
009030      03 WS-RECORDS2 PIC X(25) OCCURS 10.                         00903026
009040*----------------------------------------------------------------*00904026
009050 PROCEDURE DIVISION .                                             00905026
009060*----------------------------------------------------------------*00906026
009070 A-MAIN                                      SECTION.             00907026
009080*----------------------------------------------------------------*00908026
009090 A-001.                                                           00909026
009100                                                                  00910026
009200            INITIALIZE I.                                         00920026
009300     PERFORM 10 TIMES                                             00930026
009400        IF COND-X = 'Y'                                           00940026
009500            IF SALARY > WS-SALARY-X                               00950026
009600               MOVE SALARY TO WS-SALARY-X                         00960026
009700            END-IF                                                00970026
009800        END-IF                                                    00980026
009900                                                                  00990026
010000            ADD 1 TO I                                            01000026
010100            INITIALIZE WS-INPUTFILE-1                             01010026
010200            MOVE WS-RECORDS2(I) TO WS-INPUTFILE-1                 01020026
010300            MOVE 'Y' TO COND-X                                    01030026
010400                                                                  01040026
010500            EVALUATE SEX                                          01050026
010600              WHEN 'M'                                            01060026
010700                ADD 1 TO MaleCount                                01070026
010800                ADD 1 TO TotalCount                               01080026
010900              WHEN 'F'                                            01090026
011000                ADD 1 TO FemaleCount                              01100026
011100                ADD 1 TO TotalCount                               01110026
011200            END-EVALUATE                                          01120026
011300                                                                  01130026
011400               INITIALIZE WS-RECORDS2(I)                          01140026
011600     END-PERFORM                                                  01160026
011700                                                                  01170026
011800         DISPLAY "MALE EMPLOYEES: " MaleCount                     01180026
011900         DISPLAY "FEMALE EMPLOYEES: " FemaleCount                 01190026
012000         DISPLAY "TOTAL EMPLOYEES: " TotalCount                   01200026
012100         DISPLAY "MAXIMUM SALARY: " WS-SALARY-X .                 01210026
012200                                                                  01220026
012300 A-999.                                                           01230026
                                                                       
012400     GOBACK.                                                      01240026
012500                                                                  01250026

