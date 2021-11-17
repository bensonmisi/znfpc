import { IsNotEmpty } from "class-validator";

export class CreateInquiryDto {

    @IsNotEmpty()
    name:string

    @IsNotEmpty()
    gender:string

    @IsNotEmpty()
    maritalstatus:string

    @IsNotEmpty()
    phonenumber:string

    @IsNotEmpty()
    email:string

    @IsNotEmpty()
    city:string

    @IsNotEmpty()
    location:string

    @IsNotEmpty()
    serviceId:number

    typeId?:number
    productId?:number

    frequency?:string

    @IsNotEmpty()
    issue

    @IsNotEmpty()
    age:string

    @IsNotEmpty()
    mode:string

    @IsNotEmpty()
    calldate:string

    @IsNotEmpty()
    starttime:string

    @IsNotEmpty()
    endtime:string

    @IsNotEmpty()
    reference:string

    @IsNotEmpty()
    knowledge:string

    province?:string
    district?:string


}
