import {Request,Response} from "express"
import jwt from "jsonwebtoken"
import dotenv from "dotenv"
import * as EmailValidator from "email-validator"
import bcrypt from "bcrypt"
import { getCustomRepository } from "typeorm"
import { UserRepository } from "../database/repository/user.repository"

dotenv.config()
class AuthenticationController{
    static validateEmail(useremail : string) : boolean {
        let isEmailValidated : boolean = EmailValidator.validate(useremail);
        return isEmailValidated;
    }
    // SignUp
    static async signUp(req : Request, res : Response){
        let jwt_secret_key = process.env.JWT_SECRET_KEY as string;
        let {useremail, userpassword} = req.body;
        // Checking whether the email is valid
        if(!AuthenticationController.validateEmail(useremail)){
            return res.send({
                code : 402, // Invalid Email
                authetication : false,
                message : "Enter Valid E-mail",
            })
        }
        // Password encryption
        let salt = await bcrypt.genSalt(10);
        bcrypt.hash(userpassword, salt, async (error : any , encryptedPassword : any) => {
            if(error){
                return res.send({
                    code : 401, // General Error
                    messsage: error,
                    authentication : false,
                })
            }
            // Saving user data
            let userRepository = getCustomRepository(UserRepository)
            await userRepository.saveUserData(req,res,encryptedPassword);
            // Sending jwt in response
            jwt.sign({
                useremail // Payload
            },
            jwt_secret_key, // Secret Key
            {
                expiresIn : "1h", // Expiry Time
            },
            async (error : any, data : any) =>{ // Callback
                if(error){
                    return res.send({
                        code: 401, 
                        data: "Something went wrong, try again",
                        authentication : false,
                    })
                }
                return res.send({
                    code : 201,
                    message : data,
                    authentication : true,
                })
            });
        });
    }
    // Login
    static async login(req : Request, res : Response){
        let jwt_secret_key = process.env.JWT_SECRET_KEY as string;
        let {useremail, userpassword} = req.body;
        // Validate E-mail.
        if(!AuthenticationController.validateEmail(useremail)){
            return res.send({
                authetication : false,
                message : "Enter Valid E-mail",
            })
        }
        // Check whether user exists.
        let userRepository = getCustomRepository(UserRepository);
        let userData = await userRepository.findUserPassword(req, res, useremail);
        let basePassword = userData!.userpassword!;
        // Check password
        bcrypt.compare(
            userpassword,
            basePassword,
            async (error : any, result : any) => {
            if(error){
                return res.send({
                    code : 401,
                    message : "Something went wrpng, try again.",
                    authentication : false,
                })
            }
            if(!result){
                return res.send({
                    code :407, // Incorrect Password
                    message : "Incorrect Password",
                    authentication : false,
                });
            }
            jwt.sign({
                useremail // Payload
            },
            jwt_secret_key, // Secret Key
            {
                expiresIn : "1h", // Expiry Time
            },
            async (error : any, data : any) =>{ // Callback
                if(error){
                    return res.send({
                        code : 401,
                        message: error,
                        authentication : false,
                    })
                }
                return res.send({
                    code : 201,
                    message: data,
                    authentication : true,
                })
            });
        });
    }

    // Decode jwt
    static async decodeJwt(req : Request, res : Response){
        let token = req.headers.authorization as string;
        let jwt_secret_key = process.env.JWT_SECRET_KEY as string;
        jwt.verify(token, jwt_secret_key, async (error : any, data : any) => {
            if(error){
                console.log(error)
                return res.send({
                    code : 403,
                    message : null
                })
            }
            else{
                var useremail = data.useremail!
                return res.send({
                    code : 200,
                    message : useremail
                })
            }
        })
    }

}

export { AuthenticationController };