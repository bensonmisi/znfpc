import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateTypeDto } from './dto/create-type.dto';
import { UpdateTypeDto } from './dto/update-type.dto';
import { Type } from './entities/type.entity';

@Injectable()
export class TypeService {
  constructor(@InjectRepository(Type) private typeRepository:Repository<Type>){}
  async create(createTypeDto: CreateTypeDto):Promise<any> {
    try {
       const created = await this.typeRepository.create(createTypeDto)
       await this.typeRepository.save(created)
       return {"status":"success","message":"Successfully Created  Service Type"}
    } catch (error) {
       throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
    }
  }

  async findAll():Promise<Type[]> {
    return  await this.typeRepository.find()
  }

  async findByService(id: number):Promise<Type[]> {
    return await this.typeRepository.find({where:{serviceId:id}});
  }

  async update(id: number, updateTypeDto: UpdateTypeDto):Promise<any> {
     try {
        await this.typeRepository.update(id,updateTypeDto)
        return {"status":"success","message":"Service type successfully Updated"}
     } catch (error) {
       throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
     }
  }

  async remove(id: number):Promise<any> {
  const data = await this.typeRepository.findOne(id);
  data.status="DELETED"
  data.save()
  return {"status":"success","message":"Service type successfully deleted"}
  }
}
