﻿using LMSBL.DBModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LMSBL.Common
{
    public class Commonfunctions
    {
        public TblUser UserMapping(DataSet ds)
        {
            DateTime? nullDate = null;
            TblUser tbluser = new TblUser();
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    tbluser.UserId = Convert.ToInt16(ds.Tables[0].Rows[0]["userId"]);
                    tbluser.FirstName = Convert.ToString(ds.Tables[0].Rows[0]["firstName"]);
                    tbluser.LastName = Convert.ToString(ds.Tables[0].Rows[0]["lastName"]);
                    tbluser.EmailId = Convert.ToString(ds.Tables[0].Rows[0]["emailId"]);
                    tbluser.DOB = (Convert.ToString(ds.Tables[0].Rows[0]["DOB"]) == null || Convert.ToString(ds.Tables[0].Rows[0]["DOB"]) == "") ? nullDate : Convert.ToDateTime(ds.Tables[0].Rows[0]["DOB"]);
                    tbluser.ContactNo = Convert.ToString(ds.Tables[0].Rows[0]["contactNo"]);
                    tbluser.RoleId = Convert.ToInt16(ds.Tables[0].Rows[0]["roleId"]);
                    tbluser.TenantId = Convert.ToInt16(ds.Tables[0].Rows[0]["tenantId"]);
                    tbluser.IsNew = Convert.ToBoolean(ds.Tables[0].Rows[0]["isNew"]);
                    tbluser.profileImage = Convert.ToString(ds.Tables[0].Rows[0]["profileImage"]);
                    tbluser.TenantURL = Convert.ToString(ds.Tables[0].Rows[0]["tenantDomain"]);
                    tbluser.TenantLogo = Convert.ToString(ds.Tables[0].Rows[0]["Logo"]);
                    //tbluser.CRMClientId = Convert.ToString(ds.Tables[0].Rows[0]["CRMClientId"]);
                    //tbluser.isLMS = Convert.ToBoolean(ds.Tables[0].Rows[0]["isLMS"]);
                }
            }
            return tbluser;
        }
    }
}
