const mongoose = require('mongoose');

const Beneficiary_Inter_Bank_Schema = new mongoose.Schema({

    paymentOption:{
        type:String,
        required:true
    },
    beneficiaryAccountBank:{
        type:String,
        required:true
    },
    beneficiaryAccountBranch:{
        type:String,
        required:true
    },
    beneficiaryAccountNumber:{
        type:String,
        required:true
    },
    beneficiaryName:{
        type:String,
        required:true
    },
    emailAddress:{
        type:String,
        required:false
    },
    beneficiaryMobileNumber:{
        type:String,
        required:false
    },
    
});
const BeneficiaryInterBank = mongoose.model('Beneficiary_Inter_Bank', Beneficiary_Inter_Bank_Schema);
module.exports = BeneficiaryInterBank;