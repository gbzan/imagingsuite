C------------------------------------------------------------------------------
C NeXus - Neutron & X-ray Common Data Format
C  
C Application Program Interface (Fortran 77)
C
C Copyright (C) 1997-2002 Freddie Akeroyd, Mark Koennecke
C
C This library is free software; you can redistribute it and/or
C modify it under the terms of the GNU Lesser General Public
C License as published by the Free Software Foundation; either
C version 2 of the License, or (at your option) any later version.
C
C This library is distributed in the hope that it will be useful,
C but WITHOUT ANY WARRANTY; without even the implied warranty of
C MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
C Lesser General Public License for more details.
C
C You should have received a copy of the GNU Lesser General Public
C License along with this library; if not, write to the Free Software
C Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
C
C  For further information, see <http://www.nexusformat.org>
C
C $Id$
C------------------------------------------------------------------------------

C------------------------------------------------------------------------------
C Doxygen comments follow
C for help, see: http://www.stack.nl/~dimitri/doxygen/docblocks.html#fortranblocks
C
!> \mainpage Fortan 77 NeXus API
!!
!! The Fortran routines have the same names and argument lists as the 
!! corresponding C routines, which they call using wrappers. Some extra 
!! routines for handling input/output of character data and attributes 
!! have been added. Care must be taken to ensure enough space is allocated
!! for the input/output operations being performed.
!!
!! It is necessary to reverse the order of indices in multidimensional 
!! arrays, compared to an equivalent C program, so that data are stored in
!! the same order in the NeXus file.
!!
!! Any program using the F77 API needs to include the following line near
!! the top in order to define the required constants (NXHANDLESIZE,
!! NXLINKSIZE, etc.): 
!!
!!       include 'NAPIF.INC'
!!
!! Use this table to convert from the C data types listed with each routine to the F77 data types: 
!!
!! ==========================  ================================================
!! C                           FORTRAN 77
!! ==========================  ================================================
!! int a, int* a               INTEGER A
!! char* a                     CHARACTER*(*) A
!! NXhandle a, NXhandle* a     INTEGER A(NXHANDLESIZE)
!! NXstatus                    INTEGER
!! int[] a                     INTEGER A(*)
!! void* a                     REAL A(*) or DOUBLE A(*) or INTEGER A(*)
!! NXlink a, NXlink* a         INTEGER A(NXLINKSIZE)
!! ==========================  ================================================
!<
C------------------------------------------------------------------------------



!> Return length of a string, ignoring trailing blanks
!<
      INTEGER FUNCTION TRUELEN(STRING)
      CHARACTER*(*) STRING
      DO TRUELEN=LEN(STRING),1,-1
          IF (STRING(TRUELEN:TRUELEN) .NE. ' ' .AND. 
     &        STRING(TRUELEN:TRUELEN) .NE. CHAR(0) ) RETURN
      ENDDO
      TRUELEN = 0
      END

!> Convert FORTRAN string STRING into NULL terminated C string ISTRING
!<
      SUBROUTINE EXTRACT_STRING(ISTRING, LENMAX, STRING)
      CHARACTER*(*) STRING
      INTEGER I,ILEN,TRUELEN,LENMAX
      INTEGER*1 ISTRING(LENMAX)
      EXTERNAL TRUELEN
      ILEN = TRUELEN(STRING)
      IF (ILEN .GE. LENMAX) THEN
          WRITE(6,9000) LENMAX, ILEN+1
          RETURN
      ENDIF
      DO I=1,ILEN
          ISTRING(I) = ICHAR(STRING(I:I))
      ENDDO
      ISTRING(ILEN+1) = 0
      RETURN
 9000 FORMAT('NeXus(NAPIF/EXTRACT_STRING): String too long -',
     +       'buffer needs increasing from ', i4,' to at least ',i4)
      END

!> Convert NULL terminated C string ISTRING to FORTRAN string STRING
!<
      SUBROUTINE REPLACE_STRING(STRING, ISTRING)
      INTEGER*1 ISTRING(*)
      CHARACTER*(*) STRING
      INTEGER I
      STRING = ' '
      DO I=1,LEN(STRING)
          IF (ISTRING(I) .EQ. 0) RETURN
          STRING(I:I) = CHAR(ISTRING(I))
      ENDDO
      IF (ISTRING(LEN(STRING)+1) .NE. 0) WRITE(6,9010) LEN(STRING) 
      RETURN
 9010 FORMAT('NeXus(NAPIF/REPLACE_STRING): String truncated - ',
     +  'buffer needs to be > ', I4)
      END

