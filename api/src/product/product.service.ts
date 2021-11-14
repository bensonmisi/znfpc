import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Product } from './entities/product.entity';

@Injectable()
export class ProductService {
  constructor(@InjectRepository(Product) private productRepository:Repository<Product>){}
  async create(createProductDto: CreateProductDto):Promise<any> {
    try {
       const created = await this.productRepository.create(createProductDto)
       await this.productRepository.save(created)
       return {"status":"success","message":"Service Product Successfully Created"}
    } catch (error) {
      throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
    }
  }

  async findAll():Promise<Product[]> {
    return await this.productRepository.find()
  }

  async findByType(id: number):Promise<Product[]> {
    return  await this.productRepository.find({where:{typeId:id}})
  }

 async update(id: number, updateProductDto: UpdateProductDto):Promise<any> {
    try {
        await this.productRepository.update(id,updateProductDto)
        return {"status":"success","message":"Service Product Successfully Updated"} 
    } catch (error) {
       throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
    }
  }

  async remove(id: number):Promise<any> {
     try {
       const data = await this.productRepository.findOne(id)
       data.status = "DELETED"
       await data.save()
       return {"status":"success","message":"Service Product Successfully DELETED"} 
     } catch (error) {
      throw new HttpException(error.sqlMessage,HttpStatus.BAD_REQUEST)
     }
  }
}
