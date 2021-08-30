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
            var Tid = $("#cellid").val();
            $.ajax({
                url: 'userWebService1.asmx/GetAllUsers',
                data: {
                    id: userid, tid: Tid
                },
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
        <div class="container form-group row">
            <div class="form-group col">
                <asp:Label ID="Label6" runat="server" Text="Bank Account Number"></asp:Label>
             </div>
            <div class="col">
                <asp:TextBox ID="TextBox5" CssClass="form-control"  runat="server" placeholder="Enter Account number"></asp:TextBox>
            </div>
         </div>
        <div class="container form-group row">
            <div class="col">
            <asp:Label ID="Label1" runat="server" Text="Bank Name"></asp:Label>
            </div>
            <div class="col">
          <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                    <asp:ListItem CssClass="form-control" value="HBL">HBL bank</asp:ListItem>
                    <asp:ListItem CssClass="form-control" value="Meezan">Meezan bank</asp:ListItem>
                    <asp:ListItem CssClass="form-control" value="Alfalah">Bank Alfalah</asp:ListItem>
                    <asp:ListItem CssClass="form-control" value="Habib Metro">Habib Metro</asp:ListItem>
                    <asp:ListItem CssClass="form-control" value="National bank">National bank</asp:ListItem>
                </asp:DropDownList>
                </div>
            </div>
        <div class="row container form-group">
        <div class="col">
            <asp:Label ID="Label2" runat="server" Text="CNIC"></asp:Label>
        </div>
        <div class="col">
            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Enter CNIC"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Wrong format" EnableClientScript="False" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{5}-[0-9]{7}-[0-9]$"></asp:RegularExpressionValidator>
        </div>
        </div>
        <div class="container form-group row">
        <div class="col">
        <asp:Label ID="Label3" runat="server" Text="Amount"></asp:Label>
        </div>
        <div class="col">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Amount"></asp:TextBox>    
        </div>
        </div>
        <div class="container form-group row">
        <div class="col">
            <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
        </div>
        <div class="col">
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email not currect" EnableClientScript="False" ControlToValidate="TextBox3" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>
        </div>

        <div class="container form-group row">
        <div class="col">
            <asp:Label ID="Label5" runat="server" Text="Mobile Number"></asp:Label> 
        </div>
        <div class="col">
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="Mobile Number"></asp:TextBox>          
        </div>
        </div>

        <div class="container form-group row">
        <div class="col">
            <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
        </div>
        <div class="col">
            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
        </div>
        </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-5">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" class="btn btn-primary" Text="Submit" OnClick="Button1_Click1" />
                </div>
                
            </div>            

        
            <div>
                <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
            </div>
        
        <br />
        <div class="jumbotron">
        <h1>Search Entry AJAX</h1>
        </div>
        <div class="row form-group">
       <div class="col-2"></div>
        <div class="contaner col-8">
           <input type="text" class="form-control" id="cellid" placeholder="TransactionID" />
           
           <input type="text" class="form-control" id="transid" placeholder="Cell number" />
           <input type="button" id="search" class="btn btn-success" value="Search" /> 
           <br />
           <br />
          </div>
         <div class="row container">
             <div class="col">
            <table class="table"> 
                <tr>
                    <td>Account Number</td>
                    <td><input class="form-control" type="text" id="accNum" /></td>
                </tr>
                <tr>
                    <td>Bank Name</td>
                    <td><input class="form-control" type="text" id="bName" /></td>
                </tr>
                <tr>
                    <td>Login Date</td>
                    <td><input class="form-control" type="text" id="LDate" /></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td><input class="form-control" type="text" id="amount" /></td>
                </tr>
                <tr>
                    <td>CNIC</td>
                    <td><input class="form-control" type="text" id="cnic" /></td>
                </tr>
            </table>
          </div>
       </div>
        
    </div>
        <div class="row">
            <div class="col container">
            <h4>Note:</h4><p>The transaction id will be auto generated, to retrieve data you can copy it from the Table.</p>
        </div>
        </div>
        
    </form>
        
</body>
</html>
