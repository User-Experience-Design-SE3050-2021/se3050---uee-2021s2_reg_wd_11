require('dotenv').config({path: "./config.env"});
const express = require("express");
const router = express.Router();
const crypto = require("crypto");
const userModel = require("../models/User");
const Error = require("../utils/error_response");
const sendEmail = require("../utils/send_email");
const { getPrivateData } = require("../middleware/private_error");
const { protect } = require("../middleware/user_protect");

const accountsid = process.env.ACCOUNT_SID;
const authToken = process.env.AUTH_TOKEN;
const client = require('twilio')(accountsid, authToken);

const serviceID =process.env.SERVICE_ID;


//Protecion
router.get("/user", protect, getPrivateData);

//Register
router.post("/user/userregister", async (req, res, next) => {
  const {
    userAccType,
    userAccNumber,
    userIdType,
    userIdNumber,
    userEmail,
    userPhone,
    userPassword,
  } = req.body;

  try {
    const user = await userModel.create({
      userAccType,
      userAccNumber,
      userIdType,
      userIdNumber,
      userEmail,
      userPhone,
      userPassword,
    });

    user.save();
  } catch (error) {
    next(error);
  }
});

//Login
router.post("/user/userlogin", async (req, res, next) => {

  const { userEmail, userPassword, userPhone } = req.body;



  if (!userEmail || !userPassword || !userPhone) {
    return next(new Error("Please provide an Email , Contact and Password...!", 400));
  }

  try {
    const user = await userModel.findOne({ userEmail }).select("+userPassword");

    if (!user) {
      return next(new Error("Invalid credentials...!", 401));
    }
    const isMatch = await user.matchPasswords(userPassword);

    if (!isMatch) {
      return next(new Error("Invalid Password...!", 401));
    }
    
    sendToken(user, 200, res);



  } catch (error) {
    next(error);
  }
});

//Send OTP SMS
router.post("/user/otpsms", async (req, res, next) => {

  const {userPhone} = req.body;
  
  client.verify.services(serviceID)
             .verifications
             .create({to: "+94" + userPhone, channel: 'sms'})
             .then(verification => {
              return res.status(200).send({verification});
             })
             .catch((error) => {
              return res.status(400).send({error});
             });

 
});

//Verify otp sms
router.post("/user/verifyotpsms", async (req, res, next) => {

  const {userPhone , otp} = req.body;
  try {
    const user = await userModel.findOne({ userPhone });

    if (!user) {
      return next(new Error("No such a phone number", 401));
    }
  else {
    return client.verify.services(serviceID)
    .verificationChecks
    .create({to: "+94" + userPhone, code: otp})
    .then(verification_check =>  {
      return res.status(200).send({verification_check});
     })
     .catch((error) => {
      return res.status(400).send({error});
     });
  }} catch (error) {
    next(error);
  }

 
});




//Forgot Password verify
router.post("/user/forgotpassword", async (req, res, next) => {
  const { userEmail } = req.body;

  try {
    const user = await userModel.findOne({ userEmail });

    if(!user){
      return next(new Error("Email could not be sent to this email.", 404));
   }
   else{
     return res.status(200).json({
          success: true,
          data: "Email is there",
        });
   }
  } catch (error) {
    next(error);
  }
});

//Reset Password
router.put("/user/userresetpassword/:resetToken", async (req, res, next) => {
  const resetPasswordToken = crypto
    .createHash("sha256")
    .update(req.params.resetToken)
    .digest("hex");

  try {
    const user = await userModel.findOne({
      resetPasswordToken,
      resetPasswordExpire: { $gt: Date.now() },
    });

    if (!user) {
      return next(new Error("Invalid reset token", 400));
    }

    user.userPassword = req.body.userPassword;

    user.resetPasswordToken = undefined;
    user.resetPasswordExpire = undefined;

    await user.save();

    res.status(201).json({
      success: true,
      data: "Password reset successfully",
    });
  } catch (error) {
    next(error);
  }
});

//Retrive
router.get("/user/users", (req, res, next) => {
  userModel.find().exec((err, users) => {
    if (err) {
      return next(new Error("Can not find any user!", 400));
    }
    return res.status(200).json({
      success: true,
      users,
    });
  });
});

//Retrive specific data
router.get("/user/userdata/:userEmail", (req, res) => {
  let userEmail = req.params.userEmail;
  userModel.findOne({ userEmail: userEmail }, (err, user) => {
    if (err) {
      return next(
        new ErrorResponse("Can not find a user with this email...!", 400)
      );
    }
    return res.status(200).json({
      success: true,
      user,
    });
  });
});

//Update
router.put("/user/updateuser/:id", (req, res, next) => {
  userModel.findByIdAndUpdate(
    req.params.id,
    {
      $set: req.body,
    },
    (err, user) => {
      if (err) {
        return next(new userModel("Can not update the data!", 400));
      }

      return res.status(200).json({
        success: "Succussfully updated.",
      });
    }
  );
});

//Token send to the model class
const sendToken = (user, statusCode, res) => {
  const token = user.getSignedToken();
  res.status(statusCode).json({
    success: true,
    token,
  });
};

module.exports = router;
