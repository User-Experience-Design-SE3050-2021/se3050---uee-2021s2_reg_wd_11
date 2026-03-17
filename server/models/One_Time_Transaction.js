const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const one_time_transaction = new Schema ({
    transaction_from : {
        type: String,
        required : true,
    },
    transaction_to : {
        type: String,
        required : true,
    },
    transaction_amount : {
        type : Number,
        required : true,
    },
    mobile_number : {
        type : String,
        required : true,
    },
    Remarks : {
        type : String,
        required : true,
    },
    transaction_date : {
        type : String,
        required : true,
    },
})

const same_bank_transaction = mongoose.model("one_time_transaction", one_time_transaction );
module.exports = same_bank_transaction;