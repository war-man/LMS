using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using LMSBL.Common;
using LMSBL.DBModels.CRMNew;
using LMSBL.DBModels;
using LMSBL.Repository;
using LMSWeb.ViewModel;
using System.Threading;
using System.Web.Script.Serialization;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Net;
using iTextSharp.tool.xml;
using iTextSharp.tool.xml.pipeline.html;
using iTextSharp.tool.xml.html;
using iTextSharp.tool.xml.pipeline.css;
using iTextSharp.tool.xml.pipeline.end;
using iTextSharp.tool.xml.parser;
using System.Text;

namespace LMSWeb.Controllers
{
    public class InvoiceController : Controller
    {
        CRMNotesRepository crmnr = new CRMNotesRepository();
        CRMUsersRepository crmUsersRepository = new CRMUsersRepository();
        CRMInvoiceRepository invoiceRepository = new CRMInvoiceRepository();
        // GET: Invoice
        public ActionResult Index()
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            CRMInvoiceViewModel CRMInvoiceModelView = new CRMInvoiceViewModel();
            tblCRMInvoice objNewInvoice = new tblCRMInvoice();
            //objNewInvoice.InvoiceNumber = invoiceRepository.GetInvoiceNumber(Convert.ToInt32(sessionUser.CRMClientId));
            CRMInvoiceModelView.ObjCRMInvoivce = objNewInvoice;

            CRMInvoiceModelView.lstCRMCurriencies = invoiceRepository.GetCRMCurriencies();
            CRMInvoiceModelView.lstCRMclient = crmnr.GetClient(Convert.ToInt32(sessionUser.CRMClientId));
            return View(CRMInvoiceModelView);
        }

        [HttpPost]
        public bool AddInvoice(CRMInvoiceViewModel CRMInvoiceModelView)
        {
            bool result = false;
            TblUser sessionUser = (TblUser)Session["UserSession"];

            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
            json_serializer.MaxJsonLength = int.MaxValue;
            object[] objInvoiceData = (object[])json_serializer.DeserializeObject(CRMInvoiceModelView.JsonData);

            CRMInvoiceModelView.ObjCRMInvoivce.CreatedBy = sessionUser.UserId;
            CRMInvoiceModelView.ObjCRMInvoivce.CreatedOn = DateTime.Now;
            CRMInvoiceModelView.ObjCRMInvoivce.UpdatedBy = sessionUser.UserId;
            CRMInvoiceModelView.ObjCRMInvoivce.UpdatedOn = DateTime.Now;

            List<tblCRMInvoiceItem> lstInvoiceItems = new List<tblCRMInvoiceItem>();
            foreach (Dictionary<string, object> item in objInvoiceData)
            {
                tblCRMInvoiceItem InvoiveItem = new tblCRMInvoiceItem();
                InvoiveItem.ItemDescription = Convert.ToString(item["ItemDesc"]);
                InvoiveItem.Price = Convert.ToDecimal(item["ItemPrice"]);
                InvoiveItem.Amount = Convert.ToDecimal(item["ItemAmount"]);
                lstInvoiceItems.Add(InvoiveItem);
            }

            result = invoiceRepository.SaveInvoice(CRMInvoiceModelView.ObjCRMInvoivce, lstInvoiceItems);

            return result;
        }

        public string GetInvoiceNumber(int clientId)
        {
            string invoiceNo = string.Empty;
            invoiceNo = invoiceRepository.GetInvoiceNumber(Convert.ToInt32(clientId));
            return invoiceNo;
        }

        public ActionResult GetInvoices(int clientId)
        {
            CRMInvoiceViewModel CRMInvoiceModelView = new CRMInvoiceViewModel();
            CRMInvoiceModelView.ObjCRMInvoivceLST = invoiceRepository.GetInvoices(clientId);
            return PartialView("_InvoiceList", CRMInvoiceModelView);
        }

