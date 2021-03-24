﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using LMSBL.Common;
using LMSBL.DBModels;
using LMSBL.Repository;
using LMSWeb.App_Start;
using LMSWeb.ViewModel;

namespace LMSWeb.Controllers
{
    public class AccountController : Controller
    {
        UserRepository ur = new UserRepository();
        RolesRepository rr = new RolesRepository();
        TenantRepository tr = new TenantRepository();
        Exceptions newException = new Exceptions();
        // GET: Account
        public ActionResult Index()
        {
            try
            {
                LMSBL.DBModels.TblUser model = new LMSBL.DBModels.TblUser();
                model = (LMSBL.DBModels.TblUser)Session["UserSession"];
                return View(model);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
                return View();
            }
        }
        public ActionResult MyProfile()
        {
            TblUser objEditData = new TblUser();
            LMSBL.DBModels.TblUser model = new LMSBL.DBModels.TblUser();
            model = (LMSBL.DBModels.TblUser)Session["UserSession"];
            try
            {
                List<TblUser> userDetails = new List<TblUser>();
                userDetails = ur.GetUserById(model.UserId);
                
                objEditData = userDetails[0];
                objEditData.UserRoles = rr.GetAllRoles();
                //objEditData.Tenants = tr.GetAllTenants();
                objEditData.IsMyProfile = true;
            }
            catch(Exception ex)
            {
                newException.AddException(ex);
            }
            return View("Profile",objEditData);
        }
        public ActionResult ChangePassword()
        {
            ChangePasswordViewModel CPViewModel = new ChangePasswordViewModel();
            var model = (LMSBL.DBModels.TblUser)Session["UserSession"];
            CPViewModel.UserId = model.UserId;
            return View(CPViewModel);
        }

        public ActionResult UpdatePassword(ChangePasswordViewModel objPassword)
        {
            LMSBL.DBModels.TblUser model = new LMSBL.DBModels.TblUser();
            CommonFunctions common = new CommonFunctions();
            model.UserId = objPassword.UserId;
            model.OldPassword = common.GetEncodePassword(objPassword.OldPassword);
            objPassword.Password= common.GetEncodePassword(objPassword.Password);

            var result = ur.ChangePassword(model, objPassword.Password);
            
            if (result == 1)
            {
                TempData["Message"] = "Password changed Successfully";
            }
            else
            {
                TempData["Message"] = "Old Password is Incorrect";
            }

            return View("ChangePassword", objPassword);
        }
    }
}