import { Administrator } from "src/administrator/entities/administrator.entity";
import { Inquiry } from "src/inquiry/entities/inquiry.entity";
import { Type } from "src/type/entities/type.entity";
import { BaseEntity, Column, CreateDateColumn, UpdateDateColumn ,Entity, PrimaryGeneratedColumn, ManyToOne, OneToMany } from "typeorm";

@Entity()
export class Service  extends BaseEntity{
    @PrimaryGeneratedColumn()
    id:number

    @Column()
    name:string

    @Column({default:'ACTIVE'})
    status:string

    @CreateDateColumn()
    created_at:Date

    @UpdateDateColumn()
    updated_at:Date

    @ManyToOne(()=>Administrator,adminstrator=>adminstrator.service)
    administrator:Administrator

    @OneToMany(()=>Type,type=>type.service,{eager:true})
    types:Type[]

    @OneToMany(()=>Inquiry,inquiry=>inquiry.service,{eager:true})
    inquiries:Inquiry[]
}
