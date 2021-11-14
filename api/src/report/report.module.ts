import { Module } from '@nestjs/common';
import { ReportService } from './report.service';
import { ReportController } from './report.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Administrator } from 'src/administrator/entities/administrator.entity';
import { Service } from 'src/service/entities/service.entity';

@Module({
  imports:[TypeOrmModule.forFeature([Administrator,Service])],
  controllers: [ReportController],
  providers: [ReportService]
})
export class ReportModule {}
