import { IsDate } from "class-validator";

export class FilterDto{
    @IsDate()
    start:Date

    @IsDate()
    end:Date
}