﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Mvc;
using LMSBL.Common;
using LMSBL.DBModels;
using LMSBL.Repository;
using LMSWeb.ViewModel;
using System.Web.Script.Serialization;
using System.Net;


namespace LMSWeb.Controllers
{
    [HandleError]
    public class CoursesController : Controller
    {
        //protected override void OnException(ExceptionContext filterContext)
        //{
        //    Exception exception = filterContext.Exception;
        //    //Logging the Exception
        //    filterContext.ExceptionHandled = true;


        //    var Result = this.View("Error", new HandleErrorInfo(exception,
        //    filterContext.RouteData.Values["controller"].ToString(),
        //    filterContext.RouteData.Values["action"].ToString()));

        //    filterContext.Result = Result;

        //}
        UserRepository userRepository = new UserRepository();
        CoursesRepository cc = new CoursesRepository();
        TenantRepository tr = new TenantRepository();
        Exceptions newException = new Exceptions();
        EmailTemplateRepository etr = new EmailTemplateRepository();
        // GET: Courses
        public ActionResult Index()
        {
            List<tblCourse> listInActiveCourses = new List<tblCourse>();
            try
            {
                TblUser sessionUser = (TblUser)Session["UserSession"];
                listInActiveCourses = cc.GetAllCourses(sessionUser.TenantId);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
            }
            return View("CourseList", listInActiveCourses);
        }

        public ActionResult AddCourse()
        {
            try
            {
                tblCourse objEditData = new tblCourse();

                return View("AddNewCourse", objEditData);
            }
            catch (Exception ex)
            {

                newException.AddException(ex);
                return View("AddNewCourse");

            }
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddCourse(tblCourse objCourse, HttpPostedFileBase file)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    int rows = 0;
                    TblUser sessionUser = (TblUser)Session["UserSession"];
                    objCourse.createdBy = sessionUser.UserId;
                    objCourse.tenantId = sessionUser.TenantId;
                    newException.AddDummyException(":- " + objCourse.tenantId);
                    objCourse.ZipFile = file;
                    if (objCourse.ContentModuleId > 0)
                    {
                        rows = cc.EditCourse(objCourse);
                    }
                    else
                    {
                        rows = cc.AddCourse(objCourse);
                    }


                    if (rows != 0)
                    {
                        TempData["CourseMessage"] = "Course Saved Successfully";
                        return View("AddNewCourse", objCourse);
                        //return RedirectToAction("Index");
                    }
                    else
                    {
                        return View("AddNewCourse", objCourse);
                    }
                }
                return View("AddNewCourse", objCourse);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
                return View("AddNewCourse");
            }
        }

        public ActionResult EditCourse(int id)
        {
            try
            {
                List<tblCourse> CourseDetails = new List<tblCourse>();
                CourseDetails = cc.GetCourseById(id);

                return View("AddNewCourse", CourseDetails[0]);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
                return View("AddNewCourse");
            }

        }

        [HttpPost, ActionName("DeleteCourse")]
        public ActionResult DeleteConfirmCourse(int id)
        {
            try
            {
                Response response = new Response();
                List<tblCourse> objCourseList = cc.GetCourseById(id);
                tblCourse objCourse = objCourseList[0];
                if (ModelState.IsValid)
                {
                    if (objCourse.IsActive == true)
                    {
                        objCourse.IsActive = false;
                    }
                    else
                    {
                        objCourse.IsActive = true;
                    }
                    int rows = cc.DeleteCourse(objCourse);
                    if (rows != 0)
                    {
                        response.StatusCode = 1;
                        //return RedirectToAction("Index");
                    }
                    else
                    {
                        response.StatusCode = 0;
                        //return View(objCourse);
                    }
                }
                //return View(objTenant);
                return Json(response.StatusCode, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
                return View();
            }
        }
        public ActionResult Getuser(int id)
        {
            List<SelectListItem> userItems = new List<SelectListItem>();
            TblUser sessionUser = (TblUser)Session["UserSession"];
            if (sessionUser == null)
            {
                RedirectToAction("Index", "Login");
            }
            else
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

                DataSet ds = cc.GetAssignedCourseUsers(id);
                //  bool isDueDate = false;
                if (ds != null)
                {
                    if (ds.Tables.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            foreach (var item in userItems)
                            {
                                DataRow[] foundUsers = ds.Tables[0].Select("LearnerId = " + item.Value + "");
                                if (foundUsers.Length != 0)
                                {
                                    item.Selected = true;
                                    // isDueDate = true;

                                }
                            }
                        }
                    }
                }


            }
            return Json(userItems, JsonRequestBehavior.AllowGet);
        }
        public ActionResult GetAssignedCourseUsers(int id)
        {
            List<SelectListItem> userItems = new List<SelectListItem>();
            TblUser sessionUser = (TblUser)Session["UserSession"];
            List<tblLearnerActivityAssignment> lstAssignedUsers = new List<tblLearnerActivityAssignment>();
            if (sessionUser == null)
            {
                RedirectToAction("Index", "Login");
            }
            else
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

                lstAssignedUsers = cc.GetCourseAssignedUser(id);


            }
            return Json(lstAssignedUsers, JsonRequestBehavior.AllowGet);
        }
        
        public ActionResult AssignCourseToUser(string jsonData, int id)
        {
            try
            {
                TblUser sessionUser = (TblUser)Session["UserSession"];
                List<tblCourse> objCourse = new List<tblCourse>();
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                json_serializer.MaxJsonLength = int.MaxValue;
                object[] objData = null;
                if (!string.IsNullOrEmpty(jsonData))
                {
                    objData = (object[])json_serializer.DeserializeObject(jsonData);
                }
                var result = cc.AssignCourseTouser(objData, id);
                //if (result == 1)
                //{
                //    // TblUser sessionUser = (TblUser)Session["UserSession"];
                //    var lstTemplate = etr.GetEmailTemplateAssigns(sessionUser.TenantId);
                //    objCourse = cc.GetCourseById(id);
                //    foreach (Dictionary<string, object> item in objData)
                //    {
                //        var emailBody = lstTemplate[3].EmailBody;
                //        var objUser = userRepository.GetUserById(Convert.ToInt32(item["LearnerId"]));
                //        emailBody = emailBody.Replace("{UserName}", objUser[0].FirstName + " " + objUser[0].LastName);
                //        emailBody = emailBody.Replace("{CourseName}", objCourse[0].ContentModuleName);
                //        emailBody = emailBody.Replace("{DueDate}", Convert.ToString(item["DueDate"]));
                //        emailBody = emailBody.Replace("{Admin}", objUser[0].TenantName);
                //        var emailSubject = lstTemplate[3].EmailSubject + "-" + objCourse[0].ContentModuleName;
                //        tblEmails objEmail = new tblEmails();

                //        objEmail.EmailTo = objUser[0].EmailId;
                //        objEmail.EmailSubject = emailSubject;
                //        objEmail.EmailBody = emailBody;
                //        objEmail.Activityid = id;
                //        objEmail.Activitytype = "Course";
                //        objEmail.Duedate = Convert.ToDateTime(item["DueDate"]);
                //        bool status = cc.CheckInsertEmail(objEmail);
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

        
    }
}