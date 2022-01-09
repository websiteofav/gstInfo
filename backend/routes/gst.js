import express from "express";

const router = express.Router();

const gstInfo = [
  {
    gstNumber: "123456",
    comapnyName: "ABC",
    businessPlace:
      "Shop No.5, Dinath Terrace, 189, L.j. Rd, Opp Citylight Cinema, Mahim",
    additionalPlace: "Floor 1",
    stateJurisdiction: "Ward 74",
    centerJurisdiction: "RANGE-139",
    taxPayerType: "Regular",
    businessCondition: "Private Limited Company",
    registartionDate: "01/07/2019",
    cancellationDate: "--",
  },

  {
    gstNumber: "234567",
    comapnyName: "BCD",
    businessPlace: "218, M.j.market, Kalbadevi",
    additionalPlace: "Floor 2",
    stateJurisdiction: "Ward 84",
    centerJurisdiction: "RANGE-146",
    taxPayerType: "Regular",
    businessCondition: "Private Limited Company",
    registartionDate: "01/07/2020",
    cancellationDate: "--",
  },

  {
    gstNumber: "345678",
    comapnyName: "CDE",
    businessPlace: "27, Avantika Bhai Gokhale Str, Opera House",
    additionalPlace: "Floor 3",
    stateJurisdiction: "Ward 92",
    centerJurisdiction: "RANGE-150",
    taxPayerType: "Regular",
    businessCondition: "Private Limited Company",
    registartionDate: "01/07/2021",
    cancellationDate: "--",
  },
];

router.get("/", (req, res) => {
  var i;

  res.send(gstInfo);
});

router.get("/:id", (req, res) => {
  const gstNumber = req.body;
  var found = false;
  gstInfo.map((e) => {
    if (e["gstNumber"] == req.params.id) {
      found = true;
      res.send(e);
    }
  });
  if (found == false) {
    res.send("No Data Found");
  }
});

export default router;
