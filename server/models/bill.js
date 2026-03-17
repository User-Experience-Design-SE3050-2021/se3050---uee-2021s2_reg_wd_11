const mongoose = require('mongoose');
const schema = mongoose.Schema;

const billDetailSchema = new schema({
    
    billId:{
        type: String,
        required: true,
        unique:true
    },
    serviceProvider:{
        type: String,
        required: true
    },
    payeeDescription:{
        type: String,
        required: true
    },
    referenceNumber:{
        type: String,
        required: true
    }
})

const Bill = mongoose.model("billDetail",billDetailSchema);

module.exports = Bill;