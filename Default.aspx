<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Upload multiple file with Asp.net C# & Dropzone.js</title>

    <%--Bootstrap CSS--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" />
    <%--Dropzone css--%>
    <link href="css/dropzone.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row" style="margin-top:30px;">

                <div class="col-sm-10">
                    <div id="dZUpload" class="dropzone">
                        <div class="dz-default dz-message">
                            Drop image here. 
                   
                        </div>
                    </div>
                </div>

                <div class="col-sm-2 text-xs-center">
                    <a href="javascript:void(0)" class="btn btn-primary" id="btnStartUpload">Upload File</a>
                </div>
            </div>
        </div>
    </form>
    <%--jQuery first, then Bootstrap JS--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"></script>
    <%--Dropzone js--%>
    <script src="js/dropzone.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Dropzone.autoDiscover = false;

            var myDropzone = new Dropzone('#dZUpload', {
                url: "UploadProcess.ashx",
                maxFiles: 20,
                parallelUploads: 20,
                addRemoveLinks: true,
                autoProcessQueue: false,
                maxFilesize: 2, // MB       
                acceptedFiles: 'image/*',
                init: function () {
                    var th = this;
                    this.on('queuecomplete', function () {
                        // CALL IMAGE LOADING HERE
                        setTimeout(function () {
                            th.removeAllFiles();
                        }, 5000);
                    })
                },
                success: function (file, response) {
                    var imgName = response;
                    file.previewElement.classList.add("dz-success");
                },
                error: function (file, response) {
                    file.previewElement.classList.add("dz-error");
                    $(file.previewElement).find('.dz-error-message').text(response);
                }
            });

            $('#btnStartUpload').click(function () {
                myDropzone.processQueue();
            });
        });
    </script>
</body>
</html>
