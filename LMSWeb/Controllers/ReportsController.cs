﻿using LMSWeb.ViewModel;
using LMSBL.Common;
using LMSBL.DBModels;
using LMSBL.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Microsoft.Office.Interop.Excel;
using System.ComponentModel;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using ClosedXML.Excel;
using System.IO;
using System.ComponentModel.DataAnnotations;


namespace LMSWeb.Controllers
{
    public class ReportsController : Controller
    {
        UserRepository userRepository = new UserRepository();
        QuizRepository quizRepository = new QuizRepository();
        ReportRepository rpt = new ReportRepository();
        Exceptions newException = new Exceptions();
        CurriculumRepository cc = new CurriculumRepository();
        // GET: Reports
        public ActionResult Index()
        {
            try
            {
                TblUser sessionUser = (TblUser)Session["UserSession"];
                var objReportModel = rpt.GetMainReportForLearner(sessionUser.UserId, sessionUser.TenantId);
                return View("LearnerReportMain", objReportModel);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
                return View("LearnerReportMain");
            }
        }

        public ActionResult DetailReport(int activityId, string UserId, string cId)
        {
            try
            {
                //newException.AddDummyException("entered");
                TblUser sessionUser = new TblUser();
                sessionUser = (TblUser)Session["UserSession"];
                
                if (!string.IsNullOrEmpty(cId))
                {
                    List<CurriculumActivities> lstCurriculumActivities = new List<CurriculumActivities>();
                    DataSet Data = cc.GetCurriculumActivitiesById(Convert.ToInt32(activityId), sessionUser.UserId);

                    if (Data != null)
                    {
                        if (Data.Tables.Count > 0)
                        {
                            if (Data.Tables[0].Rows.Count > 0)
                            {
                                foreach (var item in Data.Tables[0].Rows)
                                {
                                    lstCurriculumActivities = Data.Tables[0].AsEnumerable().Select(dr => new CurriculumActivities
                                    {
                                        ActivityId = Convert.ToInt32(dr["ActivityId"]),
                                        ActivityText = Convert.ToString(dr["ActivityText"]),
                                        ActivityType = Convert.ToString(dr["ActivityType"]),
                                        DueDate = Convert.ToString(dr["DueDate"]),
                                        ActivityStatus = Convert.ToString(dr["ActivityStatus"]),
                                        CompletionDate = Convert.ToString(dr["CompletionDate"]),
                                        Duration = Convert.ToString(dr["Duration"]),
                                        Score = Convert.ToString(dr["Score"]),
                                        CurriculumName = Convert.ToString(dr["CurriculumTitle"])
                                    }).ToList();
                                }
                            }
                        }
                    }
                    return View("CurriculumActivities", lstCurriculumActivities);
                }
                else
                {
                    if (!string.IsNullOrEmpty(UserId))
                    {
                        sessionUser.UserId = Convert.ToInt32(UserId);
                    }
                    var attemptList = rpt.GetDetailReportForLearner(sessionUser.UserId, sessionUser.TenantId, activityId);
                    //newException.AddDummyException("after");
                    return View(attemptList);
                }
            }
            catch (Exception ex)
            {
                //newException.AddDummyException("error");
                newException.AddException(ex);
                return View();
            }
        }