!> Wrapper routines for NXAPI interface
!<
      INTEGER FUNCTION NXOPEN(FILENAME, ACCESS_METHOD, FILEID)
      CHARACTER*(*) FILENAME
      INTEGER*1 IFILENAME(256)
      INTEGER ACCESS_METHOD
      INTEGER FILEID(*),NXIFOPEN
      EXTERNAL NXIFOPEN
      CALL EXTRACT_STRING(IFILENAME, 256, FILENAME)
      NXOPEN = NXIFOPEN(IFILENAME, ACCESS_METHOD, FILEID)
      END

      INTEGER FUNCTION NXCLOSE(FILEID)
      INTEGER FILEID(*),NXIFCLOSE
      EXTERNAL NXIFCLOSE
      NXCLOSE = NXIFCLOSE(FILEID)
      END

      INTEGER FUNCTION NXFLUSH(FILEID)
      INTEGER FILEID(*), NXIFFLUSH
      EXTERNAL NXIFFLUSH
      NXFLUSH = NXIFFLUSH(FILEID)
      END

      INTEGER FUNCTION NXMAKEGROUP(FILEID, VGROUP, NXCLASS)
      INTEGER FILEID(*),NXIMAKEGROUP
      CHARACTER*(*) VGROUP, NXCLASS
      INTEGER*1 IVGROUP(256), INXCLASS(256)
      EXTERNAL NXIMAKEGROUP
      CALL EXTRACT_STRING(IVGROUP, 256, VGROUP)
      CALL EXTRACT_STRING(INXCLASS, 256, NXCLASS)
      NXMAKEGROUP = NXIMAKEGROUP(FILEID, IVGROUP, INXCLASS)
      END

      INTEGER FUNCTION NXOPENGROUP(FILEID, VGROUP, NXCLASS)
      INTEGER FILEID(*),NXIOPENGROUP
      CHARACTER*(*) VGROUP, NXCLASS
      INTEGER*1 IVGROUP(256), INXCLASS(256)
      EXTERNAL NXIOPENGROUP
      CALL EXTRACT_STRING(IVGROUP, 256, VGROUP)
      CALL EXTRACT_STRING(INXCLASS, 256, NXCLASS)
      NXOPENGROUP = NXIOPENGROUP(FILEID, IVGROUP, INXCLASS)
      END

      INTEGER FUNCTION NXOPENPATH(FILEID, PATH)
      INTEGER FILEID(*),NXIOPENPATH
      CHARACTER*(*) PATH
      INTEGER*1 IPATH(256)
      EXTERNAL NXIOPENPATH
      CALL EXTRACT_STRING(IPATH, 256, PATH)
      NXOPENPATH = NXIOPENPATH(FILEID, IPATH)
      END

      INTEGER FUNCTION NXGETPATH(FILEID, PATH)
      INTEGER FILEID(*),NXIGETPATH, NXIFGETPATH
      CHARACTER*(*) PATH
      INTEGER*1 IPATH(1024)
      INTEGER PLEN
      EXTERNAL NXIFGETPATH
      PLEN = 1024
      NXGETPATH = NXIFGETPATH(FILEID,IPATH,PLEN)
      CALL REPLACE_STRING(PATH,IPATH)
      END

      INTEGER FUNCTION NXOPENGROUPPATH(FILEID, PATH)
      INTEGER FILEID(*),NXIOPENGROUPPATH
      CHARACTER*(*) PATH
      INTEGER*1 IPATH(256)
      EXTERNAL NXIOPENGROUPPATH
      CALL EXTRACT_STRING(IPATH, 256, PATH)
      NXOPENGROUPPATH = NXIOPENGROUPPATH(FILEID, IPATH)
      END

      INTEGER FUNCTION NXCLOSEGROUP(FILEID)
      INTEGER FILEID(*),NXICLOSEGROUP
      EXTERNAL NXICLOSEGROUP
      NXCLOSEGROUP = NXICLOSEGROUP(FILEID)
      END

      INTEGER FUNCTION NXMAKEDATA(FILEID, LABEL, DATATYPE, RANK, DIM)  
      INTEGER FILEID(*), DATATYPE, RANK, DIM(*), NXIFMAKEDATA
      CHARACTER*(*) LABEL
      INTEGER*1 ILABEL(256)
      EXTERNAL NXIFMAKEDATA
      CALL EXTRACT_STRING(ILABEL, 256, LABEL)
      NXMAKEDATA = NXIFMAKEDATA(FILEID, ILABEL, DATATYPE, RANK, DIM) 
      END

      INTEGER FUNCTION NXCOMPMAKEDATA(FILEID, LABEL, DATATYPE, RANK, 
     &                                DIM, COMPRESSION_TYPE, CHUNK)  
      INTEGER FILEID(*), DATATYPE, RANK, DIM(*)
      INTEGER COMPRESSION_TYPE, CHUNK(*)
      INTEGER NXIFCOMPMAKEDATA
      CHARACTER*(*) LABEL
      INTEGER*1 ILABEL(256)
      EXTERNAL NXIFMAKEDATA
      CALL EXTRACT_STRING(ILABEL, 256, LABEL)
      NXCOMPMAKEDATA = NXIFCOMPMAKEDATA(FILEID, ILABEL, DATATYPE, 
     &                      RANK, DIM, COMPRESSION_TYPE, CHUNK) 
      END

      INTEGER FUNCTION NXOPENDATA(FILEID, LABEL)
      INTEGER FILEID(*),NXIOPENDATA
      CHARACTER*(*) LABEL
      INTEGER*1 ILABEL(256)
      EXTERNAL NXIOPENDATA
      CALL EXTRACT_STRING(ILABEL, 256, LABEL)
      NXOPENDATA = NXIOPENDATA(FILEID, ILABEL)
      END

      INTEGER FUNCTION NXSETNUMBERFORMAT(FILEID, ITYPE, FORMAT)
      INTEGER FILEID(*),NXISETNUMBERFORMAT,ITYPE
      CHARACTER*(*) FORMAT
      INTEGER*1 ILABEL(256)
      EXTERNAL NXISETNUMBERFORMAT
      CALL EXTRACT_STRING(ILABEL, 256, FORMAT)
      NXSETNUMBERFORMAT = NXISETNUMBERFORMAT(FILEID, ITYPE, ILABEL)
      END

      INTEGER FUNCTION NXCOMPRESS(FILEID, COMPR_TYPE)
      INTEGER FILEID(*),NXIFCOMPRESS,COMPR_TYPE
      EXTERNAL NXIFCOMPRESS
      NXCOMPRESS = NXIFCOMPRESS(FILEID, COMPR_TYPE)
      END

      INTEGER FUNCTION NXCLOSEDATA(FILEID)
      INTEGER FILEID(*),NXICLOSEDATA
      EXTERNAL NXICLOSEDATA
      NXCLOSEDATA = NXICLOSEDATA(FILEID)
      END

      INTEGER FUNCTION NXGETDATA(FILEID, DATA)
      INTEGER FILEID(*), DATA(*), NXIGETDATA
      EXTERNAL NXIGETDATA
      NXGETDATA = NXIGETDATA(FILEID, DATA)
      END

      INTEGER FUNCTION NXGETCHARDATA(FILEID, DATA)
      INTEGER FILEID(*), NXIGETDATA
      CHARACTER*(*) DATA
      INTEGER NX_ERROR,NX_IDATLEN
      PARAMETER(NX_ERROR=0,NX_IDATLEN=1024)
      INTEGER*1 IDATA(NX_IDATLEN)
      EXTERNAL NXIGETDATA
