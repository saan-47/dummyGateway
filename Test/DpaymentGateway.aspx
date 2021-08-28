<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DpaymentGateway.aspx.cs" Inherits="Test.DpaymentGateway" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="jquery-3.6.0.js"></script>  
  <script type="text/javascript" src="jquery-3.6.0.min.js"></script>  
  
    
</head>
<body>
    <form id="form1" runat="server">
        <div class="jumbotron">
            <h1>Dummy Gateway</h1>           
        </div>
        <div class="container">
            <div class="form-group col">
                <asp:Label ID="Label6" CssClass="col-1" runat="server" Text="Bank Account Number"></asp:Label>
                <asp:TextBox ID="TextBox5" CssClass="col-3"  runat="server" placeholder="Enter Account number"></asp:TextBox>
            </div>
            <div class="form-group">               
                <asp:Label ID="Label1" CssClass="col-1" runat="server" Text="Bank Name"></asp:Label>
                <asp:DropDownList ID="DropDownList1" CssClass="col-3" runat="server">
                    <asp:ListItem value="HBL">HBL bank</asp:ListItem>
                    <asp:ListItem value="Meezan">Meezan bank</asp:ListItem>
                    <asp:ListItem value="Alfalah">Bank Alfalah</asp:ListItem>
                    <asp:ListItem value="Habib Metro">Habib Metro</asp:ListItem>
                    <asp:ListItem value="National bank">National bank</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-1" Text="CNIC"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="col-3" placeholder="Enter CNIC"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Wrong format" EnableClientScript="False" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{5}-[0-9]{7}-[0-9]$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-1" Text="Amount"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="col-3" placeholder="Amount"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-1" Text="Email"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="col-3" placeholder="Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email not currect" EnableClientScript="False" ControlToValidate="TextBox3" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-1" Text="Mobile Number"></asp:Label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="col-3" placeholder="Mobile Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label7" runat="server" CssClass="col-1" Text="Address"></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="col-3" placeholder="Address"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label8" runat="server" CssClass="col-1" Text="DateTime"></asp:Label>
                
            </div>
            <div>
                <asp:Button ID="Button1" runat="server" CssClass="col-3" class="btn btn-primary" Text="Submit" OnClick="Button1_Click1" />
            </div>
            <div>
                <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <br />
    </form>
    <div class="jumbotron">
        <h1>Search Entry</h1>
    </div>
    <div class="container row">
        <div class="col-6">
            <p>Enter TransactionID</p>
            <br />
            <p>Enter Mobile Number</p>
            <%--<asp:Label ID="Label10" runat="server" Text="TransactionID"></asp:Label>
            <br />
            <asp:Label ID="Label11" runat="server" Text="Call Number"></asp:Label>--%>
            
        </div>
        <div class="col-3">
            <input type="text" id="transid" placeholder="Enter TransactionID" />
            <br />
            <input type="text" placeholder="Enter Mobile number" />
            <%--<asp:TextBox ID="TextBox7" runat="server" placeholder="transID"></asp:TextBox>
            <br />
            <asp:TextBox ID="TextBox8" runat="server" placeholder="Mobile Number"></asp:TextBox>--%>
        </div>
        <div class="col-12">
            <input id="bt" type="button" value="Show"/>
            <%--<asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" />--%>
        </div>
        
    </div>
        <div class="container">
            <div class="row">
                <div class="col-2">TransactionID</div>
                <div class="col-2">Amount</div>
                <div class="col-2">Login DateTime</div>
                <div class="col-2">CNIC</div>
                <div class="col-2">Email</div>
                <div class="col-2">Mobile Number</div>
            </div>
            <div class="row" id="demo">
                <div class="col-2 i1" id="qwe">
                    <h4 id="sheep">info</h4>
                </div>
                <div class="col-2 i2">
                    <h4>info</h4>
                </div>
                <div class="col-2 i3">
                    <h4>info</h4>                    
                </div>
                <div class="col-2 i4">
                    <h4>info</h4>                    
                </div>
                <div class="col-2 i5">
                    <h4>info</h4>                    
                </div>
                <div class="col-2 i6"></div>
            </div>
        </div><div class="container py-4">  
        <h4 class="text-center text-uppercase">HOW TO RETRIEVE DATA FROM DATABASE USING JQUERY AJAX IN MVC5</h4>  
        <div id="dataTable_wrapper"></div>  
        <table id="employee" class="table table-bordered table-striped">  
            <thead>  
                <tr>  
                    <th>Name</th>  
                    <th>Position</th>  
                    <th>Office</th>  
                    <th>Age</th>  
                    <th>Salary</th>  
                </tr>  
            </thead>  
        </table>  
    </div>   
<script>
    function getAllEmployees() {
        $.ajax({
            url: 'userWebService1.asmx/getUsers',
            dataType: "json",
            method: 'GET',
            success: function (data) {
                var employeeTable = $('#employee tbody');
                employeeTable.empty();

                $(data).each(function (index, emp) {
                    employeeTable.append('<tr><td>' + emp.ID + '</td><td>'
                        + emp.Name + '</td><td>' + emp.Gender + '</td><td>'
                        + emp.Phone + '</td><td>' + emp.Email + '</td><td>'
                        + emp.Age + '</td><td>' + emp.Salary + '</td></tr>');
                });
            },
            error: function (err) {
                console.log(err);
            }
        });
    }  
});

</script>
</body>
</html>
