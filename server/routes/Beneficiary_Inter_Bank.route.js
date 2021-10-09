const express = require('express');
const router = express.Router();
const BeneficiaryInterBank = require('../models/Beneficiary_Inter_Bank.model');

router.post('/add-bene-inter-bank', async (req, res) => {
    let beneficiary = {
        paymentOption:req.body.paymentOption,
        beneficiaryAccountBank:req.body.beneficiaryAccountBank,
        beneficiaryAccountBranch:req.body.beneficiaryAccountBranch,
        beneficiaryAccountNumber:req.body.beneficiaryAccountNumber,
        beneficiaryName:req.body.beneficiaryName,
        emailAddress:req.body.emailAddress,
        beneficiaryMobileNumber:req.body.beneficiaryMobileNumber,
    }

    const newBeneficiary = new BeneficiaryInterBank(beneficiary);

    try{
        await newBeneficiary.save().then(()=>{
            res.status(201).send({
                success:true,
                message: "New Beneficiary added successfully !"
            })
        })
    }catch (error) {
        res.status(500).send({
            success:false,
            message: "Server error !"
        })
    }
});

router.get('/get-bene-inter-bank', async (req, res) => {
    try {
        await BeneficiaryInterBank.find().then(data =>{
            res.status(200).send({
                success:true,
                data:data
            })
        })
    }catch (error) {
        res.status(500).send({
            success:false,
            message: "Server error !"
        })
    }
});

router.put('/put-bene-inter-bank/:id', async (req, res) => {
    let beneficiary = {
        paymentOption:req.body.paymentOption,
        beneficiaryAccountBank:req.body.beneficiaryAccountBank,
        beneficiaryAccountBranch:req.body.beneficiaryAccountBranch,
        beneficiaryAccountNumber:req.body.beneficiaryAccountNumber,
        beneficiaryName:req.body.beneficiaryName,
        emailAddress:req.body.emailAddress,
        beneficiaryMobileNumber:req.body.beneficiaryMobileNumber,
    }

    try{
        await BeneficiaryInterBank.findByIdAndUpdate(req.params.id,{$set:beneficiary}).then(()=>{
            res.status(200).send({
                success:true,
                message: "Beneficiary updated successfully !"
            })
        })
    }catch (error) {
        res.status(500).send({
            success:false,
            message: "Server error !"
        })
    }
})

router.delete('/delete-bene-inter-bank/:id', async (req, res) => {
    try {
        await BeneficiaryInterBank.findByIdAndDelete(req.params.id).then(result =>{
            res.status(200).send({
                success:true,
                message: "Beneficiary deleted successfully !"
            })
        })
    }catch (error){
        res.status(500).send({
            success:false,
            message: "Server error !"
        })
    }
})

module.exports = router;