C *** We need to zero IDATA as GETDATA doesn't NULL terminate character data,
C *** and so we would get "buffer not big enough" messages from REPLACE_STRING
      DO I=1,NX_IDATLEN
          IDATA(I) = 0
      ENDDO
      NXGETCHARDATA = NXIGETDATA(FILEID, IDATA)
      IF (NXGETCHARDATA .NE. NX_ERROR) THEN
          CALL REPLACE_STRING(DATA, IDATA)
      ENDIF
      END

      INTEGER FUNCTION NXGETSLAB(FILEID, DATA, START, SIZE)
      INTEGER FILEID(*), DATA(*), START(*), SIZE(*)
      INTEGER NX_MAXRANK, NX_OK
      PARAMETER(NX_MAXRANK=32,NX_OK=1)
      INTEGER RANK, DIM(NX_MAXRANK), DATATYPE, I
      INTEGER CSTART(NX_MAXRANK), CSIZE(NX_MAXRANK)
      INTEGER NXIGETSLAB, NXGETINFO
      EXTERNAL NXIGETSLAB
      NXGETSLAB = NXGETINFO(FILEID, RANK, DIM, DATATYPE)
      IF (NXGETSLAB .NE. NX_OK) RETURN
      DO I = 1, RANK
         CSTART(I) = START(RANK-I+1) - 1
         CSIZE(I) = SIZE(RANK-I+1)
      ENDDO
      NXGETSLAB = NXIGETSLAB(FILEID, DATA, CSTART, CSIZE)
      END
      
      INTEGER FUNCTION NXGETATTR(FILEID, NAME, DATA, DATALEN, TYPE)
      INTEGER FILEID(*),DATA(*),DATALEN,TYPE
      CHARACTER*(*) NAME
      INTEGER*1 INAME(256)
      INTEGER NXIGETATTR
      EXTERNAL NXIGETATTR
      CALL EXTRACT_STRING(INAME, 256, NAME)
      NXGETATTR = NXIGETATTR(FILEID, INAME, DATA, DATALEN, TYPE)
      END

      INTEGER FUNCTION NXGETCHARATTR(FILEID, NAME, DATA, 
     +                                 DATALEN, TYPE)
      INTEGER MAX_DATALEN,NX_ERROR
      INTEGER FILEID(*), DATALEN, TYPE
      PARAMETER(MAX_DATALEN=1024,NX_ERROR=0)
      CHARACTER*(*) NAME, DATA
      INTEGER*1 IDATA(MAX_DATALEN)
      INTEGER*1 INAME(256)
      INTEGER NXIGETATTR
      EXTERNAL NXIGETATTR
      CALL EXTRACT_STRING(INAME, 256, NAME)
      IF (DATALEN .GE. MAX_DATALEN) THEN
          WRITE(6,9020) DATALEN, MAX_DATALEN
          NXGETCHARATTR=NX_ERROR
          RETURN
      ENDIF
      NXGETCHARATTR = NXIGETATTR(FILEID, INAME, IDATA, DATALEN, TYPE)
      IF (NXGETCHARATTR .NE. NX_ERROR) THEN
          CALL REPLACE_STRING(DATA, IDATA)
      ENDIF
      RETURN
 9020 FORMAT('NXgetattr: asked for attribute size ', I4, 
     +       ' with buffer size only ', I4)
      END

      INTEGER FUNCTION NXPUTDATA(FILEID, DATA)
      INTEGER FILEID(*), DATA(*), NXIPUTDATA
      EXTERNAL NXIPUTDATA
      NXPUTDATA = NXIPUTDATA(FILEID, DATA)
      END

      INTEGER FUNCTION NXPUTCHARDATA(FILEID, DATA)
      INTEGER FILEID(*), NXIPUTDATA
      CHARACTER*(*) DATA
      INTEGER*1 IDATA(1024)
      EXTERNAL NXIPUTDATA
      CALL EXTRACT_STRING(IDATA, 1024, DATA)
      NXPUTCHARDATA = NXIPUTDATA(FILEID, IDATA)
      END

      INTEGER FUNCTION NXPUTSLAB(FILEID, DATA, START, SIZE)
      INTEGER FILEID(*), DATA(*), START(*), SIZE(*)
      INTEGER NX_MAXRANK,NX_OK
      PARAMETER(NX_MAXRANK=32,NX_OK=1)
      INTEGER RANK, DIM(NX_MAXRANK), DATATYPE, I
      INTEGER CSTART(NX_MAXRANK), CSIZE(NX_MAXRANK)
      INTEGER NXIPUTSLAB, NXGETINFO
      EXTERNAL NXIPUTSLAB
      NXPUTSLAB = NXGETINFO(FILEID, RANK, DIM, DATATYPE)
      IF (NXPUTSLAB .NE. NX_OK) RETURN
      DO I = 1, RANK
         CSTART(I) = START(RANK-I+1) - 1
         CSIZE(I) = SIZE(RANK-I+1)
      ENDDO
      NXPUTSLAB = NXIPUTSLAB(FILEID, DATA, CSTART, CSIZE)
      END

      INTEGER FUNCTION NXPUTATTR(FILEID, NAME, DATA, DATALEN, TYPE)
      INTEGER FILEID(*), DATA(*), DATALEN, TYPE
      CHARACTER*(*) NAME
      INTEGER*1 INAME(256)
      INTEGER NXIFPUTATTR
      EXTERNAL NXIFPUTATTR
      CALL EXTRACT_STRING(INAME, 256, NAME)
      NXPUTATTR = NXIFPUTATTR(FILEID, INAME, DATA, DATALEN, TYPE)
      END

      INTEGER FUNCTION NXPUTCHARATTR(FILEID, NAME, DATA, 
     +                                 DATALEN, TYPE)
      INTEGER FILEID(*), DATALEN, TYPE 
      CHARACTER*(*) NAME, DATA
      INTEGER*1 INAME(256)
      INTEGER*1 IDATA(1024)
      INTEGER NXIFPUTATTR
      EXTERNAL NXIFPUTATTR
      CALL EXTRACT_STRING(INAME, 256, NAME)
      CALL EXTRACT_STRING(IDATA, 1024, DATA)
      NXPUTCHARATTR = NXIFPUTATTR(FILEID, INAME, IDATA, DATALEN, TYPE)
      END

      INTEGER FUNCTION NXGETINFO(FILEID, RANK, DIM, DATATYPE)
      INTEGER FILEID(*), RANK, DIM(*), DATATYPE
      INTEGER I, J, NXIGETINFO, NX_CHAR
      EXTERNAL NXIGETINFO
      NXGETINFO = NXIGETINFO(FILEID, RANK, DIM, DATATYPE)
