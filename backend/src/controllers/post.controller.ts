import { Request, response, Response } from "express";
import { getCustomRepository } from "typeorm";
import { PostRepository } from "../database/repository/post.repository";

export class PostController{
    static async addPost(req : Request, res: Response) {
        let postRepository = getCustomRepository(PostRepository);
        await postRepository.addPost(req,res)
    }
    static async fetchPosts(req : Request, res: Response) {
        let postRepository = getCustomRepository(PostRepository);
        await postRepository.fetchPost(req,res)
    }
}