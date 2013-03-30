*
* Bloqueio/Desbloqueio de Produtos
*

SAVE SCREEN TO TMP
SELECT PRODUTO
GO TOP
STORE .F. TO OK
DECLARE MAT1[4],MAT2[4],MAT3[4]
MAT1[1] = "CODPROD"
MAT1[2] = "NOMEPROD"
MAT1[3] = "VALOR"
MAT1[4] = "IF(BLOQ,'Bloqueado','         ')"
MAT2[1] = "Código"
MAT2[2] = "Produto"
MAT2[3] = "Valor Unit."
MAT2[4] = "Bloqueio"
MAT3[1] = "─┬─"
MAT3[2] = "─┬─"
MAT3[3] = "─┬─"
MAT3[4] = "─┬─"
MOLDURA(12,01,21,76,STDMOLD,.T.,"Bloqueio de Produtos",STDINVE)
SETCOLOR(STDMOLD+","+STDINVE) 
SET CURSOR OFF
ARROWS(.F.)
DBEDIT(13,02,20,75,MAT1,"UDF","",MAT2,MAT3)
ARROWS(.T.)
RESTORE SCREEN FROM TMP
RETURN

FUNCTION UDF
RET = 1
IF LASTKEY() = 13 .AND. OK
   IF REC_LOCK(0)
      REPLACE BLOQ WITH .NOT. BLOQ
   ENDIF
ENDIF
IF LASTKEY() = 27 .AND. OK
   RET = 0
ENDIF
STORE .T. TO OK
RETURN(RET)