C *** Reverse dimension array as C is ROW major, FORTRAN column major
      DO I = 1, RANK/2
          J = DIM(I)
          DIM(I) = DIM(RANK-I+1)
          DIM(RANK-I+1) = J
      ENDDO
      END

      INTEGER FUNCTION NXGETNEXTENTRY(FILEID, NAME, CLASS, DATATYPE)
      INTEGER FILEID(*), DATATYPE
      CHARACTER*(*) NAME, CLASS
      INTEGER*1 INAME(256), ICLASS(256)
      INTEGER NXIGETNEXTENTRY
      EXTERNAL NXIGETNEXTENTRY
      NXGETNEXTENTRY = NXIGETNEXTENTRY(FILEID, INAME, ICLASS, DATATYPE)
      CALL REPLACE_STRING(NAME, INAME)
      CALL REPLACE_STRING(CLASS, ICLASS)
      END

      INTEGER FUNCTION NXGETNEXTATTR(FILEID, PNAME, ILENGTH, ITYPE)
      INTEGER FILEID(*), ILENGTH, ITYPE, NXIGETNEXTATTR
      CHARACTER*(*) PNAME
      INTEGER*1 IPNAME(1024)
      EXTERNAL NXIGETNEXTATTR
      NXGETNEXTATTR = NXIGETNEXTATTR(FILEID, IPNAME, ILENGTH, ITYPE)
      CALL REPLACE_STRING(PNAME, IPNAME)
      END

      INTEGER FUNCTION NXGETGROUPID(FILEID, LINK)
      INTEGER FILEID(*), LINK(*), NXIGETGROUPID
      EXTERNAL NXIGETGROUPID
      NXGETGROUPID = NXIGETGROUPID(FILEID, LINK)
      END

      INTEGER FUNCTION NXGETDATAID(FILEID, LINK)
      INTEGER FILEID(*), LINK(*), NXIGETDATAID
      EXTERNAL NXIGETDATAID
      NXGETDATAID = NXIGETDATAID(FILEID, LINK)
      END

      INTEGER FUNCTION NXMAKELINK(FILEID, LINK)
      INTEGER FILEID(*), LINK(*), NXIMAKELINK
      EXTERNAL NXIMAKELINK
      NXMAKELINK = NXIMAKELINK(FILEID, LINK)
      END

      INTEGER FUNCTION NXMAKENAMEDLINK(FILEID, PNAME, LINK)
      INTEGER FILEID(*), LINK(*), NXIMAKELINK
      CHARACTER*(*) PNAME
      INTEGER*1 INAME(256)
      EXTERNAL NXIMAKENAMEDLINK
      CALL EXTRACT_STRING(INAME,256,PNAME)
      NXMAKENAMEDLINK = NXIMAKENAMEDLINK(FILEID, INAME, LINK)
      END

      INTEGER FUNCTION NXOPENSOURCEGROUP(FILEID)
      INTEGER FILEID(*),NXIOPENSOURCEGROUP
      EXTERNAL NXIOPENSOURCEGROUP
      NXOPENSOURCEGROUP = NXIOPENSOURCEGROUP(FILEID)
      END

      LOGICAL FUNCTION NXSAMEID(FILEID, LINK1, LINK2)
      INTEGER FILEID(*), LINK1(*), LINK2(*), NXISAMEID, STATUS
      EXTERNAL NXISAMEID
      STATUS = NXISAMEID(FILEID, LINK1, LINK2)
      IF (STATUS .EQ. 1) THEN
         NXSAMEID = .TRUE.
      ELSE
         NXSAMEID = .FALSE.
      ENDIF
      END

      INTEGER FUNCTION NXGETGROUPINFO(FILEID, NUM, NAME, CLASS)
      INTEGER FILEID(*), NUM, NXIGETGROUPINFO
      CHARACTER*(*) NAME, CLASS
      INTEGER*1 INAME(256), ICLASS(256)
      EXTERNAL NXIGETGROUPINFO
      NXGETGROUPINFO = NXIGETGROUPINFO(FILEID, NUM, INAME, ICLASS)
      CALL REPLACE_STRING(NAME, INAME)
      CALL REPLACE_STRING(CLASS, ICLASS)
      END

      INTEGER FUNCTION NXINITGROUPDIR(FILEID)
      INTEGER FILEID(*), NXIINITGROUPDIR
      EXTERNAL NXIINITGROUPDIR
      NXINITGROUPDIR = NXIINITGROUPDIR(FILEID)
      END

      INTEGER FUNCTION NXGETATTRINFO(FILEID, NUM)
      INTEGER FILEID(*), NUM, NXIGETATTRINFO
      EXTERNAL NXIGETATTRINFO
      NXGETATTRINFO = NXIGETATTRINFO(FILEID, NUM)
      END

      INTEGER FUNCTION NXINITATTRDIR(FILEID)
      INTEGER FILEID(*), NXIINITATTRDIR
      EXTERNAL NXIINITATTRDIR
      NXINITATTRDIR = NXIINITATTRDIR(FILEID)
      END

      INTEGER FUNCTION NXISEXTERNALGROUP(FILEID, VGROUP, NXCLASS, NXURL)
      INTEGER FILEID(*),NXIISEXTERNALGROUP, LENGTH
      CHARACTER*(*) VGROUP, NXCLASS, NXURL
      INTEGER*1 IVGROUP(256), INXCLASS(256), INXURL(256)
      EXTERNAL NXIISEXTERNALGROUP
      LENGTH = 256
      CALL EXTRACT_STRING(IVGROUP, 256, VGROUP)
      CALL EXTRACT_STRING(INXCLASS, 256, NXCLASS)
      NXISEXTERNALGROUP = NXIISEXTERNALGROUP(FILEID, IVGROUP, INXCLASS, 
     &  INXURL,LENGTH)
      CALL REPLACE_STRING(NXURL, INXURL)
      END


      INTEGER FUNCTION NXINQUIREFILE(FILEID, NXFILE)
      INTEGER FILEID(*),NXIINQUIREFILE, LENGTH
      CHARACTER*(*) NXFILE
      INTEGER*1 INXFILE (1024)
      EXTERNAL NXIINQUIREFILE
      LENGTH = 1023
      NXINQUIREFILE = NXIINQUIREFILE(FILEID,INXFILE, 1023)
      CALL REPLACE_STRING(NXFILE, INXFILE)
      END

      INTEGER FUNCTION NXLINKEXTERNAL(FILEID, VGROUP, NXCLASS, NXURL)
      INTEGER FILEID(*),NXILINKEXTERNAL
      CHARACTER*(*) VGROUP, NXCLASS, NXURL
      INTEGER*1 IVGROUP(256), INXCLASS(256), INXURL(1024)
      EXTERNAL NXILINKEXTERNAL
      CALL EXTRACT_STRING(IVGROUP, 256, VGROUP)
      CALL EXTRACT_STRING(INXCLASS, 256, NXCLASS)
      CALL EXTRACT_STRING(INXURL, 1023, NXURL)
      NXLINKEXTERNAL = NXILINKEXTERNAL(FILEID, IVGROUP,INXCLASS, 
     & INXURL)
      END