        public ActionResult AttemptReport(int activityId, int attempt)
        {
            try
            {
                TblUser sessionUser = (TblUser)Session["UserSession"];
                List<TblQuiz> lstAllQuiz = new List<TblQuiz>();
                lstAllQuiz = quizRepository.GetQuizForLaunch(activityId, sessionUser.UserId);
                //var attempt = quizRepository.GetQuizAttemptByUserID(activityId, sessionUser.UserId);
                List<TblRespons> quizResponses = new List<TblRespons>();
                quizResponses = quizRepository.GetQuizResponsesByUserID(activityId, sessionUser.UserId, attempt);
                lstAllQuiz[0].TblResponses = quizResponses;

                var noOfQuestions = lstAllQuiz[0].TblQuestions.Where(x => x.QuestionTypeId == 1 || x.QuestionTypeId == 2).Count();
                var score = quizRepository.GetQuizScoreByUserID(activityId, sessionUser.UserId, attempt);
                //lstAllQuiz[0].Score = Convert.ToInt32(score.Score);
                if (score.Score == 0)
                {
                    lstAllQuiz[0].Score = "0%";
                }
                else
                {
                    lstAllQuiz[0].Score = Convert.ToString(Math.Round(Convert.ToDecimal(score.Score * 100 / noOfQuestions), 2));
                }
                lstAllQuiz[0].completeTime = score.completedTime;

                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                json_serializer.MaxJsonLength = int.MaxValue;
                lstAllQuiz[0].hdnReviewData = json_serializer.Serialize(lstAllQuiz[0]);
                //var attemptList = rpt.GetDetailReportForLearner(sessionUser.UserId, sessionUser.TenantId, activityId);
                return View("AttemptReport", lstAllQuiz[0]);
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
                return View("AttemptReport");
            }
        }
        public ActionResult ViewQuiz(int quizId, int userId, int attempt)
        {
            List<TblQuiz> lstAllQuiz = new List<TblQuiz>();
            lstAllQuiz = quizRepository.GetQuizForLaunch(quizId, userId);

            List<TblRespons> quizResponses = new List<TblRespons>();
            quizResponses = quizRepository.GetQuizResponsesByUserID(quizId, userId, attempt);
            lstAllQuiz[0].TblResponses = quizResponses;

            var score = quizRepository.GetQuizScoreByUserID(quizId, userId, attempt);
            var noOfQuestions = lstAllQuiz[0].TblQuestions.Where(x => x.QuestionTypeId == 1 || x.QuestionTypeId == 2).Count();
            //lstAllQuiz[0].Score = Convert.ToInt32(score.Score);
            if (score.Score == 0)
            {
                lstAllQuiz[0].Score = "0%";
            }
            else
            {
                lstAllQuiz[0].Score = Convert.ToString(Math.Round(Convert.ToDecimal(score.Score * 100 / noOfQuestions), 2));
            }

            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
            json_serializer.MaxJsonLength = int.MaxValue;
            lstAllQuiz[0].hdnReviewData = json_serializer.Serialize(lstAllQuiz[0]);
            return View(lstAllQuiz[0]);

        }

        public ActionResult DeleteQuiz(int quizId, int userId, int attempt)
        {
            int result = quizRepository.DeleteResponse(quizId, userId, attempt);
            return RedirectToAction("Index");
        }

        public ActionResult AllReports()
        {

            return View();
        }

        public ActionResult UserReport(string isActive)
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            List<UserReportModel> objUserList = new List<UserReportModel>();
            objUserList = rpt.GetUserReportForAdmin(sessionUser.TenantId, Convert.ToBoolean(isActive));
            return View(objUserList);
        }

