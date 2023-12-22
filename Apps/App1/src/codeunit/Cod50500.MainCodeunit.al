codeunit 50500 "Main Codeunit"
{
    procedure GetCustomerBalance(CustNo: Code[20]): Decimal
    var
        CustomerRec: Record customer;
    begin
        CustomerRec.Get(CustNo);
        CustomerRec.CalcFields("Balance (LCY)");
        exit(CustomerRec."Balance (LCY)");
    end;

    procedure ListCustomerWithNoLocation()
    var
        CustomerRec: Record Customer;
    begin
        CustomerRec.SetFilter("Location Code", '<>%1', '');
        CustomerRec.Setrange("No.", '01121212');
        if CustomerRec.findSet then begin
            Message('Customre Name : %1', CustomerRec.Name);
        end;

    end;
}
