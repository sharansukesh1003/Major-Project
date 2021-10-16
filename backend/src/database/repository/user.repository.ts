import { EntityRepository, Repository } from "typeorm";
import { UserEntity } from "../entity/user.entity";
import { Request , Response } from "express";

@EntityRepository(UserEntity)

export class UserRepository extends Repository<UserEntity>{

    async saveUserData(req : Request, res : Response , encryptedPassword : any) {
        let {username,useremail,userimage} = req.body;
        let userAlreadyExists : boolean = (await this.createQueryBuilder("users").
        select().
        where("users.useremail = :useremail",{
            useremail
        })
        .getCount() > 0);
        if(userAlreadyExists){
            return res.send({
                code: 403, // Invalid Request
                authetication : false,
                message : "Email Already Exists",
            })
        }
        this.createQueryBuilder("users").insert().values({
            userimage,
            useremail,
            userpassword : encryptedPassword,
            username
        }).execute();
    }

    async findUserPassword (req : Request, res : Response, useremail : string ) : Promise <any> {
            let getPassword = await this.createQueryBuilder("users")
            .select("users.userpassword")
            .where("users.useremail = :useremail", { useremail })
            .getOne();
            if(getPassword === undefined){
                return res.send({
                code: 403, // Invalid Request
                message : "User not Found",
                authenticated : false,
            });
          }
        return getPassword;
    }
}