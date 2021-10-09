const mongoose = require('mongoose');

const One_Time_TransferSchema  = new mongoose.Schema({

    fromAccount:{
        type:String,
        required:true
    },
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
    transferAmount:{
        type:String,
        required:true
    },
    transferOn:{
        type:String,
        required:true
    },
    transferDescription:{
        type:String,
        required:false
    }
})
const One_Time_Transfer = mongoose.model('One_Time_Transfer', One_Time_TransferSchema);
module.exports = One_Time_Transfer;