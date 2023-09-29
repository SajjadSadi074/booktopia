<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ordermanagement.aspx.cs" Inherits="booktopia.ordermanagement" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
            $(document).ready(function () {
                $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
            });
  </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
            <div class="row">
                

                <div class="col-md-4">
              <div class="card">
                  <div class="card-body">
                      <div class="row">
                          <div class="col">
                              <center>
                                  <h4>Order Details</h4>
                              </center>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col">
                              <hr>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col">
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Order_id</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="order_id_text" runat="server" placeholder="Order_id"></asp:TextBox>
                                   <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                  </div>
                                </div>
                          </div>
                      </div>


                      <div class="row">
                          <div class="col-md-12">
                              <label>Book ID</label>
                              <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="book_id_text" runat="server" placeholder="Book ID" ReadOnly="True"></asp:TextBox>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Member ID</label>
                              <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="member_id_text" runat="server" placeholder="Member ID" ReadOnly="True"></asp:TextBox>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-12">
                              <label>Phone</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="phone_id_text" runat="server" placeholder="phone" ReadOnly="True"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Address</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="Address_text" runat="server" placeholder="address" ReadOnly="True"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>payment method</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="pay_text" runat="server" placeholder="payment method" ReadOnly="True"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Transaction ID</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="t_id_text" runat="server" placeholder="transaction id" ReadOnly="True"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Status</label>
                              <div class="form-group">
                                  <div class="form-group">
                                      <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                          <asp:ListItem Text="Pending" Value="Pending" />
                                          <asp:ListItem Text="Checked" Value="Checked" />
                                          <asp:ListItem Text="Prossesing" Value="Prossesing" />
                                          <asp:ListItem Text="Declined" Value="Declined" />
                                      </asp:DropDownList>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                            <div class="col-md-4">

                            </div>
                            <asp:Button class="btn btn-dark btn-lg vertical-center col-md-4" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/>
                      </div>

                  </div>
              </div>
<center>
                    <a href="home.aspx"><< Back to Home</a><span class="clearfix"></span>
                    <br />
                    <center>
          </div>

                <div class="col-sm-8">
                    <center>
                        <h3>
                        Order List</h3>
                    </center>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [order_table]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="order_id" HeaderText="Order" SortExpression="order_id" />
                                                <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                                <asp:BoundField DataField="book_id" HeaderText="Book" SortExpression="book_id" />
                                                <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                                                <asp:BoundField DataField="Address" HeaderText="Adress" SortExpression="Address" />
                                                <asp:BoundField DataField="payment" HeaderText="Pay method" SortExpression="payment" />
                                                <asp:BoundField DataField="t_id" HeaderText="Transiction ID" SortExpression="t_id" />
                                                <asp:BoundField DataField="status" HeaderText="Pay Status" SortExpression="status" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </asp:Content>