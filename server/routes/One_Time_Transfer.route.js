const express = require('express');
const router = express.Router();
const OneTimeTransfer = require('../models/One_Time_Transfer.model');
const moment = require('moment');

const accountSid = process.env.DTWILIO_ACCOUNT_SID;
const authToken = process.env.DTWILIO_AUTH_TOKEN;
const myPhone = process.env.DTWILIO_PHONE_NUMBER;
const client = require('twilio')(accountSid, authToken);

const tempOTP = [];

router.get('/get-otp', async (req, res) => {
    try{
        const otp = Math.floor((Math.random() * 10000) + 1000);
        console.log(otp);
        client.messages.create({
            body: `One Time Password to authorize your action ${otp}`,
            from: myPhone,
            to: req.params.number || '+94776572518'
        }).then(message => {
            const expire = moment(message.dateCreated).add(5,'minutes');
            let otpData = {
                sid:message.sid.toString(),
                otp:otp.toString(),
                expire:expire
            }
            let data = {
                sid: message.sid,
                otp:otp
            }
            tempOTP.push(otpData);
            res.status(200).send({
                success:true,
                data:data,
                message:"OTP sent !"
            })
            // console.log(otpData);
            // const now = new Date().toUTCString();
            // const t = moment(now);
            // console.log(t);
            // console.log(otpData.expire > t);
            // console.log(otpData.expire > t);
            // const y = moment(message.dateCreated).add(10,'minutes');
            // console.log(t > y);
        });
    }catch (error){
        res.status(500).send({
            success:false,
            message:error.message
        })
    }
});


router.post('/verify-otp', async (req, res) => {

    if(tempOTP.length > 0){
        tempOTP.map((item , index) => {
            if(req.body.otp === item.otp){
                if(req.body.sid === item.sid){
                    tempOTP.splice(index,1);
                    const now = new Date().toUTCString();
                    const current = moment(now);
                    if(item.expire > current){
                        tempOTP.splice(index,1);
                        res.status(200).send({
                            success:true,
                            message:"OTP is valid !"
                        })
                    }else{
                        res.status(400).send({
                            success:false,
                            message:"OTP expired !"
                        })
                    }
                }else{
                    res.status(400).send({
                        success:false,
                        message:"Invalid OTP request another OTP !"
                    })
                }
            }else{
                res.status(404).send({
                    success:false,
                    message:"OTP not found !"
                })
            }
        });
    }else {
        res.status(404).send({
            success:false,
            message:"OTP not found !"
        })
    }
});

router.post('/one-time-transfer', async (req, res) =>{
    let transfer = {
        fromAccount:req.body.fromAccount,
        paymentOption:req.body.paymentOption,
        beneficiaryAccountBank:req.body.beneficiaryAccountBank,
        beneficiaryAccountBranch:req.body.beneficiaryAccountBranch,
        beneficiaryAccountNumber:req.body.beneficiaryAccountNumber,
        beneficiaryName:req.body.beneficiaryName,
        emailAddress:req.body.emailAddress,
        beneficiaryMobileNumber:req.body.beneficiaryMobileNumber,
        transferAmount:req.body.transferAmount,
        transferOn:req.body.transferOn,
        transferDescription:req.body.transferDescription
    }

    const newTransfer = new OneTimeTransfer(transfer);
    try{
        await newTransfer.save().then(data => {
            res.status(201).send({
                success:true,
                data:data
            })
        })
    }catch (error){
        res.status(500).send({
            success:false,
            message:"Server error !"
        })
    }
});

module.exports = router;

