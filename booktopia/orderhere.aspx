<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orderhere.aspx.cs" Inherits="booktopia.orderhere" %>
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
          <div class="col-md-7">
              <div class="card">
                  <div class="card-body">
                      <div class="row">
                          <div class="col">
                              <center>
                                  <h4>Book Details</h4>
                              </center>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col">
                              <center>
                                  <asp:Image ID="imgview" runat="server" Height="300px" Width="200px" />
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
                          <div class="col-md-4">
                              <label>Book ID</label>
                              <div class="form-group">
                                  <div class="input-group">
                                      <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Book ID"></asp:TextBox>
                                      <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                  </div>
                              </div>
                          </div>
                          <div class="col-md-8">
                              <label>Book Name</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Book Name"></asp:TextBox>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-4">
                              <label>Language</label>
                              <div class="form-group">
                                  <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                      <asp:ListItem Text="English" Value="English" />
                                      <asp:ListItem Text="Hindi" Value="Hindi" />
                                      <asp:ListItem Text="Marathi" Value="Marathi" />
                                      <asp:ListItem Text="French" Value="French" />
                                      <asp:ListItem Text="German" Value="German" />
                                      <asp:ListItem Text="Urdu" Value="Urdu" />
                                  </asp:DropDownList>
                              </div>
                              <label>Publisher Name</label>
                              <div class="form-group">
                                  <div class="form-group">
                                      <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                  </div>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <label>Author Name</label>
                              <div class="form-group">
                                  <div class="form-group">
                                      <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Author Name"></asp:TextBox>
                                  </div>
                              </div>
                              <label>Publish Date</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <label>gener</label>
                              <div class="form-group">
                                  <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                                      <asp:ListItem Text="Action" Value="Action" />
                                      <asp:ListItem Text="Adventure" Value="Adventure" />
                                      <asp:ListItem Text="Comic Book" Value="Comic Book" />
                                      <asp:ListItem Text="Self Help" Value="Self Help" />
                                      <asp:ListItem Text="Motivation" Value="Motivation" />
                                      <asp:ListItem Text="Healthy Living" Value="Healthy Living" />
                                      <asp:ListItem Text="Wellness" Value="Wellness" />
                                      <asp:ListItem Text="Crime" Value="Crime" />
                                      <asp:ListItem Text="Drama" Value="Drama" />
                                      <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                      <asp:ListItem Text="Horror" Value="Horror" />
                                      <asp:ListItem Text="Poetry" Value="Poetry" />
                                      <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                      <asp:ListItem Text="Romance" Value="Romance" />
                                      <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                      <asp:ListItem Text="Suspense" Value="Suspense" />
                                      <asp:ListItem Text="Thriller" Value="Thriller" />
                                      <asp:ListItem Text="Art" Value="Art" />
                                      <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                      <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                      <asp:ListItem Text="Health" Value="Health" />
                                      <asp:ListItem Text="History" Value="History" />
                                      <asp:ListItem Text="Math" Value="Math" />
                                      <asp:ListItem Text="Textbook" Value="Textbook" />
                                      <asp:ListItem Text="Science" Value="Science" />
                                      <asp:ListItem Text="Travel" Value="Travel" />
                                  </asp:ListBox>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-4">
                              <label>Edition</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Edition"></asp:TextBox>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <label>Book price(per unit)</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Book price" TextMode="Number"></asp:TextBox>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <label>Pages</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-md-4">
                              <label>Rating</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Rating" TextMode="Number" ReadOnly="True"></asp:TextBox>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <label>Rating count</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Rating count" TextMode="Number" ReadOnly="True"></asp:TextBox>
                              </div>
                          </div>
                          <div class="col-md-4">
                              <label>Sold Books</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Sold Books" TextMode="Number" ReadOnly="True"></asp:TextBox>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                          <div class="col-12">
                              <label>Book Description</label>
                              <div class="form-group">
                                  <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Book Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                              </div>
                          </div>
                      </div>
                      <div class="row">
                      </div>
                  </div>
              </div>

              <a href="homepage.aspx"><< Back to Home</a><br>
              <br>
          </div>


          <div class="col-md-5">
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
                                   <asp:TextBox CssClass="form-control" ID="phone_id_text" runat="server" placeholder="phone"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Address</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="Address_text" runat="server" placeholder="address"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>payment method</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="pay_text" runat="server" placeholder="payment method"></asp:TextBox>
                                  </div>
                                </div>
                          </div>
                      </div>

                      <div class="row">
                          <div class="col-md-12">
                              <label>Transaction ID</label>
                              <div class="form-group">
                                  <div class="input-group">
                                   <asp:TextBox CssClass="form-control" ID="t_id_text" runat="server" placeholder="transaction id"></asp:TextBox>
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
          </div>
      </div>
   </div>
</asp:Content>