﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using LMSWeb.ViewModel;
using LMSBL.Common;
using LMSBL.DBModels;
using LMSBL.Repository;
using System.Data;
using LMSBL;
using System.Net;

namespace LMSWeb.Controllers
{
    public class CurriculumController : Controller
    {
        UserRepository userRepository = new UserRepository();
        CurriculumRepository cc = new CurriculumRepository();
        CoursesRepository cr = new CoursesRepository();
        Exceptions newException = new Exceptions();
        EmailTemplateRepository etr = new EmailTemplateRepository();
        // GET: Curriculum
        public ActionResult Index()
        {
            List<tblCurriculum> lstCurriculum = new List<tblCurriculum>();
            try
            {
                TblUser sessionUser = (TblUser)Session["UserSession"];
                lstCurriculum = cc.GetCurriculumAll(sessionUser.TenantId);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
            }
            return View(lstCurriculum);
        }
        public ActionResult AddCurriculum()
        {
            tblCurriculum objCurriculum = new tblCurriculum();
            return View(objCurriculum);
        }

        public ActionResult EditCurriculum(int id)
        {
            var objCurriculum = cc.GetCurriculumById(id);
            return View("AddCurriculum", objCurriculum[0]);
        }

        public ActionResult GetActivities(string selectedType)
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            List<Param> activityList = new List<Param>();
            try
            {
                if (selectedType == "1")
                    activityList = cc.GetCurriculumCourses(sessionUser.TenantId);
                if (selectedType == "2")
                    activityList = cc.GetCurriculumSurveys(sessionUser.TenantId);
                if (selectedType == "3")
                    activityList = cc.GetCurriculumForums(sessionUser.TenantId);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
            }
            return Json(activityList, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetUsers(string cId)
        {
            List<SelectListItem> userItems = new List<SelectListItem>();
            TblUser sessionUser = (TblUser)Session["UserSession"];
            try
            {

                var Users = userRepository.GetAllUsers(sessionUser.TenantId);
                foreach (var user in Users)
                {
                    userItems.Add(new SelectListItem
                    {
                        Text = Convert.ToString(user.FirstName + " " + user.LastName),
                        Value = Convert.ToString(user.UserId)
                    });
                }


                DataSet ds = cc.GetCurriculumUsers(Convert.ToInt32(cId));

                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (var item in userItems)
                            {
                                DataRow[] foundUsers = ds.Tables[0].Select("UserId = " + item.Value + "");
                                if (foundUsers.Length != 0)
                                {
                                    item.Selected = true;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
            }


            return Json(userItems, JsonRequestBehavior.AllowGet);
        }

        public ActionResult testing()
        {

            tblCurriculum objCurriculum = new tblCurriculum();
            return View(objCurriculum);
        }

      
        public ActionResult AddCurriculumToDB(string jsonData, string title,string CId)
        {
            try
            {
                TblUser sessionUser = (TblUser)Session["UserSession"];
                tblCurriculum objCurriculum = new tblCurriculum();
                objCurriculum.CreatedBy = sessionUser.UserId;
                objCurriculum.TenantId = sessionUser.TenantId;
                objCurriculum.CurriculumTitle = title;
                if (Convert.ToInt32(CId) > 0)
                {
                    objCurriculum.CurriculumId = Convert.ToInt32(CId);
                }

                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                json_serializer.MaxJsonLength = int.MaxValue;
                object[] objData = null;
                if (!string.IsNullOrEmpty(jsonData))
                {
                    objData = (object[])json_serializer.DeserializeObject(jsonData);
                }
                var result = cc.AddCurriculumToDB(objData, objCurriculum);

            }
            catch (Exception ex)
            {
                newException.AddException(ex);
            }
            return Json("OK", JsonRequestBehavior.AllowGet);
        }

        public ActionResult AssignCurriculum(string jsonData, string CId)
        {
            try
            {
                TblUser sessionUser = (TblUser)Session["UserSession"];

                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                json_serializer.MaxJsonLength = int.MaxValue;
                object[] objData = null;
                if (!string.IsNullOrEmpty(jsonData))
                {
                    objData = (object[])json_serializer.DeserializeObject(jsonData);
                }
                var result = cc.AssignCurriculumToDB(objData, CId);

                //if (result == 1)
                //{
                //    // TblUser sessionUser = (TblUser)Session["UserSession"];
                //    var lstTemplate = etr.GetEmailTemplateAssigns(sessionUser.TenantId);
                //     var objCurriculum = cc.GetCurriculumById(Convert.ToInt32(CId));
                //    foreach (Dictionary<string, object> item in objData)
                //    {
                //        var emailBody = lstTemplate[6].EmailBody;
                //        var objUser = userRepository.GetUserById(Convert.ToInt32(item["UserId"]));
                //        emailBody = emailBody.Replace("{UserName}", objUser[0].FirstName + " " + objUser[0].LastName);
                //        emailBody = emailBody.Replace("{CurriculumName}", objCurriculum[0].CurriculumTitle);
                //        emailBody = emailBody.Replace("{DueDate}", Convert.ToString(item["DueDate"]));
                //        emailBody = emailBody.Replace("{Admin}", objUser[0].TenantName);
                //        var emailSubject = lstTemplate[6].EmailSubject + "-" + objCurriculum[0].CurriculumTitle;
                //        tblEmails objEmail = new tblEmails();

                //        objEmail.EmailTo = objUser[0].EmailId;
                //        objEmail.EmailSubject = emailSubject;
                //        objEmail.EmailBody = emailBody;
                //        objEmail.Activityid = Convert.ToInt32(CId);
                //        objEmail.Activitytype = "Curriculum";
                //        objEmail.Duedate = Convert.ToDateTime(item["DueDate"]);
                //        bool status = cr.CheckInsertEmail(objEmail);
                //        if (status)
                //        {

                //        }
                //        else
                //        {
                //            var emailResult = userRepository.InsertEmail(objEmail);
                //        }

                //    }
                //}
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
            }

            return Json(HttpStatusCode.OK, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetAssignedUsers(string cId)
        {
            //List<SelectListItem> userItems = new List<SelectListItem>();
            //TblUser sessionUser = (TblUser)Session["UserSession"];

            //var Users = userRepository.GetAllUsers(sessionUser.TenantId);
            //foreach (var user in Users)
            //{
            //    userItems.Add(new SelectListItem
            //    {
            //        Text = Convert.ToString(user.FirstName + " " + user.LastName),
            //        Value = Convert.ToString(user.UserId)
            //    });
            //}

            List<tblCurriculumAssignment> lstAssignedUsers = new List<tblCurriculumAssignment>();
            try
            {
                lstAssignedUsers = cc.GetAssignedCurriculumUsers(Convert.ToInt32(cId));
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
            }

            return Json(lstAssignedUsers, JsonRequestBehavior.AllowGet);
        }

    }
}