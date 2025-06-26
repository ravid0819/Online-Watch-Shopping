using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for GmailSender
/// </summary>
public class GmailSender
{

    public GmailSender()
{
    //
    // TODO: Add constructor logic here
    //
}
public static bool SendMail(string to, string subject, string message)
{
    try
    {
        NetworkCredential loginInfo = new NetworkCredential("dumyravi@gmail.com", "xdwt fdbf tdjt szoy");
        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("dumyravi@gmail.com", "RAVI D.");
        msg.To.Add(new MailAddress(to));
        msg.Subject = subject;
        msg.Body = message;
        msg.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = loginInfo;
        client.Send(msg);

        return true;
    }
    catch (Exception)
    {
        return false;
    }

}

    
}