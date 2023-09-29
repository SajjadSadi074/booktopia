<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerReview.aspx.cs" Inherits="booktopia.CustomerReview" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

   </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
            <div class="row">
                

            <div class="col-md-5">
              <div class="card">
                  <div class="card-body">
                      <div class="row">
                          <div class="col">
                              <center>
                                  <h4>Review Here</h4>
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
                          <div class="col">
                              <center>
                                  <asp:Image ID="imgview" runat="server" Height="270px" Width="180px" />
                              </center>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col">
                              <hr>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Book name</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="book name" ReadOnly="true"></asp:TextBox>
                              </div>
                          </div>
                      </div>

                       <div class="row">
                          <div class="col-md-6">
                              <label>Book ID</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                   <asp:Button class="form-control btn btn-outline-primary" ID="Button2" runat="server" Text="Go" OnClick="Button2_Click" />
                                  </div>
                                </div>
                          </div>
                           <div class="col-md-6">
                              <label>Book Rating</label>
                              <div class="form-group">
                                   <asp:TextBox CssClass="form-control" ID="rating_text" runat="server" placeholder="rating ( must be an integer 1 to 5 )"></asp:TextBox>
                              </div>
                          </div>
                      </div>

                      
                      <div class="row">
                          <div class="col-md-12">
                              <label>Book review</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="review_text" runat="server" placeholder="write review here"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>


                      <div class="row">
                            <div class="col-md-5">

                            </div>
                                 <asp:Button class="btn btn-dark btn-lg vertical-center col-md-2" ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click"/>
                           
                      </div>

                  </div>
              </div>
                <center>
                    <a href="home.aspx"><< Back to Home</a><span class="clearfix"></span>
                    <br />
                    <center>
          </div>
                
                <div class="col-md-7">
                    <center>
                        <h3>Reviews</h3>
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
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:elibraryDBConnectionString %>" SelectCommand="SELECT * FROM [review_table2]"></asp:SqlDataSource>
                                    <div class="col">
                                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="book_id" HeaderText="Book ID" ReadOnly="True" SortExpression="book_id" />
                                                <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                                <asp:BoundField DataField="rating" HeaderText="Rating" SortExpression="rating" />
                                                <asp:BoundField DataField="review" HeaderText="Review" SortExpression="review" />
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