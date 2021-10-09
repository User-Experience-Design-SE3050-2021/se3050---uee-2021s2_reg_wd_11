const router = require("express").Router();
const Beneficiary_Same_Bank = require('../models/Beneficiary_Same_Bank');

router.post('/insert-beneficiary', (req,res) => {
    const newBeneficiary = new Beneficiary_Same_Bank ({
        beneficiary_account_name : req.body.beneficiary_account_name,
        beneficiary_account_number : req.body.beneficiary_account_number,
        beneficiary_email : req.body.beneficiary_email,
        beneficiary_mobile : req.body.beneficiary_mobile,
        account_mobile : req.body.account_mobile,
    });
        try {
            newBeneficiary
            .save()
            .then(() => {
                res.status(200).json("Favorite Beneficary Added Successfully!");
                console.log("Favorite Beneficary Added Successfully!" + newBeneficiary);
            })
        } catch (error) {
            res.status(400).json(`Error While Adding A New Beneficiary! : ${error}`);
            console.log(error);
        }
})

router.route('/get-all-beneficiaries/:account_mobile').get((req,res) => {
    try {
        account_mobile = req.params.account_mobile;
        Beneficiary_Same_Bank
        .find({"account_mobile": account_mobile})
        .then((beneficiary_same_bank) => {
            res.status(200).json(beneficiary_same_bank);
            console.log("Your All Beneficiaries Fetched! "+ beneficiary_same_bank);
        })
    } catch (error) {
        res.status(400).json(`Error While Fetching All Beneficiaries! : ${error}`);
        console.log(`Error While Fetching All Transactions! : ${error}`)
    }
})

router.route('/get-one-beneficiary/:id').get(async(req,res) => {
    try {
        let beneficiary_id = req.params.id;
        const getonebeneficiary = await Beneficiary_Same_Bank
        .findById(beneficiary_id)
        .then((get_one_beneficiary) => {
            res.status(200).send({status : "Single Beneficiary Fetched! ", get_one_beneficiary})
            console.log("Single Beneficiary Fetched! ", get_one_beneficiary)
        })
    } catch (error) {
        res.status(400).send({status : "Error While Fetching The Single Beneficiary! ", error: error.message})
        console.log(`Error While Fetching The Single Beneficiary! ${error}`)
    }
})

router.route('/update-one-beneficiary/:id').put(async(req,res) => {
    try {
        let beneficiary_id = req.params.id;
        const getonebeneficiary = await Beneficiary_Same_Bank
        .findByIdAndUpdate(beneficiary_id)
        .then((get_one_beneficiary) => {
            get_one_beneficiary.beneficiary_account_name = req.body.beneficiary_account_name,
            get_one_beneficiary.beneficiary_account_number = req.body.beneficiary_account_number,
            get_one_beneficiary.beneficiary_email = req.body.beneficiary_email,
            get_one_beneficiary.beneficiary_mobile = req.body.beneficiary_mobile,
            //get_one_beneficiary.account_mobile = req.body.account_mobile,

            get_one_beneficiary
            .save()
            .then(() => {
                res.status(200).send({status : "Single Beneficiary Updated! ", get_one_beneficiary})
                console.log("Single Beneficiary Updated! " + get_one_beneficiary)
            })
            .catch((error) => {
                res.status(400).send({status : "Error While Fetching The Single Beneficiary! ", error: error.message})
                console.log(`Error While Fetching The Single Beneficiary! ${error}`)
            })
        })
    } catch (error) {
        res.status(400).send({status : "Error While Fetching The Single Beneficiary! ", error: error.message})
        console.log(`Error While Fetching The Single Beneficiary! ${error}`)
    }
})

router.route('/delete-one-beneficiary/:id').delete(async(req,res) => {
    try {
        let beneficiary_id = req.params.id;
        const getbeneficiary_delete = await Beneficiary_Same_Bank
            .findOneAndDelete({"_id":beneficiary_id})
            .then((delete_one_beneficiary) => {
                res.status(200).send({status: "Favorite Beneficiary Deleted!", delete_one_beneficiary})
                console.log("Favorite Beneficiary Deleted! " + delete_one_beneficiary)
            })
    } catch (error) {
        res.status(400).json(`Error While Deleting This Favorite Beneficiary! : ${error}`)
        console.log(`Error While Deleting This Favorite Beneficiary! : ${error}`)
    }
})

module.exports = router;