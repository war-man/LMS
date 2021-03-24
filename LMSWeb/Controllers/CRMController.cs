using LMSBL.DBModels;
using LMSBL.Repository;
using LMSWeb.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LMSWeb.Controllers
{
    public class CRMController : Controller
    {
        CRMDashboardRepository dashboardRepo = new CRMDashboardRepository();
        // GET: CRM
        public ActionResult Index()
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            CRMDashboardViewModel objDashboardViewModel = new CRMDashboardViewModel();
            objDashboardViewModel.objCRMEnquiryList = dashboardRepo.GetCRMDashboardList(Convert.ToInt32(sessionUser.CRMClientId), 1);
            objDashboardViewModel.objCRMPotentialClientList = dashboardRepo.GetCRMDashboardList(Convert.ToInt32(sessionUser.CRMClientId), 2);
            objDashboardViewModel.objCRMClientList = dashboardRepo.GetCRMDashboardList(Convert.ToInt32(sessionUser.CRMClientId), 3);
            //objDashboardViewModel.objCRMDocumentList = dashboardRepo.GetCRMDocumentList(Convert.ToInt32(sessionUser.CRMClientId), 3);

            return View(objDashboardViewModel);
        }
    }
}