import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateServiceDto } from './dto/create-service.dto';
import { UpdateServiceDto } from './dto/update-service.dto';
import { Service } from './entities/service.entity';

@Injectable()
export class ServiceService {
  constructor(@InjectRepository(Service) private serviceRepository:Repository<Service>){}
  async create(createServiceDto: CreateServiceDto):Promise<any> {
   
     try {
       const created = await this.serviceRepository.create(createServiceDto) 
       await this.serviceRepository.save(created) 
       return {"status":"success","message":"Successfully Created Service"}
     } catch (error) {
        throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
     }
  }

  async findAll():Promise<Service[]> {
    return await this.serviceRepository.find();
  }

  async findOne(id: number):Promise<Service> {
    return await this.serviceRepository.findOne(id)
  }

  async update(id: number, updateServiceDto: UpdateServiceDto) {
  try {
     await this.serviceRepository.update(id,updateServiceDto)
     return {"status":"success","message":"Successfully Updated Service"}
  } catch (error) {
    throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)  
  }
  }

  async remove(id: number) {
    try {
     const data = await this.serviceRepository.findOne(id)
      data.status="DELETED"
      await data.save()
      return {"status":"success","message":"Successfully Updated Service"}
    } catch (error) {
      throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)  
    }
  }
}
