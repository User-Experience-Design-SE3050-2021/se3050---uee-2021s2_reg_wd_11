// const express = require('express');
// const router = express.Router();
const router = require("express").Router();
const Bill = require('../models/bill');
const rn = require('random-number');

/**Inserting Favourite Bill Details */
router.post("/add", async(req,res) => {
    var gen = rn.generator({
        min:  0, 
        max:  999999,
        integer: true
    })
    const newBill = new Bill({
        billId : 'BILL'+gen(),
        serviceProvider : req.body.serviceProvider,
        payeeDescription : req.body.payeeDescription,
        referenceNumber : req.body.referenceNumber
    });
    await newBill.save()
        .then(data => {
            res.status(200).send({ data: data });
        })
        .catch(error => {
            res.status(500).send({ error: error.message });
        });
})

/**Retrieving All Favourite Bill Details */
router.get("/view", async(req,res) => {
    await Bill.find()
    .then(data => {
        res.status(200).send({ data: data });
    })
    .catch(error => {
        res.status(500).send({ error: error.message });
    });
})

/**Retrieving One Favourite Bill Details */
router.get("/viewOne/:billId", async(req,res) => {
    if (req.params && req.params.billId) {
        await Bill.findOne({"billId":req.params.billId})
        .then(data => {
            res.status(200).send({ data: data });
        })
        .catch(error => {
            res.status(500).send({ error: error.message });
        });
    }
})

/**Updating Favourite Bill Details */
router.put("/update/:billId", (req,res) => {
    Category.findOne({"billId":req.params.billId})
        .then((bill) => {
            bill.serviceProvider = req.body.serviceProvider;
            bill.payeeDescription = req.body.payeeDescription;
            bill.referenceNumber = req.file.referenceNumber;

            bill
            .save()
            .then(() => res.json("Bill Details Updated!"))
            .catch((err) => res.status(400).json(`Error: ${err}`));
        })
        .catch((err) => res.status(400).json(`Error: ${err}`));

})

/**Deleting Order */
router.delete("/delete/:billId", (req,res) => {
    OrderPayment.findOneAndDelete({"billId":req.params.billId})
        .then(data => {
            res.status(200).send({data:data});            
        })
        .catch((error) =>{ 
            res.status(500).send({error:error.message});
        });

})

module.exports = router;