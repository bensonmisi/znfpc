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

    province?:string
    district?:string


}
