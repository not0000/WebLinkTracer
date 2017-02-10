<%@ Page Language="C#" %>

<%  
    var href = Request.QueryString["href"];
    string file = Server.MapPath("/jqueryredirect/tracer.txt");

    //System.IO.FileStream fileStream = new System.IO.FileStream(file, System.IO.FileMode.Create);

    //fileStream.Close();   //切記開了要關,不然會被佔用而無法修改喔!!!
    /*
        System.IO.FileStream FsWrite = System.IO.File.Open(ExceptionLogFileLocation, System.IO.FileMode.Append);
        System.IO.StreamWriter Swriter = new System.IO.StreamWriter(FsWrite);
        Swriter.WriteLine("Message={0}。", message);
        Swriter.Dispose();
        FsWrite.Dispose();
    */
    string UserIP = "";
    System.Web.HttpContext context = System.Web.HttpContext.Current;
    string sIPAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
    if (string.IsNullOrEmpty(sIPAddress))
    {
        UserIP =  context.Request.ServerVariables["REMOTE_ADDR"];
    }
    else
    {
        string[] ipArray = sIPAddress.Split(new Char[] { ',' });
        UserIP =  ipArray[0];
    }

    //System.IO.FileStream fsFile = new System.IO.FileStream(file,System.IO.FileMode.OpenOrCreate);
    System.IO.StreamWriter swWriter = System.IO.File.AppendText(file); // new System.IO.StreamWriter(fsFile);
    swWriter.WriteLine("UserIP："+UserIP+"  LinkTo：" + href + "  " + DateTime.Now);
    swWriter.Close();


%>
