const router = require("express").Router();

const One_Time_Transaction = require("../models/One_Time_Transaction");

router.post('/make-transaction', (req,res) => {
    const newTransaction = new One_Time_Transaction ({
        transaction_from : req.body.transaction_from,
        transaction_to : req.body.transaction_to,
        transaction_amount : Number(req.body.transaction_amount),
        mobile_number : req.body.mobile_number,
        Remarks : req.body.Remarks,
        transaction_date : new Date(),
    });
        try {
            newTransaction
                .save()
                .then(() => {
                    res.status(200).json("One Time Transaction Success!")
                    console.log("One Time Transaction Success " + newTransaction)
                })
                   
        } catch (error) {
            res.status(400).json(`Transaction Failure! : ${error}`)
            console.log(error)
        }   
})

router.route('/get-all-onetime').get((req,res) => {
    try {
        One_Time_Transaction
            .find()
            .then((one_time_transaction) =>{
                res.status(200).json(one_time_transaction)
                console.log("Your All Transactions Fetched! "+ one_time_transaction)
        })
    } catch (error) {
        res.status(400).json(`Error While Fetching All Transactions! : ${error}`)
        console.log(`Error While Fetching All Transactions! : ${error}`)
    }
})

router.route('/get-one-transaction/:id').get(async(req,res) => {
    try {
        let transaction_id = req.params.id;
        const onetimetransaction = await One_Time_Transaction
            .findById(transaction_id)
            .then((one_time_transaction) => {
                res.status(200).send({status: "Single Transaction Fetched!", one_time_transaction})
                console.log("Single Transaction Fetched! " + one_time_transaction)
            })
    } catch (error) {
        res.status(400).send({status: "Error while Fetching One Single Record!", error: error.message})
        console.log(`Error while Fetching One Single Record! : ${error}`)
    }
})

router.route('/delete-transaction/:id').delete(async (req,res) => {
    try {
        let transaction_id = req.params.id;
        const onetimetransaction_delete = await One_Time_Transaction
            .findOneAndDelete({"_id":transaction_id})
            .then((one_time_transaction) => {
                res.status(200).send({status: "Transaction Deleted!", one_time_transaction})
                console.log("Transaction Deleted! " + one_time_transaction)
            })
    } catch (error) {
        res.status(400).json(`Error While Deleting This Transaction! : ${error}`)
        console.log(`Error While Deleting This Transaction! : ${error}`)
    }
})

module.exports = router;