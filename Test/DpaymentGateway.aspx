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
  <script src="jquery-3.6.0.min.js"></script>  
<script type="text/javascript">
    $(document).ready(function () {
        $("#search").click(function () {
            var userid = $("#transid").val();
            $.ajax({
                url: 'userWebService1.asmx/GetAllUsers',
                data: { id : userid },
                method: 'post',
                dataType: 'xml',
                success: function (data) {
                    var jXml = $(data);
                    $("#LDate").val(jXml.find('Date').text());
                    $("#bName").val(jXml.find('BankName').text());
                    $("#accNum").val(jXml.find('AccountNumber').text());
                    $("#amount").val(jXml.find('Amount').text());
                    $("#cnic").val(jXml.find('CNIC').text());
                    
                },
                error: function (err) {
                    alert(err);
                }
            })
        });
    });
</script>  
    
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
        <div class="jumbotron">
        <h1>Search Entry AJAX</h1>
        </div>
       
        <div class="contaner col-8">
           <input type="text" id="cellid" placeholder="TransactionID" />
           
           <input type="text" id="transid" placeholder="Cell number" />
           <input type="button" id="search" value="Search" /> 
           <br />
           <br />
            <table class="table"> 
                <tr>
                    <td>Account Number</td>
                    <td><input type="text" id="accNum" /></td>
                </tr>
                <tr>
                    <td>Bank Name</td>
                    <td><input type="text" id="bName" /></td>
                </tr>
                <tr>
                    <td>Login Date</td>
                    <td><input type="text" id="LDate" /></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" id="amount" /></td>
                </tr>
                <tr>
                    <td>CNIC</td>
                    <td><input type="text" id="cnic" /></td>
                </tr>
            </table>
           <h1 id="h">hello brother</h1>
       </div>

    </form>
        
</body>
</html>
