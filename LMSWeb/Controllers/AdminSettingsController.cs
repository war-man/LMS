using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LMSBL.Common;
using LMSBL.DBModels;
using LMSBL.Repository;
using LMSWeb.App_Start;
using System.Net;
using System.Collections;
using LMSWeb.ViewModel;
using LMSBL.DBModels.CRMNew;
using System.IO;
using System.Drawing;

namespace LMSWeb.Controllers
{

    public class AdminSettingsController : Controller
    {
        UserRepository ur = new UserRepository();        
        Exceptions newException = new Exceptions();
        CRMRepository cr = new CRMRepository();
        // GET: AdminSettings
        public ActionResult Index()
        {

            LMSBL.DBModels.TblUser model = new LMSBL.DBModels.TblUser();
            model = (LMSBL.DBModels.TblUser)Session["UserSession"];
            TblUserViewModel objuserviewmodel = new TblUserViewModel();
            model.IsMyProfile = true;
            List<tblCRMClient> clientdetails = new List<tblCRMClient>();
            clientdetails = cr.GetClientById(Convert.ToInt32(model.CRMClientId));           
            objuserviewmodel.objtblCRMClient = clientdetails[0];
            objuserviewmodel.objtbluser = model;
            return View("Index", objuserviewmodel);

        }
        [HttpPost]
        public bool UpdateUser(TblUserViewModel objUserviewmodel, HttpPostedFileBase file)
        {
            bool status = false;
            try
            {
                LMSBL.DBModels.TblUser model = new LMSBL.DBModels.TblUser();
                model = (LMSBL.DBModels.TblUser)Session["UserSession"];
                int rows = 0;
                bool ResultUpdate;
                string path = string.Empty;
                if (!string.IsNullOrEmpty(objUserviewmodel.imageName))
                {

                    var profileURL = System.Configuration.ConfigurationManager.AppSettings["CRMLogoImages"];
                    var profilePhysicalURL = System.Configuration.ConfigurationManager.AppSettings["CRMLogoPhysicalURL"];

                    if (!System.IO.Directory.Exists(profilePhysicalURL + "\\" + model.CRMClientId))
                    {
                        System.IO.Directory.CreateDirectory(profilePhysicalURL + "\\" + model.CRMClientId);
                    }

                    string filePhysicalPath = System.IO.Path.Combine(profilePhysicalURL + "\\" + model.CRMClientId + "\\");
                    path = System.IO.Path.Combine(profileURL + "/" + model.CRMClientId + "/" + model.CRMClientId + ".jpg");

                    string base64String = Convert.ToString(objUserviewmodel.imageJson);

                    byte[] newBytes = Convert.FromBase64String(base64String);
                    MemoryStream ms = new MemoryStream(newBytes, 0, newBytes.Length);
                    ms.Write(newBytes, 0, newBytes.Length);
                    var fileName = Convert.ToString(model.CRMClientId + ".jpg");
                    FileStream fileNew = new FileStream(filePhysicalPath + "\\" + fileName, FileMode.Create, FileAccess.Write);
                    ms.WriteTo(fileNew);
                    fileNew.Close();
                    ms.Close();
                }

                rows = ur.EditUser(objUserviewmodel.objtbluser);
                if (!string.IsNullOrEmpty(objUserviewmodel.imageName))
                {
                    ResultUpdate = cr.UpdateCRMClient(Convert.ToInt32(model.CRMClientId), path);
                }
                if (objUserviewmodel.objtbluser.IsMyProfile)
                {
                    if (!string.IsNullOrEmpty(objUserviewmodel.objtbluser.OldPassword) && !string.IsNullOrEmpty(objUserviewmodel.objtbluser.Password))
                    {
                        CommonFunctions common = new CommonFunctions();
                        objUserviewmodel.objtbluser.OldPassword = common.GetEncodePassword(objUserviewmodel.objtbluser.OldPassword);
                        objUserviewmodel.objtbluser.Password = common.GetEncodePassword(objUserviewmodel.objtbluser.Password);
                        var result = ur.ChangePassword(objUserviewmodel.objtbluser, objUserviewmodel.objtbluser.Password);

                    }

                }
                if (objUserviewmodel.objtbluser.IsMyProfile)
                {
                    var userDetails = ur.GetUserById(model.UserId);
                    Session["UserSession"] = userDetails[0];
                    status = true;
                }
            }
            catch(Exception ex)
            {
                newException.AddException(ex);
            }
            return status;
        }
    }
}