        public ActionResult UserProgressReport(int UserId)
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            List<UserProgressReportModel> objUserList = new List<UserProgressReportModel>();
            objUserList = rpt.GetUserProgressReportForAdmin(sessionUser.TenantId, UserId);
            return View(objUserList);
        }

        public ActionResult LearningCompletionReport()
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            List<LearningCompletionReportModel> objUserList = new List<LearningCompletionReportModel>();
            objUserList = rpt.GetLearningCompletionReportForAdmin(sessionUser.TenantId);
            return View(objUserList);
        }

        public ActionResult LearningProgressCompletionReport(int ActivityId, string Type)
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            List<LearningCompletionProgressReportModel> objUserList = new List<LearningCompletionProgressReportModel>();
            objUserList = rpt.GetLearningCompletionProgressReportForAdmin(sessionUser.TenantId, ActivityId, Type);
            return View(objUserList);
        }

        public ActionResult HighScoreUsersReport()
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];

            List<HighScoreUsersReportModel> objUserList = new List<HighScoreUsersReportModel>();
            var objReportData = rpt.GetHighScoreUsersReportForAdmin(sessionUser.TenantId);
            return View(objReportData);
        }
        
        public ActionResult ExportToExcel(string isActive, string fDate, string tDate, string ReportName, string UserId, string ActivityId, string Type)
        {
            try
            {
               // string fDate, string tDate,
                TblUser sessionUser = (TblUser)Session["UserSession"];
                
                System.Data.DataTable table = new System.Data.DataTable();

                if (!string.IsNullOrEmpty(isActive))
                {
                    List<UserReportModel> objUserList = new List<UserReportModel>();
                    objUserList = rpt.GetUserReportForAdmin(sessionUser.TenantId, Convert.ToBoolean(isActive));
                    if (isActive == "True")
                    {
                        //excelSheet.Name = "Active User Report";
                        ReportName = "Active User Report";
                    }
                    else
                    {
                        //excelSheet.Name = "Total User Report";
                        ReportName = "Total User Report";
                    }
                    if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.DateCreated != "" && (Convert.ToDateTime(x.DateCreated) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.DateCreated) <= Convert.ToDateTime(tDate))).ToList();
                    }
                    else if (!string.IsNullOrEmpty(fDate))
                    {
                        objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) >= Convert.ToDateTime(fDate)).ToList();
                    }
                    else if (!string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) <= Convert.ToDateTime(tDate)).ToList();
                    }

                    PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(UserReportModel));
                    foreach (PropertyDescriptor prop in properties)
                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

                    foreach (UserReportModel item in objUserList)
                    {
                        DataRow row = table.NewRow();
                        foreach (PropertyDescriptor prop in properties)
                            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;

                        table.Rows.Add(row);
                    }
                    table.Columns.Remove("UserId");
                    table.Columns.Remove("ActivityLearningAssigned");
                    
                }
                if (ReportName == "User Progress Report")
                {
                    List<UserProgressReportModel> objUserList = new List<UserProgressReportModel>();
                    objUserList = rpt.GetUserProgressReportForAdmin(sessionUser.TenantId, Convert.ToInt32(UserId));
                    if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.AttemptedOn != "" && (Convert.ToDateTime(x.AttemptedOn) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.AttemptedOn) <= Convert.ToDateTime(tDate))).ToList();
                    }
                    else if (!string.IsNullOrEmpty(fDate))
                    {
                        objUserList = objUserList.Where(x => x.AttemptedOn != "" && Convert.ToDateTime(x.AttemptedOn) >= Convert.ToDateTime(fDate)).ToList();
                    }
                    else if (!string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.AttemptedOn != "" && Convert.ToDateTime(x.AttemptedOn) <= Convert.ToDateTime(tDate)).ToList();
                    }

                    PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(UserProgressReportModel));
                    foreach (PropertyDescriptor prop in properties)
                    {
                        if (!prop.Name.Equals("userReportModel"))
                        {
                            table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
                        }
                    }

                    foreach (UserProgressReportModel item in objUserList)
                    {
                        DataRow row = table.NewRow();
                        foreach (PropertyDescriptor prop in properties)
                        {
                            if (!prop.Name.Equals("userReportModel"))
                            {
                                row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;                                
                            }
                        }
                        table.Rows.Add(row);
                    }
                    table.Columns.Remove("ActivityId");
                    table.Columns.Remove("QuestionCount");
                    table.Columns.Remove("ActivityLearningAssigned");
                    foreach (DataRow dr in table.Rows)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(dr["Comments"])))
                        {
                            dr["Comments"] = dr["Comments"].ToString().Replace("#;;#", "\n");
                        }
                    }
                }
                if (ReportName == "Learning Completion Report")
                {
                    List<LearningCompletionReportModel> objUserList = new List<LearningCompletionReportModel>();
                    objUserList = rpt.GetLearningCompletionReportForAdmin(sessionUser.TenantId);

                    if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && (Convert.ToDateTime(x.ActivityLearningAssigned) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.ActivityLearningAssigned) <= Convert.ToDateTime(tDate))).ToList();
                    }
                    else if (!string.IsNullOrEmpty(fDate))
                    {
                        objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && Convert.ToDateTime(x.ActivityLearningAssigned) >= Convert.ToDateTime(fDate)).ToList();
                    }
                    else if (!string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && Convert.ToDateTime(x.ActivityLearningAssigned) <= Convert.ToDateTime(tDate)).ToList();
                    }

                    PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(LearningCompletionReportModel));
                    foreach (PropertyDescriptor prop in properties)
                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

                    foreach (LearningCompletionReportModel item in objUserList)
                    {
                        DataRow row = table.NewRow();
                        foreach (PropertyDescriptor prop in properties)
                            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;

                        table.Rows.Add(row);
                    }
                    table.Columns.Remove("ActivityId");
                    table.Columns.Remove("ActivityDescription");
                }
                if (ReportName == "Learning Progress Report")
                {
                    List<LearningCompletionProgressReportModel> objUserList = new List<LearningCompletionProgressReportModel>();
                    objUserList = rpt.GetLearningCompletionProgressReportForAdmin(sessionUser.TenantId, Convert.ToInt32(ActivityId), Type);

                    if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.CompletionDate != "" && (Convert.ToDateTime(x.CompletionDate) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.CompletionDate) <= Convert.ToDateTime(tDate))).ToList();
                    }
                    else if (!string.IsNullOrEmpty(fDate))
                    {
                        objUserList = objUserList.Where(x => x.CompletionDate != "" && Convert.ToDateTime(x.CompletionDate) >= Convert.ToDateTime(fDate)).ToList();
                    }
                    else if (!string.IsNullOrEmpty(tDate))
                    {
                        objUserList = objUserList.Where(x => x.CompletionDate != "" && Convert.ToDateTime(x.CompletionDate) <= Convert.ToDateTime(tDate)).ToList();
                    }


                    PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(LearningCompletionProgressReportModel));
                    foreach (PropertyDescriptor prop in properties)
                    {
                        if (!prop.Name.Equals("learningCompletionReportModel"))
                        {
                            table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
                        }
                    }

                    foreach (LearningCompletionProgressReportModel item in objUserList)
                    {
                        DataRow row = table.NewRow();
                        foreach (PropertyDescriptor prop in properties)
                        {
                            if (!prop.Name.Equals("learningCompletionReportModel"))
                            {
                                row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                            }
                        }

                        table.Rows.Add(row);
                    }
                    foreach (DataRow dr in table.Rows)
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(dr["Comments"])))
                        {
                            dr["Comments"] = dr["Comments"].ToString().Replace("#;;#", "\n");
                        }
                    }
                   // table.Columns.Remove("ActivityDescription");
                    table.Columns.Remove("ActivityLearningAssigned");

                }
                if (ReportName == "High Score Users Report")
                {
                    List<HighScoreUsersReportModel> objUserList = new List<HighScoreUsersReportModel>();
                    var objReportData = rpt.GetHighScoreUsersReportForAdmin(sessionUser.TenantId);

                    PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(HighScoreUsersReportModel));
                    foreach (PropertyDescriptor prop in properties)
                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

                    foreach (HighScoreUsersReportModel item in objReportData)
                    {
                        DataRow row = table.NewRow();
                        foreach (PropertyDescriptor prop in properties)
                            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;

                        table.Rows.Add(row);
                    }
                    table.Columns.Remove("TotalQuestion");
                }
              //  table.Columns.Remove("ActivityDescription");
                
                string fileName = ReportName + ".xlsx";
                using (XLWorkbook wb = new XLWorkbook())
                {

                    //excelSheet.Name
                    table.TableName = ReportName;
                    wb.Worksheets.Add(table);
                    using (MemoryStream stream = new MemoryStream())
                    {
                        wb.SaveAs(stream);
                        return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", fileName);
                    }
                }
            }
            catch (Exception ex)
            {
                newException.AddException(ex);
                return null;
            }
        }

        public ActionResult ExportToPdf(string isActive, string fDate, string tDate, string ReportName, string UserId, string ActivityId, string Type)
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];

            System.Data.DataTable table = new System.Data.DataTable();

            if (!string.IsNullOrEmpty(isActive))
            {
                List<UserReportModel> objUserList = new List<UserReportModel>();
                objUserList = rpt.GetUserReportForAdmin(sessionUser.TenantId, Convert.ToBoolean(isActive));
                if (isActive == "True")
                {
                    ReportName = "Active User Report";
                }
                else
                {
                    ReportName = "Total User Report";
                }

                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.DateCreated) <= Convert.ToDateTime(tDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) <= Convert.ToDateTime(tDate)).ToList();
                }

                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(UserReportModel));
                foreach (PropertyDescriptor prop in properties)
                    table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);

                foreach (UserReportModel item in objUserList)
                {
                    DataRow row = table.NewRow();
                    foreach (PropertyDescriptor prop in properties)
                        row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;

                    table.Rows.Add(row);
                }
                table.Columns.Remove("UserId");
                table.Columns.Remove("ActivityLearningAssigned");
            }
            if (ReportName == "User Progress Report")
            {
                List<UserProgressReportModel> objUserList = new List<UserProgressReportModel>();
                objUserList = rpt.GetUserProgressReportForAdmin(sessionUser.TenantId, Convert.ToInt32(UserId));

                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.AttemptedOn != "" && (Convert.ToDateTime(x.AttemptedOn) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.AttemptedOn) <= Convert.ToDateTime(tDate))).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.AttemptedOn != "" && Convert.ToDateTime(x.AttemptedOn) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.AttemptedOn != "" && Convert.ToDateTime(x.AttemptedOn) <= Convert.ToDateTime(tDate)).ToList();
                }

                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(UserProgressReportModel));
                foreach (PropertyDescriptor prop in properties)
                {
                    if (!prop.Name.Equals("userReportModel"))
                    {

                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
                    }
                }
                foreach (UserProgressReportModel item in objUserList)
                {
                    DataRow row = table.NewRow();
                    foreach (PropertyDescriptor prop in properties)
                    {
                        if (!prop.Name.Equals("userReportModel"))
                        {

                            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                        }
                    }
                    table.Rows.Add(row);
                }
                table.Columns.Remove("ActivityId");
                table.Columns.Remove("QuestionCount");
                table.Columns.Remove("ActivityLearningAssigned");

                foreach (DataRow dr in table.Rows)
                {
                    if (!string.IsNullOrEmpty(Convert.ToString(dr["Comments"])))
                    {
                        dr["Comments"] = dr["Comments"].ToString().Replace("#;;#", "\n");
                    }
                }
            }
            if (ReportName == "Learning Completion Report")
            {
                List<LearningCompletionReportModel> objUserList = new List<LearningCompletionReportModel>();
                objUserList = rpt.GetLearningCompletionReportForAdmin(sessionUser.TenantId);
                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && (Convert.ToDateTime(x.ActivityLearningAssigned) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.ActivityLearningAssigned) <= Convert.ToDateTime(tDate))).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && Convert.ToDateTime(x.ActivityLearningAssigned) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && Convert.ToDateTime(x.ActivityLearningAssigned) <= Convert.ToDateTime(tDate)).ToList();
                }


                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(LearningCompletionReportModel));
                foreach (PropertyDescriptor prop in properties)
                {
                    if (!prop.Name.Equals("learningCompletionReportModel"))
                    {

                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
                    }
                }
                foreach (LearningCompletionReportModel item in objUserList)
                {
                    DataRow row = table.NewRow();
                    foreach (PropertyDescriptor prop in properties)
                    {
                        if (!prop.Name.Equals("learningCompletionReportModel"))
                        {

                            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                        }
                    }
                    table.Rows.Add(row);
                }
                table.Columns.Remove("ActivityId");
                table.Columns.Remove("ActivityDescription");
            }
            if (ReportName == "Learning Progress Report")
            {
                List<LearningCompletionProgressReportModel> objUserList = new List<LearningCompletionProgressReportModel>();
                objUserList = rpt.GetLearningCompletionProgressReportForAdmin(sessionUser.TenantId, Convert.ToInt32(ActivityId), Type);

                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.CompletionDate != "" && (Convert.ToDateTime(x.CompletionDate) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.CompletionDate) <= Convert.ToDateTime(tDate))).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.CompletionDate != "" && Convert.ToDateTime(x.CompletionDate) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.CompletionDate != "" && Convert.ToDateTime(x.CompletionDate) <= Convert.ToDateTime(tDate)).ToList();
                }


                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(LearningCompletionProgressReportModel));
                foreach (PropertyDescriptor prop in properties)
                {
                    if (!prop.Name.Equals("learningCompletionReportModel"))
                    {
                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
                    }
                }
                foreach (LearningCompletionProgressReportModel item in objUserList)
                {
                    DataRow row = table.NewRow();
                    foreach (PropertyDescriptor prop in properties)
                    {
                        if (!prop.Name.Equals("learningCompletionReportModel"))
                        {

                            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                        }
                    }
                    table.Rows.Add(row);
                }
                table.Columns.Remove("ActivityLearningAssigned");
                
                foreach (DataRow dr in table.Rows)
                {
                    if (!string.IsNullOrEmpty(Convert.ToString(dr["Comments"])))
                    {
                        dr["Comments"] = dr["Comments"].ToString().Replace("#;;#", "\n");
                    }
                }
            }
            if (ReportName == "High Score Users Report")
            {
                List<HighScoreUsersReportModel> objUserList = new List<HighScoreUsersReportModel>();
                var objReportData = rpt.GetHighScoreUsersReportForAdmin(sessionUser.TenantId);

                PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(HighScoreUsersReportModel));
                foreach (PropertyDescriptor prop in properties)
                {
                    if (!prop.Name.Equals("HighScoreUsersReportModel"))
                    {

                        table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
                    }
                }
                foreach (HighScoreUsersReportModel item in objReportData)
                {
                    DataRow row = table.NewRow();
                    foreach (PropertyDescriptor prop in properties)
                    {
                        if (!prop.Name.Equals("HighScoreUsersReportModel"))
                        {

                            row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                        }
                    }
                    table.Rows.Add(row);
                }
                table.Columns.Remove("TotalQuestion");
            }
           // table.Columns.Remove("ActivityDescription");
            // creating document object  
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.LETTER);
            rec.BackgroundColor = new BaseColor(System.Drawing.Color.Olive);
            Document doc = new Document(rec);
            doc.SetPageSize(iTextSharp.text.PageSize.LETTER);
            PdfWriter writer = PdfWriter.GetInstance(doc, ms);
            doc.Open();

            //Creating paragraph for header  
            BaseFont bfntHead = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            iTextSharp.text.Font fntHead = new iTextSharp.text.Font(bfntHead, 16, 1, iTextSharp.text.BaseColor.ORANGE);
            Paragraph prgHeading = new Paragraph();
            prgHeading.Alignment = Element.ALIGN_CENTER;
            prgHeading.Add(new Chunk(ReportName.ToUpper(), fntHead));
            doc.Add(prgHeading);

            //Adding paragraph for report generated by  
            Paragraph prgGeneratedBY = new Paragraph();
            BaseFont btnAuthor = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
            iTextSharp.text.Font fntAuthor = new iTextSharp.text.Font(btnAuthor, 8, 2, iTextSharp.text.BaseColor.BLUE);
            prgGeneratedBY.Alignment = Element.ALIGN_RIGHT;
            //prgGeneratedBY.Add(new Chunk("Report Generated by : ASPArticles", fntAuthor));  
            //prgGeneratedBY.Add(new Chunk("\nGenerated Date : " + DateTime.Now.ToShortDateString(), fntAuthor));  
            doc.Add(prgGeneratedBY);

            //Adding a line  
            Paragraph p = new Paragraph(new Chunk(new iTextSharp.text.pdf.draw.LineSeparator(0.0F, 100.0F, iTextSharp.text.BaseColor.BLACK, Element.ALIGN_LEFT, 1)));
            doc.Add(p);

            //Adding line break  
            doc.Add(new Chunk("\n", fntHead));

            //Adding  PdfPTable  
            PdfPTable pdfTable = new PdfPTable(table.Columns.Count);
            pdfTable.WidthPercentage = 100;
            for (int i = 0; i < table.Columns.Count; i++)
            {
                string cellText = Server.HtmlDecode(table.Columns[i].ColumnName);
                PdfPCell cell = new PdfPCell();
                cell.Phrase = new Phrase(cellText, new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.TIMES_ROMAN, 10, 1, new BaseColor(System.Drawing.ColorTranslator.FromHtml("#000000"))));
                cell.BackgroundColor = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#C8C8C8"));
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                cell.PaddingBottom = 5;
                //cell.Width = 80f;
                pdfTable.AddCell(cell);
            }

            //writing table Data  
            for (int i = 0; i < table.Rows.Count; i++)
            {
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    pdfTable.AddCell(table.Rows[i][j].ToString());
                }
            }

            doc.Add(pdfTable);
            doc.Close();
            byte[] result = ms.ToArray();

            string filename = ReportName + ".pdf";
            return File(result, "application/pdf", filename);


        }

        [HttpPost]
        public ActionResult GetFilteredData(string isActive, string fDate, string tDate, string ReportName, string UserId, string ActivityId, string type)
        {
            TblUser sessionUser = (TblUser)Session["UserSession"];
            if (ReportName == "UserReport")
            {
                List<UserReportModel> objUserList = new List<UserReportModel>();
                objUserList = rpt.GetUserReportForAdmin(sessionUser.TenantId, Convert.ToBoolean(isActive));
                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.DateCreated) <= Convert.ToDateTime(tDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.DateCreated != "" && Convert.ToDateTime(x.DateCreated) <= Convert.ToDateTime(tDate)).ToList();
                }

                return PartialView("_UserReportList", objUserList);
            }
            if (ReportName == "UserProgressReport")
            {
                List<UserProgressReportModel> objUserList = new List<UserProgressReportModel>();
                objUserList = rpt.GetUserProgressReportForAdmin(sessionUser.TenantId, Convert.ToInt32(UserId));

                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.AttemptedOn != "" && (Convert.ToDateTime(x.AttemptedOn) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.AttemptedOn) <= Convert.ToDateTime(tDate))).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.AttemptedOn != "" && Convert.ToDateTime(x.AttemptedOn) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.AttemptedOn != "" && Convert.ToDateTime(x.AttemptedOn) <= Convert.ToDateTime(tDate)).ToList();
                }
                return PartialView("_UserProgressReportList", objUserList);
            }
            if (ReportName == "LearningCompletionReport")
            {
                List<LearningCompletionReportModel> objUserList = new List<LearningCompletionReportModel>();
                objUserList = rpt.GetLearningCompletionReportForAdmin(sessionUser.TenantId);

                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && (Convert.ToDateTime(x.ActivityLearningAssigned) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.ActivityLearningAssigned) <= Convert.ToDateTime(tDate))).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && Convert.ToDateTime(x.ActivityLearningAssigned) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.ActivityLearningAssigned != "" && Convert.ToDateTime(x.ActivityLearningAssigned) <= Convert.ToDateTime(tDate)).ToList();
                }

                return PartialView("_LearningCompletionReportList", objUserList);
            }
            if (ReportName == "LearningProgressReport")
            {
                List<LearningCompletionProgressReportModel> objUserList = new List<LearningCompletionProgressReportModel>();
                objUserList = rpt.GetLearningCompletionProgressReportForAdmin(sessionUser.TenantId, Convert.ToInt32(ActivityId), type);
                if (!string.IsNullOrEmpty(fDate) && !string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.CompletionDate != "" && (Convert.ToDateTime(x.CompletionDate) >= Convert.ToDateTime(fDate) && Convert.ToDateTime(x.CompletionDate) <= Convert.ToDateTime(tDate))).ToList();
                }
                else if (!string.IsNullOrEmpty(fDate))
                {
                    objUserList = objUserList.Where(x => x.CompletionDate != "" && Convert.ToDateTime(x.CompletionDate) >= Convert.ToDateTime(fDate)).ToList();
                }
                else if (!string.IsNullOrEmpty(tDate))
                {
                    objUserList = objUserList.Where(x => x.CompletionDate != "" && Convert.ToDateTime(x.CompletionDate) <= Convert.ToDateTime(tDate)).ToList();
                }

                return PartialView("_LearningProgressReportList", objUserList);
            }

            return null;
        }
    }
}