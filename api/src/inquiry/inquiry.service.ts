import { HttpException, HttpStatus, Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Between, Equal, Repository } from 'typeorm';
import { CreateInquiryDto } from './dto/create-inquiry.dto';
import { UpdateInquiryDto } from './dto/update-inquiry.dto';
import { Inquiry } from './entities/inquiry.entity';

@Injectable()
export class InquiryService {
  constructor(@InjectRepository(Inquiry) private inquiryRepository:Repository<Inquiry>){}
  async create(createInquiryDto: CreateInquiryDto,id:number) {
     try {
       const created = await this.inquiryRepository.create({administratorId:id,...createInquiryDto})
       await this.inquiryRepository.save(created)
       return {"status":"success","message":"Inquiry Successfully Logged"}
     } catch (error) {
       throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
     }
  }

  async findAll():Promise<Inquiry[]>{
    return  await this.inquiryRepository.find({relations:["service",'administrator','type']})
  }

  async findOne(id: number):Promise<Inquiry> {
    return  await this.inquiryRepository.findOne(id,{relations:["service",'administrator','type']})
  }

  async update(id: number, updateInquiryDto: UpdateInquiryDto,administratorId:number):Promise<any> {
     try {
        const data = await this.inquiryRepository.findOne(id)
        if(data){
          if(data.administratorId===administratorId){
              await this.inquiryRepository.update(id,updateInquiryDto)
              return {"status":"success","message":"Inquiry Successfully Updated"}
          }else{
            throw new UnauthorizedException({message:"Unauthorized to change inquiry",status:HttpStatus.UNAUTHORIZED})

          }
        }
     } catch (error) {
       throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
     }
  }

  async remove(id: number,administratorId:number):Promise<any> {
     try {
        const data = await this.inquiryRepository.findOne(id)
        if(data.administratorId === administratorId){
          data.status ="DELETED"
          await data.save()
          return {"status":"success","message":"Inquiry Successfully Deleted"}
        }else{
          throw new UnauthorizedException({message:"Unauthorized to change inquiry",status:HttpStatus.UNAUTHORIZED})
 
        }

     } catch (error) {
      throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
     }
  }

  async getcurrentByUser(id:number):Promise<Inquiry[]>{
    const date = new Date()
    return await this.inquiryRepository.find({where:{administratorId:id},relations:["service",'administrator','type']})
  }
  async getByService(id:number):Promise<Inquiry[]>{
    const date = new Date()
    return await this.inquiryRepository.find({where:{serviceId:id},relations:["service",'administrator','type']})
  }



  async getByUserCustome(id:number,start:Date,end:Date):Promise<Inquiry[]>{
    return await this.inquiryRepository.find({where:{administratorId:id,created_at: Between(start,end)},relations:["service",'administrator','type']})
  }
  async geCustome(start:Date,end:Date):Promise<Inquiry[]>{
    return await this.inquiryRepository.find({where:{created_at: Between(start.toISOString,end.toISOString)},relations:["service",'administrator','type']})
  }
}
