/// <summary>
/// Codeunit Main Codeunit (ID 50500).
/// </summary>
codeunit 50500 "Main Codeunit"
{
    /// <summary>
    /// GetCustomerBalance.
    /// </summary>
    /// <param name="CustNo">Code[20].</param>
    /// <returns>Return value of type Decimal.</returns>
    procedure GetCustomerBalance(CustNo: Code[20]): Decimal
    var
        CustomerRec: Record customer;
    begin
        CustomerRec.Get(CustNo);
        CustomerRec.CalcFields("Balance (LCY)");
        exit(CustomerRec."Balance (LCY)");
    end;

    /// <summary>
    /// ListCustomerWithNoLocation.
    /// </summary>
    procedure ListCustomerWithNoLocation()
    var
        CustomerRec: Record Customer;
    begin
        Message('Caliiing a List-customer-with-no-location function from code unit');
        CustomerRec.SetFilter("Location Code", '<>%1', '');
        CustomerRec.Setrange("No.", '01121212');
        if CustomerRec.findSet then begin
            Message('Customre Name : %1', CustomerRec.Name);
        end;

    end;
}
