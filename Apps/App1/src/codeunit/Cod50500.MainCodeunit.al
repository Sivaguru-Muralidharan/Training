codeunit 50500 "Main Codeunit"
{
    procedure GetCustomerBalance(CustNo: Code[20]): Decimal
    var
        CustomerRec: Record customer;
    begin
        CustomerRec.Get(CustNo);
        CustomerRec.CalcFields("Balance (LCY)");
        Message('customer num: %1 And balance %2', CustNo, CustomerRec."Balance (LCY)");
        exit(CustomerRec."Balance (LCY)");

    end;

    procedure ListCustomerWithNoLocation()
    var
        CustomerRec: Record Customer;
    begin
        CustomerRec.SetFilter("Location Code", '<>%1', '');
        Page.Run(Page::"Customer List", CustomerRec);
    end;
}
