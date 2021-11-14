import { Administrator } from "src/administrator/entities/administrator.entity";
import { Service } from "src/service/entities/service.entity";
import { Type } from "src/type/entities/type.entity";
import { BaseEntity, Column, CreateDateColumn, Entity, ManyToOne, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

@Entity()
export class Inquiry extends BaseEntity{
    @PrimaryGeneratedColumn()
    id:number

    @Column()
    name:string

    @Column()
    gender:string

    @Column()
    maritalstatus:string

    @Column()
    phonenumber:string

    @Column({nullable:true})
    email:string

    @Column({nullable:true})
    province:string

    @Column({nullable:true})
    district:string

    @Column()
    city:string

    @Column()
    location:string

    @Column()
    serviceId:number

    @Column({nullable:true})
    typeId:number

    @Column({nullable:true})
    productId:number

    @Column({nullable:true})
    frequency:string
    
    @Column({type:"text"})
    issue

    @Column()
    administratorId:number

    @Column({default:'ACTIVE'})
    status:string
    
    @CreateDateColumn()
    created_at:Date

    @UpdateDateColumn()
    updated_at:Date


    @ManyToOne(()=>Administrator,administrator=>administrator.inquires)
    administrator:Administrator

    @ManyToOne(()=>Service,service=>service.inquiries)
    service:Service

    @ManyToOne(()=>Type,type=>type.inquires)
    type:Type 
}
