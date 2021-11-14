import { Inquiry } from "src/inquiry/entities/inquiry.entity";
import { Product } from "src/product/entities/product.entity";
import { Service } from "src/service/entities/service.entity";
import { BaseEntity, Column, CreateDateColumn, UpdateDateColumn ,Entity, PrimaryGeneratedColumn, ManyToOne, OneToMany } from "typeorm";

@Entity()
export class Type extends BaseEntity{

    @PrimaryGeneratedColumn()
    id:number

    @Column()
    name:string
    
    @Column()
    serviceId:number

    @Column({default:'ACTIVE'})
    status:string

    @CreateDateColumn()
    created_at:Date

    @UpdateDateColumn()
    updated_at:Date

    @ManyToOne(()=>Service,service=>service.types)
    service:Service

    @OneToMany(()=>Product,product=>product.type,{eager:true})
    products:Product[]

    @OneToMany(()=>Inquiry,inquiry=>inquiry.type)
    inquires :Inquiry[]
}
