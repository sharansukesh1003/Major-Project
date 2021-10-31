import { BaseEntity, Column, Entity, JoinColumn, OneToMany, PrimaryGeneratedColumn } from "typeorm";
import { PostRepository } from "../repository/post.repository";
import { PostEntity } from "./post.entity";

@Entity("users")

export class UserEntity extends BaseEntity{
    @PrimaryGeneratedColumn()
    id!: string;

    @Column({
        nullable : false
    })
    username!: string;

    @Column({
        nullable : false
    })
    useremail!: string;

    @Column({
        nullable : false
    })
    userpassword!: string;
    @Column({
        nullable : true
    })
    userimage!: string;

    // Relations
    @OneToMany(() => PostEntity, (user_post)=> user_post.post_user)
    @JoinColumn()
    user_post! : PostEntity[];
}