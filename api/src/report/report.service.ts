import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Administrator } from 'src/administrator/entities/administrator.entity';
import { Service } from 'src/service/entities/service.entity';
import { Repository } from 'typeorm';
import { CreateReportDto } from './dto/create-report.dto';
import { UpdateReportDto } from './dto/update-report.dto';

@Injectable()
export class ReportService {
  constructor(@InjectRepository(Administrator) private administratorRepository:Repository<Administrator>,@InjectRepository(Service) private serviceRepository:Repository<Service>){}
  async getReportByAgent():Promise<Administrator[]>{
    return await this.administratorRepository.find()
  }

  async getReportByService():Promise<Service[]>{
    return await this.serviceRepository.find()
  }
}
