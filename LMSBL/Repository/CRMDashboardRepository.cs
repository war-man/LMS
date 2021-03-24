using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LMSBL.Common;
using LMSBL.DBModels.CRMNew;
using System.Web.Mvc;
using System.Data.Entity;
using System.Data.Entity.Migrations;

namespace LMSBL.Repository
{
    public class CRMDashboardRepository
    {
        DataRepository db = new DataRepository();
        Exceptions newException = new Exceptions();

        public List<tblCRMUser> GetCRMDashboardList(int clientID, int stage)
        {
            List<tblCRMUser> objCRMEnquiryList = new List<tblCRMUser>();
            using (var context = new CRMContext())
            {
                objCRMEnquiryList = context.tblCRMUsers.Where(x => x.ClientId == clientID && x.CurrentStage == stage)
                    .OrderByDescending(p => p.CreatedOn).Take(5).ToList();

            }
                return objCRMEnquiryList;
        }
        public List<tblCRMUser> GetCRMDocumentList(int clientID, int stage)
        {
            //This function is not working, result is not getting, getting error
            List<tblCRMUser> objCRMEnquiryList = new List<tblCRMUser>();
            using (var context = new CRMContext())
            {
                objCRMEnquiryList = context.tblCRMUsers.Where(x => x.ClientId == clientID && x.CurrentStage == stage)
                    .OrderByDescending(p => p.CreatedOn).Take(5).ToList();
                
                
                var docs = context.tblCRMDocuments.OrderByDescending(m=>m.UpdatedDate).ToLookup(p => p.ClientId).Select(coll => coll.FirstOrDefault()).ToList();

                var lstResult = from a in context.tblCRMUsers
                                join c in docs on a.Id equals c.ClientId
                                where a.ClientId == clientID && a.CurrentStage == stage
                                select new
                                {
                                    a.ClientId,
                                    a.FirstName,
                                    a.LastName,
                                    c.UpdatedDate
                                };

                var result = lstResult.Select(x=>x.ClientId).ToList();
                

            }
            return objCRMEnquiryList;
        }

    }
}
