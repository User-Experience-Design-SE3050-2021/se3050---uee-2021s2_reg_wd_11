const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const same_bank_beneficiary = new Schema ({
    beneficiary_account_name : {
        type : String,
        required : true,
    },
    beneficiary_account_number  : {
        type : String,
        required : true,
    },
    beneficiary_email : {
        type : String,
        required : true,
    },
    beneficiary_mobile : {
        type : String,
        required : true,
    },
    account_mobile : {
        type : String,
        required : true,
    },
})

const create_table_beneficiary = mongoose.model("same_bank_beneficiary", same_bank_beneficiary);
module.exports = create_table_beneficiary;
