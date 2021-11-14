import { Type } from "src/type/entities/type.entity";
import { BaseEntity, Column, CreateDateColumn,UpdateDateColumn, Entity, PrimaryGeneratedColumn, ManyToOne } from "typeorm";

@Entity()
export class Product extends BaseEntity {
    @PrimaryGeneratedColumn()
    id:number

    @Column()
    name:string

     @Column()
     typeId:number
     
    @Column({default:"ACTIVE"})
    status:string

    @CreateDateColumn()
    created_at:Date

    @UpdateDateColumn()
    updated_at:Date

    @ManyToOne(()=>Type,type=>type.products)
    type:Type
}
