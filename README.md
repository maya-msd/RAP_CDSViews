# SAP S/4HANA & ABAP: Parameterized CDS View & Open SQL Consumer

Implementation of a Core Data Services (CDS) view utilizing single-parameter data filtering, built-in string functions, and conditional expressions, consumed via modern Open SQL in ABAP.

## Technical Architecture

### 1. Data Definition (`zcst_invoice12.asddls`)
* **Base Table**: `kna1` (General Customer Master Data)
* **Parameter Handling**: Uses `with parameters ctry : land1` to filter customer datasets directly at the database engine level via `$parameters.ctry`.
* **String Operations**:
  * `concat_with_space()`: Concatenates `name1` and `name2` with defined spacing.
  * `length()`: Computes character length of city names (`ort01`).
* **Conditional Logic**: Evaluates country keys (`land1`) dynamically using `CASE ... WHEN` expressions.

### 2. ABAP Consumer Report (`zcst_invoice12_p2.abap`)
* Implements inline declarations (`@DATA(it_final)`).
* Passes runtime selection screen parameters (`p_land1`) into the parameterized CDS view via host variable binding (`@p_land1`).
* Renders processed datasets using standard `cl_demo_output`.

## Technologies Used
* SAP Core Data Services (CDS)
* ABAP Open SQL (New Syntax)
* SAP S/4HANA Database Modeling
* Eclipse ADT
