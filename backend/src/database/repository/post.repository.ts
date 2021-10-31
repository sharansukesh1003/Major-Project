import { EntityRepository,getCustomRepository,Repository } from "typeorm";
import { PostEntity } from "../entity/post.entity";
import { Request, Response } from "express";
import { UserRepository } from "./user.repository";

@EntityRepository(PostEntity)

export class PostRepository extends Repository<PostEntity>{
    async addPost(req : Request, res : Response){
        let { post_title , post_images, post_comments, post_likes } = req.body;
        let { useremail } = req.params
        let userRepository = getCustomRepository(UserRepository)

        let user = await userRepository.findOne({useremail})

        let postEntity = new PostEntity()

        postEntity.post_user = user!;
        postEntity.post_title = post_title;
        postEntity.post_images = post_images;
        postEntity.post_comments = post_comments;
        postEntity.post_likes = post_likes;

        await postEntity.save().then((data : any) => {
            if(data !== undefined){
                return res.send({
                    code : 201,
                    added : true
                });
            }
        }).catch((error : any) => {
            if(error !== undefined){
                return res.send({
                    code : 401,
                    added : false
                });
            } 
        })
    }
    async fetchPost(req : Request, res : Response){
        try{
            let post = await this.createQueryBuilder("post")
            .leftJoinAndSelect("post.post_user","users")
            .select()
            .getMany()

            if(post !== undefined){
                return res.send({
                    code : 200,
                    data : post,
                    received : true
                });
            }
        }
        catch(error){
            if(error !== undefined){
                return res.send({
                    code : 401,
                    data : error,
                    received : false
                });
            }
        }
    }
}