        public ActionResult GetInvoiceForEdit(int InvoiceId)
        {
            CRMInvoiceViewModel CRMInvoiceModelView = new CRMInvoiceViewModel();
            CRMInvoiceModelView.ObjCRMInvoivce = invoiceRepository.GetInvoiceForEdit(InvoiceId);
            CRMInvoiceModelView.ObjCRMInvoiceItemLST = invoiceRepository.GetInvoiceItemForEdit(InvoiceId);

            return Json(CRMInvoiceModelView, JsonRequestBehavior.AllowGet);
        }

        public bool MarkPaidInvoice(int invoiceId)
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            var status = invoiceRepository.MarkPaidInvoice(invoiceId, sessionUser.UserId);
            return status;
        }


        public ActionResult DownloadInvoice(int InvoiceId)
        {
            CRMInvoiceViewModel CRMInvoiceModelView = new CRMInvoiceViewModel();
            CRMInvoiceModelView.ObjCRMInvoivce = invoiceRepository.GetInvoiceForEdit(InvoiceId);
            CRMInvoiceModelView.ObjCRMUser = crmUsersRepository.GetCRMUserById(CRMInvoiceModelView.ObjCRMInvoivce.ClientId);
            string fileName = CRMInvoiceModelView.ObjCRMUser.FirstName + "_" + CRMInvoiceModelView.ObjCRMUser.LastName + "_" + CRMInvoiceModelView.ObjCRMInvoivce.InvoiceNumber + ".pdf";
            Document pdfDoc = new Document();
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, HttpContext.Response.OutputStream);
            pdfDoc.Open();
            string strHTML = GetInvoiceHTML(InvoiceId);
            HTMLWorker htmlWorker = new HTMLWorker(pdfDoc);
            htmlWorker.Parse(new StringReader(strHTML));
            pdfWriter.CloseStream = false;
            pdfDoc.Close();
            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
            Response.Flush();
            Response.End();

            return null;
        }

        public string GetInvoiceHTML(int InvoiceId)
        {
            CRMInvoiceViewModel CRMInvoiceModelView = new CRMInvoiceViewModel();
            CRMInvoiceModelView.ObjCRMInvoivce = invoiceRepository.GetInvoiceForEdit(InvoiceId);
            CRMInvoiceModelView.ObjCRMInvoiceItemLST = invoiceRepository.GetInvoiceItemForEdit(InvoiceId);
            CRMInvoiceModelView.ObjCRMUser = crmUsersRepository.GetCRMUserById(CRMInvoiceModelView.ObjCRMInvoivce.ClientId);
            CRMInvoiceModelView.ObjCRMClient = crmUsersRepository.GetClientDetails(Convert.ToInt32(CRMInvoiceModelView.ObjCRMUser.ClientId));

            string invoiceDate = "";
            if (!string.IsNullOrEmpty(Convert.ToString(CRMInvoiceModelView.ObjCRMInvoivce.InvoiceDate)))
            {
                invoiceDate = Convert.ToDateTime(CRMInvoiceModelView.ObjCRMInvoivce.InvoiceDate).ToString("MMM-dd-yyyy");
            }
            string invoiceDueDate = "";
            if (!string.IsNullOrEmpty(Convert.ToString(CRMInvoiceModelView.ObjCRMInvoivce.InvoiceDueDate)))
            {
                invoiceDueDate = Convert.ToDateTime(CRMInvoiceModelView.ObjCRMInvoivce.InvoiceDueDate).ToString("MMM-dd-yyyy");
            }
            string invoiceHeading = "";
            if (CRMInvoiceModelView.ObjCRMInvoivce.Status == "Draft")
            {
                invoiceHeading = "Draft Invoice";
            }
            else
            {
                invoiceHeading = "Invoice";
            }
            var imageUrl = "";
            if (!string.IsNullOrEmpty(CRMInvoiceModelView.ObjCRMClient.ClientLogo))
            {
                var baseURL = System.Configuration.ConfigurationManager.AppSettings["BaseURL"];
                imageUrl = baseURL + CRMInvoiceModelView.ObjCRMClient.ClientLogo;
            }

            string htmlString = @"<!DOCTYPE html>  
                        <html xmlns='http://www.w3.org/1999/xhtml'>  
                        <head>  
                            <title></title>                         
                        </head>  
                        <body>";


            htmlString += @"<div align = 'center'><h3><b>" + invoiceHeading + "</b></h3></div>";
            htmlString += @"<div align = 'center'><h3><b>_______________</b></h3></div>";
            htmlString += @" <table border = '0' width = '100%' height = '100%'>";


            htmlString += @"       
                                    <tr>
                                        <td></td> <td></td> <td></td> 
                                        <td>";
            if(!string.IsNullOrEmpty(imageUrl))
            {
                htmlString += "<img width = '100%' src = '" + imageUrl + @"' />";
            }
            htmlString += @"             </td>             
                                    </tr>

                                        <tr>  
                                        <td><b>To: </b></td>  
                                        <td>" + CRMInvoiceModelView.ObjCRMUser.FirstName + " " + CRMInvoiceModelView.ObjCRMUser.LastName +
                                        @" </td> 
                                        <td><b>From: </b></td> 
                                        <td>" + CRMInvoiceModelView.ObjCRMClient.ClientName + " " + CRMInvoiceModelView.ObjCRMClient.Address +
                                   @"</tr>  
                                    <tr>  
                                        <td><b>Invoice Number:</b> </td>  
                                        <td>" + CRMInvoiceModelView.ObjCRMInvoivce.InvoiceNumber +
                                        @"</td> <td></td> <td></td>             
                                    </tr>
                                    <tr>  
                                        <td><b>GST Number:</b> </td>  
                                        <td>" + CRMInvoiceModelView.ObjCRMInvoivce.GSTNumber +
                                        @"</td> <td></td> <td></td>             
                                    </tr>
                                    <tr>  
                                        <td><b>Issued Date: </b></td>  
                                        <td>" + invoiceDate +
                                        @"</td> <td></td> <td></td>             
                                    </tr>
                                    <tr>  
                                        <td><b>Due Date: </b></td>  
                                        <td>" + invoiceDueDate +
                                        @"</td> <td></td> <td></td>             
                                    </tr>
                                    <tr>  
                                        <td colspan='4'>_____________________________________________________________________________</td>             
                                    </tr></table>";

            htmlString += "<table border = '0'  width = '100%' height = '100%'>";

            htmlString += "<tr><th colspan='2'><b>Description</b></th><th><b>Price</b></th><th><b>Amount</b></th></tr>";
            foreach (var item in CRMInvoiceModelView.ObjCRMInvoiceItemLST)
            {
                htmlString += "<tr><td colspan='2'>" + item.ItemDescription + "</td><td>" + item.Price + "</td><td>" + item.Amount + "</td></tr>";
            }
            htmlString += "<tr><td colspan='4'>_____________________________________________________________________________</td></tr>";
            htmlString += "<tr><td colspan='2'></td><td><b>Sub total</b></td><td>" + CRMInvoiceModelView.ObjCRMInvoivce.SubTotal + "  " + CRMInvoiceModelView.ObjCRMInvoivce.InvoiceCurrency + "</td></tr>";
            htmlString += "<tr><td colspan='2'></td><td><b>GST Rate</b></td><td>" + CRMInvoiceModelView.ObjCRMInvoivce.GSTRate + "%</td></tr>";
            htmlString += "<tr><td colspan='2'></td><td><b>Total</b></td><td><b>" + CRMInvoiceModelView.ObjCRMInvoivce.InvoiceTotal + "  " + CRMInvoiceModelView.ObjCRMInvoivce.InvoiceCurrency + "</b></td></tr>";
            htmlString += "<tr><td colspan='4'>_____________________________________________________________________________</td></tr>";
            htmlString += @"</table></body></html>";

            return htmlString;
        }
        public byte[] GetInvoicePDF()
        {
            Document pdfDoc = new Document(PageSize.A4);
            byte[] result;

            string htmlText = @"<!DOCTYPE html>  
                        <html xmlns='http://www.w3.org/1999/xhtml'>  
                        <head>  
                            <title></title>  
                        </head>  
                        <body>  
                            <div id='content' class='p-4 p-md-5 pt-5'>
                                    <div class='multisteps-form__panel shadow p-4 list-box bg-white' data-animation='scaleIn'>

                                
                                <h5 class='multisteps-form__title' style='text-align:center;'>Invoice</h5>
                                
                                <div class='row'>
                                    <div class='col-8'>
                                            <h5 class='multisteps-form__title' style='padding-left:50px;padding-top:50px;'>Invoice</h5>
                                    </div>
                                    
                                </div>
                                
                                
                                <div class='row'>
                                    <div class='col-3'>To</div>
                                    <div class='col-3'>John John</div>
                                    <div class='col-2' style='text-align:end;'>From</div>
                                    <div class='col-4'>Logiciel Softtech Pvt.Ltd. 102, Nisarg Pushp,
                                                        Vishal Nagar, Pune, Maharashtra India 411 027</div>
                                </div>
                                <div class='row'>
                                    <div class='col-3'>Invoice Number</div>
                                    <div class='col-3'>INV-3</div>
                                    <div class='col-2'></div>
                                    <div class='col-4'></div>
                                </div>
                                <div class='row'>
                                    <div class='col-3'>GST Number</div>
                                    <div class='col-3'>A6767</div>
                                    <div class='col-2'></div>
                                    <div class='col-4'></div>
                                </div>
                                <div class='row'>
                                    <div class='col-3'>Issued Date</div>
                                        <div class='col-3'> Oct-25-2020</div>
                                    <div class='col-2'></div>
                                    <div class='col-4'></div>
                                </div>
                                <div class='row'>
                                    <div class='col-3'>Due Date</div>
                                        <div class='col-3'> Oct-29-2020</div>
                                    <div class='col-2'></div>
                                    <div class='col-4'></div>
                                </div>
                                

                            </div>

                            </div> 
                        </body>  
                        </html>";

            List<string> cssFiles = new List<string>();
            cssFiles.Add(@"/assets/CRM/style.css");
            cssFiles.Add(@"/assets/CRM/styleSteps.css");
            cssFiles.Add(@"/assets/CRM/bootstrap.min.css");
            //cssFiles.Add("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css");

            using (var ms = new MemoryStream())
            {
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, ms);
                writer.CloseStream = false;
                pdfDoc.Open();
                HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
                htmlContext.SetTagFactory(Tags.GetHtmlTagProcessorFactory());
                ICSSResolver cssResolver = XMLWorkerHelper.GetInstance().GetDefaultCssResolver(false);

                cssFiles.ForEach(i => cssResolver.AddCssFile(Server.MapPath(i), true));

                IPipeline pipeline = new CssResolverPipeline(cssResolver, new HtmlPipeline(htmlContext, new PdfWriterPipeline(pdfDoc, writer)));
                XMLWorker worker = new XMLWorker(pipeline, true);
                XMLParser xmlParser = new XMLParser(worker);
                byte[] byteArray = Encoding.UTF8.GetBytes(htmlText);
                //byte[] byteArray = Encoding.ASCII.GetBytes(contents);
                MemoryStream stream = new MemoryStream(byteArray);
                XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, new StreamReader(stream));
                //xmlParser.Parse(new MemoryStream(Encoding.UTF8.GetBytes(htmlText)));
                pdfDoc.Close();
                result = ms.GetBuffer();
                //XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, new StreamReader(htmlText));

            }

            return result;
        }
    }
}