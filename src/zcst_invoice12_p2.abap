*&---------------------------------------------------------------------*
*& Report zcst_invoice12_p2
*& Consuming Parameterized CDS View via Open SQL
*&---------------------------------------------------------------------*
REPORT zcst_invoice12_p2.

PARAMETERS: p_land1 TYPE kna1-land1 OBLIGATORY DEFAULT 'IN'.

START-OF-SELECTION.

  " Select directly from parameterized CDS view using Open SQL host variables
  SELECT *
    FROM zcst_invoice12( ctry = @p_land1 )
    INTO TABLE @DATA(it_final).

  IF it_final IS NOT INITIAL.
    cl_demo_output=>display( it_final ).
  ELSE.
    MESSAGE 'No customer records found for the selected country.' TYPE 'I'.
  ENDIF.
