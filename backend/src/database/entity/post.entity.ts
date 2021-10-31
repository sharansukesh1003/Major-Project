import { BaseEntity, Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";
import { UserEntity } from "./user.entity";

@Entity("post")

export class PostEntity extends BaseEntity{

    @PrimaryGeneratedColumn()
    post_id!: string;

    @Column({
        nullable: false,
    }) 
    post_title!: string;

    @Column({
        type : "simple-array",
        nullable: true,
    })
    post_images!: string[];

    @Column({
        type : "simple-array",
        nullable: true
    })
    post_comments!: string[];

    @Column({
        nullable : true
    })
    post_likes!: number;

    @Column({
        type: "timestamp",
        default : ()=> "CURRENT_TIMESTAMP(6)",
        nullable: false,
    })
    post_time!: Date;

    @ManyToOne(() => UserEntity,(post_user) => post_user.user_post)
    post_user! : UserEntity; 
}