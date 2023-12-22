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
        if CustomerRec.findfirst then
            Message('%1', CustomerRec.Name);

    end;

    /// <summary>
    /// ListCustomerWithNoLocation.
    /// </summary>
    procedure ListCustomerWithNoLocation()
    var
        CustomerRec: Record Customer;
    begin
        CustomerRec.SetFilter("Location Code", '<>%1', '');
        Page.Run(Page::"Customer List", CustomerRec);
    end;
}
