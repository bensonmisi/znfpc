import { IsDate } from "class-validator";

export class FilterDto{
   
    start?:Date   
    end?:Date
    serviceId?:number
    typeId?:number
    productId:number
    minage?:number
    maxage?:number
    mode?:string
    gender?:string
    province?:string
    district?:string
    maritalstatus?:string

}